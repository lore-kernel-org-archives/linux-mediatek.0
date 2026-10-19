Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49CCCF2D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=; b=VU81xZon9KHjVVn6Oo3gvI7g4Q
	JEWxi6SWm/MjyTdRQtyfTQMoBDmka+limZaG25Zeg4HjzbV2m3IhtA5TIDU5cA/TNJhaWxAvqVIQ/
	OIWxxJpMcFEa7caUMt6dg6w1L2ZZ9eRoKU/8CJi5O3FjFEIrI5NVfoI2wsdGDjhoLJs02xz+alAzx
	/cNImNpHTRLtvFmQDxo743uJUJ6qYqRj7bLr0NZq6iHM33D87q4+SA9OxH1DZ/OmsvMLZKPuC5PFK
	R6MAHUibvERu3+nf0Sb3MU94HVbdICsiCLYGGzgipWNfO4YzPm94MPOpfFIaK84VS6FcmJI653f12
	gZfTSNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYh-00000007OoO-37cu;
	Mon, 19 Oct 2026 12:33:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYd-00000007OlG-1snu
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1167680f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413217; x=1793018017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=;
        b=IihDtvGDtih2sFwvIunN3srBnIXXI3H2hR6QAy+zOyiBG7JrMoky+4m3W/c0nd5oqr
         yxLMM4VftjFrk/ZyXDWdBc5kBc0AbTkQqojw26iwadI/jZdMwfIeCYR0kt3I1Wz3wLT+
         Pa6AvdoDXwY+aaZ0lAPEKEsIEfIfcX3IZPiGM3c+hcxJ1PV3LT1Po40n03d1W78Eu8Qz
         fIRWstC+9HskEKNi+ydV3IwyA7hOTtfcoDH9ow0xt91+/6gS1lJ8f82Th87/01Su3O5h
         T47gX7n+WlBadm83eR81mzrhUeB1xTds5NxF7A+konCwl258vhqmOUyowjCmf2BUwxXG
         sREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413217; x=1793018017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D510WMtJn6qt45zniahXCzgTs78JgIjBCMNt/1RZUFI=;
        b=MEXBGDDi8vhUwR0KwHRWSB0Tahd0UEotqTL7TX7zUx/lRyLo2I415uu92XvTbm5Dxr
         gAnv6gD9uNiM30zSDH3P8dZniIBf9uj2iYUYarIeCtk50JC4VpdKS5ESAvoNok/OnTcz
         mJgozfciFv8HewF+VQvSbPsaackovTBekTsY9VQYpei/sAyX83fXQ+DsPPBsW4RZHGQJ
         U/ytsWte+J7g7V3j5gQ4tYBM69rSGaALcqQjJ8XMYXgaS7u9PQ/qAI5a+1q33xenZ5Nd
         AijqRm8zSP98rON2Srkhi8FtpU5LIO4eB0sOvRmgV7pxNsmGyqXe5CXZUxxYe0eco6hN
         loUg==
X-Forwarded-Encrypted: i=1; AKwUvBy5IuSXRCgd+k3GtXbWQ46ZP4opNeP3tw08ZYuUaGoUmasggRSL3S8TSy3ymGZP38WWDpdQ6KqOq1upLZbXQg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIbZxPqFVn139921Ar0w8w6WS/FhEOIQAsjHTIH/e172Qss6e3t
	PV7zLeSEXGs+2Q42f7z0fgzka13oyCROrWWPy7SIj24U0vyKEC23eqCQeg4M4NQCduU=
X-Gm-Gg: AYBFou15oo2/TEgSJbfZAKV8S/axxKG96m7lKauNqlnhwt4+SVH/s0vS/XBC407sbvS
	w/znIZNVZGQZvL3JUwPGoUSHotY1E8uLHVdj5g0hLFTMWMCiWTWxN9caLptemOtTXTlunedujMX
	kn8SFMY4Q5ygfge8QdMwj2FzKGVxksjd1ekcYwQX/K4Rfl2iChzU0xNedVWyudlxAcTr06Pyhh2
	Gn/fiRQosZ1W2+FW97ScNcj2TbmlJD7ZH6LKrcyFfcDXT5cpYGYdgAkfEltLeIh8AjKdZySaMep
	2Zc4tmg8t2xYxEF5n43NZ90DouD8Kus82vWG7uQeb/wvaybRApum8ZPyWI16QvYoue25tUY3lVg
	RA76t9DLDa2xLLYBk6CZ83vzbj0GOf7NQGumLYyWvDC/X4xHj/p8EIO7lq5wWvaS2yY+0JPPNct
	Ms1gNrN0pmxttJcTqC5slyyIWSlZ09JrqhQpasAa/w1FcoC18l+CebTxPH6ORN1h3V2P/YSnW7k
	jEqQM5bxY3LKrxJ59cLKTaSuagWHZ8FZGCjhVr6I+rhhjwk3a6bPRtMH+MSOXTCZuaLjzrHZGw5
	oZSM9c3GtPkq+N8minBc4UZKQPIP4DvN0134dhGGvHVYpRiIPTNkpOI=
X-Received: by 2002:a05:6000:4b1a:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e07fa2f48mr13222112f8f.51.1792413216789;
        Mon, 19 Oct 2026 05:33:36 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:36 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 19 Oct 2026 14:33:55 +0200
Subject: [PATCH 1/2] pmdomain: mediatek: mt8365: fix defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-1-dfd445dc3763@baylibre.com>
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053339_513031_946A117A 
X-CRM114-Status: GOOD (  11.83  )
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

Fix the names of some defines for MT8365. Looking at the datasheet, some
names were not aligned with the datasheet. While at it, also fix some
indentation issues.

No functional changes expected.yy

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h |  8 ++++----
 include/linux/soc/mediatek/infracfg.h         | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 33265ab8ce76..3775e4dc2c91 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -52,7 +52,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0 |
-				MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1 |
+				MT8365_INFRA_TOPAXI_PROTECTEN_MM_M1 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1),
 			MT8365_BUS_PROT_WAY_EN(
@@ -92,7 +92,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_ack_bits = GENMASK(17, 13),
 		.bp_cfg = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
-				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_S |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M),
 		},
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -129,7 +129,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
-				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
+				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1),
 		},
 	},
 	[MT8365_POWER_DOMAIN_CAM] = {
@@ -183,7 +183,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.bp_cfg = {
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI_1(
-				MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB |
+				MT8365_INFRA_TOPAXI_PROTECTEN_1_DSP_EMI |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M |
 				MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S),
 		},
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 9956e18c5ffa..d2cfa09f81ba 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -6,29 +6,29 @@
 #define MT8365_INFRA_TOPAXI_PROTECTEN_SET				0x2a0
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CLR				0x2a4
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M0				BIT(1)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_MDMCU_M1				BIT(2)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MM_M1				BIT(2)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MMAPB_S				BIT(6)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_0		BIT(10)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MM2INFRA_AXI_GALS_SLV_1		BIT(11)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_AP2CONN_AHB			BIT(13)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG			BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1				BIT(22)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU2AP				BIT(2)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0	BIT(16)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1	BIT(17)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST	BIT(18)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_0		BIT(16)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_MM2INFRA_AXI_GALS_MST_1		BIT(17)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_CONN2INFRA_AXI_GALS_MST		BIT(18)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CAM2MM_AXI_GALS_MST		BIT(19)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_APU_CBIP_GALS_MST		BIT(20)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV	BIT(21)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_INFRA_GALS_ADB	BIT(24)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_PWRDNREQ_MP1_L2C_AFIFO		BIT(27)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_INFRA2CONN_AHB_GALS_SLV		BIT(21)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_DSP_EMI				BIT(24)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_S		BIT(27)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_AUDIO_M		BIT(28)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M		BIT(30)
-#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S		BIT(31)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_M			BIT(30)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_1_AUDIO_BUS_DSP_S			BIT(31)
 
 #define MT8365_INFRA_NAO_TOPAXI_SI0_STA					0x0
 #define MT8365_INFRA_NAO_TOPAXI_SI0_CTRL_UPDATED			BIT(24)

-- 
2.56.0


