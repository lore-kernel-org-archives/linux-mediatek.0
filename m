Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EFAC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=; b=ExKS6M3vq0UbruYpLeFXsvZoFj
	8GBcuRWpHA3Gnxip2GuaXhn+vJehyfdwAv7C9awdudBUO0hg+SGyTVxJ9FXjKlVdtg/seMb4+U5DZ
	wobeGWJPjG8CvVKGTlWjGAY0vN8J3XGvxohM5nGDtSgbakDXlElTh8mBq44DNl5lxYU5bl+2/IiGH
	R+HUEOnP4lmCwp1fvxwM0xFLDUUpXOqWX3PbeFWC4tTJ6pUqNRCD/jwfrhOQtyIyCPQ6y84hUIg8E
	Si4kEQgTXcxbGK51IFCAu7FHJ6t/E4EkN1V3CST9e+K8v8rqb5osb49cH1myxYWtzW0t9vGA5mHXR
	91QkZzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAz-00ET9g-CD; Mon, 13 Feb 2023 11:39:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAS-00ESti-LT
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 11:38:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id gr7so31076751ejb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=vB8WykBafuRzRtDuguyc/Bo7sbY5f8z+gZOza7CCBeeEj6YTIzlIkJq/9c4EOPLl7C
         50Ee1gHpVfORgKOsSDYfzA9WuJGCvSwAAoDVcifSXr8s+InCZw2mDiGTae7uUdOWm8mt
         BcwlQKCl4oQx9mHeAK/roUU2AtelFtJ1kXJcs17xzwpymr7zFiHP+KN0M75x2IlqAk/M
         ssRZdEBzWecwlqDwlqi+JTyG4CffD+U03W843WrTFJ1mrTO8AjS7o4FZY5RPo6GoX4rL
         jhy7au2YWjp5Xi3WlVC+hNIc9AsFm6lEABGBUScDZhtW/akwnOb9YHELHjQh64vW83It
         uo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=oKzoxl/7UjTRITn1faimCGETtBw4xj8+o3tStTizNb3/ax5uCpKc6YNrzbBpQ9aFwW
         cp8hFjgwXWTMGyEEaJwpxWyEi8v89kFBcA5s11CMbkLlB07OwtXVsc+ZgLzBsgF5CV2+
         RGd/S44gZj5rH153Sb6qv0RTvdgBXYN36OMFnP5zxJichtpe90/GNRBnbX0/rsYfBYvO
         BUMXDFWx90w0ylb5itt5pcGfeMek/51hLnPSG75BfY3CY94AiKzoAcCjinE5ulSEz+wD
         jQJCwQRYWQnk1S7eC1frxZtQJlhyxaSYvhEESg5d4rhoBSIWkCxt5jbAWiiLIM3YF8RD
         AuhA==
X-Gm-Message-State: AO0yUKUX44J680PBED+uuXMYvmVpzEdOixR6Ycc448ctA/TU9Xjmm7Q+
	luf6WcQWYaC/BEk55XZJVMIab/msg1Oojky9U4o=
X-Google-Smtp-Source: AK7set+hnByAR87YpkSk8ZEV835WPhK7lmMocjr5dOOtPVxa4wOhPW/jWxc2FJLO53e5q5T3zl73pA==
X-Received: by 2002:a17:907:72cb:b0:8af:5750:917 with SMTP id du11-20020a17090772cb00b008af57500917mr12827958ejc.35.1676288322760;
        Mon, 13 Feb 2023 03:38:42 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-d206-ae05-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:d206:ae05:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906061400b0088ba2de323csm6638792ejb.181.2023.02.13.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 03:38:42 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 13 Feb 2023 12:33:33 +0100
Subject: [PATCH v7 2/3] phy: phy-mtk-hdmi: Add generic phy configure
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v7-2-b5b58c5ccc07@baylibre.com>
References: <20220919-v7-0-b5b58c5ccc07@baylibre.com>
In-Reply-To: <20220919-v7-0-b5b58c5ccc07@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_033844_756011_80C805AF 
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

Some phys, such as mt8195, needs to have a configure callback defined.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b16d437d6721..32f713301768 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -8,10 +8,12 @@
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
 
 static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.power_on = mtk_hdmi_phy_power_on,
 	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
 	.owner = THIS_MODULE,
 };
 
@@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	if (hdmi_phy->conf->hdmi_phy_configure)
+		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index c7fa65cff989..f5aac9d352d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
2.39.0


