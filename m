Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1BDC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzY2tGdI9Ze9z5i2yml98b++235/QIz3fMNn10urMJA=; b=kd+/JRaispy5SfgctFp1Do6fc8
	cLPnJytzEQf5S57E4mDRKYuvPspXFsB4LnSRPxwe7+YTqYDob8nF0V0/tqb17Zo3Ru6VLCqoRoxNM
	rEZUGD/WSdUdom2kFE/ZfzfGghJw6oTIbF+SNgl3Oyoz44Bka9vlv1SvBThTtE03ot7wFBkO3+dhA
	/14cZx3phK6nIVuKnjqO+ZXgp6ZuOAMnLeE1XkSloWPCixHHgavu89igBnGH2WPBQ5HON2/CzEUeK
	ivnoAcUEKG5LerkZ0JXNk8sLecg2jNJTnKyAyVHOEwagNA58KlDYl4iYdRdOgB/u20OUKwYRr77Pb
	3krPKqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC2t-00DMo8-D2; Mon, 06 Mar 2023 14:42:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBUX-00D45v-NA; Mon, 06 Mar 2023 14:07:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E410D6602FF0;
	Mon,  6 Mar 2023 14:07:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111624;
	bh=ziGH2zOiWjI+IoI+jWYiAA1anJ7BSP8mPNTuPdiSX6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aojRSbbkh7jvOgyMfoLo3ObnWAvZvh/WNRaT4wGm+r52gyCMy9Ts3GMDdAWuXhz16
	 gTKe5bVkJDmQPmKc7SaPtF/NoGQ86peBKMDIcP+48E5PmURQPMB3jZmFZ19GnjJF7R
	 /bpRrhaUsxAT96u+oalMbfN/go09DXUBmZEwB6RIdcQR+xb9fk/MjaJnqYVl78vbTp
	 2tQBS33+dX43B1wWGM0D3JPIxhkNv8Kansz5hXgLQTBBrM6mFWSGxoyUbkfQXPCk/v
	 9OU9sm9pst/Q5WzM6Cw4r02aq011sc9KVqwYuQ5DtRnLMBMBAlDG67E1f4idmgO3Lo
	 YiVrN8ki0hBIA==
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
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 48/54] clk: mediatek: Kconfig: Allow module build for core mt8192 clocks
Date: Mon,  6 Mar 2023 15:05:37 +0100
Message-Id: <20230306140543.1813621-49-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060715_712985_41BA4E55 
X-CRM114-Status: GOOD (  10.76  )
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
Tested-by: Miles Chen <miles.chen@mediatek.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 04b4be419bd0..02093996ccc3 100644
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
2.39.2


