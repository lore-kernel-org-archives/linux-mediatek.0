Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22095C5472E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBeiEf9X8N6xSFq/Sd6Q+1/33k4A8r9mRuaNtrYrkSQ=; b=rZLgWEXVfSU34nDeWKfK5yEOI7
	cFFKY3Mcp4OgmYq4bbTFSTagm4yJpamBkA84C6Dpa9Ck8WlqLJ3bMoKdfJBpCj0QHD7LlVKYKWhWt
	H7Q973hW+v4La88YLXmssoPki+UowMmc8NWhFn4GQdd1zaRVLidoso6rTJshTHyjJsuMnD31SoElE
	vC4vhGorpY6HZim9KKLWJvkIqGn+TUlnZJsLMtlDVEweAtGRmJUGNLXzANF8Z+YWin7Pf5IhVUWT4
	XbwNbOeQiH4Mt5GxC4cuzgKGujdIpmMrON30rOspVM+HvW6zKcw6XGFhDQEagoU4jLFDwgoswQ8UF
	yviNI/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWkO-00000006sWV-2ZmJ;
	Mon, 26 Aug 2024 10:14:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdX-00000006qhd-153B
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37193f192b1so94248f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666866; x=1725271666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBeiEf9X8N6xSFq/Sd6Q+1/33k4A8r9mRuaNtrYrkSQ=;
        b=lU7LhK10qP7zkvCw6foy5ZP+dPNfOzk45p4egq/ueLjXZMVIDu8YdSocZbbFdi5ns9
         MWNDDV3ooSGtPvMpJb9bUy0NLe4JDSfHabvQ0AGPVB7T9k+5tLOVNpuHBtuFyjiGSdsB
         A3M3ozVoAF2XHIAmPL5SBzwn07QGGMrV95kJgDHo5TXjxQdGUQnl0jka0aYBtTZGCH6t
         B9n1rMx82bazIh9g79UV9pk37ETnEU5Gkk0KwE3Ye2RVRIUoN7lGMiFHnpFLEFiJbwrq
         cRFtAlCaO1xFAjm792BSfd5vBcvlSoXlJlkh6gCwzTr1CBZj0HIrbH8TRbleT0blLo06
         0TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666866; x=1725271666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBeiEf9X8N6xSFq/Sd6Q+1/33k4A8r9mRuaNtrYrkSQ=;
        b=xAV655EAwN60HtkTxcWHzQ8lAb1DeBVG4Z1acUPsAQ5llwdZQIPQCVOK8PksZTz3Fe
         K656Zo0U5M0TLW/ThRiC2L8soCxaFE8y4BIhF9OyCo3hCN+LDpzzdvf8UlxOxkur8n3r
         YpWWquXZcLIoHKz+Hdy0RpSFkwT530EW/C+c2aWU35soSyvl84tsSBlsGfKbtaCndFsp
         od1/vQ8vbKHrv393xjL+zRPmEioEsYBXWsVE9lmJ8cemDQ3JO1Wctca8NZOYC9n3zKTn
         +Ff/DhGn0R0HA0dUIDqZJl3GQjgJJX7qfT4VPEx2vDJ42mqDibzeqdQdu7DuxPBs3A3n
         iQQw==
X-Forwarded-Encrypted: i=1; AJvYcCUDwnuVUE4lE6Yz15WLo34V9+FF8SyCtxBFITW2xM4hLcTEYHoSEZXRfUvda7z6V8a4BGY/5rmymwOlT1y1KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6CFH5wStxICwg3fYQfZZZrpBhyDKOl5WOQh1VmD8Pwb5iqe4j
	217Zd4zN87RbAnwdpAU3Wgom1rC1yyp44zW9r3qPrpz/1mUwgjSFrojvcwahnrM=
X-Google-Smtp-Source: AGHT+IGok8paLmSnpgAD267hn+gsKafIUp4M7EbxL8F3BzEx2cfwlqJfUxJ4Ip76g3TR7Pw0QL7lUQ==
X-Received: by 2002:a05:6000:178a:b0:368:4c5:1b5a with SMTP id ffacd0b85a97d-373118e9be9mr3513537f8f.9.1724666865829;
        Mon, 26 Aug 2024 03:07:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:25 +0200
Subject: [PATCH 09/11] phy: ti: gmii-sel: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-9-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wdcz8XiBcDZ4nb0AOyZykqRBbhQuQooZzPq8xpdRV9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPg7XFF/j171N1twJsIMBg7OuBUTIrml6/H3
 z9mJ585yGaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT4AAKCRDBN2bmhouD
 15gsD/9NG7meHEPdkGDSA1PRkg5U5KXHnzxvUKotKxcO1clvqIkAji/rh3oNkqiVL+FPmrussrg
 hDEha6daxxni20jY+Ps+KDwx8AEJx/V43b0u9zIz8mznDtIJP+QV+w65ItVJMER4EL4qFrrvNoa
 84PAeHCNHzZ+yLYNMU5OHdd34ujA4aj3PG1RmhcTGHROblTW5Yo0X0FN5K2CUyqsQTWmOCftmC7
 na/onL30T6APTuiL8MM7nxnifJQiejwoEAMCmuMShcfMxb2TSizTQDE2ngzW7k+rEaYYmvxTliS
 6BjwvzLXMtXfGYPkqEo0sBTfKvF7BTjGkNO+bSqwqwCzgOFCUnw9amfi9dPWX3UnNeShsLOHEcg
 sehqouSfwTMyQlfK76x8h8hFGbP40KlZv2HZbHnEoXKZQ/qU6KCcHaHIoOzA5FMDpZ68Zjotu2W
 LTAeT5wfYwqcq0V+eOWZ2mERiuw5ZQfK7eqE5m4pb5Zqgnker6X9zm/EPSrE4Ai7O5VgE6jz8hs
 zYAfE7cvePsM2H0lwtG6C2nwx042tFYgGfFNNXp2ElpjYOLV1LXedhq1TruxTPXlOs/uEYVsp8L
 cD1t44/kop1FGB241wS/jpWalj3dDyx7/aXSoWpydH0n5RKrHxtztgp0t7fp3xgqmOhC+4234Lf
 /t4rWoyAgjN2j9Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_030747_342244_3BDA5676 
X-CRM114-Status: GOOD (  10.76  )
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

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/ti/phy-gmii-sel.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index b30bf740e2e0..103b266fec77 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -468,11 +468,9 @@ static int phy_gmii_sel_probe(struct platform_device *pdev)
 	priv->regmap = syscon_node_to_regmap(node->parent);
 	if (IS_ERR(priv->regmap)) {
 		priv->regmap = device_node_to_regmap(node);
-		if (IS_ERR(priv->regmap)) {
-			ret = PTR_ERR(priv->regmap);
-			dev_err(dev, "Failed to get syscon %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(priv->regmap))
+			return dev_err_probe(dev, PTR_ERR(priv->regmap),
+					     "Failed to get syscon\n");
 		priv->no_offset = true;
 	}
 
@@ -485,11 +483,9 @@ static int phy_gmii_sel_probe(struct platform_device *pdev)
 	priv->phy_provider =
 		devm_of_phy_provider_register(dev,
 					      phy_gmii_sel_of_xlate);
-	if (IS_ERR(priv->phy_provider)) {
-		ret = PTR_ERR(priv->phy_provider);
-		dev_err(dev, "Failed to create phy provider %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->phy_provider))
+		return dev_err_probe(dev, PTR_ERR(priv->phy_provider),
+				     "Failed to create phy provider\n");
 
 	return 0;
 }

-- 
2.43.0


