Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E3C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 16:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0OXxX4BN+JC/Hy+vtoYftLVfMwhN/RiALx1B4QXUlc=; b=Ym2P6G6m2981RD+qoDSS72d4yq
	J2809rEmTZfpNnO1MTqxourW4mLTkezuLpGi/v5kPeop0GrfIUPyeJN2LOjeOO4SdV9pGtRAaxaXD
	WYiq2znBaiZjtEysPJrM28TX+Dg/L4ouMEkjmxhrwz+P+T/P3m4XaAQeOOQ+JnLo+MJV+nWtXu/Jr
	sUnv9oQPEwIMoudYiXnM8gC5d2r7+VKr/r75dQwTxmHNbR3NglbbqW8tpDoYNuiRZC4tTyQaMKDXW
	ULahcBAraNzKPq1skWWPcg3Xz+9DW/3xnE6zmFwcSshDuS/9t1MoSYNOEm/9z/vq6lGDQigi0RCil
	eUxIZiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgtv-002mJD-6V; Mon, 28 Nov 2022 16:22:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgtC-002luU-19
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 16:21:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id o5so8708552wrm.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0OXxX4BN+JC/Hy+vtoYftLVfMwhN/RiALx1B4QXUlc=;
        b=SlkrWf3SnnGDpb675mkRP6lf4nLIT1ljnSs811QXoTIpKGIr6nkO1robz4uvX+3hel
         emJjd5A2yCCTjR0LXKEjLdGYNb2o2zsvcHdQ1nXfW9oFv0bIePuY9EEF+wvSQ1jpJpfe
         uYlNtXWlsAQakgdO/rq4yHkCGTL/bSh4cUCBhsM2mfP/FtZp0bXgE/HPcGJU/oRl3i2l
         zPL3lW+z6Kap+h6fgLOacZBtOL/HD9TJ6ShxhljgFYgVd4/L6A/2W0q8oT/Juz8T/7qv
         qlVqVlXVA5+/JbXKOjRIX+Nb72oLRueixKPJUM69A14modQclXgDP110z0Dye0vX0jdJ
         cvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0OXxX4BN+JC/Hy+vtoYftLVfMwhN/RiALx1B4QXUlc=;
        b=vYeAhZE0oZU72s2rw8wuzXGVYYSJR44V/EsjxwYPbw6kZjBdvjgmGiY0zrF88Qgp6E
         Klzx0jU1pOppjJwMHXlluklSxBsk5yOFC4NS2rmnUtqMGfzXon6tB3fEaW+cOelchF2n
         F3ZHVCToP1YpW0d2iRaSLgsNGHk9WcKkRjAD1jYLUmki5OPCEwuyJO6Fi8jX7bVM8XGb
         ZYykjTOmXG/Z1HPVCxP7RNpp3nMIy2MOWtUNUZFmC8rbjrwcd0NGnyYQ0Pl3cBMT9/7f
         qPCSvzIY1uvD2eNSnEJsIRZ2YM3gvBEas8wSIeFthpwyTOGe4y0mjRUGL6Fv0/8BIPCf
         bgKw==
X-Gm-Message-State: ANoB5plwvjCO+ojmTyb0cJ2LU2dwXNoGjfukP0+OdMpfJF0sLxy9xsR8
	BLmMnBeEufmO00rZiX65t1guMg==
X-Google-Smtp-Source: AA0mqf4mvZhMdusHlUCoDzlaITnTfcTdfTwIBg2rPiKj4l0XqNnN3xuoOOxzvyyaTx+gTn619CGt5g==
X-Received: by 2002:a05:6000:128c:b0:236:e512:1a9e with SMTP id f12-20020a056000128c00b00236e5121a9emr23151843wrx.416.1669652506887;
        Mon, 28 Nov 2022 08:21:46 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-6340-f657-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f657:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id s10-20020a1cf20a000000b003cfe1376f68sm15311450wmc.9.2022.11.28.08.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:21:46 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 28 Nov 2022 17:17:37 +0100
Subject: [PATCH v5 2/3] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v5-2-f346444bc459@baylibre.com>
References: <20220919-v5-0-f346444bc459@baylibre.com>
In-Reply-To: <20220919-v5-0-f346444bc459@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: mac.shen@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 kernel test robot <lkp@intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_082150_097839_F5B2D757 
X-CRM114-Status: GOOD (  10.45  )
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
2.38.1

