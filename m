Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C75AC54732
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WbdwJwMzGd487Jm58/6IPAFGaqbJVFIEVy/1bU3kBU=; b=cB6aR2F6hbXwbiBkdwouZMDu8A
	BmBOPYBSp/iROfd/7O9DrNpmPOqVXy4kKyK/TTRRE6Bph9R+b3bqG87fwTpXzZXEnW06h0ngrGbgT
	21gCUq2U3qNF/GRq5mJskQnNUpzUPn1sM4e7gd8quw9vka1enKWJAR1MBU/xpCdlPfk9IPYGt+l69
	nZD9FR1+QKf7j3POw2T1UfgYolXwKV8GWo75Al0GAYIgpBL/D8WYJVb6sFGWZ2Bgr3l40EE5Y9rLZ
	ug+d+f0GufZwk+wzleKcSghCalNKX2pf9vP4UJIc+kAEYfsV6C+2PpCa85ZPvSgMMmr4wPGMZKVlI
	Ii2wgNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWeP-00000006qzK-0QeM;
	Mon, 26 Aug 2024 10:08:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdP-00000006qcw-0Gqv
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42803adb420so5120225e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666857; x=1725271657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WbdwJwMzGd487Jm58/6IPAFGaqbJVFIEVy/1bU3kBU=;
        b=oZgjnaCpq5y+DdK+o79IOjlgjdBFaspfXJfQL6quKgV8kJkGIQ6HxGqiK9H1ZbTTGv
         pMZSEHvYndzCdydcjgqppyKgBnho9tAx5iyuM8MyBsE/epggMFaEvOUqQYjHby0ZtJ71
         V2/METTZBBzLoXS6Wpu408Am8/ijpsg8+qAa1P8/b6z6Uek8L5BHfFBPxHqnmu/LeBxv
         C96EU4BtsJc6Bob30Cxfdaw+FDJieXWbKnngR7NH22pEtwBP1LGM90OaslKcv9BlibH7
         fWcHPOdkXUCtubvE6NhqfibD7F3sLwaRN+I8JIxNq5T9HpTqL8WHOeSZC8e5TRAEqLc1
         vgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666857; x=1725271657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WbdwJwMzGd487Jm58/6IPAFGaqbJVFIEVy/1bU3kBU=;
        b=MF9xLPx0SrV7CzZtia604ofQm0Ampnk0+bMlrugfQWTx9QNWONPwMhHsCnLC1T0nUn
         cbuSqI6FANAOxAxkXeoIbHiKAXJlsTbE2MONJERFXu722VykXQR31nDfufgsBdLgDn3a
         Y2mUJMrOvTuSi4FYZvYzeRdVHqsZ4rJuYxcPVOyvFouwk2GczD9qsD3dFtODbGTOF+hK
         UhVDdJnWNRNVzABr5gH17BeLGiC8zF3Ob8t4yT3wW72v2iiM2fkXdhZ52jE5/mDrbC1p
         OkOz2BWYm8fq2HdkJ4ABlnBHiYDM9QrJ/oAtqyDY2uF/TLDaIDBdCAuupf0Ku8K6YRqy
         xVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUweZkOuA0Xd9OikQ28cwB6bxS4StNegZ/m2Sxo0tD9BUZ08gVkG/yuHKYobyMWK8e1x4Ixw6CId6U3hmp+Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxL6zqLaB9MVWkUaKi8TYFWLYdXcjyuRdTfciFq3Dasvz9pd8Q
	Ijk8yVqeoEte9C1Um179afLBXF/JKR1BlsCMEjdQnsiCDUAVdlgdpxYzUmTsMjE=
X-Google-Smtp-Source: AGHT+IFklH3Ny9t7GPphcYtSHUeO9OqMZPPFfYRC9xfJkhjaSEMhKLJDJuN0g5pcthbBx7LS51ulDQ==
X-Received: by 2002:a5d:648e:0:b0:373:6bf:9608 with SMTP id ffacd0b85a97d-37311843370mr3729073f8f.2.1724666856869;
        Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:19 +0200
Subject: [PATCH 03/11] phy: cadence: sierra: Simplify with scoped for each
 OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-3-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jtNLroZp6oDWwv/KZ3xoT8RtBVpmgjpirqt/ibFxI8s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPbbKpPHL6GdF5Qqk8rC/GGGrQ4Hh1ZvCtrZ
 cPY7A2jkAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT2wAKCRDBN2bmhouD
 15SfD/9OO/+x3tuIvYd/WbnMT1CUTEf/bF9MuCLRDZpGzwZ8G5dCifwH0FuB5yPntS+hAZlBHp3
 uIrluv46zJ/Bwsu8eq55BNiIRX2jDecimSOcjXpQndqjiK0v11mZqrpzbFr0PFZcxC2LdszLC9j
 /1mXPHAhb7CRvCnzKAieTGIY0RA+XP2H0vmzYIQLoc4P7pX19VuxzJhn1pz3CAxAS5qu/iHf5EE
 7MfJDnYLKjy48xxkuXs2K2x7jfQv1rBa400T84DoO34MI6A/CxhYEvclBvEVotu+W2zY6x+C+ek
 QcfKOYnaW1fgCgbA6BpD64ycS2PLcs0Sa+U9KCaaxGkMFF3wcsTeHQ8medG4dhIrzRPyKTMyPkt
 VluPLHFOHLDew0KlZGSnd2Q1ksOGy+/45S1Oco+2jKUJKyOaiVhsS21scCBagibIWtRLLGHlDid
 JUVnWiX9yv436GZxILEaeALTUJZbn7NOJUcZK/mcLgVLcaG46CZnZgF+iw7uv1WpwIAUqXkaUpM
 bnfiSwO5YAEdHESCbWUmxilRSIntxrgzfEhTmEipYjHtmtGNX7nO0ZtShMAiKmpIsqb1+g8nxXE
 Vl6HFgHWsh5qYz0LpYb7xlW7AmzeV+0LqjatoYQECv4pDCWf/rZiuC8oqhQw3mBeO4gq/qcGhbr
 2ZWDAaRAwHdBApA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_030739_145052_7CC708C7 
X-CRM114-Status: GOOD (  12.19  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/cadence/phy-cadence-sierra.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 3010c9f24136..aeec6eb6be23 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -1366,7 +1366,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	unsigned int id_value;
 	int ret, node = 0;
 	void __iomem *base;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 
 	if (of_get_child_count(dn) == 0)
 		return -ENODEV;
@@ -1438,7 +1438,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 
 	sp->autoconf = of_property_read_bool(dn, "cdns,autoconf");
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		struct phy *gphy;
 
 		if (!(of_node_name_eq(child, "phy") ||
@@ -1452,7 +1452,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get reset %s\n",
 				child->full_name);
 			ret = PTR_ERR(sp->phys[node].lnk_rst);
-			of_node_put(child);
 			goto put_control;
 		}
 
@@ -1461,7 +1460,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(dev, "missing property in node %s\n",
 					child->name);
-				of_node_put(child);
 				reset_control_put(sp->phys[node].lnk_rst);
 				goto put_control;
 			}
@@ -1475,7 +1473,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			gphy = devm_phy_create(dev, child, &noop_ops);
 		if (IS_ERR(gphy)) {
 			ret = PTR_ERR(gphy);
-			of_node_put(child);
 			reset_control_put(sp->phys[node].lnk_rst);
 			goto put_control;
 		}

-- 
2.43.0


