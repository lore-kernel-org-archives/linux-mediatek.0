Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BABC636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=; b=c65xRr8ZOJWnw0+2ZkaEhXEw3Y
	yFptnfAR5TeCPEfFgGenXP2VzY70YLWLHoutFpgFiCFmvxPOwfKcFpTW0rYXQ19vWK/J6ND/deghl
	tyj5Mk4DliB+RvcYIlFwFokg3tGiGp4+QWm1JXuj+mzf8hXLiXoGeTJnIWB0VHyKnILJRIlMFADEU
	NUZQT26MJGL+JHFgqIx2kR0H9oCq4nEl82J0mPYaTdvJFm0gROSOOTjmeYQvfDokMCIdwg24WDAa/
	Ume4mpfGSO/39NxJDG92g9viWqXtr4Bv4afGkYTlFp29WAcGMvdu8NjU057GnymNSe+F4iXwFjuWt
	PPYqIUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShrM-00BJFX-H8; Thu, 16 Feb 2023 17:15:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgru-00B6Tz-N4
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 16:12:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id by3so2339881wrb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 08:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=jgEXZWlfDe4qtHQuf4Jd+qS29NFxdCuq99gX2oiiomDmkUZCmAcArwOHwSs5Mzn/Zq
         tw6EtSU0kn3JCd/gaeg879yxoUrkkQImAHoishjoNLUj136ChpytIYKH8S6t5/5fvxz/
         hm5Nfc8mjClJTK0zlD7h9LWNLOc5bdZJ57z1LFhTgYNwrWFuL3g9n1Sqz/Vsq7c4A6Ms
         sn+hhJ3dl7YYFMH42vKkBmoUL0Dwe5inEgawgt8QdgRlLUtK8m1z18OVqnv+jG4ReuFz
         tKIHfitIXwG+jDhP2hRrroCjiUlONtCkUugswqX3mz2VIrhoMFczqVRLoxqVKFNf2GH5
         3vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op30N8VplB3ypI088BE1DuG6HdC3ZVERGlwL+v56hF8=;
        b=KYQeCtT4/DlbPp4L6XJ7wDbKfLULaDzOM/6pRHX48hSjd+Oj9biAtaAjTrvjwlNcjy
         LmJ+CJi6wjwOddB+SwEbJIYNSz0BGifCcKkoN7jugVlCNSb9grAbTRjYTcUXMy58/0HW
         9XRmXHDbDdkb2RuEDg9KqHzceS3ShShnxzByFoimO0MtOZz5bLeQ3nHB+gii8y03AMRM
         qci6Uu7xIOs3IMPzVgw9M8Nfw2tcJ7YoGo1huV26i/4DZuc2aRzyQzO2JmnDKLifCDhK
         BTBNmdriGCEqtnxhzv2Oa1VM8jxyiOnpIBb+gLVKgxiQC7zO5UvVHFoXtchGAuhb5J+V
         V58A==
X-Gm-Message-State: AO0yUKU+YGSW/vVmHDZGqSE5xw4Ms7v9KkVPIEwlvYEQL1KCC68czsEB
	Ndc8xbYKRBHsIJOMU7aChFcY8A==
X-Google-Smtp-Source: AK7set8xSzpv3cwcbk4SfxFIeaHGJO04GQ3q7uEVVcm5jY6xK/M9RbXRhAsTmApjfVv92Og00YaeNg==
X-Received: by 2002:a5d:518b:0:b0:2bd:d9b5:8191 with SMTP id k11-20020a5d518b000000b002bdd9b58191mr5262191wrv.61.1676563937909;
        Thu, 16 Feb 2023 08:12:17 -0800 (PST)
Received: from [127.0.0.1] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id m16-20020adff390000000b002c56a1a5a95sm1845586wro.30.2023.02.16.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:12:17 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 16 Feb 2023 17:02:26 +0100
Subject: [PATCH v8 2/3] phy: phy-mtk-hdmi: Add generic phy configure
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v8-2-a84c80468fe9@baylibre.com>
References: <20220919-v8-0-a84c80468fe9@baylibre.com>
In-Reply-To: <20220919-v8-0-a84c80468fe9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230216_081222_850677_394C3C6A 
X-CRM114-Status: GOOD (  11.04  )
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


