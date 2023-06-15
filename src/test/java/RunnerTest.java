import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class RunnerTest {
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features").outputCucumberJson(true).tags("~@PX-9").parallel(5);
    }

}