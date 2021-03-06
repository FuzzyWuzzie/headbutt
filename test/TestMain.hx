import buddy.reporting.ConsoleFileReporter;
import buddy.SuitesRunner;

class TestMain {
	public static function main() {
		var reporter = new buddy.reporting.ConsoleFileReporter(true);
		var runner = new buddy.SuitesRunner([
			new TestShapes2D(),
			new TestHeadbutt2D(),
			new TestShapes3D(),
			new TestHeadbutt3D()
		], reporter);

		runner.run();
	}
}