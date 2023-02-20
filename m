Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE88C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYpWg6Galh0Rq8EO+QG39ASBOqaCtteNUXxPi/6eQlA=; b=pW+FpnF8iTrtVe1CW1mxlt9dIr
	nkZGcwiiG3e+wvH6TDeGy8BmydPfOXcUjflmLTlVyYfc5clM537yEArLUXtn4wkWllJSUNIV5Ihyj
	Hjods2DyJ4RggVTBy4zSlV6cdG/z3o5ryIMlBagPTo4JLGTA8vg0aK213dvjleeON+sInNaQPB9Ce
	0GAlC5dZpm0xCDGE7jmrKJq3DzuDNRe4iX9jlfr4y3braj+FMKwdHra/Cq3llM6AhAWMMFerG+W3n
	zl9DzMf7u7PA+5VCIKIdWvEZvvgPkf58HDI+QJSTBxrZaxeElpogWOrUXkU+wQBctx1HoB1XpSokh
	rCtXv80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8E6-004fD1-Pz; Mon, 20 Feb 2023 15:37:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7gK-004NnY-RH; Mon, 20 Feb 2023 15:02:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E44A6602173;
	Mon, 20 Feb 2023 15:02:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905339;
	bh=uU/7bQ25kUBitf+IxOTEtWvQReBBcOYpCxGIBYu7/dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBiSxGsT4w2/Cm27RnUimOwEWAiuCUvrpjO8Nhpm2vKhaIS5gu+O1Z5wwS35kGlrd
	 RGxXPMXP9Fkp3ejw33tHOXP5mGQrIzHmYD6Z9B6YCXSFjbfEpuO8aL/ejVu3TaUIyW
	 MjTX1Yp10pCpu1FW5HMARY7SCEjYhbWGirJxSnmzNaTBalFw1Zf9CI/Xef8MyxC+do
	 ON3eIb7ru5Qu8Wm30C1KgkMAVa/0adsh5qH4fpgqNwBE9exyUSVNSAIeplyXqMnnJX
	 asC0CokdsKry0To8Dz100TqCEKijI5zhKTZQStFeiYWba2YsoYl/wxr5n3+jp7Q0OD
	 wfeiDNcfzR3ig==
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
Subject: [PATCH v3 45/55] clk: mediatek: Allow building most MT6797 clock drivers as modules
Date: Mon, 20 Feb 2023 16:01:01 +0100
Message-Id: <20230220150111.77897-46-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070221_235893_88FF11B7 
X-CRM114-Status: UNSURE (   8.85  )
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

Most of the MT6797 clock drivers can be built as modules: change them
to tristate to allow that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index bf27dad1b490..a558e951d759 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -312,25 +312,25 @@ config COMMON_CLK_MT6797
 	  This driver supports MediaTek MT6797 basic clocks.
 
 config COMMON_CLK_MT6797_MMSYS
-	bool "Clock driver for MediaTek MT6797 mmsys"
+	tristate "Clock driver for MediaTek MT6797 mmsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 mmsys clocks.
 
 config COMMON_CLK_MT6797_IMGSYS
-	bool "Clock driver for MediaTek MT6797 imgsys"
+	tristate "Clock driver for MediaTek MT6797 imgsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 imgsys clocks.
 
 config COMMON_CLK_MT6797_VDECSYS
-	bool "Clock driver for MediaTek MT6797 vdecsys"
+	tristate "Clock driver for MediaTek MT6797 vdecsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 vdecsys clocks.
 
 config COMMON_CLK_MT6797_VENCSYS
-	bool "Clock driver for MediaTek MT6797 vencsys"
+	tristate "Clock driver for MediaTek MT6797 vencsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 vencsys clocks.
-- 
2.39.1


