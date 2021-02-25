Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4087FC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E085D64F3E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E085D64F3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NCum1WS6U4wQ8eAxgKHd2pNgFBpHQVkhc9AL6UjdSGA=; b=eE7bWauNnY7+cZtIOsSzRn92MI
	SVZBjkzgcsioFEwwssrUQZnkOapQq8ZfB6kc5igtfVO3yMgwmly+LjjxEKkPRDz2UMtgeWGZhoVxj
	6zREF3DrTkys6o0rMHolxhAg25NZTmcdYiBXYZFFn0txbv6AY7+pDgmvndFA/6/P//F+R+H9Xy08u
	7tNbnxPrht7sGW6Fg0frBqELo2JFgNls/BJkInPuxQNVCX6Xy4e074dbxYi9yvEHOwh6UxvUg37wi
	ktIBu5IDCoph3RbAiyg9VFQYNmQrtJ/zGYummY33icBG6y7ciTz066pB2xDIPuUlsgiLvyXdDiRkk
	OiWm143w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFKmN-0005fd-6h; Thu, 25 Feb 2021 17:50:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFKmE-0005cj-O7; Thu, 25 Feb 2021 17:50:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 81C6E1F46395
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] soc: mediatek: pm-domains: Add a meaningful power domain
 name
Date: Thu, 25 Feb 2021 18:49:57 +0100
Message-Id: <20210225175000.824661-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_125014_915447_7E1A1893 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the power domains names to the power domain struct so we
have meaningful name for every power domain. This also removes the
following debugfs error message.

  [    2.242068] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
  [    2.249949] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
  [    2.257784] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
  ...

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mt8173-pm-domains.h | 10 ++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |  6 +++++-
 drivers/soc/mediatek/mtk-pm-domains.h    |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 3e8ee5dabb43..654c717e5467 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -12,24 +12,28 @@
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 	[MT8173_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
 		.sta_mask = PWR_STATUS_VDEC,
 		.ctl_offs = SPM_VDE_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8173_POWER_DOMAIN_VENC] = {
+		.name = "venc",
 		.sta_mask = PWR_STATUS_VENC,
 		.ctl_offs = SPM_VEN_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8173_POWER_DOMAIN_ISP] = {
+		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = SPM_ISP_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 	},
 	[MT8173_POWER_DOMAIN_MM] = {
+		.name = "mm",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -40,18 +44,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		},
 	},
 	[MT8173_POWER_DOMAIN_VENC_LT] = {
+		.name = "venc_lt",
 		.sta_mask = PWR_STATUS_VENC_LT,
 		.ctl_offs = SPM_VEN2_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8173_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
 		.sta_mask = PWR_STATUS_AUDIO,
 		.ctl_offs = SPM_AUDIO_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8173_POWER_DOMAIN_USB] = {
+		.name = "usb",
 		.sta_mask = PWR_STATUS_USB,
 		.ctl_offs = SPM_USB_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -59,18 +66,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT8173_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
 		.sta_mask = PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = 0,
 	},
 	[MT8173_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
 		.sta_mask = PWR_STATUS_MFG_2D,
 		.ctl_offs = SPM_MFG_2D_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 	},
 	[MT8173_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = SPM_MFG_PWR_CON,
 		.sram_pdn_bits = GENMASK(13, 8),
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index b7f697666bdd..694d6ea6de1d 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -438,7 +438,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		goto err_unprepare_subsys_clocks;
 	}
 
-	pd->genpd.name = node->name;
+	if (!pd->data->name)
+		pd->genpd.name = node->name;
+	else
+		pd->genpd.name = pd->data->name;
+
 	pd->genpd.power_off = scpsys_power_off;
 	pd->genpd.power_on = scpsys_power_on;
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 141dc76054e6..21a4e113bbec 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -76,6 +76,7 @@ struct scpsys_bus_prot_data {
 
 /**
  * struct scpsys_domain_data - scp domain data for power on/off flow
+ * @name: The name of the power domain.
  * @sta_mask: The mask for power on/off status bit.
  * @ctl_offs: The offset for main power control register.
  * @sram_pdn_bits: The mask for sram power control bits.
@@ -85,6 +86,7 @@ struct scpsys_bus_prot_data {
  * @bp_smi: bus protection for smi subsystem
  */
 struct scpsys_domain_data {
+	const char *name;
 	u32 sta_mask;
 	int ctl_offs;
 	u32 sram_pdn_bits;
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
