Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53379C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B10820872
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qpc6DO3G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B10820872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7lDW/1Pw37VQ7EGrvCwaAVIXqxdHEUBXEidAuo1JidY=; b=Qpc6DO3GsVUssHHDkrvAGVjVB
	3QthIkFOXW8ghzZ29nE63LVRaHil62czgUFT4oSzll0FumPlJV2PkY+yJTW16gOiIynKek71lOaA4
	EWEAuISCgHU8K8GPM24J3Mlu8R1U23nW206RPfEK7MRShp3X6XHiMZXq36SkHsJqsCb6But5F+Z9B
	g5s34gmLW+QJ9VkLXpQ/nfL2S964e83P599dgIphFWlg6ruzNNPsB7sP+ndNMqAfxIi/k8A/l+CBw
	dF457h4ZYQt8vw8mohOox2/VoT6TIPNShGrUntbQAhKBRAh9UOeTgBj9dSQ1BBsMpCubxiaoSrgRj
	Y/tMXElSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO12M-00008k-PJ; Thu, 01 Oct 2020 16:02:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO11y-0008OC-GD; Thu, 01 Oct 2020 16:02:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3332829D75E
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] soc: mediatek: pm-domains: Add bus protection
 protocol
Date: Thu,  1 Oct 2020 18:01:46 +0200
Message-Id: <20201001160154.3587848-5-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120206_666117_94034F51 
X-CRM114-Status: GOOD (  16.47  )
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

Changes in v2: None

 drivers/soc/mediatek/mtk-pm-domains.c | 44 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 68886bf437f9..cc8915b53c7e 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -54,6 +54,8 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
+#define SPM_MAX_BUS_PROT_DATA		3
+
 struct scpsys_bus_prot_data {
 	u32 bus_prot_mask;
 	bool bus_prot_reg_update;
@@ -74,7 +76,7 @@ struct scpsys_domain_data {
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
 	u8 caps;
-	const struct scpsys_bus_prot_data bp_infracfg;
+	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
 };
 
 struct scpsys_domain {
@@ -162,24 +164,40 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 
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
@@ -479,7 +497,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.bp_infracfg = {
+		.bp_infracfg[0] = {
 			.bus_prot_reg_update = true,
 			.bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
 				MT8173_TOP_AXI_PROT_EN_MM_M1,
@@ -521,7 +539,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
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
