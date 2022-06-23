Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A33C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhXu7ZRTSltw6dhR68R+5KMkZw9rAdhE7AZVPbXef4w=; b=J/oauquvVkKY8bzWYZop+X6B8l
	nf+5JywJFLN0WP9MAsd/r1NT8mNugMSdKorEWIY1eIwnrAGq5b9iMnR1vtuwaaHu7Ue3k95g6sGeQ
	QKg/9xdtf79R0JdOVSa9ivDxG5ZXIaHenUq5i/8NbuCMXAS1HUx5hIFtuPeBRWAaa1yIi5GMA0u84
	bP4hRkFVPYh3oo4KuKv7WG10XkncKsgKc2Cu4vwjOqj1VpH54GO+0hbR7+hbF1QdxG0P7Vy5vonR8
	DEXK/64sVBGyYITef2QPJk16OJRoRSoT5HI+YVctLwUaWthKHpH/J+cGc2uaJZPAoUD/mfXRg1xb0
	DqXkX6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M7c-00F2Jp-Hn; Thu, 23 Jun 2022 12:39:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M76-00F2BL-5t; Thu, 23 Jun 2022 12:39:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D2C566017D1;
	Thu, 23 Jun 2022 13:39:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655987950;
	bh=Opbkx5tpm4cSm4X+cPI3YI3cPVY0QQ0JlJF9WyMluwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFLMDsnvshN5Gq1jogNnbiwHbYsIYA312tfmjDewqnNnxRs4JvSGvhf9EQuoL0LYw
	 ywXBtlFDrp/DO6hKddFUCdaeaYaocpWGx2DM9lA2HEuyC2Y2+cjXbk1ekkg2B1by1A
	 d7SsheiTzR6I4lekn2/legyVeQMiEEe8kc6PjzfGxhGop9b5Lsdpu//7aZjLnQWYA1
	 0jtvqTRET2UbyCHHCIXy/8Y4U88W1UzuURpAbSII/guhEMyUAGXUTHwj8bv2ZQ4yUi
	 IZrvo2cL97lPy3Cv724bDYrG524U+c+L3UmUM8umMHYA8avChZSQopRd+IIwL5iTQf
	 uHcvKoPnLzLuQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs
Date: Thu, 23 Jun 2022 14:38:49 +0200
Message-Id: <20220623123850.110225-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
References: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_053912_411776_88D30437 
X-CRM114-Status: GOOD (  13.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek SoCs have multiple MFG power-domains, exclusively used for
the GPU which, in turn, requires external power supplies: make sure
to have the MTK_SCPD_DOMAIN_SUPPLY cap on the two topmost MFGs to
allow voting for regulators on/off upon usage of these power domains.

This also ensures that the SRAM is actually powered and that we're
not relying on the bootloader leaving this supply on when performing
the first (and latter) poweron sequence for these domains' sram.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8183-pm-domains.h | 1 +
 drivers/soc/mediatek/mt8186-pm-domains.h | 2 +-
 drivers/soc/mediatek/mt8192-pm-domains.h | 2 ++
 drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
index 71b8757e552d..99de67fe5de8 100644
--- a/drivers/soc/mediatek/mt8183-pm-domains.h
+++ b/drivers/soc/mediatek/mt8183-pm-domains.h
@@ -41,6 +41,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8183_POWER_DOMAIN_MFG] = {
 		.name = "mfg",
diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/soc/mediatek/mt8186-pm-domains.h
index bf2dd0cdc3a8..108af61854a3 100644
--- a/drivers/soc/mediatek/mt8186-pm-domains.h
+++ b/drivers/soc/mediatek/mt8186-pm-domains.h
@@ -51,7 +51,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 				MT8186_TOP_AXI_PROT_EN_1_CLR,
 				MT8186_TOP_AXI_PROT_EN_1_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8186_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index 558c4ee4784a..b97b2051920f 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -58,6 +58,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8192_POWER_DOMAIN_MFG1] = {
 		.name = "mfg1",
@@ -85,6 +86,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 				    MT8192_TOP_AXI_PROT_EN_2_CLR,
 				    MT8192_TOP_AXI_PROT_EN_2_STA1),
 		},
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8192_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
index 0529d130b675..d7387ea1b9c9 100644
--- a/drivers/soc/mediatek/mt8195-pm-domains.h
+++ b/drivers/soc/mediatek/mt8195-pm-domains.h
@@ -162,7 +162,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
 				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8195_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
-- 
2.35.1


