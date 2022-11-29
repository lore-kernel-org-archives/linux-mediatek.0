Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB35C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=; b=VhZ9c6LEPEfoYWEfxktumx28z/
	ThWjS1++V2K9s1Xshamxz3lLigfxeteeqmaVcOztvVW9gHray7Fl+EbV5tnHsIeaVw01wZ54tNbdh
	X/+YC7rf99k8hbN25BmKAVwvHYfmfSXZ8ng4aI6E1o6TMO+Fll2aZRWrHwIpWQAuQDfn5hHuSNLHn
	/vwRDjbW5u+TKcEEplo7y3bKzCLB0N5Xpxsi4Yo+PGA9Ug6VXy2y7alnVmRmx6Q9QHF9DfJz9B9RE
	LfPXK6kok9i/Ye65LxdUFJ8p66Ux/ztFTp/oqZfFMHzzXZtHRtcCzpR37Pfe+IteG1zKTiBKPLXZg
	PdCFlnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRn-005KFg-4W; Tue, 29 Nov 2022 02:34:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRj-005KB3-De
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 02:34:09 +0000
Received: by mail-ej1-x631.google.com with SMTP id n21so30477057ejb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 18:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
        b=zdPnBz8LuT1eYde2dmjuvmer7HQPreaOkL/J34wCWMTbFXn/rlUkZgCRefXxmTxSd6
         ynHItCJhUlhX/oB2no2KlunwGK6IeCorVQeNAtZFV3oyjteMsRZVQXkWRXhjrRtoPFfv
         5dTvbspYt2uIpdh6UQQCegMEKg5YRfpqkfvCrZnv6NCgczSc7qKFiDJhgpL7nq5Ix5Yw
         JDv1wHyuf8+45dqkj6Blp5k9x5lc7FxsVJyBNVTlGlCM/p0CjKi6p8sx7XCmaYgR/Pso
         n4+SrZ1GsX9KXdHppUTzlSbDJaxWGT0Of3R5Nsw2oApzRycZvxrSZv00CIsPOmdE/UTR
         YTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
        b=jTYzGZLTqsO1R/GLo1CNGPkoo3mr5zq9zW+8Lc4nKcn9WSxZLf4Bm/wnkeUBgxgmVO
         nZvVhOikjNI4pnEkuO1n39vc+pdF2X/tacBK0Kc0fketcpx9ucqd3R6EMx+fsYQWU6J3
         9incgHmDCai8quZsEtS4a+W6cidqBX0wjMcvhDbkm2PEleVecT68HcbvtVAji26trdIi
         OGynJjLxR8GJ1DrMoKswSgDyv3KJjtj560QLIf3+oQ2F9N3EbwfrPhW+/iczqoH9+p+d
         jskWWiNQ8lynbxOH704VD6psASLF87XBEk47qrGfpMHmUIjmkSHJj0MIiZe/3zMQ4GEI
         JNfQ==
X-Gm-Message-State: ANoB5pkW7sniZMCChORVluxVKWMjFPOmdXPxzU0IayacLdL5izOezslo
	PR5kuAfKfgg4JQyTixpFgdUXKA==
X-Google-Smtp-Source: AA0mqf7cNqtLS8XZxcIEfqpN/Zg8AfFILEVbgilC7PIW1LJ9tdQClOSPyxdLvja1MaMQAwYiJDpXfQ==
X-Received: by 2002:a17:906:8465:b0:7bd:7253:457a with SMTP id hx5-20020a170906846500b007bd7253457amr13730873ejc.81.1669689244396;
        Mon, 28 Nov 2022 18:34:04 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:04 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: [PATCH v3 1/7] pinctrl: mediatek: common: Remove check for pins-are-numbered
Date: Tue, 29 Nov 2022 03:33:55 +0100
Message-Id: <20221129023401.278780-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_183407_700880_C9D7CC05 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Remove the check for the unnecessary pins-are-numbered Devicetree property.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 076ae0b38e3d7..553d16703475b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1057,7 +1057,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *pctl;
 	struct device_node *np = pdev->dev.of_node, *node;
-	struct property *prop;
 	int ret, i;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
@@ -1066,11 +1065,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	platform_set_drvdata(pdev, pctl);
 
-	prop = of_find_property(np, "pins-are-numbered", NULL);
-	if (!prop)
-		return dev_err_probe(dev, -EINVAL,
-				     "only support pins-are-numbered format\n");
-
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
 		pctl->regmap1 = syscon_node_to_regmap(node);
-- 
2.38.1


