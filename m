Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C22C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dLDkQf2vaEkGIxazc+FMQzXIVTV0+ydf8M//rJxA6KM=; b=mgqu4Uqu5fTMDoCe98Cx8zJrFr
	Ela3PYAYoZJBPj49+WBCRCLDYiTC/YUv4/Ec4d7m4DWSLLUoFo5+Nk3cIzJiPo75lMGlfc7olChJz
	XMT2I1ZfWI4Qw0UlpxORhyqUVIxWWSeQFl1/1VP9EjLH4/pv/9AuJSEUOvwToyYAvYrEio3+STdzh
	z38WZE0ezXp8tiSwdPTuD8NVwYRdNMhAJfXmDSbCHAu7NeY6AWByaIWZxHyUawBkp+d62CPBervrh
	LT+v0Tcv5C/0SglWsgKxCuwYwKMrBQhrgvUT94m0cf7msuEB2vj3DdblpXIKOIaWpj5zv0nRbxs13
	eC6v3IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzveE-00000007fmL-33J8;
	Thu, 25 Apr 2024 09:44:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzveC-00000007flG-1Pnd;
	Thu, 25 Apr 2024 09:44:09 +0000
X-UUID: 586239b202e811ef8ada5f53ce9ad2d9-20240425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dLDkQf2vaEkGIxazc+FMQzXIVTV0+ydf8M//rJxA6KM=;
	b=fg7stGuBmNdhbEVzjpurSIYfflff5n62P/OdVApj8dNGy+VnDRkhnlQ3G15meq5a4+FGr+gPXFas30AsWZb+XlJNAU5DzmTWx3QUqziRh6C9iwpj2xmgKIgGVggH4g+ZHGKicORRdJUDq7rPxMPmCOaFynq6sb2J+Z48R957Fxs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f23a84a7-535c-4f44-a3f6-5c4f14693d70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:49f59a86-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 586239b202e811ef8ada5f53ce9ad2d9-20240425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 474022666; Thu, 25 Apr 2024 02:44:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 Apr 2024 17:43:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 Apr 2024 17:43:58 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Chen-Yu Tsai <wens@kernel.org>
CC: <wireless-regdb@lists.infradead.org>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wireless-regdb: Update regulatory rules for Taiwan (TW) on 6GHz
Date: Thu, 25 Apr 2024 17:43:13 +0800
Message-ID: <8f7c6ecd8e2cd15d277435719bf993217d40f12d.1714038069.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_024408_404126_7D4905A0 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

The Ministry of Transportation and Communications in Taiwan has updated
its frequency allocation rules [1], now including the 5945 ~ 6425 MHz
range for Low Power Indoor (LPI) and Very Low Power (VLP) devices. As
only one power rule can be applied to a specific frequency range, we
choose the LPI devices with a power limit of 23 dBm. There is no Dynamic
Frequency Selection (DFS) requirement.

Also update the section information for the 2.4/5/60 GHz bands
with reference [1].

[1] LP0002 Low-power Radio-frequency Devices Technical Regulations
    2024/Feb/06
    https://www.ncc.gov.tw/chinese/files/24020/538_49880_240206_3.pdf

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 db.txt | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/db.txt b/db.txt
index fdc2c13..6981930 100644
--- a/db.txt
+++ b/db.txt
@@ -1724,12 +1724,12 @@ country TT: DFS-FCC
 # Table of Frequency Allocations of Republic of China (Taiwan) / Feb 2017:
 #   https://www.motc.gov.tw/websitedowndoc?file=post/201702221012200.doc& \
 #	filedisplay=Table%2Bof%2Bradio%2Bfrequency%2Ballocation.doc
-# LP0002 Low-power Radio-frequency Devices Technical Regulations / 23 Aug 2016:
-#   http://www.ncc.gov.tw/english/show_file.aspx?table_name=news&file_sn=681
+# LP0002 Low-power Radio-frequency Devices Technical Regulations / 6 Feb 2024:
+#   https://www.ncc.gov.tw/chinese/files/24020/538_49880_240206_3.pdf
 country TW: DFS-FCC
-	# 2.4g band, LP0002 section 3.10.1
+	# 2.4g band, LP0002 section 4.10.1
 	(2400 - 2483.5 @ 40), (30)
-	# 5g U-NII band, LP0002 section 4.7
+	# 5g U-NII band, LP0002 section 5.7
 	# 5.15 ~ 5.25 GHz: 30 dBm for master mode, 23 dBm for clients
 	(5150 - 5250 @ 80), (23), AUTO-BW
 	(5250 - 5350 @ 80), (23), DFS, AUTO-BW
@@ -1739,7 +1739,9 @@ country TW: DFS-FCC
 	# happy and be able to use channel 144.
 	(5470 - 5730 @ 160), (23), DFS
 	(5725 - 5850 @ 80), (30)
-	# 60g band, LP0002 section 3.13.1.1 (3)(C), EIRP=40dBm(43dBm peak)
+	# 6g band, LP0002 section 5.13.1.1, EIRP=23dBm
+	(5945 - 6425 @ 320), (23), NO-OUTDOOR
+	# 60g band, LP0002 section 4.13.1.1 (1)(A), EIRP=40dBm(43dBm peak)
 	(57000 - 66000 @ 2160), (40)
  
 country TZ:
-- 
2.18.0


