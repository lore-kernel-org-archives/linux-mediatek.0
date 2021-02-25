Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72727C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B75264F36
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B75264F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vY3LZ4S6jVzKtuZKY+3ieWWO8UAIp5lzL32rtx3XoFw=; b=en7k5pyKQOm0tb48DmA9MsiOb
	nm/uHqiwjKjUVsyvkAPBfWye/2vpPyWqX2LO/AglmXqRK34Oi2C7MIzhppVFiD5tXvOmYq6Xs6XN4
	FGe2njBlxH4foCKv3Z+vqxn4a2j9Kb1WO1YLQWgwu/RPtSbA3SrOUlQCcfler0IhyJW6QQkGOeRzU
	GRr/H9ABCix1qbBNxv8PhwOxXA/IMdt7/CXtLAbtvV8UCk4yEhyQONmbL69ta86zOH5bf4lz1QTye
	B5o8zkHsutGbqaedTvTAQCkpF214UL5rWqJVzYxmn0k5kMY/QArxfSYiGl170kDgUgo1aKQ1G2UM9
	dw5+X41XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFKmM-0005fT-Cb; Thu, 25 Feb 2021 17:50:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFKmE-0005d2-Oo; Thu, 25 Feb 2021 17:50:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 644291F463C9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] soc: mediatek: pm-domains: Add a power domain names for
 mt8183
Date: Thu, 25 Feb 2021 18:49:58 +0100
Message-Id: <20210225175000.824661-2-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210225175000.824661-1-enric.balletbo@collabora.com>
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_125014_951412_8C0CB65E 
X-CRM114-Status: GOOD (  10.36  )
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

Add the power domains names for the mt8183 SoC. This removes the debugfs
errors like the following:

  debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!

Fixes: eb9fa767fbe1 ("soc: mediatek: pm-domains: Add support for mt8183")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mt8183-pm-domains.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
index aa5230e6c12f..98a9940d05fb 100644
--- a/drivers/soc/mediatek/mt8183-pm-domains.h
+++ b/drivers/soc/mediatek/mt8183-pm-domains.h
@@ -12,12 +12,14 @@
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 	[MT8183_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
 		.sta_mask = PWR_STATUS_AUDIO,
 		.ctl_offs = 0x0314,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
 	[MT8183_POWER_DOMAIN_CONN] = {
+		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = 0x032c,
 		.sram_pdn_bits = 0,
@@ -28,12 +30,14 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
 		.sta_mask = PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = 0x0334,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
 	},
 	[MT8183_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = 0x0338,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -41,18 +45,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8183_POWER_DOMAIN_MFG_CORE0] = {
+		.name = "mfg_core0",
 		.sta_mask = BIT(7),
 		.ctl_offs = 0x034c,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8183_POWER_DOMAIN_MFG_CORE1] = {
+		.name = "mfg_core1",
 		.sta_mask = BIT(20),
 		.ctl_offs = 0x0310,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8183_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
 		.sta_mask = PWR_STATUS_MFG_2D,
 		.ctl_offs = 0x0348,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -65,6 +72,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_DISP] = {
+		.name = "disp",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = 0x030c,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -83,6 +91,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_CAM] = {
+		.name = "cam",
 		.sta_mask = BIT(25),
 		.ctl_offs = 0x0344,
 		.sram_pdn_bits = GENMASK(9, 8),
@@ -105,6 +114,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_ISP] = {
+		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = 0x0308,
 		.sram_pdn_bits = GENMASK(9, 8),
@@ -127,6 +137,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
 		.sta_mask = BIT(31),
 		.ctl_offs = 0x0300,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -139,6 +150,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_VENC] = {
+		.name = "venc",
 		.sta_mask = PWR_STATUS_VENC,
 		.ctl_offs = 0x0304,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -151,6 +163,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_VPU_TOP] = {
+		.name = "vpu_top",
 		.sta_mask = BIT(26),
 		.ctl_offs = 0x0324,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -177,6 +190,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		},
 	},
 	[MT8183_POWER_DOMAIN_VPU_CORE0] = {
+		.name = "vpu_core0",
 		.sta_mask = BIT(27),
 		.ctl_offs = 0x33c,
 		.sram_pdn_bits = GENMASK(11, 8),
@@ -194,6 +208,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.caps = MTK_SCPD_SRAM_ISO,
 	},
 	[MT8183_POWER_DOMAIN_VPU_CORE1] = {
+		.name = "vpu_core1",
 		.sta_mask = BIT(28),
 		.ctl_offs = 0x0340,
 		.sram_pdn_bits = GENMASK(11, 8),
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
