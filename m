Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6615BC369B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C76lYKqOaKFf1LWgw9jI+3gYXvFZ5Li6KGDavd2GlFk=; b=2BF18bAikUaMBa8XUusU4Mdcqs
	NmqBHE7nsoSQbo933SpBKS7I9JrkIeEwSBMQa2uuAL7qHPQ53OXvxeWKoRu7RqumikDgjXqaaSE5K
	7hx1bDHCXvwsu47KFAC8XQ4IDYcdu9HluAtJkpe/L0heKQpmIfRVZb9f3Rfx2E+LwsIOHax9a9Scs
	mUQgV6mmFizE06eR5deneizqpKfoVnMW1bAF0fB/tu2wSEJ9C83Ch+YBaQr5Emxu5h3BgkNgaetOM
	WtzbS5AaeF+s0bYrQcMQyM85Hiu0HgSZXUoZ/8jBOcj/g/O/3C6wEKi2gaceFY2KE5BR4FKhL1eQj
	F7l07Lrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOYA-00000004eMH-1xrm;
	Wed, 25 Sep 2024 09:43:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOTY-00000004dMq-03JW
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 09:38:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71971d20ad9so4314343b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727257103; x=1727861903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C76lYKqOaKFf1LWgw9jI+3gYXvFZ5Li6KGDavd2GlFk=;
        b=LXAS2epLxO0q/Sbf5iCVfZMkWe/aeZS4Mgy7zZclvD0lSvznqxDVImMkdBVyMUcuCL
         4w+V6HdcZ3czYlui4inOobvA0YGXoma1v9g0+pA7DQIP5sxth8Ggah3+9aPtXo0DsRgv
         Cr4yvtFtyEsRQc8eUYQg2+egJETOrq2DhiZuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257103; x=1727861903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C76lYKqOaKFf1LWgw9jI+3gYXvFZ5Li6KGDavd2GlFk=;
        b=WgBvMRH0Oj19eMAaW0HLMDLLN2n43f7eS5ov/fUwOfnXLK3rtfG/WvcRW74jxAhFRK
         Liol/cDSnPvrT1LB6ew1KBvkAcGCcYIcuxkXBA8yy6yfTBOp25+nqZutb+vXSbDD1rlE
         iNRDJHhLQcl/Q3isckVFi5npf4d6GRjKyjRPm7WdoIwBoYdYfuV7ut/deO4K3mlKJeNE
         trP59re29TeJJMx5NXOQVbdVlTFu8cA/AJv7K/m4e/TfY8iKgsS/ZpirPNe4Fu6UG2ya
         Ps4jRmnjmGHqCtjxE8/kxmeS922nYR86bgX+caoZs6SZXYYROMNQ7FnXR4AiBEQ9Fcqx
         /lrg==
X-Forwarded-Encrypted: i=1; AJvYcCX+05DXF/H1JHWZT/XN81d7WFmAFvVt0XmBAB3DLZa12vBVr+4J+3cdb3CiXvXD+A1sCJ0CTmJ/FoBrWxGcIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrDHrE2KATvY9mR+34KCapw3PjWduyAzAT8HxN+qU9lm4Dze04
	4zziShztTWBlP6sMI5NF9ogJYInrf2Se+iNF9KpJ5uadpo7+OUWIsVqd2T0r5w==
X-Google-Smtp-Source: AGHT+IEIT60mHW/rWrUCbyRDTdBe2V8pmg+iP0bif2d5gdv8qwR5RMS+9ty2CUG5H+qVfEQgUwNthA==
X-Received: by 2002:a05:6a00:14c6:b0:718:ddd7:dc3b with SMTP id d2e1a72fcca58-71b0ac5aad9mr3130147b3a.21.1727257103023;
        Wed, 25 Sep 2024 02:38:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2480:2c96:2b64:cdcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8347fesm2432789b3a.35.2024.09.25.02.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:38:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v8 3/3] pmdomain: mediatek: Use OF-specific regulator API to get power domain supply
Date: Wed, 25 Sep 2024 17:38:06 +0800
Message-ID: <20240925093807.1026949-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925093807.1026949-1-wenst@chromium.org>
References: <20240925093807.1026949-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_023824_105935_81086ED4 
X-CRM114-Status: GOOD (  18.40  )
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

The MediaTek power domain driver contains a hack that assigns the device
node of the power domain to the struct device of the power domain
controller in order to use the devres regulator API.

Now that there is a proper OF-specific regulator API, and even a devres
version, replace the hack with proper code.

This change is incompatible with incomplete device trees. Instead of
assigning the dummy regulator in cases where the power domain requires
a supply but the device tree does not provide one, the driver will just
error out. This will be seen on the MT8390 EVK, which is missing
supplies for the IMG_VCORE and CAM_VCORE domains. And likely all the
MediaTek EVBs, which have no power domain supplies specified. This is
however the correct behavior. If the power domain's supply is missing,
then it should not work. Relying on other parts of the system to keep
the unattached regulator enabled is likely to break in ways less easier
to understand.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- New patch

The other option is to follow what Rockchip will be doing: getting the
regulator supply upon first use / enable [1]. This will result in less
breakage: only the power domain that is missing its supplies will fail
to be attached.

[1] https://lore.kernel.org/all/20240919091834.83572-6-sebastian.reichel@collabora.com/
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 88406e9ac63c..3580913f25d3 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -353,7 +353,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
-	struct device_node *root_node = scpsys->dev->of_node;
 	struct device_node *smi_node;
 	struct property *prop;
 	const char *clk_name;
@@ -388,16 +387,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->scpsys = scpsys;
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
-		/*
-		 * Find regulator in current power domain node.
-		 * devm_regulator_get() finds regulator in a node and its child
-		 * node, so set of_node to current power domain node then change
-		 * back to original node after regulator is found for current
-		 * power domain node.
-		 */
-		scpsys->dev->of_node = node;
-		pd->supply = devm_regulator_get(scpsys->dev, "domain");
-		scpsys->dev->of_node = root_node;
+		pd->supply = devm_of_regulator_get_optional(scpsys->dev, node, "domain");
 		if (IS_ERR(pd->supply))
 			return dev_err_cast_probe(scpsys->dev, pd->supply,
 				      "%pOF: failed to get power supply.\n",
-- 
2.46.0.792.g87dc391469-goog


