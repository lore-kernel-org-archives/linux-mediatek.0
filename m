From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v2] checkpatch: add several Kconfig default value tests
Date: Thu, 4 Jul 2019 17:40:24 +0800
Message-ID: <20190704094024.16162-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This change adds 3 Kconfig default value tests:

1. discourage default n cases:
e.g.,
default n

2. discourage default "[ynm]" cases:
e.g.,
arch/powerpc/Kconfig:   default "y" if PPC_POWERNV
arch/powerpc/Kconfig:   default "y" if PPC_POWERNV
arch/powerpc/Kconfig:   default "n"
drivers/auxdisplay/Kconfig:     default "n"
drivers/crypto/Kconfig: default "m"
drivers/rapidio/devices/Kconfig:        default "n"

3. discourage default \!?EXPERT cases:
e.g.,
drivers/hid/Kconfig:    default !EXPERT

tested cases:
default m
default n if ALPHA_EV5 || ALPHA_EV56 || (ALPHA_EV4 && !ALPHA_LCA)
default y if ALPHA_QEMU
default n if PPC_POWERNV
default n
default EXPERT
default !EXPERT
default "m"
default "n"
default "y" if EXPERT
default "y" if PPC_POWERNV

test result:
WARNING: 'default n' is the default value, no need to write it explicitly.
+       default n

WARNING: Avoid default turn on kernel configs by default !?EXPERT
+       default EXPERT

WARNING: Avoid default turn on kernel configs by default !?EXPERT
+       default !EXPERT

WARNING: Use default [ynm] instead of default "[ynm]"
+       default "m"

WARNING: Use default [ynm] instead of default "[ynm]"
+       default "n"

WARNING: Use default [ynm] instead of default "[ynm]"
+       default "y" if EXPERT

WARNING: Use default [ynm] instead of default "[ynm]"
+       default "y" if PPC_POWERNV

Change since v1:
discourage default n$
discourage default "[ynm]"
discourage default \!?EXPERT

Cc: Joe Perches <joe@perches.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 scripts/checkpatch.pl | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 342c7c781ba5..c1de50202a18 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3005,6 +3005,27 @@ sub process {
 			     "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
 		}
 
+# discourage redundant 'default n'
+		if ($realfile =~ /Kconfig/ &&
+		    $line =~ /^\+\s*default n$/) {
+			WARN("DEFAULT_VALUE_STYLE",
+			     "'default n' is the default value, no need to write it explicitly.\n" . $herecurr);
+		}
+
+# discourage quote: use default [ynm], not default "[ynm]"
+		if ($realfile =~ /Kconfig/ &&
+		    $rawline =~ /^\+\s*default\s*"[ynm]"/) {
+			WARN("DEFAULT_VALUE_STYLE",
+			     "Use default [ynm] instead of default \"[ynm]\"\n" . $herecurr);
+		}
+
+# discourage default \!?EXPERT
+		if ($realfile =~ /Kconfig/ &&
+		    $line =~ /^\+\s*default \!?EXPERT/) {
+			WARN("DEFAULT_VALUE_STYLE",
+			     "Avoid default turn on kernel configs by default !?EXPERT\n" . $herecurr);
+		}
+
 		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
 		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
 			my $flag = $1;
-- 
2.18.0
