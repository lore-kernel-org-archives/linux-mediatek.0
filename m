Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB01C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCTXtSXii4WjoQb/QME4Zdq2bfBGafme2o0RO1nxKt8=; b=e4/5Q4c9uJjHxilypr2nUV+QPk
	Hkz1t81Aj1T7cVLda03p8ULCZgGJb4h9ZSmVrzmouU1KjR7CTWAGp3Z73e32FjpykBvnJGsLr9IDx
	njw9x7PR7lsDq0jswPPE7JHPqv/iGkcDJIN5OlxNHScdBspMcqByJHNWZjUSn4bdUKUIQcRcUQq6o
	+q2mAZ4HvVBaGXPYEpD+EEyUL+v0haT/r3EGqGWhXEGTs5u4ocR0T8ZAOmak23q+wVtccaSm8ytBl
	oF0wif9gwOEcQMmiVhfGcaRzhy7r4PPmF5vzln66Xn1BrxUdYHZExQP2LVsPq/NrEQ9YHSI1ExHFM
	NhbgUv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEST-006xcJ-1c;
	Tue, 25 Jul 2023 09:35:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOESO-006xZz-2h;
	Tue, 25 Jul 2023 09:35:54 +0000
X-UUID: a20d062a2ace11ee83ed1395ce914268-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CCTXtSXii4WjoQb/QME4Zdq2bfBGafme2o0RO1nxKt8=;
	b=pJM25hOGVrtXDyNIDLycc74vFOas6onEsU0S4A1ivop07H6V4rWXdwuiMvo2wOIfW9THQXYjlQ0yRFjPeJcJVDWkt7qwcmbpO2nkQ3BFDozOLVk9Huq9R8j/VEvsyhIaTXlY9W6VuDvNzslvIkKvX++erd21tW01f2M81pJ5uo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:400e57f2-87eb-4d4e-8833-eeef4360f078,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7562a7,CLOUDID:ea244dd2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a20d062a2ace11ee83ed1395ce914268-20230725
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1966177495; Tue, 25 Jul 2023 02:35:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 17:35:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 17:35:24 +0800
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
Subject: [PATCH 1/8] scripts/gdb/symbols: add specific ko module load command
Date: Tue, 25 Jul 2023 17:34:51 +0800
Message-ID: <20230725093458.30064-2-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
References: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_023552_875626_A054CA7F 
X-CRM114-Status: GOOD (  11.64  )
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

Add lx-symbols <ko_path> command to support add specific
ko module.

Example output like below:
(gdb) lx-symbols mm/kasan/kasan_test.ko
loading @0xffff800002d30000: mm/kasan/kasan_test.ko

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/symbols.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index fdad3f32c747..b21ae62fdd7d 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -107,11 +107,12 @@ lx-symbols command."""
                     name=section_name, addr=str(address)))
         return "".join(args)
 
-    def load_module_symbols(self, module):
+    def load_module_symbols(self, module, module_file=None):
         module_name = module['name'].string()
         module_addr = str(module['mem'][constants.LX_MOD_TEXT]['base']).split()[0]
 
-        module_file = self._get_module_file(module_name)
+        if not module_file:
+            module_file = self._get_module_file(module_name)
         if not module_file and not self.module_files_updated:
             self._update_module_files()
             module_file = self._get_module_file(module_name)
@@ -135,6 +136,19 @@ lx-symbols command."""
         else:
             gdb.write("no module object found for '{0}'\n".format(module_name))
 
+    def load_ko_symbols(self, mod_path):
+        self.loaded_modules = []
+        module_list = modules.module_list()
+
+        for module in module_list:
+            module_name = module['name'].string()
+            module_pattern = ".*/{0}\.ko(?:.debug)?$".format(
+                module_name.replace("_", r"[_\-]"))
+            if re.match(module_pattern, mod_path) and os.path.exists(mod_path):
+                self.load_module_symbols(module, mod_path)
+                return
+        raise gdb.GdbError("%s is not a valid .ko\n" % mod_path)
+
     def load_all_symbols(self):
         gdb.write("loading vmlinux\n")
 
@@ -173,6 +187,11 @@ lx-symbols command."""
         self.module_files = []
         self.module_files_updated = False
 
+        argv = gdb.string_to_argv(arg)
+        if len(argv) == 1:
+            self.load_ko_symbols(argv[0])
+            return
+
         self.load_all_symbols()
 
         if hasattr(gdb, 'Breakpoint'):
-- 
2.18.0


