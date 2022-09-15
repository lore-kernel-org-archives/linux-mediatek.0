Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B100ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XojuKpZCUNxY4C6Madj4ukhRH/8ix5f31tF8a8eQ3Js=; b=MhB0XJ2aDSt6ARImzx5V4Qmlvh
	eaU+I6iVLsY+CZBa1/zVIemckiFL4PZAAh+2kCzQ8o3SrAzjJKTh8CjjHXc1HvT6XojBfGYsmAcj3
	10TBmyvSdnmXyMETak7b4KxvUE16qt/VcVeHgj4/1laAOxo20s8IAKiDZCruEcVrddh4lDbqt3kci
	QzyxGdoCcMx2fNUCZ/9W9a9NOQB7gyTAGheH3ct/lb6NMmpoB2yNDssykeRHL8qBWSiqxfqgv6aco
	KawZOi7mlursBCo1s9onpiR1N6zUxVgyO/e8dPPh5b6jLtFhcZSKYfZ8FyBfLnHRCSMBPbuu5cCc3
	oHcQcrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYo2d-008eP1-3b; Thu, 15 Sep 2022 12:32:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYo2Z-008e7G-Ud; Thu, 15 Sep 2022 12:32:25 +0000
X-UUID: 97bc815a4b3b4635a4c404dee62679d6-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XojuKpZCUNxY4C6Madj4ukhRH/8ix5f31tF8a8eQ3Js=;
	b=Z+09M7b9nMVgON3lUU9Ty8w49WszrIE9Hl8V2vlur+9FyWxrpbtTPZAPzXMpvCW8V3kfAHOXGgMZwRQkFGZWEeoOT25zepObPhBsSy8vszPJCbGQEkUuAzKYIx8g/NVJPi16XJUFccQR58j4VEGjHrV9m/8h1lPba2Af6akc4IU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3ae4a8be-3dd7-47a3-bf8c-55e27d1bc760,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:bfca86f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 97bc815a4b3b4635a4c404dee62679d6-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1285498711; Thu, 15 Sep 2022 05:31:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 19:51:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 19:51:38 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
Subject: [PATCH] media: mediatek: venc: Add h264 extended profile support
Date: Thu, 15 Sep 2022 19:51:35 +0800
Message-ID: <20220915115135.7271-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_053224_000026_EFBDB6EC 
X-CRM114-Status: GOOD (  10.25  )
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

Add h264 extended profile support

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Co-developed-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
index 13c4f860fa69..ac2ef6275d78 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
@@ -243,8 +243,7 @@ static unsigned int h264_get_profile(struct venc_h264_inst *inst,
 		mtk_vcodec_err(inst, "unsupported CONSTRAINED_BASELINE");
 		return 0;
 	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
-		mtk_vcodec_err(inst, "unsupported EXTENDED");
-		return 0;
+		return 88;
 	default:
 		mtk_vcodec_debug(inst, "unsupported profile %d", profile);
 		return 100;
-- 
2.18.0


