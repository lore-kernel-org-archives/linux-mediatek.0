Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C08C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi8Gem8KFTDXyQe5zwnArPoVelHEgUtCowW5N3S2JBQ=; b=0M2REjpiVis6RXefrOTmb3ZPHB
	H7HyE/5o/VlOLSYWIslC6PaaPitqGs0jG374oEcx5bx7NzvE7UDwbwVwhlModEXfSWotCVIUe2UVy
	N7bRWOlNao0gwvJJUu0OU6lGH86e+Hr3WqvuaCLTP/zMoM6MjTBUTCKIBmuo5zyltuRSOIRzZUkNc
	doircG4OwxyUH1XCdLZYvxK1HXe7UjgzdNvLibTLW1S3/LPaGNfEZxVuCtp6VCA5+UsD5MKt5J2ZS
	hevW6P3GTg+/J9t1o1ppRdFzsfbOxwI2h5P5gi1hBcc/LE6O35i2HnHoR4gswwZZyOEVZj401GqpN
	j68LDBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3kX-0093es-Bk; Mon, 06 Feb 2023 15:49:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3Rp-008u1o-7r; Mon, 06 Feb 2023 15:30:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA1376602F9C;
	Mon,  6 Feb 2023 15:30:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697424;
	bh=5LnBocYaUnWmYtiYaTuAVfdZl416kibnaXZXNlSPZEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HnBNHI0YNAEvSGm+KYKvbmKFGGvfOhqbJVy4LXFqhmvYOeoErU25vH0zPPrzC1v4l
	 gLbYVSXeYWi9IZUyK0fkbcfvW9eNQTGhqfr3Oozv70gVsIc5RElFKFqbdWnyVQQWuN
	 KDxhWOpyzggiEUhk4G2OmG5WJO1BCsPdp5D08caU72+Pz1F2QgrPyZyTJre1OATX0D
	 xuKFp7xdLX1qBuuCgyehTPZS7itVfDC7EIPwVLFGlyzTYqjih2bFcvfQo0Qr600Cm9
	 t0nnzDOdG2lzReFWAh5kZZckxVz3k7hiliJedf2cG63vOPGoPVPcx5/97j8RtE9Cku
	 yVoSaSZGlxsuQ==
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
Subject: [PATCH v1 27/45] clk: mediatek: mt8516: Allow building clock drivers as modules
Date: Mon,  6 Feb 2023 16:29:10 +0100
Message-Id: <20230206152928.918562-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073025_431118_017F8D65 
X-CRM114-Status: GOOD (  10.09  )
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
---
 drivers/clk/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index adc6a9f87e7e..45b7aea7648d 100644
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


