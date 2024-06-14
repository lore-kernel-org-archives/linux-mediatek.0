Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D8DC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tfh75ueWVlJEBbGX4eUx02SwpuikQxjyrP+FXeiLmzA=; b=GPWKNcOpnG5IE+k0HMqPDxX4sM
	oIfmOzivSBEGNTEQG7mGPbCaIkf4JpBwAVej9Nl3EkIX80DNZwnq9E6N0zar/pq3EzTDYIWi7JaE2
	M3hHuHBTbdr5YbfEoAoiHUmSwyt/D7Vbx9SN2rTqkVoA57S0QFeKDOI9Wt5g6SEJhUafg319bhFNJ
	Cq3DacJOKFvftH1aBueW7JkUSnQz4pm5uaMWB9O1A/plJONyB0apcHm7R+7ZV/v2kDZn7H1nzq/sN
	CGCI1KRV5HEgZFe0V+vrBNB1FRmDOT79IgwGo5S6xh9/rePZ1OyG/nKqVB/EMLAEesoU/Dq61HLF+
	BhUGwAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI19k-00000001iix-3DRH;
	Fri, 14 Jun 2024 07:15:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI19i-00000001iiM-2bXH;
	Fri, 14 Jun 2024 07:15:27 +0000
X-UUID: dd97dd6a2a1d11efaf04eb0598667787-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tfh75ueWVlJEBbGX4eUx02SwpuikQxjyrP+FXeiLmzA=;
	b=TQ8oKK6LlxcocHVmcOEI/yQwV9APQgc+MtQeCBLazXYLzWRBgSSa3WVUT7rXvLF+8Ujs1LRPp/ncLtcwz9CuTzsiGWhnwaxfAsqTLADrzddOz3Lp+JKbi8Hq6lX4+hFVTRgJhlUnZtFvZhLWYuBsrPNZK33gkGe+EQBU/axwF5I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:4ce6f803-2d09-43d9-832a-7f5e86184532,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:aff59488-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd97dd6a2a1d11efaf04eb0598667787-20240614
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 693060177; Fri, 14 Jun 2024 00:15:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 00:15:20 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 15:15:20 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet
	<corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, <mark-pk.tsai@mediatek.com>,
	<linux-kbuild@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates
Date: Fri, 14 Jun 2024 15:15:02 +0800
Message-ID: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_001526_689203_5D3DE6D1 
X-CRM114-Status: GOOD (  12.26  )
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

The default INSTALL_MOD_DIR was changed from 'extra' to
'updates' in commit b74d7bb7ca24 ("kbuild: Modify default
INSTALL_MOD_DIR from extra to updates").

This commit updates the documentation to align with the
latest kernel.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 Documentation/kbuild/modules.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a1f3eb7a43e2..131863142cbb 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -128,7 +128,7 @@ executed to make module versioning work.
 
 	modules_install
 		Install the external module(s). The default location is
-		/lib/modules/<kernel_release>/extra/, but a prefix may
+		/lib/modules/<kernel_release>/updates/, but a prefix may
 		be added with INSTALL_MOD_PATH (discussed in section 5).
 
 	clean
@@ -417,7 +417,7 @@ directory:
 
 And external modules are installed in:
 
-	/lib/modules/$(KERNELRELEASE)/extra/
+	/lib/modules/$(KERNELRELEASE)/updates/
 
 5.1 INSTALL_MOD_PATH
 --------------------
@@ -438,10 +438,10 @@ And external modules are installed in:
 -------------------
 
 	External modules are by default installed to a directory under
-	/lib/modules/$(KERNELRELEASE)/extra/, but you may wish to
+	/lib/modules/$(KERNELRELEASE)/updates/, but you may wish to
 	locate modules for a specific functionality in a separate
 	directory. For this purpose, use INSTALL_MOD_DIR to specify an
-	alternative name to "extra."::
+	alternative name to "updates."::
 
 		$ make INSTALL_MOD_DIR=gandalf -C $KDIR \
 		       M=$PWD modules_install
-- 
2.18.0


