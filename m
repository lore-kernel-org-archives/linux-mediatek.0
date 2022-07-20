Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F77C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXhl0KoHqANRik608bAj/kYG5xciXgrdLeAmDj7j+aI=; b=GCK9QYwDAaTFeK8V0+0Qb+38am
	UeDOuNxVZkkgF4tQYZxLJr6sgkLTFfTechZF7/MpVS8fg9zuOmZbDET0r8RzlOqllxAabmfpKfNn+
	nRdkF+5cOXaji3yp1jtR+xh3pqH7+KAOIGjDoszsG6ze4HWKPz0z/DLP3w813+GwRRerUYSjjagsx
	Ijn4DXFMx1bKSHaB0utwcZ/ps4b4znJaITQYYuYwgqhTRDQbNg3JGXDuwgdUizYe9quS9Qhq915q4
	GdVrSgsR4Df0qBg50Srzu0QN/zNpcyFGjDv0ePdCQ4jcVtrwk/ST4bdZ5GKGgufdS2YXvWx6Haj6j
	QRHC+TTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5XL-002vfI-Mz; Wed, 20 Jul 2022 08:58:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5XE-002vRY-8e; Wed, 20 Jul 2022 08:58:27 +0000
X-UUID: d9f8deee25b24a8e970a4eb90a5cf42f-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:783004b7-f244-4d89-925b-2645d0f255ac,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d681c964-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d9f8deee25b24a8e970a4eb90a5cf42f-20220720
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 907444485; Wed, 20 Jul 2022 01:58:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 20 Jul 2022 16:57:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 20 Jul 2022 16:57:41 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
	<acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 3/6] media: mediatek: vcodec: Add mt8188 encoder driver
Date: Wed, 20 Jul 2022 16:57:28 +0800
Message-ID: <20220720085731.11011-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720085731.11011-1-irui.wang@mediatek.com>
References: <20220720085731.11011-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_015824_324838_8A79A3B4 
X-CRM114-Status: GOOD (  12.09  )
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

Add mt8188's compatible "mediatek,mt8188-vcodec-enc".
Add mt8188's device private data "mt8188_pdata".

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_enc_drv.c   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 95e8c29ccc65..ea667b867b56 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -406,6 +406,18 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.core_id = VENC_SYS,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.uses_ext = true,
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
+	.min_bitrate = 64,
+	.max_bitrate = 50000000,
+	.core_id = VENC_SYS,
+	.uses_34bit = true,
+};
+
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
@@ -434,6 +446,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
 			.data = &mt8173_vp8_pdata},
 	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
+	{.compatible = "mediatek,mt8188-vcodec-enc", .data = &mt8188_pdata},
 	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{.compatible = "mediatek,mt8195-vcodec-enc", .data = &mt8195_pdata},
 	{},
-- 
2.18.0


