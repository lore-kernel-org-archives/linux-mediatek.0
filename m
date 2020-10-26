Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A8AC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFEF222C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JA9ma57p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BFEF222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FDgaL60Voy+xhEDrXG9AIJLTQ48oi5qlw0XG3kRm6aE=; b=JA9ma57pZ2WI+SPPYtuMgCWjE
	jH+7hr2hv+PIXKaTzm6aQ4tk/ogXBAuCRDytasdGtb4fOcRnL1xFnwcEwZRGyzW1wbfT0aZfZVBBD
	ZpsvT4NNM/KpWoRDHLO9AB+ypi+ok1n6uFOTr81a6/yG1z8/dMnlBBr2AKX2nl8j27JRQAuVjG2WF
	r1jfpKhpbDnDAZx/eysQ/IOkmYD+fp36v6BI5uT/+HfvjaheUbJMarM49dPs4E+C26SoxetaYNIEs
	3fIG9XbtL6n0fk64ADvp+stjvS4ecG93so35RczSsxEN8gstMMgWUdilodUzPrDxBbKeDgU01Z+Nk
	RSC6kV5Cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6mm-0001Qf-4N; Mon, 26 Oct 2020 18:00:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6iZ-0007uh-0b; Mon, 26 Oct 2020 17:55:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6E8191F44FCD
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/16] soc: mediatek: pm_domains: Make bus protection
 generic
Date: Mon, 26 Oct 2020 18:55:14 +0100
Message-Id: <20201026175526.2915399-6-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026175526.2915399-1-enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_135539_320340_75CF956C 
X-CRM114-Status: GOOD (  15.30  )
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
 Miles Chen <miles.chen@mediatek.com>, Matthias Brugger <mbrugger@suse.com>,
 linux-mediatek@lists.infradead.org, Joerg Roedel <jroedel@suse.de>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Bus protection is not exclusively done by calling the infracfg misc driver.
Make the calls for setting and clearing the bus protection generic so
that we can use other blocks for it as well.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2: None

 drivers/soc/mediatek/mtk-infracfg.c   |  5 ---
 drivers/soc/mediatek/mtk-pm-domains.c | 53 +++++++++++++++++++++------
 include/linux/soc/mediatek/infracfg.h |  5 +++
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
index 4a123796aad3..0590b68e0d78 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -12,11 +12,6 @@
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
 
-#define INFRA_TOPAXI_PROTECTEN		0x0220
-#define INFRA_TOPAXI_PROTECTSTA1	0x0228
-#define INFRA_TOPAXI_PROTECTEN_SET	0x0260
-#define INFRA_TOPAXI_PROTECTEN_CLR	0x0264
-
 /**
  * mtk_infracfg_set_bus_protection - enable bus protection
  * @infracfg: The infracfg regmap
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 2121e05cb9a4..92c61e59255b 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -87,18 +87,24 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 					MTK_POLL_TIMEOUT);
 }
 
-static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
+static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
 {
-	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		if (!bpd[i].bus_prot_mask)
+		u32 val, mask = bpd[i].bus_prot_mask;
+
+		if (!mask)
 			break;
 
-		ret = mtk_infracfg_set_bus_protection(pd->infracfg,
-						      bpd[i].bus_prot_mask,
-						      bpd[i].bus_prot_reg_update);
+		if (bpd[i].bus_prot_reg_update)
+			regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, mask);
+		else
+			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
+
+		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+					       val, (val & mask) == mask,
+					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
 			return ret;
 	}
@@ -106,18 +112,34 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 	return 0;
 }
 
-static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
+static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 {
 	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
+	int ret;
+
+	ret = _scpsys_bus_protect_enable(bpd, pd->infracfg);
+	return ret;
+}
+
+static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
+				       struct regmap *regmap)
+{
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		if (!bpd[i].bus_prot_mask)
+		u32 val, mask = bpd[i].bus_prot_mask;
+
+		if (!mask)
 			return 0;
 
-		ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
-							bpd[i].bus_prot_mask,
-							bpd[i].bus_prot_reg_update);
+		if (bpd[i].bus_prot_reg_update)
+			regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, 0);
+		else
+			regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_CLR, mask);
+
+		ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
+					       val, !(val & mask),
+					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
 			return ret;
 	}
@@ -125,6 +147,15 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 	return 0;
 }
 
+static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
+{
+	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
+	int ret;
+
+	ret = _scpsys_bus_protect_disable(bpd, pd->infracfg);
+	return ret;
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 233463d789c6..5bcaab767f6a 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -32,6 +32,11 @@
 #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
 						 BIT(7) | BIT(8))
 
+#define INFRA_TOPAXI_PROTECTEN			0x0220
+#define INFRA_TOPAXI_PROTECTSTA1		0x0228
+#define INFRA_TOPAXI_PROTECTEN_SET		0x0260
+#define INFRA_TOPAXI_PROTECTEN_CLR		0x0264
+
 #define REG_INFRA_MISC				0xf00
 #define F_DDR_4GB_SUPPORT_EN			BIT(13)
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
