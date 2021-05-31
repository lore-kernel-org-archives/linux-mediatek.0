Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA22EC47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4C66120E
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4C66120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nmMHoY2BKOd2AYvzxrmvrZNP87b05QJdxld3ydczE90=; b=JRCnHuxpr7nAI2
	UNTK4Ui1tVblpMWhjnrOeUkWpaiuuNyUiFGnCsiUAMEW9Cu9WLRSDaMMSOY2ooj+ecDpQmEaUIN4n
	F+mTnXclYw3ilMmmJIlgSBuy5lzrQkqO5+8z9mR4nEQwrmlp9+1W16PEQvQK5AOwUSACv4fzxKbkJ
	CC8rHKDPjarZlvQeczwBPSwjjizMVKiKzLNGWnnZflhR2hYH1NKiUFOp6BzodfPXcWDAeqp1wzpzB
	5LIw8TybWx2KJ9J6zJOVy10efjhSC8udVuQluZ+5yt3izejiztP+m/8wWY/uPc4qbB540daWzwclv
	xfuCzs6ZBonkrSfT5MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnZdz-00AhUi-82; Mon, 31 May 2021 04:35:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnZdt-00AhRj-U5
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 04:35:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id e15so4597298plh.1
 for <linux-mediatek@lists.infradead.org>; Sun, 30 May 2021 21:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHs8c9vGdjXi2giuywOaumDo2EmlRLA/sn7ZfRaihIo=;
 b=ZjaTTsW7dChI/1TWMdqo+HJVQgeE4uuo5w5gyenkQ3Ftwqh1OzRaAUqWB6964K/nNT
 AfeIGJmPE+rEujTOE+nn8NIAHBn8pUCDOM0LtqyT7hXmVgpHjPtLul19Y2wGrk5dNztp
 XV/o7yASeg5tXM5SjNTFm+P5kpidpK79TJk+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHs8c9vGdjXi2giuywOaumDo2EmlRLA/sn7ZfRaihIo=;
 b=h4ubjsAqKSWBNuqwlaVytCsgcBoBSU5+C4BhhuVOmtEKz/DBg3ragn+zmXmsw0HpCZ
 6F0OCEutyIOLFpIntcUveV29oSxbEjIA0bXr8zqChbcSemt+1QIEYIUQpW0vxP5Z545d
 zOfr0Dp7uXGNIJZOXc48A/jXsg+2h2W3VEVioOHgG+n7ka9HFy7IFhBE+QzjCaIy9+Y4
 hxJWUxiKCV6eOsrp/XsJVIWx6owunYhE07V/s9cpCznMz9VhlMQx/DK/vsTPWkoUcUAF
 xhSRQuKBjzfiSoUfQEP5AizKpdqpOSHDazkeEeRJ0ZsgtVla6ZHW4OzLZjQQ4QJpGB6s
 EDUQ==
X-Gm-Message-State: AOAM530MyTmyLG5F3TTHZSrifuTeyofraH2aToRytmKr/+s6vEQD+K7q
 UokOxnmDOpL1BEDXaGr9IZDPGg==
X-Google-Smtp-Source: ABdhPJxxgSMWMTn772k1ysuWnGkE1QOeHgmac5qTvTSd6ojr5RCWo9CeIZwcl08Tbiyh7nLDB3cKVQ==
X-Received: by 2002:a17:90a:5d93:: with SMTP id
 t19mr17272027pji.116.1622435706373; 
 Sun, 30 May 2021 21:35:06 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c929:9e58:1e99:bfb5])
 by smtp.gmail.com with ESMTPSA id a9sm9366811pfo.69.2021.05.30.21.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 21:35:06 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH 1/3] soc: mtk-pm-domains: Fix the clock prepared issue
Date: Mon, 31 May 2021 12:35:00 +0800
Message-Id: <20210531043502.2702645-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_213510_027654_86DEC8A0 
X-CRM114-Status: GOOD (  15.76  )
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
it will prepare the depenedent clocks at the same.
So we only do clk_bulk_enable/disable control during power ON/OFF.
When system suspend, the pm runtime framework will forcely power off
power domains. However, the dependent clocks are disabled but kept
preapred.

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

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
