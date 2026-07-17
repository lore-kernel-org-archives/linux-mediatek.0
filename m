Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B50C44520
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6Nle1J2Z37EDbTLYDXicAyW2PuOELSBhKsjOPEFE1Y=; b=U+DxXMBqzUZHxQ4xf2BVQAc8Wm
	OkhX3i/eLlVJcIf8rOlYkHLCyCuxbDxsdHv+lyOcN9Os41/Cjkj3jcReLvhegS83RmhkcNp8V1KrL
	P1GNB2duyZtycxo4ED3SchLZzx6Rviy+tr3Qx82PC2Gg3IQRmyKx1uroweonJMTA2Qs8oHBU9lgoB
	Uj4qxvWQqCMrCw/ERZ3p+rX5zGVzCcTMCrKSaggSOCJP+MN/MXedfObG0EXgC6U5fFr7A2P0FoDkH
	j2j3EZb6lpBYyOEc5xgAsf4fSHBI9Flzhmyf0GTXoNgwzLDXDPh06mCjfxN+wOtbcQraNd5fvwyip
	OIcd4eDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHf-00000002Zzi-1xmi;
	Fri, 17 Jul 2026 15:15:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHW-00000002Zos-1Vv5
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:19 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so11195801a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301317; x=1784906117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6Nle1J2Z37EDbTLYDXicAyW2PuOELSBhKsjOPEFE1Y=;
        b=jZ6RA3fiUMtazecGCEXQhczWDNOiZoc1ckLAhegPFLlpOjQsuOLfnwIuwy8dO+hYO1
         TsrNduWcOj5DQsWfkidgyggfHexDCw01K46yTmyLMIMm7C5GKGQmdr5PXeMqcNnp8DV7
         MqbD8vWoxHfIbvocT/X2o/JyTeIBITzcOWzBta61sU+SWm96S33buMMHAXTdVvHDsFX6
         C0gKtbgkUkbJL969imnrwyMyr6UQ8lk/KIM5MQ6JIbDlFy8JomgI2wX/PcylLt2+LGPm
         QL30QufelN+PuF6ZM765eJFO7G+8jwA4gBtoPy2KmVH337vfXWKTTMQGOBrJedLKNwOf
         u1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301317; x=1784906117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6Nle1J2Z37EDbTLYDXicAyW2PuOELSBhKsjOPEFE1Y=;
        b=f1dCoGJB6qUkoUwl+egqDQOU37CRfgA+CnuDlAN8m72NOFWiX6mjvXxfaZf8UQ5zKp
         fzUDxPs73oNxZKNB3owNWYILGYgTQ8h27CDjaKy8iMk2yo9DS8HrPUwARQrQ/rEL88iK
         afDMDrmvpgejZydMYEA3gv8Mfpqpdgjv/4GciyuJuYa/OHYNuMli2w2Tb0H83etcp5/+
         eeOGoyf/+NzrpXNKw+oATggyuWwzKYZujMZCwRevhBrZd1cPq8fGSElHv6/PRu0qqoOB
         KkrU4yJTqTbi5GJ1YkIGb0CnzWIiF+plr7smShLf/YCUfFWe+BD18blG+m6Olzt9N73v
         ePGg==
X-Gm-Message-State: AOJu0YwDBBivzYKkTjWwrVURQbJEKIsUHlmRhF/eL3oniD40SghPgqyH
	w/LbgCvzpP/i+qLrfYNplOQys7c3nopdbHOSQHs5y0/lZfG0DkYxAKZJd8xb08js
X-Gm-Gg: AfdE7cm6hWaDm5MRktpg7NVfOQ+805CG7EfR7XxsgDdKKa9bbDrWOHPdR5RepIp+kIx
	N2ZQka7baCUjfn126ClbJ3JgeJvA4VkMcPS0FBcWMAVoN6nESdS7XGhP6GiOEyES6hkbXPEGSe3
	xdnAlEGOhh6KABw3SfsrCuaRpSt77vNVyvOPlxXKvHK1lioQKe9D5FWTw878tOmzHn4Yu63J37T
	OiUDNqZmm7i4+5h900AiNYLASKhcAM83QONlrzVmbNCeuGbOdVIuyOb45GdY5bJWigmv5/0LTOZ
	YiYjPIqkNCR0S5maudMNwhpKP6QonHtGpQyDi/oMj3pPUyY2zyn+HzRoiszACpjECjbfQYPrHAc
	fy3pMrwAVsujU7EbvfOxz4TTZE+R4QzMs6TrQVRoep9+PZh7oMKCnAQ+VWcmpQxrPmVGgHL+0Kw
	==
X-Received: by 2002:a05:6402:50d1:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-69e65228d68mr1306044a12.8.1784301316360;
        Fri, 17 Jul 2026 08:15:16 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Fri, 17 Jul 2026 17:11:14 +0200
Message-ID: <20260717151134.678839-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081518_451651_2B4E3EF1 
X-CRM114-Status: GOOD (  10.79  )
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 40 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  3 +++
 2 files changed, 43 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..b8f38ff8cf44 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,46 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
+
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
+/* MMSYS resets */
+static const u8 mmsys_mt8167_rst_tb[] = {
+	[MT8167_MMSYS_SW0_RST_B_SMI_COMMON]	= MMSYS_RST_NR(0, 0),
+	[MT8167_MMSYS_SW0_RST_B_SMI_LARB0]	= MMSYS_RST_NR(0, 1),
+	[MT8167_MMSYS_SW0_RST_B_CAM_MDP]	= MMSYS_RST_NR(0, 2),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RDMA0]	= MMSYS_RST_NR(0, 3),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ0]	= MMSYS_RST_NR(0, 4),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ1]	= MMSYS_RST_NR(0, 5),
+	[MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0]	= MMSYS_RST_NR(0, 6),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WDMA]	= MMSYS_RST_NR(0, 7),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WROT0]	= MMSYS_RST_NR(0, 8),
+	[MT8167_MMSYS_SW0_RST_B_FAKE_ENG]	= MMSYS_RST_NR(0, 9),
+	[MT8167_MMSYS_SW0_RST_B_MUTEX]		= MMSYS_RST_NR(0, 10),
+	[MT8167_MMSYS_SW0_RST_B_DISP_OVL0]	= MMSYS_RST_NR(0, 11),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA0]	= MMSYS_RST_NR(0, 12),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA1]	= MMSYS_RST_NR(0, 13),
+	[MT8167_MMSYS_SW0_RST_B_DISP_WDMA0]	= MMSYS_RST_NR(0, 14),
+	[MT8167_MMSYS_SW0_RST_B_DISP_COLOR]	= MMSYS_RST_NR(0, 15),
+	[MT8167_MMSYS_SW0_RST_B_DISP_CCORR]	= MMSYS_RST_NR(0, 16),
+	[MT8167_MMSYS_SW0_RST_B_DISP_AAL]	= MMSYS_RST_NR(0, 17),
+	[MT8167_MMSYS_SW0_RST_B_DISP_GAMMA]	= MMSYS_RST_NR(0, 18),
+	[MT8167_MMSYS_SW0_RST_B_DISP_DITHER]	= MMSYS_RST_NR(0, 19),
+	[MT8167_MMSYS_SW0_RST_B_DISP_UFOE]	= MMSYS_RST_NR(0, 20),
+	[MT8167_MMSYS_SW0_RST_B_DISP_PWM]	= MMSYS_RST_NR(0, 21),
+	[MT8167_MMSYS_SW0_RST_B_DSI0]		= MMSYS_RST_NR(0, 22),
+	[MT8167_MMSYS_SW0_RST_B_DPI0]		= MMSYS_RST_NR(0, 23),
+	/* bit 24 is SMI_COMMON again according to data sheet */
+	/* bit 25 is SMI_LARB0 again according to data sheet */
+	/* all other bits are not described in data sheet */
+	[MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER]	= MMSYS_RST_NR(1, 2),
+	[MT8167_MMSYS_SW1_RST_B_DPI1]		= MMSYS_RST_NR(1, 3),
+	[MT8167_MMSYS_SW1_RST_B_HDMI]		= MMSYS_RST_NR(1, 4),
+};
+
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..abd96634b63c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,9 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.rst_tb = mmsys_mt8167_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8167_rst_tb),
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


