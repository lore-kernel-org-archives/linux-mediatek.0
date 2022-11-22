Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22997C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=; b=opzsKqhAIIrF01x7oRYEitFfy4
	cOMcXSQhVSo8qRH/5Rd27UAdYN42mO7l0TvSpXUdhgGVJ4UL1CGN9HZ/l25+382AwJCQAJeYGon9N
	+0fGh56z8tudqfCSYr3IFWA/Jnq946OYYMoipzWXcNrnERvMvPybakWB5TIcZfkJpl98mT9JS2KJB
	4JWqzSiogbYvYwfHDOobutAPMC6YqudOlGapjJE6lOqMw/MNsJuPt9wrNyjxwClHdqVVW13AyqgoD
	7ESlL5g65s2CsT0q+7OnJlgwu7VK3G3CH0nRMjk+vgYpw1HEKd10nHGtil9uW+DXeksclGxiSZadY
	p5zP8zfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHm1-001nPQ-Ne; Tue, 22 Nov 2022 01:08:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nJm-FV
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id gv23so32381160ejb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
        b=LxkapDROlNg89vbfyOnHNwYtPPUfl2VexbTmKnYd0BjumMyVcRkoBcbPgGQNiCR76Z
         lu71Zfj0axIJ5DX8GAYZYxOcUEcnNsw19VoSTfGwI3jpbvJTC7fpGmm28fhX55YGIDul
         q6HM6mtWmwwZgWn/Jxl0R+IFpAHdrkfwzeiDNe3JLDvu58K0AmooRZlP42VhOD+nOtu8
         Wpn2B0vMSsS3VTfpWqyvY0El80MtzxkC3ni7qpQS2roMk2Nk5Sl0U6kG15gzcX8U/yqw
         CM+eVkiPmV3UsNrgQxJ4fPA3bBMV8yMTG2Cb9YD/l1IjmFGKuLPm6gS44TXGKTDI6kW7
         9BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
        b=QohVJrX3xB7c5TFriL0AcEQbf0d0kD0B7nCgC8guTFAB2qPyWGa6ypHWPcW7rW6o5t
         gLdSeCtexaBcSV/IChD0pcMWQbWRqgWoJuqTWZ9fyPNJ32yCE/fJLd1vTjuLFJmiLdZv
         7fbokDn5syCEkpmpoCW+tgNTn8yBfsU78x1YBY6dm+s7AJJVj949WJoTvMVdx2O8p91G
         H3NpdHXzIzwIBEnoF0+1E5qBr8j+lMOdF0vjSn7jKg4pPyLSUXHYkdgkZZEd9jJPn+z1
         6JrrXxsEfov27+kNg9wGwQraIxiOwUNMwkaHT+5CE8dozeDIcR7fMaxw+9G9wWnjmG/t
         x0qQ==
X-Gm-Message-State: ANoB5pmRViqpiZlz3KPRcyahC4tpMrF9Mj/tysX24zWKASnRUSPdVwoo
	Tvu9MdasYjS4DlOwR4Nw4a02qQ==
X-Google-Smtp-Source: AA0mqf7VrdKpG04LpKtWDcLfh9W2BtI6C/41tDew40mV/sen6b/FETzkdsA3/5/JhMJG+02LOvmq5w==
X-Received: by 2002:a17:906:3810:b0:7b5:cab5:2ea8 with SMTP id v16-20020a170906381000b007b5cab52ea8mr1036389ejc.222.1669079288692;
        Mon, 21 Nov 2022 17:08:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:08 -0800 (PST)
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
	khilman@baylibre.com
Subject: [PATCH v2 1/7] pinctrl: mediatek: common: Remove check for pins-are-numbered
Date: Tue, 22 Nov 2022 02:07:47 +0100
Message-Id: <20221122010753.3126828-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_599248_EA9A53A8 
X-CRM114-Status: UNSURE (   8.57  )
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


