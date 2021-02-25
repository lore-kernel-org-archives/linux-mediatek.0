Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF15C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE49E64F3C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 17:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE49E64F3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVtCgFNOghL9r94jx8lgwfD8wYwq6GMA2g5PCwbE+2U=; b=kpn301p6HJwRbqRzd00douuM9
	Bg/B5aLLcmF0TATWJzGNRHJANR1a9rGrKlIU8Js2f3HIJIOGaLM1hVZAwnT6PrZS3fr4vw6fRS+yq
	ivpix1ii6iYimemnPtKTpDpN8RYgHfpPYZKCE7Z7jQ+VnSy7sRxYtqqW34uchkxVx3f1yBNTyru0o
	c4Vf15Rkhyhv4Jzg1FB6n09dgf71jpu3OM1+S1baktxmuEwBq5TXmdcu6WwUdLCHlMAUms60oQp1v
	yo+xtqMt1DpjkNT3pZc+0smq1qksPvTCq53pR4osBqkHyEtD+WWM5B0jdChpZ06x1B/fUQ3UZCqeG
	LHGL9VbTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFKmR-0005gS-DJ; Thu, 25 Feb 2021 17:50:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFKmF-0005dW-J0; Thu, 25 Feb 2021 17:50:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 409BC1F463CE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] soc: mediatek: pm-domains: Add a power domain names for
 mt8192
Date: Thu, 25 Feb 2021 18:49:59 +0100
Message-Id: <20210225175000.824661-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210225175000.824661-1-enric.balletbo@collabora.com>
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_125015_860463_AA0CE5C7 
X-CRM114-Status: GOOD (  10.07  )
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

Add the power domains names for the mt8192 SoC.

Fixes: a49d5e7a89d6 ("soc: mediatek: pm-domains: Add support for mt8192")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mt8192-pm-domains.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index 0fdf6dc6231f..543dda70de01 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -12,6 +12,7 @@
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 	[MT8192_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
 		.sta_mask = BIT(21),
 		.ctl_offs = 0x0354,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -24,6 +25,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_CONN] = {
+		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = 0x0304,
 		.sram_pdn_bits = 0,
@@ -45,12 +47,14 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8192_POWER_DOMAIN_MFG0] = {
+		.name = "mfg0",
 		.sta_mask = BIT(2),
 		.ctl_offs = 0x0308,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
 		.sta_mask = BIT(3),
 		.ctl_offs = 0x030c,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -75,36 +79,42 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
 		.sta_mask = BIT(4),
 		.ctl_offs = 0x0310,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
 		.sta_mask = BIT(5),
 		.ctl_offs = 0x0314,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_MFG4] = {
+		.name = "mfg4",
 		.sta_mask = BIT(6),
 		.ctl_offs = 0x0318,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_MFG5] = {
+		.name = "mfg5",
 		.sta_mask = BIT(7),
 		.ctl_offs = 0x031c,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_MFG6] = {
+		.name = "mfg6",
 		.sta_mask = BIT(8),
 		.ctl_offs = 0x0320,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_DISP] = {
+		.name = "disp",
 		.sta_mask = BIT(20),
 		.ctl_offs = 0x0350,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -133,6 +143,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_IPE] = {
+		.name = "ipe",
 		.sta_mask = BIT(14),
 		.ctl_offs = 0x0338,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -149,6 +160,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_ISP] = {
+		.name = "isp",
 		.sta_mask = BIT(12),
 		.ctl_offs = 0x0330,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -165,6 +177,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_ISP2] = {
+		.name = "isp2",
 		.sta_mask = BIT(13),
 		.ctl_offs = 0x0334,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -181,6 +194,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_MDP] = {
+		.name = "mdp",
 		.sta_mask = BIT(19),
 		.ctl_offs = 0x034c,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -197,6 +211,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_VENC] = {
+		.name = "venc",
 		.sta_mask = BIT(17),
 		.ctl_offs = 0x0344,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -213,6 +228,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
 		.sta_mask = BIT(15),
 		.ctl_offs = 0x033c,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -229,12 +245,14 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_VDEC2] = {
+		.name = "vdec2",
 		.sta_mask = BIT(16),
 		.ctl_offs = 0x0340,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_CAM] = {
+		.name = "cam",
 		.sta_mask = BIT(23),
 		.ctl_offs = 0x035c,
 		.sram_pdn_bits = GENMASK(8, 8),
@@ -263,18 +281,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		},
 	},
 	[MT8192_POWER_DOMAIN_CAM_RAWA] = {
+		.name = "cam_rawa",
 		.sta_mask = BIT(24),
 		.ctl_offs = 0x0360,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_CAM_RAWB] = {
+		.name = "cam_rawb",
 		.sta_mask = BIT(25),
 		.ctl_offs = 0x0364,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
 	[MT8192_POWER_DOMAIN_CAM_RAWC] = {
+		.name = "cam_rawc",
 		.sta_mask = BIT(26),
 		.ctl_offs = 0x0368,
 		.sram_pdn_bits = GENMASK(8, 8),
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
