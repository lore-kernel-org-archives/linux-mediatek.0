Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C397C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1763E64E46
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1763E64E46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z0gDOSG0mHi8zR1AzRt3IAOkuB6gNQvcK9Vxauui0MQ=; b=w7jgVRthUVrbC3GyI7SMpq1yc
	ZrCKZ9y1PLYzxXhSM2l2/IBr2bXRUWml3qKVQg5XEFsSezcLSGjFxI2XQjFHv0U2rjDwV3QhQqK01
	9K61uT5zZh1lc2jkwRXLMXH9waTm697AkRqLa8qLUoObboWATTbLIELJFUKBze7ojMc8CxmFwJxWv
	rbi97ScbTU0H94Cllz5+NhfvaMS5ogecdR4Rgww/Ui6OpCI1SZtMJDe9vqLLp1DxftJETjdv8R2l5
	35guU/jXiS3LT3dUIJ4VOU87HlG1yyLluUbU9LgmUs3S27MTcvbJUgaNYUzITt6H2DQYjqIYWQf/3
	okRdLWKqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Dg7-0006LI-6A; Wed, 03 Feb 2021 08:38:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Dg3-0006JJ-9D; Wed, 03 Feb 2021 08:38:21 +0000
X-UUID: 9ba5b69ad59a474e80254cf88fb6f4e6-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D4FoPbvJHE9kV1qFERX2ZE1osOmInIHOuyiFQUWpc1U=; 
 b=D6T8LnCSr+2yHVTOUCCxgkceCSaPNUhHzLsnxDmvzDdYrB5dITvLEN3hMVMN8R06YWh4Whe6ZFAse6BOe9yFkCHwIw0yNGL4rffTRTv9W5PfCvElsJ5wQh6b4Ldyyn12yboJgxwn+Nr7v7uhjgGv4fxyYhKBHDtasrBRRBPygq0=;
X-UUID: 9ba5b69ad59a474e80254cf88fb6f4e6-20210203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 158680049; Wed, 03 Feb 2021 00:38:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 00:38:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:38:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:38:05 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih
 <tzungbi@chromium.org>
Subject: [PATCH 4/5] media: mtk-vcodec: Add MT8192 H264 venc driver
Date: Wed, 3 Feb 2021 16:37:51 +0800
Message-ID: <20210203083752.12586-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203083752.12586-1-irui.wang@mediatek.com>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_033820_115544_F1A27DFA 
X-CRM114-Status: GOOD (  13.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Irui
 Wang <irui.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 venc driver's compatible and device private data.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h   |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 1594edcc706d..75914d2fd54a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -303,6 +303,7 @@ struct mtk_vcodec_ctx {
 enum mtk_chip {
 	MTK_MT8173,
 	MTK_MT8183,
+	MTK_MT8192,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index e8552673bbc7..dedc68b2260d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -428,12 +428,28 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.core_id = VENC_SYS,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.chip = MTK_MT8192,
+	.name = MTK_VCODEC_ENC_NAME,
+	.uses_ext = true,
+	/* MT8192 supports the same capture formats as MT8183*/
+	.capture_formats = mtk_video_formats_capture_mt8183,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
+	/* MT8192 supports the same output formats as MT8173 */
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 100000000,
+	.core_id = VENC_SYS,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-avc-enc",
 			.data = &mt8173_avc_pdata},
 	{.compatible = "mediatek,mt8173-vcodec-vp8-enc",
 			.data = &mt8173_vp8_pdata},
 	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
+	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
