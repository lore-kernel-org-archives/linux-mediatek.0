Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB7C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 01:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k1NVMs4c1NQmKvWH9PsNtMU+v0jIXy8wQzRwh98laSU=; b=GHCyELhzJFAfkl
	IW6WVvVNzMSXSkw7AVji45NaeuRoDGrAB4px3HdaAyNtNeUtElEj8zC4jtTSVal/5etmMuQlY2iKu
	T2dPYHemHJjyig200Yn8QRx1jS5VTWCaRDpfsmhi+weSzN0Av3HKmDePyzBJQRIMdpyEF+8jxGEib
	GRyHBKb2b+dFYTbA1/6SCthTEuQmymfBmwNGw3hW8hJc1h+EGzhtyF0Ck48vHNr1K4ejhJgB1GNve
	W62oyUByPlzB5kBHeATC8uumQY94qi6pP99fgqWAO7K/VWba7JpQRcrN7IaPnyY9BGo2khRkvTIxD
	EQsUbPal+qvHaAQAAu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTqH-0056TY-HG; Fri, 10 Jun 2022 01:53:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTq5-0056Mk-NH; Fri, 10 Jun 2022 01:53:30 +0000
X-UUID: 7ce292fbf9f84251aab70561d97118c6-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:4494bc02-2621-4d74-a4a3-27994c326bc6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:e18ddc7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 7ce292fbf9f84251aab70561d97118c6-20220609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2137149006; Thu, 09 Jun 2022 18:53:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 18:53:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 09:53:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jun 2022 09:53:16 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
	<acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 1/4] media: mediatek: vcodec: Fix decoder v4l2 bus_info not correctly
Date: Fri, 10 Jun 2022 09:53:12 +0800
Message-ID: <20220610015315.25513-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_185329_791417_0849CE46 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix v4l2 capability bus_info value with correct chip name according to compatible.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
changed with v1:
- change bus_info from "platform:mt%d" to "platform:mt%d-dec"
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..4bdb5ae4a116 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -185,11 +185,32 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
+static int mtk_vcodec_dec_get_chip_name(void *priv)
+{
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
+
+	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
+		return 8173;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
+		return 8183;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
+		return 8192;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
+		return 8195;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
+		return 8186;
+	else
+		return 8173;
+}
+
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
+
 	strscpy(cap->driver, MTK_VCODEC_DEC_NAME, sizeof(cap->driver));
-	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
 
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
