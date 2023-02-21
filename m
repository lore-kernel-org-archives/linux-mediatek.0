Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27BCC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xif5LaIWYWbcJ+CtnCby/aQTuXhwUMIiWddhdZdyt0c=; b=ncEVjrpFDWLk5TOfoq5dcMBeQS
	PM+L6T7mHXNJY8UTxsnf436rbdxbq2sVR51q2BsRR3QxcAuyfGu865/YsvhHIqw/W1vJkwNQWLLKy
	1eEGTV/QG45vDtp+pY0KczzmPMIboajjkjES/3XLkwgK0p3AG8p9EECOqcTpHntyPbkfLY5j3ZVbJ
	tzA1NRlfZyLE6MFIwbNM/aIOpS52I9AIEbLfzYQplv0i2aQgqPrQW/K5a0r7mlKpdLaITllQ2oBLv
	czjwY4WrXjx053AyfsoWSQbSkpYRC8yAk8PrmQU6Z3LxwO3FbSZDI9MWyrCNyZz8sQd0WMW2OL878
	STUpFrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURbT-007v83-Fe; Tue, 21 Feb 2023 12:18:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURG8-007jsO-5z; Tue, 21 Feb 2023 11:56:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6C4D66021E3;
	Tue, 21 Feb 2023 11:56:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980595;
	bh=xhH2n5XmogkvcmxqMIc1jv/49UOL0BNOcn3TahthPEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WyAxRrYfivG5Ofwl9YHj2bkOqcFSuVICCa2nj8wHfmpg3F2fe7fxRQ0K09lZE5ot9
	 wBkkyYAjRCetcAwFCXb9GbYcQJKSgPN3SU3BwXMT64Oo+UDb9ZmQmgJv6faZ8drn79
	 UtDGn09GXzT4NYJ7v5Ar+a2NfBGQkPg6f+aVTsHCuJtWFUxRWYOnGpVl2Aw6GSo6dy
	 l+TmtHk+j/coHSMVoJlaWFx15Bg94Hmx3uVcZK26ynA9WF3r2ELOH2cOKhTRRJOXO0
	 AcPhkwE3dvLoD0xutf2HC/Hpa8jGsthI7pvYuRbe6rC1O2DnuIKjFEG8ZRBW/v4vT/
	 PWWxhTAP7DkbA==
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
Subject: [PATCH v4 30/54] clk: mediatek: mt8516: Allow building clock drivers as modules
Date: Tue, 21 Feb 2023 12:55:25 +0100
Message-Id: <20230221115549.360132-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035636_392919_0742D75C 
X-CRM114-Status: GOOD (  10.71  )
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

Now that all MT8516 drivers have been converted to platform driver,
change the configuration options to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2d14855dd37e..b9c0a9e21cf1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -743,7 +743,7 @@ config COMMON_CLK_MT8365_VENC
 	  This driver supports MediaTek MT8365 venc clocks.
 
 config COMMON_CLK_MT8516
-	bool "Clock driver for MediaTek MT8516"
+	tristate "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -751,7 +751,7 @@ config COMMON_CLK_MT8516
 	  This driver supports MediaTek MT8516 clocks.
 
 config COMMON_CLK_MT8516_AUDSYS
-	bool "Clock driver for MediaTek MT8516 audsys"
+	tristate "Clock driver for MediaTek MT8516 audsys"
 	depends on COMMON_CLK_MT8516
 	help
 	  This driver supports MediaTek MT8516 audsys clocks.
-- 
2.39.1


