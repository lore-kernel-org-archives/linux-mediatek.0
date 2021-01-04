Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127F4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94CD21D93
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 10:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94CD21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GAQxPhAdP8rTmcrfova+mCk48ZYuhOoWpnlx7JWrY28=; b=HiPtd7L2HkOms++At/HLmEKYd
	sxvMgAuKd56saJ6LI+cCAu/2J8tO2I6h/i3DT+6Jm6wfwac/uKPrfWwJfhAx4C78BxtKzYLvbHFYG
	XKgWt1Jenx8SDWWXiYnhXDHqmQG8baYVhuZkl3658TyrS4C8u+ZJFdvkCgAVR/swNaUw8Jv/cC7h2
	TIMl3p3bBohIzHXPzFiTiiAnlV8rECRU26hy1D1LiY+E9teqBXM5V+R+bh2ja7HBWOmeUHV9DFWTe
	pUgrn3gybxWoj60yJv2RMgQQ90iJjbC2cAOy3Tk0PKtG65svxuASQwUzpdkSfG+ZW9joxEvvvqd0+
	LjMXg7iHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNPq-0001Zv-SO; Mon, 04 Jan 2021 10:48:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNPc-0001T1-QH; Mon, 04 Jan 2021 10:48:36 +0000
X-UUID: 3b79b46024624085aa3648857583a265-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rxYBjZorzbswLY9/cPMvClnq4GXFkFCM2mg4f5zQdJU=; 
 b=QIWk5h+mY4yQHtpcJnoLGTl36J2yUAh6KUW0teJ2+aqggLhpIQF5zpeaL/kLR+cUYlIKDOyfTirfl1iVd8KnBXGfUvImOatZEeDV/9c9pGKc0Y+DHUYOSt24z/jZBA/AQ1kp9B2kyuNzsqGXQuUU5ietpHoCFJHSIUTk4ZQBbcw=;
X-UUID: 3b79b46024624085aa3648857583a265-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365480780; Mon, 04 Jan 2021 02:48:25 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 02:45:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 18:44:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 18:44:58 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 2/2] soc: mediatek: Fix the clock prepared issue
Date: Mon, 4 Jan 2021 18:44:53 +0800
Message-ID: <1609757093-30618-3-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609757093-30618-1-git-send-email-weiyi.lu@mediatek.com>
References: <1609757093-30618-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_054833_106984_F40CDF5F 
X-CRM114-Status: GOOD (  16.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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
---
 drivers/soc/mediatek/mtk-pm-domains.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index a160800..f0bcc84 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -216,7 +216,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
-	ret = clk_bulk_enable(pd->num_clks, pd->clks);
+	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
 	if (ret)
 		goto err_disable_regulator;
 
@@ -234,7 +234,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
-	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
+	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
 	if (ret)
 		goto err_pwr_ack;
 
@@ -251,9 +251,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 err_disable_sram:
 	scpsys_sram_disable(pd);
 err_disable_subsys_clks:
-	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 err_pwr_ack:
-	clk_bulk_disable(pd->num_clks, pd->clks);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 err_disable_regulator:
 	scpsys_regulator_disable(pd);
 	return ret;
@@ -274,7 +274,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
-	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
 	/* subsys power off */
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
@@ -289,7 +289,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
-	clk_bulk_disable(pd->num_clks, pd->clks);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
 	ret = scpsys_regulator_disable(pd);
 	if (ret < 0)
@@ -402,14 +402,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
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
@@ -424,7 +416,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		ret = scpsys_power_on(&pd->genpd);
 		if (ret < 0) {
 			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-			goto err_unprepare_clocks;
+			goto err_put_subsys_clocks;
 		}
 	}
 
@@ -432,7 +424,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		ret = -EINVAL;
 		dev_err(scpsys->dev,
 			"power domain with id %d already exists, check your device-tree\n", id);
-		goto err_unprepare_subsys_clocks;
+		goto err_put_subsys_clocks;
 	}
 
 	pd->genpd.name = pd->data->name ?: node->name;
@@ -448,10 +440,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	return scpsys->pd_data.domains[id];
 
-err_unprepare_subsys_clocks:
-	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
-err_unprepare_clocks:
-	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_subsys_clocks:
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 err_put_clocks:
@@ -529,10 +517,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
-
-	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
