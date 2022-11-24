Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E3C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbPBO3XofCZnvE8MJ00/ODH8w117f7m9bV8bhNWeOD8=; b=y3MmwGSJ4J0r+E/5bs7TWpz6Sl
	/ZY9674FmocnTVJh4hFia/wrxuVq1566a+yXY0s5AYVRG9RiGxj6JEXOPWlJVdjZAUvMrvPJbpnKU
	8Qls0+lTwvJXnsoAqoqc4WDmndf4bH799ruSoHqonOCPosgJLgnvkfJmEigEjOkOkn82G9UGyAamc
	7Vg/KjbeF5XbFSpuyNOTid46Of3usbnqqNbkDiF7VO1zsDbrvvWlJITlhxCHhBfrDI2031ssi9xN1
	Na3lvLrf6Wrp21Y/nS4YMtYvqQ4VPESRcqmtp3qHi474EsIXPJp2sU+rMm3CXWJK1W/KzPEFi/zcI
	Chd7Z6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBVh-008O0L-3q; Thu, 24 Nov 2022 12:39:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBVc-008NwI-MP
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 12:39:19 +0000
X-UUID: df78baf6c5574b48ba5e17b474a7bf58-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NbPBO3XofCZnvE8MJ00/ODH8w117f7m9bV8bhNWeOD8=;
	b=nO8bDJ/K1qiiO94ZnMsIAvuD59W2h214OaInlIMVFzIjzJBPZdCOH5j/TBBwORcuPGmFA/dUsCUv/lf6ql+y42AZkFhCQ+OdnjeKKWTa8VwxhLlpv0F0seHoFmjdQvAKf3eeghbLs4RIGSwoXO8W0GkiBx09o7U/4vlzCvwfyeo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:85dd5556-1517-4026-a453-9d4f9e715167,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:85dd5556-1517-4026-a453-9d4f9e715167,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:e5ecba2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:2211242039068NYV8RRR,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:1,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: df78baf6c5574b48ba5e17b474a7bf58-20221124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 883987106; Thu, 24 Nov 2022 05:39:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 20:39:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 20:39:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 7/9] media: platform: mtk-mdp3: extend mdp_color format for compressed mode
Date: Thu, 24 Nov 2022 20:38:57 +0800
Message-ID: <20221124123859.24395-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221124123859.24395-1-moudy.ho@mediatek.com>
References: <20221124123859.24395-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_043916_780165_C26D8B4B 
X-CRM114-Status: GOOD (  10.63  )
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

Due to future support for hardware compression formats, the MDP3
internal color format expression needs to be extended.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 205 +++++++++---------
 1 file changed, 103 insertions(+), 102 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
index 8e91bcb094e0..e9ab8ac2c0e8 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
@@ -18,11 +18,12 @@
  * V-subsample: 0, 1
  * Color group: 0-RGB, 1-YUV, 2-raw
  */
-#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
-	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
+#define MDP_COLOR(COMPRESS, PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
+	(((COMPRESS) << 29) | ((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
 	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
 	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
 
+#define MDP_COLOR_IS_COMPRESS(c)        ((0x20000000 & (c)) >> 29)
 #define MDP_COLOR_IS_10BIT_PACKED(c)	((0x08000000 & (c)) >> 27)
 #define MDP_COLOR_IS_10BIT_LOOSE(c)	(((0x0c000000 & (c)) >> 26) == 1)
 #define MDP_COLOR_IS_10BIT_TILE(c)	(((0x0c000000 & (c)) >> 26) == 3)
@@ -44,144 +45,144 @@
 enum mdp_color {
 	MDP_COLOR_UNKNOWN	= 0,
 
-	//MDP_COLOR_FULLG8,
-	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
+	/* MDP_COLOR_FULLG8 */
+	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
+	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
 	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
 
-	//MDP_COLOR_FULLG10,
-	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
+	/* MDP_COLOR_FULLG10 */
+	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
+	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
 	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
 
-	//MDP_COLOR_FULLG12,
-	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
+	/* MDP_COLOR_FULLG12 */
+	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
+	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
 	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
 
-	//MDP_COLOR_FULLG14,
-	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
+	/* MDP_COLOR_FULLG14 */
+	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
+	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
 	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
 
-	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
+	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
 
-	//MDP_COLOR_BAYER8,
-	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
+	/* MDP_COLOR_BAYER8 */
+	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
+	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
 	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
 
-	//MDP_COLOR_BAYER10,
-	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
+	/* MDP_COLOR_BAYER10 */
+	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
+	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
 	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
 
-	//MDP_COLOR_BAYER12,
-	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
+	/* MDP_COLOR_BAYER12 */
+	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
+	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
 	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
 
-	//MDP_COLOR_BAYER14,
-	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
+	/* MDP_COLOR_BAYER14 */
+	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
+	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
 	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
 
-	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
+	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
 	/* For bayer+mono raw-16 */
-	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
+	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
 
-	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
-	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
-	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
-	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
+	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
+	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
+	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
+	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
 
 	/* Unified formats */
-	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
-
-	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
-	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
-	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
-	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
-	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
-	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
-	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
-	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
-
-	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
-	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
-	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
-	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
-
-	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
-	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
-	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
-	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
-	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
-	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
-
-	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
-	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
-	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
-	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
-	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
-	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
+	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
+
+	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
+	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
+	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
+	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
+	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
+	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
+	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
+	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
+
+	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
+	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
+	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
+	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
+
+	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
+	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
+	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
+	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
+	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
+	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
+
+	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
+	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
+	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
+	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
+	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
+	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
 
 	/* MediaTek proprietary formats */
 	/* UFO encoded block mode */
-	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
+	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
 	/* Block mode */
-	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
+	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
 	/* Block mode + field mode */
-	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
+	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
 	/* Block mode */
-	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
+	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
 
-	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
-	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
+	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
+	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
 
 	/* Packed 10-bit formats */
-	MDP_COLOR_RGBA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
-	MDP_COLOR_BGRA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
+	MDP_COLOR_RGBA1010102	= MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
+	MDP_COLOR_BGRA1010102	= MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
 	/* Packed 10-bit UYVY */
-	MDP_COLOR_UYVY_10P	= MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
+	MDP_COLOR_UYVY_10P	= MDP_COLOR(0, 1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
 	/* Packed 10-bit NV21 */
-	MDP_COLOR_NV21_10P	= MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
+	MDP_COLOR_NV21_10P	= MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
 	/* 10-bit block mode */
-	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
+	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(0, 1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
 	/* 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
+	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(0, 1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
 	/* UFO encoded 10-bit block mode */
-	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
+	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(0, 1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
 	/* UFO encoded 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
+	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(0, 1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
 
 	/* Loose 10-bit formats */
-	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
-	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
-	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
-	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
-	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
-	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
-	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
-	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
-	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
-	MDP_COLOR_I420_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
+	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
+	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
+	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
+	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
+	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
+	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
+	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
+	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
+	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
+	MDP_COLOR_I420_10L	= MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
 };
 
 static inline bool MDP_COLOR_IS_UV_COPLANE(enum mdp_color c)
-- 
2.18.0


