From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [PATCH] perf/hw_breakpoint: Fix arch_hw_breakpoint
 use-before-initialization
Date: Fri, 6 Sep 2019 14:01:16 +0800
Message-ID: <20190906060115.9460-1-mark-pk.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, matthias.bgg@gmail.com
Cc: Alix Wu <alix.wu@mediatek.com>, YJ Chiang <yj.chiang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

If we disable the compiler's auto-initialization feature
(-fplugin-arg-structleak_plugin-byref or -ftrivial-auto-var-init=pattern)
is disabled, arch_hw_breakpoint may be used before initialization after
the change 9a4903dde2c86.
(perf/hw_breakpoint: Split attribute parse and commit)

On our arm platform, the struct step_ctrl in arch_hw_breakpoint, which
used to be zero-initialized by kzalloc, may be used in
arch_install_hw_breakpoint without initialization.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: YJ Chiang <yj.chiang@mediatek.com>
Cc: Alix Wu <alix.wu@mediatek.com>
---
 kernel/events/hw_breakpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index c5cd852fe86b..8fb842394924 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -413,7 +413,7 @@ static int hw_breakpoint_parse(struct perf_event *bp,

 int register_perf_hw_breakpoint(struct perf_event *bp)
 {
-	struct arch_hw_breakpoint hw;
+	struct arch_hw_breakpoint hw = {0};
 	int err;

 	err = reserve_bp_slot(bp);
@@ -461,7 +461,7 @@ int
 modify_user_hw_breakpoint_check(struct perf_event *bp, struct perf_event_attr *attr,
 			        bool check)
 {
-	struct arch_hw_breakpoint hw;
+	struct arch_hw_breakpoint hw = {0};
 	int err;

 	err = hw_breakpoint_parse(bp, attr, &hw);
--
2.18.0
