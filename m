Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4D7C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqdAqtl2HyM6weGdRUYSI5fz6MeLKme641FAPtX5r3Y=; b=bbzlJ1wUt+Zl6yV5bGqR3bROwg
	JDLR66j52caCQUh+PZe59xLrFyTRVTqPb3pNmxqUgnphAeVPHCsx0qlxkMCT1o9IrpinMOfjwbEcz
	AjfoGLX8SGUkOemZEt39H867i/lhiTwbHooqsU3s0LaPpus5IjEy2LUNBTQAXW76f6eW2sE71dO+m
	tJRXFDlLvrDaK1/MRYqncVkIxSakQmBqBSzEiVTAlJEW6h22MTHiSk0fOTWmnKHobZsA7B7nCD6dt
	8xgnzUGXDWWPR4nMtutzE1rcLr4nmbC0UFG3WgmNfCo0VPggrtZuQx8mc0EMBTm9dAFgXEnyu6FEK
	B7/pdSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrcg-005SrK-Uy; Sat, 25 Feb 2023 10:17:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrcI-005Sdg-3u; Sat, 25 Feb 2023 10:17:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id ck15so7155805edb.0;
        Sat, 25 Feb 2023 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqdAqtl2HyM6weGdRUYSI5fz6MeLKme641FAPtX5r3Y=;
        b=SJOypASA17J1FKOo6kyyV500JXZQFVFCO776wNmuV4SCzUTMoivR3arUdg0Hq6bd20
         Q57GtAFi/UATECSfJnIWOuOxDuD4nK1qEO/Yn3i3/UMy4M1g/Xkmu4zO2IYpOBQ6GADi
         dkBppSVdbq3TPlWwsKavCiY8a2PtzoRY9d2mZg+ZVaoKEhz+wWX9nM1U4zByz9bTGP7u
         1RmUmwpv0J02HnrnhhC4MD3SXobdjlSRtbyDesa8XywGxzSo0YVEjhImkzSBYtaT1VtP
         CWQbmvQEzU1FolZSnppWJ5bBrU37lbnoO9i6w+kcprbo3/kgudAKooj2yfgTgRUYhEuy
         GiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqdAqtl2HyM6weGdRUYSI5fz6MeLKme641FAPtX5r3Y=;
        b=NpYWMeOYqNbC0+q8A8VE0ctSoyqWCLUsqHu7VlDtlgXH2P5LARE2YCKCotCN1/4CiN
         aiY2d24pzEKgxOUCI4gjb2OHXST/cfCc9kO2kHj6zrCKOmZTucgpkyS0aL3D6rmm0W3i
         arTBGvVXPqfXwa7teu5VOuBuvPyVmzs7Tm7fpypAkDDn1gNff4NOc4NyN+ALoc6BiQN7
         Nx0MbRV//KPkuoi613fLQcsydX2AQbn4KxuUi5D0n0Bj0uPfLzF/QIFd9IpqMJxi6VoB
         Jp3CxVIxKXwcPY44imKEvO+a6n/u2aVDyjaVCjQAZxfVwGo/n23rR+PL2YQHjNPEcdTj
         vANg==
X-Gm-Message-State: AO0yUKV9yVRcSPcu8yLeNSdvkyMVxPOHgFXqKQKvpwuUTD9b9spnqlqy
	5vIST5KOydo3AGJTU6RJuzY=
X-Google-Smtp-Source: AK7set+M//y5jAG54Dw5hwWPqfgJ4BDNdS66Iw9Q5xh131Vo6pX8zFC8LqZeCc3It6fTNWWUmbnA4A==
X-Received: by 2002:a17:906:86d4:b0:87b:3d29:2982 with SMTP id j20-20020a17090686d400b0087b3d292982mr26298346ejy.11.1677320235019;
        Sat, 25 Feb 2023 02:17:15 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004af6163f845sm677722edi.28.2023.02.25.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 02:17:14 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] soc: mediatek: scpsys: Add support for MT6735
Date: Sat, 25 Feb 2023 13:16:29 +0300
Message-Id: <20230225101629.264206-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225101629.264206-1-y.oudjana@protonmail.com>
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_021722_188482_50E40311 
X-CRM114-Status: GOOD (  14.70  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add support for SCPSYS power domains of MT6735. All non-CPU power domains
are added except for MD2 (C2K modem), which is left out due to issues
with powering it on.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 84 +++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 7a668888111c..b771bfb93cc9 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
+#include <dt-bindings/power/mediatek,mt6735-scpsys.h>
 #include <dt-bindings/power/mt2701-power.h>
 #include <dt-bindings/power/mt2712-power.h>
 #include <dt-bindings/power/mt6797-power.h>
@@ -32,6 +33,7 @@
 #define SPM_VEN_PWR_CON			0x0230
 #define SPM_ISP_PWR_CON			0x0238
 #define SPM_DIS_PWR_CON			0x023c
+#define SPM_MD1_PWR_CON			0x0284	/* MT6735 */
 #define SPM_CONN_PWR_CON		0x0280
 #define SPM_VEN2_PWR_CON		0x0298
 #define SPM_AUDIO_PWR_CON		0x029c	/* MT8173, MT2712 */
@@ -57,11 +59,13 @@
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
 
+#define PWR_STATUS_MD1			BIT(0)
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
 #define PWR_STATUS_ISP			BIT(5)
 #define PWR_STATUS_VDEC			BIT(7)
+#define PWR_STATUS_VEN			BIT(8)	/* MT6735 */
 #define PWR_STATUS_BDP			BIT(14)
 #define PWR_STATUS_ETH			BIT(15)
 #define PWR_STATUS_HIF			BIT(16)
@@ -750,6 +754,73 @@ static const struct scp_subdomain scp_subdomain_mt2712[] = {
 	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
 };
 
+/*
+ * MT6735 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt6735[] = {
+	[MT6735_POWER_DOMAIN_MD1] = {
+		.name = "md1",
+		.sta_mask = PWR_STATUS_MD1,
+		.ctl_offs = SPM_MD1_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = (BIT(24) | BIT(25) | BIT(26) | BIT(27) | BIT(28)),
+	},
+	[MT6735_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = SPM_CONN_PWR_CON,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = 0,
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = (BIT(2) | BIT(8)),
+	},
+	[MT6735_POWER_DOMAIN_DIS] = {
+		.name = "dis",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = SPM_DIS_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = (BIT(1)),
+	},
+	[MT6735_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = SPM_MFG_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = BIT(14),
+	},
+	[MT6735_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = SPM_ISP_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6735_POWER_DOMAIN_VDE] = {
+		.name = "vde",
+		.sta_mask = PWR_STATUS_VDEC,
+		.ctl_offs = SPM_VDE_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.clk_id = {CLK_NONE},
+	},
+	[MT6735_POWER_DOMAIN_VEN] = {
+		.name = "ven",
+		.sta_mask = PWR_STATUS_VEN,
+		.ctl_offs = SPM_VEN_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+	},
+};
+
 /*
  * MT6797 power domain support
  */
@@ -1033,6 +1104,16 @@ static const struct scp_soc_data mt2712_data = {
 	.bus_prot_reg_update = false,
 };
 
+static const struct scp_soc_data mt6735_data = {
+	.domains = scp_domain_data_mt6735,
+	.num_domains = ARRAY_SIZE(scp_domain_data_mt6735),
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt6797_data = {
 	.domains = scp_domain_data_mt6797,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt6797),
@@ -1088,6 +1169,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt2712-scpsys",
 		.data = &mt2712_data,
+	}, {
+		.compatible = "mediatek,mt6735-scpsys",
+		.data = &mt6735_data,
 	}, {
 		.compatible = "mediatek,mt6797-scpsys",
 		.data = &mt6797_data,
-- 
2.39.2


