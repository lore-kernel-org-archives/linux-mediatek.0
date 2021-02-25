Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21100C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B553364F3B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B553364F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1hUu5AEEB+i5SUvmD/mLwFmx9kXk8Z8/56ZJ7sGsAw=; b=VtQ3y9+Ga7iLy9OB9luSHUFP2
	NOinqATdb4sqBED+FbxZTzKrebR54BNJrx4lEXb4SnS9Hg30sPgrOBNODT+4ddtdhx0GEh23Idc+7
	wJbaba+DhOAmK0+n2DpxHHRDOc635GK4JMrixOG/mlsXsRxEjTmNHIhZRq8V/Dj5p+bKa2qnEIyOb
	rY+1TeJ+dXiGOi39Wp3K6SubKAEIX10HUY3oV2B0mlpjhsq26vQKED1OlLe862IvWmC1sGUqMtxHI
	OR0yGFodAlnqOGBLdIw3nmz4KqmGZu3n0aDTA8msCKDhGrvmlmKkxeyLEf0JQ9DQ5F4CJCSEZCM32
	g8M4eFjkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFKmW-0005i8-Ox; Thu, 25 Feb 2021 17:50:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFKmH-0005e1-Ic; Thu, 25 Feb 2021 17:50:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 1A9571F463CC
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] soc: mediatek: pm-domains: Add a power domain names for
 mt8167
Date: Thu, 25 Feb 2021 18:50:00 +0100
Message-Id: <20210225175000.824661-4-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210225175000.824661-1-enric.balletbo@collabora.com>
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_125017_742990_1E13E437 
X-CRM114-Status: GOOD (  10.04  )
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
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the power domains names for the mt8167 SoC.

Fixes: 207f13b419a6 ("soc: mediatek: pm-domains: Add support for mt8167")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mt8167-pm-domains.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
index ad0b8dfa0527..15559ddf26e4 100644
--- a/drivers/soc/mediatek/mt8167-pm-domains.h
+++ b/drivers/soc/mediatek/mt8167-pm-domains.h
@@ -15,6 +15,7 @@
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 	[MT8167_POWER_DOMAIN_MM] = {
+		.name = "mm",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = SPM_DIS_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -26,6 +27,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT8167_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
 		.sta_mask = PWR_STATUS_VDEC,
 		.ctl_offs = SPM_VDE_PWR_CON,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -33,6 +35,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT8167_POWER_DOMAIN_ISP] = {
+		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = SPM_ISP_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -40,6 +43,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT8167_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
 		.sta_mask = MT8167_PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
 		.sram_pdn_bits = 0,
@@ -50,18 +54,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		},
 	},
 	[MT8167_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
 		.sta_mask = MT8167_PWR_STATUS_MFG_2D,
 		.ctl_offs = SPM_MFG_2D_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8167_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = SPM_MFG_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8167_POWER_DOMAIN_CONN] = {
+		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = SPM_CONN_PWR_CON,
 		.sram_pdn_bits = GENMASK(8, 8),
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
