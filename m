Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1587C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=tI27I6dDOHx6PX1TDhCXN7V6bl
	UQG6ltEpew30VvuJmUFxY+wf3+Ezld68ND7/PuAvWBGjZJwNluBV6UCnvyRAlI8J5EoOjPNFnHWgD
	bzdJo5g50WO1niDKLHSrrDZQ8JpeI/UiiksG8Vd82LUx29jYIqEVG9baOfF0xBAMqucLTwJKw28Uq
	Tpn9T1ppfZwA1BjdPa4+hN91A2lspqU57l4pIgbTxkCjlbrCCXCZIgbacB75JAtZmuwdD0+/NBj5t
	YWYqUiMajOZVWYcefKY2K1RY4/2SfJRikExKhHAuAOrv2Bo1TXeRvTTU3fgofZDc2symhhLVv8dey
	pYUn6MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdP4-00000009WX9-0ufb;
	Wed, 19 Aug 2026 10:20:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOP-00000009W0S-065i
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=hRRoi1tdbPIq6svuJExw35KqcT
	XDjVtZiSn7fGx6HkZe+Z/dwtu8+i2IXYdvR02Ezj2t9j6LSe2WDXDO0xROitggWzJKjJI5tYTfRev
	5hKSpaxHaFqtMkS4d6TkNVCRxFy2JpbFrEZ4c8YMsIf3dkyIV9HkgHl0Ywex6xnXYwyh7LQvPEAE+
	i/rsoQnJpceS44DX9rAwdjTnysqWx2Qzx1V13k6bsg9gJN/9mDJyORETA4Nm2UokOuedF5prCLAhd
	eYZtQtvTNlNEutpWyUV2JHZDQjWQ3nS/waczdTvAsbmrSLrgtsv5YF7xZDadAlr5lWy8qx/pdizWA
	ptVSATnA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOH-0000000DUce-3RCG
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so10058715e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134764; x=1787739564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=JfwKsxJYWFaycK1akK6xy4GCMQCCsx49gkQxcxdTwo52e4OfrCtfIwxe6P75IMU3K0
         t5QKeuBFlSsbz2r0E9AfV3DbVFFpLlM7MbdE0vpp489wGj0o1eXKka3pnRz2O5bkwReR
         44Nkt9oX8zUc0Y99c5tKIPkmJM5JLfdF1TJhsIzxrGB4peXrwUSXYKfgYKRfGPJ05avT
         LUMXWpRyp1NEyh+Qm9pIDeCUF0f1Rc3tlNyBdFa8YBzGPtshx8T/AGYAK/WbjSaxYkD2
         84vol5UP0T6by1hN3HPVmbGzLlgG5ujhQXWyvfrCSUShpsE8qtsDHA18r8TQ0f0owhzG
         5hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134764; x=1787739564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=N6g5rkD7AUlYG16Et7ctUCP7hhUOZ/3EAfv6Hl5AIw/FXtvtY4Db8GZumMGPZ8/a8S
         E2/NjFrc0FHLIIwyornqSvZuJrZYvlnxd8G4dGgSiou/CLSkkff813EcfWRqz4N6zsvh
         o0mYuau2M8Ol2766pTXoNk9alle4Ww7yzENe0lm01FkZolvhH+x6vd9kORVEbYvQItnV
         rNv4+BCdSbZoC41P5zVY82jKE3dW1q5UrH1WHXGHXy4rpIOOLUOTRCrYXgBy/jAWgZsu
         gVE/v/HSldr9hA8fuWF5wJFb8qgSPFSN1WIH1mLesQbaDmZwCt7PGYMbzlP9EQcmosJJ
         uDxA==
X-Gm-Message-State: AOJu0YzfU5CnVc0xbsP7n+3tsVNIT1jja5EjTeyrt07JS4zw6l/KYlJF
	No5gIeqDWL9dOtTjoxjM07OwYUxlobOq6c5C1DfkdvIJbWPsKFiyg15kZYPqkYHY
X-Gm-Gg: AR+sD11admC8JQwXT6zULWd2OxYTkUAuIzdHoLGOabtJPOjbcpX+ocyhfGreUhwfcju
	sMx6h19VSHcwGlqArSxSA+xx0/gYLrMbzYlW9lNdqjyo5/CdU1hdDAv9aJNduKsIYs1xra2zcNj
	EZwud2CDulefy+OSW09rtXqEo9JtfguQVEoxWI6UrCaeDpkYP9+v2L8EKGIOyHNDpI1HkzpKr8j
	oe/Qv70zPYuMU6cD4vA7B0nrW8/lPIDoHVPTUeS4WSX6uuFje8BsUiWaMtEBT/6ljZYObm3bJxM
	Vp5H+b/HmOutGT6uNtn3FdnrldjVjWH8rMfmneqeUOlO0+u7DlGiVNCRgdeE8OyWaLKIE/kftII
	YUUnKgku3m8GrZHwyA7VT6gz+Co2XrtAazZYCX4PN39eCjf4M5lcuHur4gihzc7nsnNZwftTEcJ
	jrEq3LdcIIJk5u6+DqK/Lk0g6m7l2nb0EqMnJ9MimKw3y3CGhzAd+4TA==
X-Received: by 2002:a05:600c:8b6e:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499aa1a8bbcmr65261925e9.7.1787134763824;
        Wed, 19 Aug 2026 03:19:23 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:23 -0700 (PDT)
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
Subject: [PATCH v4 6/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Wed, 19 Aug 2026 12:16:27 +0200
Message-ID: <20260819101853.44681-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111925_887301_55E104CA 
X-CRM114-Status: GOOD (  11.98  )
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


