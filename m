Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EC9C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:27:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 344846044F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 344846044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H7G7u3STM2QFhs4sJLHKrcmeNiF3URB8/ci4iU1vBxo=; b=aqZ6cmzKegnlaerOR2OY5U5Hz
	0okdBpAMHbJCrxShvvD6TIE/6Q/45qIZLFKYytvzxPe1m8TG91uH6Z08TX9CvNEPYO9xwawFoZq3r
	pfFf/tNOM8Utjlp/q38nIMCVAfX3VvFIgyEII3ppvZYrir2YfI+bZs+/RXudftiehdzKWz3elmjfs
	gFhLP8r9ZyGHjizu7USjmIvWrWstgablFztWuKdFSJfE4d2kh+5bzKAAU2GeZ5qOSb8236Jsk2G3j
	VQXZKuzVFKtl+KkMCdZxPZOlt+jdIFafl14Bc3sicDRkNIowctVWV+QhxcTpQj/3c/uqYLd6wbQMr
	3j0lRbi+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqPD-00CCxX-EJ; Tue, 20 Apr 2021 13:27:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOn-00CCty-Eo; Tue, 20 Apr 2021 13:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=F/Ns6WIK2Dy0aPedbYy3llJMXtmG+SMNazBAvgRMihY=; b=OXUDoqg5EOiai3Y3quoKLQvqXv
 TtqZE9xHXvSYQvNV/ltbyIo9HKN2OR7QwuogH2nJocESGd+obmH82tkbyUzrOV2+Am2v2Ic6+yu4q
 dcsgTnAFzaKCKFUbTMjrCEcmXahDzyOP427T1sv+uZQYv4R9P7pyzEs3F5xUzjKgbnN+SsePmXBqa
 YjK0h4c57RmvywCx3daLLREAaiB2+AuSGA6s3XZS92ZJSbb523kbcSBMzE1rV+9v3THX0PIn9OpB2
 U3/DPcQGV0+hVudFDWenl1xUI1BEk/cUOk32/nDuYS4LEWSF9TQkFd5kf4ldedbLqwQ8uoyH+Z1dr
 Gfk2Kj3Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOi-00C8zX-9e; Tue, 20 Apr 2021 13:26:40 +0000
X-UUID: 54f85fcdcba2401c8c420f812a8d2751-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F/Ns6WIK2Dy0aPedbYy3llJMXtmG+SMNazBAvgRMihY=; 
 b=o0UFIGtF7B5l+zpZ/eonUMjp4IyVrBz4SJ+o6C1z6gZde/pSxgrVv04K313rlg+ePenX7Dlg1KHOp9jf8PVjKNBIJJJ8KWRe84pjKGf9dWuDqGTJ++lgzPRMwQmg56W91edZA3uBAjqgKD0bLYzKZwpxs8qbs4Zbps07DkEuBCk=;
X-UUID: 54f85fcdcba2401c8c420f812a8d2751-20210420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1946939592; Tue, 20 Apr 2021 06:26:32 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 06:26:30 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 4/4] drm/mediatek: add dsi module reset driver
Date: Tue, 20 Apr 2021 21:26:13 +0800
Message-ID: <20210420132614.150242-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420132614.150242-1-jitao.shi@mediatek.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CDD0EDBC07D217E939DC5558E2076778B137CA9F9ABA7EDE162356D70FBDF6E02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062636_361938_0702AEE8 
X-CRM114-Status: GOOD (  16.70  )
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

Reset dsi HW to default when power on. Prevent the setting differet
between bootloader and kernel.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 36 +++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 455fe582c6b5..113438ddd4cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -7,10 +7,12 @@
 #include <linux/component.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -143,6 +145,8 @@
 #define DATA_0				(0xff << 16)
 #define DATA_1				(0xff << 24)
 
+#define MMSYS_SW_RST_DSI_B BIT(25)
+
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
 
 #define MTK_DSI_HOST_IS_READ(type) \
@@ -186,7 +190,8 @@ struct mtk_dsi {
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct phy *phy;
-
+	struct regmap *mmsys_sw_rst_b;
+	u32 sw_rst_b;
 	void __iomem *regs;
 
 	struct clk *engine_clk;
@@ -272,6 +277,16 @@ static void mtk_dsi_disable(struct mtk_dsi *dsi)
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, 0);
 }
 
+static void mtk_dsi_reset_all(struct mtk_dsi *dsi)
+{
+	regmap_update_bits(dsi->mmsys_sw_rst_b, dsi->sw_rst_b,
+			   MMSYS_SW_RST_DSI_B, 0);
+	usleep_range(1000, 1100);
+
+	regmap_update_bits(dsi->mmsys_sw_rst_b, dsi->sw_rst_b,
+			   MMSYS_SW_RST_DSI_B, MMSYS_SW_RST_DSI_B);
+}
+
 static void mtk_dsi_reset_engine(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, DSI_RESET);
@@ -985,6 +1000,8 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 
+	mtk_dsi_reset_all(dsi);
+
 	return ret;
 }
 
@@ -1007,6 +1024,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct drm_panel *panel;
 	struct resource *regs;
+	struct regmap *regmap;
 	int irq_num;
 	int ret;
 
@@ -1022,6 +1040,22 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+						 "mediatek,syscon-dsi");
+	ret = of_property_read_u32_index(dev->of_node, "mediatek,syscon-dsi", 1,
+					 &dsi->sw_rst_b);
+
+	if (IS_ERR(regmap))
+		ret = PTR_ERR(regmap);
+
+	if (ret) {
+		ret = PTR_ERR(regmap);
+		dev_err(dev, "Failed to get mmsys registers: %d\n", ret);
+		return ret;
+	}
+
+	dsi->mmsys_sw_rst_b = regmap;
+
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
 					  &panel, &dsi->next_bridge);
 	if (ret)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
