Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A89C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4D22076D
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmKhJhhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4D22076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O/Zkt1OmSObkA5qAkB8b3fVG7ujYEjD++X/brt7y89o=; b=OmKhJhhBr6IV/AwyejezDa3uq
	G+ntgzcwfpGDuT7M+7VCSmGePBJMiWlrNM2EwixWxrSvtqB9H/F1JzOXIqjfw78gqvoQhtaeL7K68
	8jfopRK5SQz/Ef7//UJnqhZfSw4g8yEbO/QVwknmr/TsttPgQKP3KrvTio4WzPC8G5Jj0zfvhnsf8
	FA39V22vTiZ3wlYSwLJk7iuJ1UMcNsP9jWY3yCiE78U0Hdm/TLeQvsPkhR6vJBIvX1yPhA5VCpn4A
	CMuMJ8mtVgtxjdgYGvV1g59PSctExfFGvWUQSTAN5SscKnI0uYbU/zZfXAIikeqkk21b1aELqQvbz
	wtTuqc/5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYSmV-00038W-28; Fri, 30 Oct 2020 11:41:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYSi5-000106-19; Fri, 30 Oct 2020 11:36:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 82C4B1F45EBD
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/16] soc: mediatek: pm-domains: Add default power off flag
Date: Fri, 30 Oct 2020 12:36:21 +0100
Message-Id: <20201030113622.201188-16-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030113622.201188-1-enric.balletbo@collabora.com>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_073645_290820_FDF31A55 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Weiyi Lu <weiyi.lu@mediatek.com>

For some power domain, like conn on MT8192, it should be default OFF.
Because the power on/off control relies the function of connectivity chip
and its firmware. And if project choose other chip vendor solution,
those necessary connectivity functions will not provided.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v4:
- Check via scpsys_domain_is_on() if a power domain is on when removing.

Changes in v3: None
Changes in v2: None

 drivers/soc/mediatek/mtk-pm-domains.c | 25 ++++++++++++++++++-------
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 8703d50cd2b7..c3b85b69f2f7 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -377,10 +377,16 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	 * software.  The unused domains will be switched off during
 	 * late_init time.
 	 */
-	ret = scpsys_power_on(&pd->genpd);
-	if (ret < 0) {
-		dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-		goto err_unprepare_clocks;
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
+		if (scpsys_domain_is_on(pd))
+			dev_warn(scpsys->dev,
+				 "%pOF: A default off power domain has been ON\n", node);
+	} else {
+		ret = scpsys_power_on(&pd->genpd);
+		if (ret < 0) {
+			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
+			goto err_unprepare_clocks;
+		}
 	}
 
 	if (scpsys->domains[id]) {
@@ -394,7 +400,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->genpd.power_off = scpsys_power_off;
 	pd->genpd.power_on = scpsys_power_on;
 
-	pm_genpd_init(&pd->genpd, NULL, false);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+		pm_genpd_init(&pd->genpd, NULL, true);
+	else
+		pm_genpd_init(&pd->genpd, NULL, false);
+
 	scpsys->domains[id] = &pd->genpd;
 
 	return scpsys->pd_data.domains[id];
@@ -467,6 +477,9 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 {
 	int ret;
 
+	if (scpsys_domain_is_on(pd))
+		scpsys_power_off(&pd->genpd);
+
 	/*
 	 * We're in the error cleanup already, so we only complain,
 	 * but won't emit another error on top of the original one.
@@ -477,8 +490,6 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	scpsys_power_off(&pd->genpd);
-
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 2c745f11b422..a2f4d8f97e05 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -6,6 +6,7 @@
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
 #define MTK_SCPD_SRAM_ISO		BIT(2)
+#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
