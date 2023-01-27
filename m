Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A162C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=; b=FtaeOl5Q86NfHvDcoyKPdQKVzq
	7b9O2whKekEVOx3KshJCiN3+wTFu+ZieZr16cP9oQe98hexG9djF1iNuWg360SJMfn8YwBh26Cski
	/UtnTJ31EInK87ad73nGyhpipvzZEnr8zVlMn9MSF/p2B1Aj96E0l8xWracEioGnEVuLMPS+FuxvC
	iO0WOxKdY163FR8XVf4jUGeNnK+HVCnA0D3pQ2KxAH+o6KbDI9qipHKEXOoj4m+vgU9b3ATPABErt
	u6q67ei6jWG/iA+z6UEEQ8l3VChy8da/YXcRLDN7YucJtBsqhSXqPvN2ai56yEBn/8rZWzkQ5E321
	yaeY5hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRPW-00Fcru-Bt; Fri, 27 Jan 2023 16:17:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLROm-00FcaI-74
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 16:16:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso3846578wms.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 08:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=SZmfIny3U/S8qG+e/WnJPW4Ssp//fHLsfmZRnuGKIjQTiMoUmWHXcxyZjYy1KVA7QS
         oaCB2QrEooTl9JsCGk5BX2yDzWNkkiEWfQKklWElFXvT5LuTZ8bl6PA8gvRxnJiuFQCQ
         ys/gWBK0HZXF0WohL0y6qH1/kbm86bd0lvIE5rIwCVnNwBXpou+1efVA4qJxT0PBMkNz
         uUqCAIDiXkYYJoRn+34edZorjJOJ8YWGQ7jt1oNyZ1865LL63dXK3s4fGMeaRKCwlFFL
         WzgoOyT8vV2UQ4rOZYkBaUxxGTudg8Ca3ay0+6v2g4tpfg5b0E8kHpd1HDjOaU0sE3o9
         uxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=JRT3GmxJoiUy6WS2kaL1lt4ipct9Z2tzkQqxBlnOxm4jcVduMOUuOpmk5goErBrfXE
         J9V1/yUQWP/hq/XhBndO8F/9Qj/1qqsiw0PqiFSIKPOswR4XM1vvz3IY45fFAQIcNnx8
         G4mQ7lTw/yTpNdKq4WbHY3Xx29Tpp0S9rJkkr5BcQqbzvyqIy8r6retqcB7ZpyB1fZ01
         H8Ehp4SpmbgeiZTjhWjZf9DAg+7gqX2Uyu0p9r8RBoon1CtC1IS7DTiSEhEcplwkU93W
         JP41ijW/3KEmDnbzO2HmqZXzVZStY58qpWYV3nTg5alG+/xX+EqwmC53AkBZlymSpE2p
         FqJQ==
X-Gm-Message-State: AFqh2kqRZHS2Pwr4fSJ+AIGuKYPrlt5h7fAE89WBeclCrv0glPctOxIm
	H/IVifC5e42sqx7Fs6poucF73A==
X-Google-Smtp-Source: AMrXdXuordLziVYmuuVYBeA7Bkt5b1HbFTqNvAAo/MRucQWcpaadudaJmH5tq/D7Ta4P+ZjFAaTv7A==
X-Received: by 2002:a05:600c:21c4:b0:3da:fcf1:d4cc with SMTP id x4-20020a05600c21c400b003dafcf1d4ccmr40404327wmj.30.1674836178781;
        Fri, 27 Jan 2023 08:16:18 -0800 (PST)
Received: from [127.0.0.1] ([2a01:cb19:85c2:1100:7fe1:513:212f:568e])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm4744566wmn.19.2023.01.27.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:16:18 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 27 Jan 2023 17:11:35 +0100
Subject: [PATCH v6 2/3] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v6-2-2f641c422cb6@baylibre.com>
References: <20220919-v6-0-2f641c422cb6@baylibre.com>
In-Reply-To: <20220919-v6-0-2f641c422cb6@baylibre.com>
To: David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jitao shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stuart.lee@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>,
 mac.shen@mediatek.com, kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_081620_262622_F5653936 
X-CRM114-Status: GOOD (  10.94  )
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

