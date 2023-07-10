Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF031EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nb99lc8Wmse35yybNXCud8AjDzpYa3GbyoDtpeuAjOk=; b=KC2X4O9sFT0DzjLkG4E8v2N63m
	B1rhUFrzOUccO3eIyf+bpve3+zGp6oMHAxrikK+6ybZKK2cku+4+pnnHxvCpWQBu5B+GQR6PuPtOo
	8ewNOYVy//ODpB54YX5+j99H/TUMtmpTes62Xxab6pRyBH16AoWGclpruhLQmi6xLTx1g4DOHHgn7
	lepkANKipc8uvyg99k5bVHZQQuurEzZQNrhEiTAUvDooUPnsmrD5b59GLluu1cPeeqEurGTk+cUL4
	QVBhlS32IXQWHhibJbSItzcxUVgxYextz59vctGifVyE29jJjt8kXuxoEgDkme5QX2CYXGOOSFh9a
	e8Gg321w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInMm-00B48G-0O;
	Mon, 10 Jul 2023 09:39:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInMj-00B471-2a;
	Mon, 10 Jul 2023 09:39:35 +0000
X-UUID: aa1c54bc1f0511ee83ed1395ce914268-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nb99lc8Wmse35yybNXCud8AjDzpYa3GbyoDtpeuAjOk=;
	b=SeEG/ioOymc16mHFXLdb9p1jG8VP+wACBtfVuE6iLSwL+9UV6Rn5fxzRrIiXl0oN3iAGnZtjHqyqy/48Fe6wQBlyy602seF/whgm9UJBWa337vEY2nsk7uIiOgZVSilCFbPi1M3fpWUimBYrtE+ZqEYXHEQIRkIFoBWs3GLcF90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:bec83182-c69d-4c6e-9f52-7cec9adfb8af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:176cd25,CLOUDID:0915d3da-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aa1c54bc1f0511ee83ed1395ce914268-20230710
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1049895643; Mon, 10 Jul 2023 02:39:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 17:29:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 17:29:25 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Pankaj Raghav
	<p.raghav@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <linux-modules@vger.kernel.org>,
	<casper.li@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] scripts/gdb: fix 'lx-lsmod' show the wrong size
Date: Mon, 10 Jul 2023 17:28:46 +0800
Message-ID: <20230710092852.31049-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023933_845725_E69608CF 
X-CRM114-Status: GOOD (  11.62  )
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

'lsmod' shows total core layout size, so we need to
sum up all the sections in core layout in gdb scripts.

/ # lsmod
kasan_test 200704 0 - Live 0xffff80007f640000

Before patch:
(gdb) lx-lsmod
Address            Module                  Size  Used by
0xffff80007f640000 kasan_test             36864  0

After patch:
(gdb) lx-lsmod
Address            Module                  Size  Used by
0xffff80007f640000 kasan_test            200704  0

Fixes: b4aff7513df3 ("scripts/gdb: use mem instead of core_layout to get the module address")
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
V1->V2:
  - Remove special condition

 scripts/gdb/linux/constants.py.in |  3 +++
 scripts/gdb/linux/modules.py      | 12 +++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index 50a92c4e9984..fab74ca9df6f 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -64,6 +64,9 @@ LX_GDBPARSED(IRQ_HIDDEN)
 
 /* linux/module.h */
 LX_GDBPARSED(MOD_TEXT)
+LX_GDBPARSED(MOD_DATA)
+LX_GDBPARSED(MOD_RODATA)
+LX_GDBPARSED(MOD_RO_AFTER_INIT)
 
 /* linux/mount.h */
 LX_VALUE(MNT_NOSUID)
diff --git a/scripts/gdb/linux/modules.py b/scripts/gdb/linux/modules.py
index 261f28640f4c..f76a43bfa15f 100644
--- a/scripts/gdb/linux/modules.py
+++ b/scripts/gdb/linux/modules.py
@@ -73,11 +73,17 @@ class LxLsmod(gdb.Command):
                 "        " if utils.get_long_type().sizeof == 8 else ""))
 
         for module in module_list():
-            layout = module['mem'][constants.LX_MOD_TEXT]
+            text = module['mem'][constants.LX_MOD_TEXT]
+            text_addr = str(text['base']).split()[0]
+            total_size = 0
+
+            for i in range(constants.LX_MOD_TEXT, constants.LX_MOD_RO_AFTER_INIT + 1):
+                total_size += module['mem'][i]['size']
+
             gdb.write("{address} {name:<19} {size:>8}  {ref}".format(
-                address=str(layout['base']).split()[0],
+                address=text_addr,
                 name=module['name'].string(),
-                size=str(layout['size']),
+                size=str(total_size),
                 ref=str(module['refcnt']['counter'] - 1)))
 
             t = self._module_use_type.get_type().pointer()
-- 
2.18.0


