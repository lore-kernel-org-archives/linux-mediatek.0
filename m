Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7CEC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLRXZ8JkZ/uttlc+rpLNlOjkZ+tu1NjDBwbmdqcEaJA=; b=qsecBlv+gdUhffH11M3KYbW07p
	zB3SlgHhUwiPWl0v3GN72g7cLv4qVsw5hqBjK3KNF4QMieCyMAokcjhhuQfKOvZzERBjQ4Mp7IY+x
	PwpjKYvOS/hVOK6Jli7d9OyRyPQEOtHAZPoGtHilnNc8ojSFRwcVrjW2aKJrZ8zhcq9ZWDKpy6pUI
	U4NslMTgZt0o4yfABtoFh/ExDYTqxfLNO4RuoQrRGW0UZe/c6gm9TdtTibMbaSwaLROWBy5jDlGRh
	cmVLCp96muh5iQap6F9ZayAYncWXS+gdvijoH2DLn/V44x0M5AX6xaochV1Fp5ngsbi6X89rhifiK
	LOkm5ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI7Z-0021wf-04;
	Tue, 08 Aug 2023 08:31:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI7W-0021vO-37;
	Tue, 08 Aug 2023 08:31:16 +0000
X-UUID: ee8f0af035c511ee83ed1395ce914268-20230808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jLRXZ8JkZ/uttlc+rpLNlOjkZ+tu1NjDBwbmdqcEaJA=;
	b=dzdvMumbhw19h7492B6v/eP9viSV4gcUZ/n5cjocP4ijzWdEF+smOI7mXs7i29KAKQ61KP+S9ABMsQDQ4U2ylWM+sH/0gQgvHAW4sAnfZ7/dO5ofNemdBKRM7bm5Nw8VMwa5oaC32qDt7pjFUUFTjheFgwGFmmQzHvr8BLQOiLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:39c3c19b-85dd-4709-8e14-436604891d89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:39c3c19b-85dd-4709-8e14-436604891d89,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:3c6346b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:230808163042XYYQD8E0,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: ee8f0af035c511ee83ed1395ce914268-20230808
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2066179045; Tue, 08 Aug 2023 01:31:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Aug 2023 16:30:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Aug 2023 16:30:38 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <linux-modules@vger.kernel.org>,
	<casper.li@mediatek.com>, <akpm@linux-foundation.org>,
	<linux-arm-kernel@lists.infradead.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 5/8] scripts/gdb/stackdepot: Add stackdepot support
Date: Tue, 8 Aug 2023 16:30:15 +0800
Message-ID: <20230808083020.22254-6-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230808083020.22254-1-Kuan-Ying.Lee@mediatek.com>
References: <20230808083020.22254-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_013115_023400_B7EDC76C 
X-CRM114-Status: GOOD (  15.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for printing the backtrace of stackdepot handle.

This is the preparation patch for dumping page_owner,
slabtrace usage.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/constants.py.in |  1 +
 scripts/gdb/linux/stackdepot.py   | 55 +++++++++++++++++++++++++++++++
 scripts/gdb/vmlinux-gdb.py        |  1 +
 3 files changed, 57 insertions(+)
 create mode 100644 scripts/gdb/linux/stackdepot.py

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index 0805aeab3dcd..f33be26253d2 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -128,3 +128,4 @@ LX_CONFIG(CONFIG_VMAP_STACK)
 if IS_BUILTIN(CONFIG_NUMA):
     LX_VALUE(CONFIG_NODES_SHIFT)
 LX_CONFIG(CONFIG_DEBUG_VIRTUAL)
+LX_CONFIG(CONFIG_STACKDEPOT)
diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
new file mode 100644
index 000000000000..047d329a6a12
--- /dev/null
+++ b/scripts/gdb/linux/stackdepot.py
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2023 MediaTek Inc.
+#
+# Authors:
+#  Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
+#
+
+import gdb
+from linux import utils, constants
+
+if constants.LX_CONFIG_STACKDEPOT:
+    stack_record_type = utils.CachedType('struct stack_record')
+    DEPOT_STACK_ALIGN = 4
+
+def stack_depot_fetch(handle):
+    global DEPOT_STACK_ALIGN
+    global stack_record_type
+
+    stack_depot_disabled = gdb.parse_and_eval('stack_depot_disabled')
+
+    if stack_depot_disabled:
+        raise gdb.GdbError("stack_depot_disabled\n")
+
+    handle_parts_t = gdb.lookup_type("union handle_parts")
+    parts = handle.cast(handle_parts_t)
+    offset = parts['offset'] << DEPOT_STACK_ALIGN
+    pool_index_cached = gdb.parse_and_eval('pool_index')
+
+    if parts['pool_index'] > pool_index_cached:
+        gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (parts['pool_index'], pool_index_cached, handle))
+        return gdb.Value(0), 0
+
+    stack_pools = gdb.parse_and_eval('stack_pools')
+
+    try:
+        pool = stack_pools[parts['pool_index']]
+        stack = (pool + gdb.Value(offset).cast(utils.get_size_t_type())).cast(stack_record_type.get_type().pointer())
+        size = int(stack['size'].cast(utils.get_ulong_type()))
+        return stack['entries'], size
+    except Exception as e:
+        gdb.write("%s\n" % e)
+        return gdb.Value(0), 0
+
+def stack_depot_print(handle):
+    if not constants.LX_CONFIG_STACKDEPOT:
+        raise gdb.GdbError("CONFIG_STACKDEPOT is not enabled")
+
+    entries, nr_entries = stack_depot_fetch(handle)
+    if nr_entries > 0:
+        for i in range(0, nr_entries):
+            try:
+                gdb.execute("x /i 0x%x" % (int(entries[i])))
+            except Exception as e:
+                gdb.write("%s\n" % e)
diff --git a/scripts/gdb/vmlinux-gdb.py b/scripts/gdb/vmlinux-gdb.py
index fd24574bcec9..24f149694b81 100644
--- a/scripts/gdb/vmlinux-gdb.py
+++ b/scripts/gdb/vmlinux-gdb.py
@@ -45,3 +45,4 @@ else:
     import linux.radixtree
     import linux.interrupts
     import linux.mm
+    import linux.stackdepot
-- 
2.18.0


