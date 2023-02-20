Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9612DC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY76+r14mLeBhoVzYLyM7pNheQVEMPsBzI/z5gTRoY4=; b=aQEA1cSzlOdBH+FhG/Rhub0Nex
	Ug2P2A90a7CyDCUW2Q4Cq32x80e4dXw6ldCDeILrNBiqUCMocWUXLnSh1sXKwvBv/K1MpYcalPjB8
	rJBqVdy3ienFynb2XepYkrOkzoZI7Eg/qkh7Bh4KjhzoBF1Esk8ISXNeb9FMN9GpxVAqf4VcTnJDC
	RAB/CCgSuqnp9UxWxopKJ8mYFGsp1XIc9r68XxO8FZxRK3OHojeOypQxuFAJhNFVj446/sFYDPjfX
	o1zevGKX+CiZVGjCdfgR4o94Enrho7Qo1oIaBoK7Gmei3ZuRQmZIRHLoSxOBsyqpfC0PqevAiryu1
	E0SIkpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8BK-004dll-CK; Mon, 20 Feb 2023 15:34:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7gH-004NlS-TR; Mon, 20 Feb 2023 15:02:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B45266021C7;
	Mon, 20 Feb 2023 15:02:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905336;
	bh=zK57pu6YreEhk+8+0/wsk/oSJuvEwA1BCrX0LjW9yCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbNTnmaGgiRU1R5tSO6gZHxGlWb8PPOQTQrSOoketnQD6Ukz74zBkGOqBEPx70LtM
	 sxsPx854BprmifxmozCFhsaWFUj8nswrPXGESmaQbAJAhxffWfyIMMVjk+ubnlXWqw
	 0Mc3v6TCt7zrPV1Df3mal+8G+UiuMibMx4DgWLsyoYPZxxqsiKT9XwOhzVlx+137mi
	 HFjGrIXlPgqZnv9vH6o3Q79Hzdt8hY8UyZOitbJRF/9okFjRTzG+5L0CO1HBJeTw7Y
	 qgwQFteXzeLjeI+FyP22GjIm5KNEsVjOrh4K2DTFGw6M9av0EW9JNUSlOMWlWpgQFk
	 H6X1rX/9oG4ZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 43/55] clk: mediatek: Allow all MT8183 clocks to be built as modules
Date: Mon, 20 Feb 2023 16:00:59 +0100
Message-Id: <20230220150111.77897-44-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070218_282298_62F970FB 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

All MT8183 clocks are platform drivers now! Allow module build for
all of them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 6cbc69e713dd..ff04d82278eb 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -511,7 +511,7 @@ config COMMON_CLK_MT8173_VENCSYS
 	  This driver supports MediaTek MT8173 vencsys clocks.
 
 config COMMON_CLK_MT8183
-	bool "Clock driver for MediaTek MT8183"
+	tristate "Clock driver for MediaTek MT8183"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
@@ -519,77 +519,77 @@ config COMMON_CLK_MT8183
 	  This driver supports MediaTek MT8183 basic clocks.
 
 config COMMON_CLK_MT8183_AUDIOSYS
-	bool "Clock driver for MediaTek MT8183 audiosys"
+	tristate "Clock driver for MediaTek MT8183 audiosys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 audiosys clocks.
 
 config COMMON_CLK_MT8183_CAMSYS
-	bool "Clock driver for MediaTek MT8183 camsys"
+	tristate "Clock driver for MediaTek MT8183 camsys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 camsys clocks.
 
 config COMMON_CLK_MT8183_IMGSYS
-	bool "Clock driver for MediaTek MT8183 imgsys"
+	tristate "Clock driver for MediaTek MT8183 imgsys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 imgsys clocks.
 
 config COMMON_CLK_MT8183_IPU_CORE0
-	bool "Clock driver for MediaTek MT8183 ipu_core0"
+	tristate "Clock driver for MediaTek MT8183 ipu_core0"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_core0 clocks.
 
 config COMMON_CLK_MT8183_IPU_CORE1
-	bool "Clock driver for MediaTek MT8183 ipu_core1"
+	tristate "Clock driver for MediaTek MT8183 ipu_core1"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_core1 clocks.
 
 config COMMON_CLK_MT8183_IPU_ADL
-	bool "Clock driver for MediaTek MT8183 ipu_adl"
+	tristate "Clock driver for MediaTek MT8183 ipu_adl"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_adl clocks.
 
 config COMMON_CLK_MT8183_IPU_CONN
-	bool "Clock driver for MediaTek MT8183 ipu_conn"
+	tristate "Clock driver for MediaTek MT8183 ipu_conn"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 ipu_conn clocks.
 
 config COMMON_CLK_MT8183_MFGCFG
-	bool "Clock driver for MediaTek MT8183 mfgcfg"
+	tristate "Clock driver for MediaTek MT8183 mfgcfg"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 mfgcfg clocks.
 
 config COMMON_CLK_MT8183_MMSYS
-	bool "Clock driver for MediaTek MT8183 mmsys"
+	tristate "Clock driver for MediaTek MT8183 mmsys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 mmsys clocks.
 
 config COMMON_CLK_MT8183_VDECSYS
-	bool "Clock driver for MediaTek MT8183 vdecsys"
+	tristate "Clock driver for MediaTek MT8183 vdecsys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
 	  This driver supports MediaTek MT8183 vdecsys clocks.
 
 config COMMON_CLK_MT8183_VENCSYS
-	bool "Clock driver for MediaTek MT8183 vencsys"
+	tristate "Clock driver for MediaTek MT8183 vencsys"
 	depends on COMMON_CLK_MT8183
 	default COMMON_CLK_MT8183
 	help
-- 
2.39.1


