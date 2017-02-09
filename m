From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] arm64: use linux/sizes.h for constants
Date: Thu, 9 Feb 2017 09:52:03 +0800
Message-ID: <1486605123-30819-1-git-send-email-miles.chen@mediatek.com>
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
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Use linux/size.h to improve code readability.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index a3a2816..aaac783 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -407,7 +407,7 @@ unsigned long arch_align_stack(unsigned long sp)
 unsigned long arch_randomize_brk(struct mm_struct *mm)
 {
 	if (is_compat_task())
-		return randomize_page(mm->brk, 0x02000000);
+		return randomize_page(mm->brk, SZ_32M);
 	else
-		return randomize_page(mm->brk, 0x40000000);
+		return randomize_page(mm->brk, SZ_1G);
 }
-- 
1.9.1
