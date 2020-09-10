Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D05C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:30:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4AD20C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ySti4df5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4AD20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3HTFoHK59gSmo2tK/1kiA6UZ0wafw7OxTmCB8RmTVE=; b=ySti4df5Y4AQ8lL1FR8ZNB6hr
	npqBei2T214gq6utseOCIUtfoQhl+MGoRZREBKK23xC8DKINuTL8TuGmP1VMf3YCMokFHjGKlny6u
	aIrL3djFvYM4wsuzUBNNiZBJ+eT3J2PwXrSe6hHb7yISOIXYCN0xg/+Y1IuPwhl4QZu0f5M1tYVUK
	PO6wON2sWNx5nbn9feb4aIhpceDPFpbnF6mWrlv6DfIWhAHdkMkJHfDp8u9Jv3oWe+ltVf70Zwus6
	QG7EqKkN09020utT1YZ6LjC9W4rSbU09sa7qtAlozSt6qAnJERg8H66O7oEBxvAO7fSlZtqESN1Hl
	d9YFzaVbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQOZ-0004s1-Vd; Thu, 10 Sep 2020 17:30:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQNH-0004BJ-LO; Thu, 10 Sep 2020 17:28:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 4D59729BB13
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] soc: mediatek: pm-domains: Add bus protection protocol
Date: Thu, 10 Sep 2020 19:28:18 +0200
Message-Id: <20200910172826.3074357-5-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910172826.3074357-1-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_132843_826163_4033368A 
X-CRM114-Status: GOOD (  16.46  )
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
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Bus protection will need to update more then one register
in infracfg. Add support for several operations.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-pm-domains.c | 44 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index db631dbaf2e3..52ac41ca871f 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -53,6 +53,8 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
+#define SPM_MAX_BUS_PROT_DATA		3
+
 struct scpsys_bus_prot_data {
 	u32 bus_prot_mask;
 	bool bus_prot_reg_update;
@@ -73,7 +75,7 @@ struct scpsys_domain_data {
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
 	u8 caps;
-	const struct scpsys_bus_prot_data bp_infracfg;
+	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
 };
 
 struct scpsys_domain {
@@ -159,24 +161,40 @@ static int scpsys_sram_disable(struct scpsys_domain *pd, void __iomem *ctl_addr)
 
 static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 {
-	const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
+	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
+	int i, ret;
 
-	if (!bp_data->bus_prot_mask)
-		return 0;
+	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
+		if (!bpd[i].bus_prot_mask)
+			break;
 
-	return mtk_infracfg_set_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
-					       bp_data->bus_prot_reg_update);
+		ret = mtk_infracfg_set_bus_protection(pd->infracfg,
+						      bpd[i].bus_prot_mask,
+						      bpd[i].bus_prot_reg_update);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 {
-	const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
+	const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
+	int i, ret;
+
+	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
+		if (!bpd[i].bus_prot_mask)
+			return 0;
 
-	if (!bp_data->bus_prot_mask)
-		return 0;
+		ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
+							bpd[i].bus_prot_mask,
+							bpd[i].bus_prot_reg_update);
+		if (ret)
+			return ret;
+	}
 
-	return mtk_infracfg_clear_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
-						 bp_data->bus_prot_reg_update);
+	return 0;
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -482,7 +500,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.bp_infracfg = {
+		.bp_infracfg[0] = {
 			.bus_prot_reg_update = true,
 			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
 				MT8173_TOP_AXI_PROT_EN_MM_M1,
@@ -524,7 +542,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_MFG_PWR_CON,
 		.sram_pdn_bits = GENMASK(13, 8),
 		.sram_pdn_ack_bits = GENMASK(21, 16),
-		.bp_infracfg = {
+		.bp_infracfg[0] = {
 			.bus_prot_reg_update = true,
 			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MFG_S |
 				MT8173_TOP_AXI_PROT_EN_MFG_M0 |
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
