Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AF7C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Xb9vp/zDMtbZnyHS5vs1FS1ZUEni0RKX8ZdXR21Rzo=; b=0AZac03X3osT72tsYuuvlbPjzR
	hP5dZQICluaeXlDo6M8tnUxglR3Jlu6vR85Bbw7i0j+9tV/FtnBzEaeRcA8fl3p7qKrUMBep1hbU7
	/rQXqmG2qUbKKIOMFZkLAoTunxGZxO1zYfpgo09gOjOzZ+bmyIfatSoPcHB2QTA/y2576YKgHiNwx
	iwCH9yONuOWPjJ8K3+gh6zwuFQfU0GFQ0m2laeHYvF8Ijn04f8j4cFwg7psR1LaBDHE+lNxP7/mlb
	3kAzWOD0JIAaAs3E8evb7pHjCelLYwnxjmmcdFErqI9XNYdkqk0zf40zI/rkOR+N4ywsRc3R345XI
	t6uNvopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURhu-007yTE-An; Tue, 21 Feb 2023 12:25:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURGI-007jzP-PI; Tue, 21 Feb 2023 11:56:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5270866021CD;
	Tue, 21 Feb 2023 11:56:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980605;
	bh=vmZboqnY88zhAaEwDm8Q0/dnSl1U3JPvdAiFCCN2+8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GWYLhBp8gA/bQCkvnxxiK0M2DN4dkYlxYta9+2aMHHXYwNpy+qVzwQIFDmUICgl7S
	 Uvc0otvCAMJOa1c20UiRNJodM8cCnI04pR73O5Cu+jryegoOM8PlItUPJxswXql+Zi
	 So9A7hxu/qGih/iWK0tzDEjjK7+xD8EA4JbGuedalrHWuToD3Jd8YiWNeVVuS3vhef
	 AqBjT2DawoFkUXf3qtkf5WYi6cRoNa1Dwbz/3jQoGAkrGiC1rD08JeyQNlGCYFa/je
	 Wsnbs2fWUERgG2xbJSAzw8gXF9DW0IlosPBVMGR/yEX6Oet+G4dFWvLZG1KYbkVeD0
	 KnwxNR6GnUmCg==
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
Subject: [PATCH v4 38/54] clk: mediatek: mt2712: Change Kconfig options to allow module build
Date: Tue, 21 Feb 2023 12:55:33 +0100
Message-Id: <20230221115549.360132-39-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035647_053915_ECFB0DD4 
X-CRM114-Status: UNSURE (   9.58  )
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

All of the mt2712 drivers have been converted to platform drivers!
Change the Kconfig options for all MT2712 clocks to tristate to allow
building all clock drivers as modules.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b9c0a9e21cf1..45b7aea7648d 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
 	  This driver supports MediaTek MT2701 g3dsys clocks.
 
 config COMMON_CLK_MT2712
-	bool "Clock driver for MediaTek MT2712"
+	tristate "Clock driver for MediaTek MT2712"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
@@ -83,43 +83,43 @@ config COMMON_CLK_MT2712
 	  This driver supports MediaTek MT2712 basic clocks.
 
 config COMMON_CLK_MT2712_BDPSYS
-	bool "Clock driver for MediaTek MT2712 bdpsys"
+	tristate "Clock driver for MediaTek MT2712 bdpsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 bdpsys clocks.
 
 config COMMON_CLK_MT2712_IMGSYS
-	bool "Clock driver for MediaTek MT2712 imgsys"
+	tristate "Clock driver for MediaTek MT2712 imgsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 imgsys clocks.
 
 config COMMON_CLK_MT2712_JPGDECSYS
-	bool "Clock driver for MediaTek MT2712 jpgdecsys"
+	tristate "Clock driver for MediaTek MT2712 jpgdecsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 jpgdecsys clocks.
 
 config COMMON_CLK_MT2712_MFGCFG
-	bool "Clock driver for MediaTek MT2712 mfgcfg"
+	tristate "Clock driver for MediaTek MT2712 mfgcfg"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 mfgcfg clocks.
 
 config COMMON_CLK_MT2712_MMSYS
-	bool "Clock driver for MediaTek MT2712 mmsys"
+	tristate "Clock driver for MediaTek MT2712 mmsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 mmsys clocks.
 
 config COMMON_CLK_MT2712_VDECSYS
-	bool "Clock driver for MediaTek MT2712 vdecsys"
+	tristate "Clock driver for MediaTek MT2712 vdecsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 vdecsys clocks.
 
 config COMMON_CLK_MT2712_VENCSYS
-	bool "Clock driver for MediaTek MT2712 vencsys"
+	tristate "Clock driver for MediaTek MT2712 vencsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 vencsys clocks.
-- 
2.39.1


