Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6EEC79FAE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=yXPOhEI8ZCO0H7ZM/r36LgV0ys
	HJZJ1ZcYlICUcP6qssGOQcH7NvaRMk8AnnEZQm96sb4BTiCpG7tKkPu6IHE/biQeQdsnSzUNW+tRg
	Ux6053sLdloMiMum76/5pNeByQXyudxHGnbLaJpY/bZR2J+ACvtg0ixiEybh3pENlBCD7XiyrtRCm
	YYmiiL+mELp9tS9mP7iW1VrU70KF90Dd+n/F9kBHQZ1qikp6hscnfsuMrJ3nhjG9/MF/59B0EML7e
	UYz+mvfnkmc5sesGGLWLDIwBMVjbswFCxkIIS9F2uX3EM3ibmYFJpwJ7PoN673Zg3bLkLvXRC0RLa
	Hi0ReGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsL-00000009sI1-0FDQ;
	Tue, 08 Sep 2026 17:44:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsD-00000009s8d-13rT
	for linux-mediatek@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=YuMsa/WJkCC0iw9a7PjADGsdiO
	3KYd7TiunBsl04b6sGwHD/hwrH9UCv5PyKEDzmQ8Kfwi+Sj5kf9rKdJvowGaH9aohuqJZqy00P9tj
	4GNBnvp23HmSLYYbVYqJT4CnpICdvzOn071bBDe5rGSQxwXEXTjQzrsJW519gFgDLyMyW6mQ6urFT
	4KJXiVMzEfbDunpQH0Bgl8ovCUr7gmegpe/beu1oYrKyBPX1BkI5ejZ1d+L0yINP/LgGehCkdAn3z
	vHvljqj/fqzSbwJwHS5ij7iG2nm5hv2a5tzNSJSIMJDuulbQwh0tc/qCxU6hnoG1I4MrPJSO5dDfV
	edT7AnAw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zs8-00000000B0g-3nvl
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-482ea739de2so3384973f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889479; x=1789494279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=lT6pbO6erhLxo5qaoSGiWU49369Ubyj4eyRyAVQTsUYX5X53ojWcgZBWMPa4a6MT6b
         29WX0rqAJYCzGjdXr+UZlBwCV/Xhd9awDdl6PuRurZIoX/SpC0oEbg1wVAywuggCGIZn
         S4IuIJ+Y3tiNL2wqQ9v2SjcF/cseeZqlXTmOO6tPAOMbD6ecPrEKKexmP037f9o3Pe9L
         Lkus5k/uYhzYdrhLbBNWzrRB44UM5fiQ7Ymwopts2AawUag/eQ55VZsWe4rOQF/I+GXT
         R27HM1fSwITEyiBQkIL2CaaqSrIzDejcNCg1XqMjdOf/OkiFIc1K+riSpDWu+NlVP9IO
         F37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889479; x=1789494279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=i+TdZ8TD5DwfTlQw0AbYfOaMTavCd43gL4nnzyIiFlGxy+oaIr+ZDOKB1/4ms3zlhu
         JUUppLUikbi3oHO1SG/D7ZCsPq+xcICMZQxgi7sDrnL+ahrCjCIe14Avg3dSOG24NF6H
         UZoJRbfVe2kmB7suI5ap8UItVKlnn3jX+QuWrXDQGKOiRATMvBkNjmJys31u1CtdinQ7
         nMGGJHzWcgN+9eyZZfbY4jvaqklhAre2ed1EZ/3Iyro1VN4ILkJbhWhGsySMwnaLI4Ph
         MFrqdu9cPWyEFXcj3rU7SZ44G6ywAzy/+dajyqJUsp/CsYdvzw2SbmeyUKocGsnTSK4Q
         Stpg==
X-Gm-Message-State: AFuF++l6NMvD8jLe9G9hagu7yy5NvVnkHD+Nci4fM0gpM1JTwCRIT2bw
	lLqfXdvbe/BIax3SWLCS5cI+FMzSj3f0ddwIbiIPmWiWIyS5XHSLy/1onk/xHdot
X-Gm-Gg: AYBFou3n+okx1yCllofXbE54LQtngy60n+T6pjttI/Xk3sUeGkeElcOl94TlOY5XppN
	FYnKGgJW0NjtwHxWq9OTXwfH4BnQr57SlVOQcX11N2dkulW9IP426UXSnN8htnruwDcQKvwcwUo
	fuSFxOJfePtd8qRhXuzmD6lQJOyLtr6z5QRnujD12Gt1JlehJRelUCj29LKPrJotfSETfBYErKm
	zbMZcSfNkoCpUvdIwrgmSNJ0It2OHSFUlqm9PVJ3/r4oTws05kYGObgpoFShE4HpcUdrYkaEvhh
	x9ecU9mKVoiEy7PKPwf2uAIInXjS6942NzyHjEvJf87CKTgPFMn1a8lk8MJjbXYuNESFPCW6WtK
	n7ntJbNjOYEZNbDHIiJLfMoaF2uTtg0vB6UMpKe/MDgxDzgOfMBw5IwwBGtd3C1yOUv/Xn12euh
	zNqfTxOsligoovKHFPljQfiXzyhZ+dYkX/iHzyuF0qyVUaXtlLP0Fzo2qF
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49cfff39708mr256750925e9.17.1788889478855;
        Tue, 08 Sep 2026 10:44:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:38 -0700 (PDT)
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
Subject: [PATCH v5 7/8] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Tue,  8 Sep 2026 19:38:34 +0200
Message-ID: <20260908174259.9009-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_184441_019043_0A8CD73C 
X-CRM114-Status: GOOD (  12.25  )
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

The mt8167 SoC has 28 mmsys resets, split across two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144).

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..5c7cded5cfa4 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,9 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..015dc5b86478 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -53,10 +54,47 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
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
+	[MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG]	= MMSYS_RST_NR(0, 26),
+	/* all other bits are not described in data sheet */
+	[MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER]	= MMSYS_RST_NR(1, 2),
+	[MT8167_MMSYS_SW1_RST_B_DPI1]		= MMSYS_RST_NR(1, 3),
+	[MT8167_MMSYS_SW1_RST_B_HDMI]		= MMSYS_RST_NR(1, 4),
+};
+
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
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


