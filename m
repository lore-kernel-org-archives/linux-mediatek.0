Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6623BC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C8olInZ2U2OjphX9pSmDTmiExKe1b/NUHKYXQxINTw=; b=P+XY8BRzAS4mWb1sAQtfGoKQIA
	sjKyIDkHavAlTpBf4ETTFCXDy9cHgdlByAd5Td84ZVUDtvI1onTzax7enBQ/37hhDHGTdQDxdZmkL
	irVyQ2jJeoB47zmsMD7sYngTYyWWJjF9VFUrt+YaORMsV2EvytXbBES8BmwNRfRdZVMPehkglga/x
	TrpIbjetkoyZKszqUWQQQQjvFFjIkkkoSvRuLLXvdLPPyqH1jqN3dmutwZmJeiO7SCWbnVUJQ+S66
	BSDmGD7IwF9hbKALxMX7BgZk8QbCtmvnqZA8oqgwNaKJwzyuwCYwuaBaEqiZzCxRoZAo+LiETRXig
	txBywv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOESR-006xb6-0p;
	Tue, 25 Jul 2023 09:35:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOESN-006xZk-2p;
	Tue, 25 Jul 2023 09:35:53 +0000
X-UUID: a28e8e0c2ace11ee83ed1395ce914268-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8C8olInZ2U2OjphX9pSmDTmiExKe1b/NUHKYXQxINTw=;
	b=e9a7c3J8ZMyiZv87hpnff3+7M2HOoIlM11mOshOBFtJmgYgMhvPjacktFlca995qYwFNtRn4JYMdUJMLBQjLVFphaW0/PwEpa3GdIhaBHJ+ZRSD7Xg0wD4bLCyNNS6SoUY/Bl44cHB8R9uPPEDIfLzu9U3D5pyIwJgeOm88aPeQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:ff05a3a9-c3b0-4911-9a7b-a7033d150c80,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:e7562a7,CLOUDID:e9244dd2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a28e8e0c2ace11ee83ed1395ce914268-20230725
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1234229802; Tue, 25 Jul 2023 02:35:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 17:35:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 17:35:26 +0800
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
Subject: [PATCH 2/8] scripts/gdb/modules: add get module text support
Date: Tue, 25 Jul 2023 17:34:52 +0800
Message-ID: <20230725093458.30064-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
References: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_023551_923542_9FC1EFEB 
X-CRM114-Status: GOOD (  13.41  )
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

When we get an text address from coredump and we cannot find
this address in vmlinux, it might located in kernel module.

We want to know which kernel module it located in.

This GDB scripts can help us to find the target kernel module.

(gdb) lx-getmod-by-textaddr 0xffff800002d305ac
0xffff800002d305ac is in kasan_test.ko

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/modules.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/modules.py b/scripts/gdb/linux/modules.py
index 261f28640f4c..54bb7fcad41d 100644
--- a/scripts/gdb/linux/modules.py
+++ b/scripts/gdb/linux/modules.py
@@ -91,5 +91,35 @@ class LxLsmod(gdb.Command):
 
             gdb.write("\n")
 
-
 LxLsmod()
+
+def help():
+    t = """Usage: lx-getmod-by-textaddr [Heximal Address]
+    Example: lx-getmod-by-textaddr 0xffff800002d305ac\n"""
+    gdb.write("Unrecognized command\n")
+    raise gdb.GdbError(t)
+
+class LxFindTextAddrinMod(gdb.Command):
+    '''Look up loaded kernel module by text address.'''
+
+    def __init__(self):
+        super(LxFindTextAddrinMod, self).__init__('lx-getmod-by-textaddr', gdb.COMMAND_SUPPORT)
+
+    def invoke(self, arg, from_tty):
+        args = gdb.string_to_argv(arg)
+
+        if len(args) != 1:
+            help()
+
+        addr = gdb.Value(int(args[0], 16)).cast(utils.get_ulong_type())
+        for mod in module_list():
+            mod_text_start = mod['mem'][constants.LX_MOD_TEXT]['base']
+            mod_text_end = mod_text_start + mod['mem'][constants.LX_MOD_TEXT]['size'].cast(utils.get_ulong_type())
+
+            if addr >= mod_text_start and addr < mod_text_end:
+                s = "0x%x" % addr + " is in " + mod['name'].string() + ".ko\n"
+                gdb.write(s)
+                return
+        gdb.write("0x%x is not in any module text section\n" % addr)
+
+LxFindTextAddrinMod()
-- 
2.18.0


