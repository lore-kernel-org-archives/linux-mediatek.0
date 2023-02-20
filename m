Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F73C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L11laNfYSUI6T2hOoferXiRMEhhYwWcUsgYMZC6NPXg=; b=DgfH2WjrFN9P/jQIJWg3zp7acC
	UdeyhNSnblL2MlmjJw+tYB/LIJiajFd6uK+SG3/pq3+aNACherJAZp1AXhixDQ3PCaz4Gd3cCIfPp
	BVFRg6eBLj2sPxSX0QAM/Jd2ng23m0b+0Mu8bdC1gYAq3fD35GyGs9nQIiTb6zNg8trDajggchxf9
	S+Gkekl7tZkhgAvZ2hWlpxCLD2BMVlfIoAiO2vnX57q/pJmfMaC6dgRIbvfQbWM0y6USJoH0D+wm/
	Hyfdb3iQ995QTN4BQ19w0UygJT1913uqJbku9gxHOuEPrVxXP7OFnKLm30FxCzfcVJe5FkV9OEFe7
	GKxn4W8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8Fz-004g9g-O7; Mon, 20 Feb 2023 15:39:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7gO-004Nqu-Pd; Mon, 20 Feb 2023 15:02:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FD3366021CB;
	Mon, 20 Feb 2023 15:02:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905343;
	bh=n2hgQCHC+yZ31qlw6R7gz49FBg/5g7apceJcI0oFfeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lscCxmE2S9xd4sCl+fB5xOhzRFNXZkJTRy5qaT6pa6r9Ho1BgHsDiDH5096XNQw+k
	 V3KNXiZcdpaRSN79Zpkq+pNls2Am9jM9tXJxA8Z9551n85SdpK4sm79oNAKkkIDBQm
	 GmhCfInEX8g7v9mCAZGksV0VVmADMOFMbdctkcbhGIgrKJlYTIdPrv3NMWYCigP3AO
	 BpnFsvJJkJB+55qtDefpkxXbWCaoCdVsi8cIpd+2UnrusKaC66KDvl6+RZQRgoYFYJ
	 B8f9EDS1+6yQWr+juCvzVzadEI5c710ijQr3NYQrFyTeVDYgXxSPjRTEDsDRqUUfG3
	 itpOqhSFu0OWw==
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
Subject: [PATCH v3 48/55] clk: mediatek: Kconfig: Allow module build for core mt8192 clocks
Date: Mon, 20 Feb 2023 16:01:04 +0100
Message-Id: <20230220150111.77897-49-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070225_149181_F606AFBB 
X-CRM114-Status: GOOD (  11.44  )
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

Bootloaders must in a way setup the SoC to boot Linux: this means
that it will be possible to decompress a ramdisk and eventually
insert the core clock driver module from there.
Allow module build for all MT8192 clocks by switching to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 6f970d54a2cd..90691261cddb 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -682,7 +682,7 @@ config COMMON_CLK_MT8186_VENCSYS
 	  This driver supports MediaTek MT8186 vencsys clocks.
 
 config COMMON_CLK_MT8192
-	bool "Clock driver for MediaTek MT8192"
+	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARM64
-- 
2.39.1


