From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 1/1] arm64: Use _rcuidle for smp_cross_call() tracepoints
Date: Tue, 12 Feb 2019 19:09:25 +0800
Message-ID: <1549969765-3707-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com, Mars Cheng <mars.cheng@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

fix similar issue for aarch64 as the commit 7c64cc0531fa
("arm: Use _rcuidle for smp_cross_call() tracepoints") fixed
in aarch32

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 arch/arm64/kernel/smp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1598d6f..c1cf8f9 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -758,7 +758,7 @@ void __init set_smp_cross_call(void (*fn)(const struct cpumask *, unsigned int))
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
-	trace_ipi_raise(target, ipi_types[ipinr]);
+	trace_ipi_raise_rcuidle(target, ipi_types[ipinr]);
 	__smp_cross_call(target, ipinr);
 }
 
-- 
1.7.9.5
