Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECC6C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=; b=1astu/EpemlUgZIDMz3AqLLL3I
	n7XD7HxdJFR+2kCTariOzNlHDd2DGjvkGsM0d5/hn5v/wpvfDbwh5V7LoezLXZ7Ik6kODPkoNtWEZ
	iTY0o7Yh2ZhGOhXM5+gR51fzxQjZszWz2wo4xlhGe9VGF4JGaK0fsmEGWS8Tiu6x6yqYezd5nuc4M
	M8gIQVhUln6DgkwxC3vojhQViLag5Z99tr5ZxF/xlp0hy+JrFnyiHXpOGzmLt7ocOuML7LjimyMud
	bvVLpUJgNGWYRzG1hO/MQcteglrDYYhvK5vrWpG5x5eXeeisqVpVIdQ7JDhCMG8AVxFGe1OkWPqCJ
	NJ6rKztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63a-0000000ATWe-0ecA;
	Sun, 09 Aug 2026 16:07:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63X-0000000ATRU-1T1y
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954dff6536so9179675e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291642; x=1786896442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=Nlkx+DrC0FB1/EHEYqpwd8bQhNoDXh/qGch5Bb+HaGdlPcBzWox9EuZromhb0h1nla
         KO0D8srJ+u524Go8s3p8cXuhMOvRMlam+c2Vt6RSDX59TBK+j2otdN6dL6sOU+IqUqJw
         TxDXfQTqQ/HNtB92XIWLPiocTHOuAKx0UU/UrklI7ssaLZtW6hr3AJ1ou/U5L1FSohnI
         W5ikG2enDoX427U5ZYfn8fG1jJAQbh4HbS3Vl2uD/BnElz7coIeBKqeqE1NGEiLQEeVB
         494A4xLnMzGim7N7YFe98N/F7yj0Gcp0YEoXQXImXwXt7pPU+NBYudt+LbUbkdfrTuZT
         CP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291642; x=1786896442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=A91Gv/RdXgF4amz8+r2OC/flpVeJT3RZNy+G7f/79EgtpWUlMi4sBREInp8bYNMUdt
         a4MoU/HXJeFA2D1+w+zfHy3XB0bafle9GCvn0tvpZ879DnRqYzMxdPmOHunDkZzoTT8i
         pywEwC9UwFDuTlP49ocS914uzI52HWu/IIRVTspZOXmlfbUmXXKx3MzXhB3Qp12Fmh+b
         kbDUCylPGsA5ALmPaz8r+BZ9KzifvijPkmTuYuZHr9yFV3MPAVfSzy9GTdalrPRLlIQ9
         GuQX6Js83/gXB4ViNdFuNXKA5RGKkUjJMwYKd8aBGl4b/1yUFYss245E8bfF9dEmyQ7b
         H7uA==
X-Gm-Message-State: AOJu0YwsGf64hm3x00sB2bYWXXaS00TLF8jwJbDZdQLbDgqXIo88BKgP
	9nWuJQ5AF4Fki1plL+K09wnVQ9nlL1AjiWH4fK/oumjGsNDrveLfaJHmikR8URBHKKa/Rw==
X-Gm-Gg: AR+sD10xfYhoZ8SjQdhZ+ZK9NjzZFL9P5cf1sj8LNRmuVMv0YTwUADP7hrHMIdncV0W
	xPLKXWBaDB1PIxPJEdRfKI5AxsGcop/j6D5BxNnOKAqtOSH5ZluRy4+0HOkfCKiD0sa2wbPM/rs
	UL6POQ9trfcRRIEWazVIZ01b7nsT3EVy7cq9YR6KfCfDxl13yTCxA15sIlzm2nm7K1ttGdTMCJ4
	yE21p+odbN33ygxpMB/UuQpMUHkrl7egvbus4v/xGtpKvYs9kKaIuNReHyiP7C83RbM4Yknv8xj
	8yopQR5d8Ai82k8T++KqFDTsnxaIfN3axoaV8oQBtlVLi/2+UVGpcQegpx/D6Sr5omHuI5MvvbH
	f9vi+2Swcb7BfUGgakWTRvw1RNHxiNNhvbZon0vjU6KZIm7J1pOkndNhNGKFX925+rDNwuGt+O4
	G0Z5PdoCwnXKXZN/NFk/bb5iphjtb9zxakzExW7lIVbUE7U7XCayTcEeQqr0pGxwwYyqJYMdpvN
	Tai
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr315410825e9.3.1786291641636;
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
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
Subject: [PATCH v3 8/8] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Sun,  9 Aug 2026 18:03:32 +0200
Message-ID: <20260809160643.33991-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090723_451784_9D7339A4 
X-CRM114-Status: GOOD (  12.63  )
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
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..27793462ce0d 100644
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
index 2f3e0778bb17..02649225e8a7 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
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


