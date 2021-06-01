Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394ADC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8E160E08
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8E160E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iYPLGKcS7RzTCMWybMCCQSm9Z/fPK5dVSWw4Zp2MHPk=; b=eAUF36XxzYRj/i
	D/oRpd4rkYjMH4g/hmjZsQc8Uw0WtTxRbdN1V+1KhD4lLaW9AZTdTnwAvDYGWn43NCoFw+KpJ5Adh
	Cd4l3IC3rPQzDmSKIzdbU6mOEAtDt7NUxQm1sPzc+BZSxjgv4qeZe0FiyvZ/JnxI0rEoqiXxTctgo
	NrJQ8HkBA1fp0jLKgqx9f0cjFgki+cXPjRNMMG+ohpxytvOoiVMqpsnpEgegWQELnDjuYOnV435S6
	PO+zewM3u/2JTYjJoYCTPN14j22PkHBmQ4M5FXzJSS1fqp596c9eeFNdrMkK7fWZNCLPV0uomLvRP
	PzdKQWOW5gqubLTH6XAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnvYf-00ESV0-0A; Tue, 01 Jun 2021 03:59:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnvYc-00ESTs-HE
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 03:59:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id e7so4085796plj.7
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 20:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXwwYLYnJsnDBREbEY1ZpSah/5rCANgCAGvtHU5EDV4=;
 b=DsX8PTvp7nRUwWpmJC/wVYpd2qd27HE9+ililwcm6lIVdQUi9680xucnTRbHskC424
 4jzAahY89yDIZXjMVmTPI60eQtmBwedVlnIydqpIHXLzs9/fdhkwKvRWe+HyeTtQ3Yl4
 TBaYQLe+nTcwnF7mtZjJI84eVmu1oVIqLBgTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXwwYLYnJsnDBREbEY1ZpSah/5rCANgCAGvtHU5EDV4=;
 b=IMrga5T8K0z7lVxYXu7W6XE9IuBntCbBWMGhbIrRCGDPlpHrosXQwWGv1dq+NCM+QS
 opA5gSqz6xoceer4aUJcIgBguRShpBQLc8jrpWBVd1ujL/TNjil6mL39S0tRWEVBTuhR
 FAYtXS8K+B8pB+fkNyOJ6l/GU1ShPG1eytcRu/jPekCY3CFjRnjnQOY+SsXfa8wCnuJh
 Hbz4dH5lrvG/yL++p2mgGeIp//IWTp1L+FwX8yYWUwk/le/JsgJwKMxIABoBKeb58/H1
 LhBEnsS7hflRST2CyfWYuuLiZsdddy8jA0yI4jyq2ii/RBFG2ttaEazZtSMv0tBxfkg8
 HJ6w==
X-Gm-Message-State: AOAM5332ThV2Gjp0vwam9b01hngUeVEbH9cIqykNfMfT5elF0cdklVNn
 ST/2T8jEPjtTNG5iO/rcrXxG+Q==
X-Google-Smtp-Source: ABdhPJwG6Rn5CV9j8+8zdP9BMbU2vg1FdpBVA8VXDgHafS3v4vMRxLv5l7xQojLafjQKMt1nbXQANA==
X-Received: by 2002:a17:90b:2250:: with SMTP id
 hk16mr2434435pjb.95.1622519949734; 
 Mon, 31 May 2021 20:59:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f83:3563:b780:4d82])
 by smtp.gmail.com with ESMTPSA id 203sm2779735pfw.124.2021.05.31.20.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 20:59:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 1/3] soc: mtk-pm-domains: Fix the clock prepared issue
Date: Tue,  1 Jun 2021 11:59:03 +0800
Message-Id: <20210601035905.2970384-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_205910_631400_37DFA019 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Weiyi Lu <weiyi.lu@mediatek.com>

In this new power domain driver, when adding one power domain
it will prepare the dependent clocks at the same.
So we only do clk_bulk_enable/disable control during power ON/OFF.
When system suspend, the pm runtime framework will forcely power off
power domains. However, the dependent clocks are disabled but kept
prepared.

In MediaTek clock drivers, PLL would be turned ON when we do
clk_bulk_prepare control.

Clock hierarchy:
PLL -->
       DIV_CK -->
                 CLK_MUX
                 (may be dependent clocks)
                         -->
                             SUBSYS_CG
                             (may be dependent clocks)

It will lead some unexpected clock states during system suspend.
This patch will fix by doing prepare_enable/disable_unprepare on
dependent clocks at the same time while we are going to power on/off
any power domain.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: chun-jie.chen <chun-jie.chen@mediatek.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 31 +++++++--------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 0af00efa0ef8..536d8c64b2b4 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -211,7 +211,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_enable(pd->num_clks, pd->clks);
+	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
 	if (ret)
 		goto err_reg;
 
@@ -229,7 +229,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
-	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
+	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
 	if (ret)
 		goto err_pwr_ack;
 
@@ -246,9 +246,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 err_disable_sram:
 	scpsys_sram_disable(pd);
 err_disable_subsys_clks:
-	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 err_pwr_ack:
-	clk_bulk_disable(pd->num_clks, pd->clks);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 err_reg:
 	scpsys_regulator_disable(pd->supply);
 	return ret;
@@ -269,7 +269,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
-	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
 	/* subsys power off */
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
@@ -284,7 +284,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
-	clk_bulk_disable(pd->num_clks, pd->clks);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
 	scpsys_regulator_disable(pd->supply);
 
@@ -405,14 +405,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		pd->subsys_clks[i].clk = clk;
 	}
 
-	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
-	if (ret)
-		goto err_put_subsys_clocks;
-
-	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
-	if (ret)
-		goto err_unprepare_clocks;
-
 	/*
 	 * Initially turn on all domains to make the domains usable
 	 * with !CONFIG_PM and to get the hardware in sync with the
@@ -427,7 +419,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		ret = scpsys_power_on(&pd->genpd);
 		if (ret < 0) {
 			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-			goto err_unprepare_clocks;
+			goto err_put_subsys_clocks;
 		}
 	}
 
@@ -435,7 +427,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		ret = -EINVAL;
 		dev_err(scpsys->dev,
 			"power domain with id %d already exists, check your device-tree\n", id);
-		goto err_unprepare_subsys_clocks;
+		goto err_put_subsys_clocks;
 	}
 
 	if (!pd->data->name)
@@ -455,10 +447,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	return scpsys->pd_data.domains[id];
 
-err_unprepare_subsys_clocks:
-	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
-err_unprepare_clocks:
-	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_subsys_clocks:
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 err_put_clocks:
@@ -537,10 +525,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
-
-	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
