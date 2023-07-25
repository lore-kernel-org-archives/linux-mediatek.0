Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFCAC0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPZv3tM9vTtpWd34AkCCKWUdpVmNx/aOuZOzG2VcV74=; b=WuJHlzhKMLKARc1pMc7Bu0kA37
	4E/gLRjDdmNaMmHcVXHQfe7VUQJIRrSp30+wxJNDTa2InH5CeXf5LhPIsUoszi9PTs/VmF5gGzf4v
	+Tj0EuVphDAKsbuZfS+t3e14snrB2wxRVYGeRtwUlmBXS/dYRmzdpTWDR6IDI38xd5RF9N88wBIWv
	gMLHdovveIl9mWqN3cgSBbX65OSwyIv0OmKSj+X3mz2OlGXFxCrWhym2Rck7AezMGAWSZTrj23m8Y
	gpwiOLXRKiLomoGXtIIHRyr4uZ8xeykAwqp6Rfi2Elcq7wErQB7gMcNRgDnv3iQZhd0AD1SF3ui6A
	pwk0Anlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEli-0070fx-1V;
	Tue, 25 Jul 2023 09:55:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOElf-0070eq-1e;
	Tue, 25 Jul 2023 09:55:49 +0000
X-UUID: 6888f23a2ad111ee912e1518a6540028-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yPZv3tM9vTtpWd34AkCCKWUdpVmNx/aOuZOzG2VcV74=;
	b=r2NxIXm8d7FUY+Nyld7O5AzqQjHDZ6hIX0c+G1WwpEfMiiUxWmCkSIOPDzJWExF2/+gdoL9BaeXCyAj2SOnFsjmbxKhII/uZQct7ZG52cRk38a/HSBmUhTotz2q+MCZUaeTXdYRMIUKVWwUZsucyvQbDlzZc8oHnDOBI0FUKcUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:fcf75e59-db8a-4c80-b36a-bf95183da962,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7562a7,CLOUDID:114a6e42-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6888f23a2ad111ee912e1518a6540028-20230725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047767663; Tue, 25 Jul 2023 02:55:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 17:35:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 17:35:34 +0800
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
Subject: [PATCH 5/8] scripts/gdb/stackdepot: Add stackdepot support
Date: Tue, 25 Jul 2023 17:34:55 +0800
Message-ID: <20230725093458.30064-6-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
References: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_025547_704548_492B5578 
X-CRM114-Status: GOOD (  15.42  )
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
 scripts/gdb/linux/stackdepot.py   | 54 +++++++++++++++++++++++++++++++
 scripts/gdb/vmlinux-gdb.py        |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 scripts/gdb/linux/stackdepot.py

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index 7c44222bbf23..ec88c9affdd2 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -133,3 +133,4 @@ LX_CONFIG(CONFIG_VMAP_STACK)
 if IS_BUILTIN(CONFIG_NUMA):
     LX_VALUE(CONFIG_NODES_SHIFT)
 LX_CONFIG(CONFIG_DEBUG_VIRTUAL)
+LX_CONFIG(CONFIG_STACKDEPOT)
diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
new file mode 100644
index 000000000000..03b5eb19f056
--- /dev/null
+++ b/scripts/gdb/linux/stackdepot.py
@@ -0,0 +1,54 @@
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
+stack_record_type = utils.CachedType('struct stack_record')
+DEPOT_STACK_ALIGN = 4
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


