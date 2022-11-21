Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A14BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/w2w13+mMWO6nBDKGCXMZSCYwmXc/qjKkmDVe/55kA=; b=gZY2m/OnXjlekevYwnHjSadmZa
	ZLj6mli2R/OtDSkYzziZY+UrfNHYxJNj1yNyoCxA2gq0fTfFSeb2NOje87NlJod5+a0vMNWSpBOSI
	Xt2Ko8/3jbyo32dIHKVie4xeTkqijV1WBKA4NPaQPYY2/bnri3ylq1H+sc4l6VMRycEWnrmSYtlKn
	CnKteVfaagyHCZKzdfWVjqfJzYvCTQ+mzspy2MD64C35NgBlYG/fsezWHldW8TQGlg06xyzboWS4k
	FQNvfPp4lGW6Q+i1TIJFWqq0j1VeFR+zrNgS0KyBn9R3/qSb74qyh5cb8psFcmQFrMc+uxLouHAWG
	JFT4O+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww2g-008K3t-Ul; Mon, 21 Nov 2022 01:56:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JMy-3d
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:24 +0000
Received: by mail-ej1-x635.google.com with SMTP id n20so25501523ejh.0
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/w2w13+mMWO6nBDKGCXMZSCYwmXc/qjKkmDVe/55kA=;
        b=ukSmjE2ZDkr5MBplaKJox8349Bq/DFiq/a+pyIyb/dlA/5xXDM2fH0vK6PKGnWpHkY
         WdbkNQfkGfBgc+fqQZ5Avx95WjORzzRqj2KqksT/e5UN5a4UNVVmTnnr9TkYmq94lq6Y
         AEtOcit1AdlVUNZ4kJbth4iUfDPhXwFfgrk7/UZ8XaGJtPggN+hS645yy1IV5SeQJGWh
         QNmIf7CsqpsYBZa1EgAbQ6VSFIF7O2S4J2gmpjbEsZyoG1YbkBoKfM3mwQfxc8UNootx
         8+c4vL+jyPU2rIR80jERU92JSOhVf55BiCCNb+6/3Gad2i1L5DutvxH/Bjeci4OyEcYg
         aT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/w2w13+mMWO6nBDKGCXMZSCYwmXc/qjKkmDVe/55kA=;
        b=QhmxApoBrLJQ3Lc/rMcBkGEMYB5rmReAyWekdfV4HDrxL0enYG9Ua3oLRhuM2YvaAl
         ddkTmyyOMph8z73GGcNgj4B2h5zqim0H4hp2q/MbQh1zbRGAgMWPPCjHU7rYa0RkbfWc
         LDgpnVqOlBzYBzGnkgxn94xK9Jqdj/Rc6p7ILrcrFUhZrXGLE5sJzYIjw7p96k5TSytF
         9eoFTogF/wkr9ar5I8YD0m5LYn2CRMfTZ1BUV4r063EksqZIundOzAIYR5Mx09UxxhIv
         tQLOCtW9FUXUO3Ujvbj515kHPjWoHKc44NRlKYf5s6t3ubk/Ph8upsAic5bEvCuXreuZ
         Sk2g==
X-Gm-Message-State: ANoB5pm/jmP1OqTmUNLqno5hRI85uL5KAB0AUy5R73WZtUpKp5KZCFCf
	CxwRNGHLolMwvEFORo8PDio3Ig==
X-Google-Smtp-Source: AA0mqf5AZ2xmEjYJZfawEV5yKJs7UGrH3Rw1OX9e0ct+5T3lY1OESXQajfo4ZcuEXEWOAgUov53/1g==
X-Received: by 2002:a17:907:9890:b0:783:6c5:c49e with SMTP id ja16-20020a170907989000b0078306c5c49emr13775680ejc.483.1668995707442;
        Sun, 20 Nov 2022 17:55:07 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 1/9] pinctrl: mediatek: common: Remove check for pins-are-numbered
Date: Mon, 21 Nov 2022 02:54:43 +0100
Message-Id: <20221121015451.2471196-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175523_226434_37C7962E 
X-CRM114-Status: UNSURE (   7.71  )
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


