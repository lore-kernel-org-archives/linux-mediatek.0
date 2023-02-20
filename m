Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C9C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZaqjdIGAha8xBItQx6aK1Af+9CKYKqXGbboqIIwSk8=; b=4yO6r9/K7OuxvuVcn9AItbboYA
	VM+Bcs0vg+LrGoZUA+nhUy8EmqmWXgf1Ci5RfectCaOS8YFSxenF32UZdxIfOY0DvfQOqOkrF+d8q
	pRxan7eZTG68hjInBXNEfB8bVQvmccrOoV3u/DhqFRXBqCTJeufslAegh7e7HuvHosY9Xnom/1gDq
	OkXGZY2E1iQn37HkV5kxcR2Gt7J8DsX1XORqXZpWPDLfuQpX/454wYlBpZ0S5qPVMnIOosPCgUsq3
	eJgCpXKeHZG0PstJmNyoRseBw8IIwUet/hZQzpPTpvlPsvS1hmhqgN2zdna7hUBXezqnQRiCxEgDp
	Y+xXXmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8BN-004do0-FE; Mon, 20 Feb 2023 15:34:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7gD-004NiS-Lp; Mon, 20 Feb 2023 15:02:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 233BC66021C4;
	Mon, 20 Feb 2023 15:02:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905332;
	bh=23yRTeVWUXmnOiJrCv3GdiTdq7Ghlfk/tGRYNluEPEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQbLEipwdnCYWFpB/zc0yqk/jGqQqC4N8qPlq0fND8mPOvKMlX37XdG0AMlV3/hnl
	 DBBAbiAgRCxOVlfSzJrXvZMXHF0wJwzqYa/w+roJqUbfDQI8H9bMJiqvZY1kd16dZA
	 rKEwTwFA0bVHmV2qoYi4FwgmajqCGW/0KjjyR0d/JJcZp+uVFZZiM5/tohl/9ofgph
	 LEOu3o8kDogRa2EC1Zx87ZuScaXs2Y5oRAlXrWll8+GJ1Ro+yVCJJvIFEKY8j8Mt0+
	 N24b7lleoA7qC4soht0dttef8zjnCboe7heDWn1gvFUC4+90xn9rxcHYXhBUv5Rw30
	 CyIkYqZyDC0Lg==
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
Subject: [PATCH v3 40/55] clk: mediatek: Allow building MT8192 non-critical clocks as modules
Date: Mon, 20 Feb 2023 16:00:56 +0100
Message-Id: <20230220150111.77897-41-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070214_538740_C120A0A6 
X-CRM114-Status: UNSURE (   7.71  )
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

Allow building non boot critical clocks for MT8192 SoC as modules by
changing them to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 49919da2be26..ac90b304d422 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -613,73 +613,73 @@ config COMMON_CLK_MT8192
 	  This driver supports MediaTek MT8192 basic clocks.
 
 config COMMON_CLK_MT8192_AUDSYS
-	bool "Clock driver for MediaTek MT8192 audsys"
+	tristate "Clock driver for MediaTek MT8192 audsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 audsys clocks.
 
 config COMMON_CLK_MT8192_CAMSYS
-	bool "Clock driver for MediaTek MT8192 camsys"
+	tristate "Clock driver for MediaTek MT8192 camsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
 config COMMON_CLK_MT8192_IMGSYS
-	bool "Clock driver for MediaTek MT8192 imgsys"
+	tristate "Clock driver for MediaTek MT8192 imgsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
 
 config COMMON_CLK_MT8192_IMP_IIC_WRAP
-	bool "Clock driver for MediaTek MT8192 imp_iic_wrap"
+	tristate "Clock driver for MediaTek MT8192 imp_iic_wrap"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap clocks.
 
 config COMMON_CLK_MT8192_IPESYS
-	bool "Clock driver for MediaTek MT8192 ipesys"
+	tristate "Clock driver for MediaTek MT8192 ipesys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 ipesys clocks.
 
 config COMMON_CLK_MT8192_MDPSYS
-	bool "Clock driver for MediaTek MT8192 mdpsys"
+	tristate "Clock driver for MediaTek MT8192 mdpsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mdpsys clocks.
 
 config COMMON_CLK_MT8192_MFGCFG
-	bool "Clock driver for MediaTek MT8192 mfgcfg"
+	tristate "Clock driver for MediaTek MT8192 mfgcfg"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mfgcfg clocks.
 
 config COMMON_CLK_MT8192_MMSYS
-	bool "Clock driver for MediaTek MT8192 mmsys"
+	tristate "Clock driver for MediaTek MT8192 mmsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mmsys clocks.
 
 config COMMON_CLK_MT8192_MSDC
-	bool "Clock driver for MediaTek MT8192 msdc"
+	tristate "Clock driver for MediaTek MT8192 msdc"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 msdc and msdc_top clocks.
 
 config COMMON_CLK_MT8192_SCP_ADSP
-	bool "Clock driver for MediaTek MT8192 scp_adsp"
+	tristate "Clock driver for MediaTek MT8192 scp_adsp"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 scp_adsp clocks.
 
 config COMMON_CLK_MT8192_VDECSYS
-	bool "Clock driver for MediaTek MT8192 vdecsys"
+	tristate "Clock driver for MediaTek MT8192 vdecsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
 
 config COMMON_CLK_MT8192_VENCSYS
-	bool "Clock driver for MediaTek MT8192 vencsys"
+	tristate "Clock driver for MediaTek MT8192 vencsys"
 	depends on COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vencsys clocks.
-- 
2.39.1


