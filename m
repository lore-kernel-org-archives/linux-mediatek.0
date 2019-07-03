From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] checkpatch: avoid default n
Date: Wed, 3 Jul 2019 16:30:31 +0800
Message-ID: <20190703083031.2950-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This change reports a warning when "default n" is used.

I have seen several "remove default n" patches, so I think
it might be helpful to add this test in checkpatch.

tested:
WARNING: 'default n' is the default value, no need to write it explicitly.
+       default n

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 342c7c781ba5..6531b5757c6b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3005,6 +3005,13 @@ sub process {
 			     "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
 		}
 
+# avoid redundant 'default n'
+		if ($realfile =~ /Kconfig/ &&
+		    $line =~ /^\+\s*\bdefault n\b/) {
+			WARN("AVOID_DEFAULT_N",
+			     "'default n' is the default value, no need to write it explicitly.\n" . $herecurr);
+		}
+
 		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
 		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
 			my $flag = $1;
-- 
2.18.0
