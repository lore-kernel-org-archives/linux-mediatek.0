Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51E2C7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLFgiq9Y0HfE0m7HgnrCAsFhY4EbP/6RyKK3i8+8gQI=; b=w9eWiZmcNlIMovCnF9tWL/tGII
	CEfnP7l4qB67ltlDqbegt6rGgDVtBAzxbGFg7Oo9Ko92gyDqsBVh7JZA1GW/2/nawVHwKJ6ygx0ej
	wjr07q66uoWKT3vrYhSgMDdzOihS1blHEsNlSqx0VO9EGbQ6KwUKIWNuMROaWqsq8bqf6hR3HW+p9
	oftoS545Ry9SvBF9gS+Bw9UPJCnjh0GCfzqrsGxMHdtiDJh5O4DVeBIhwaV7T+B2c+qQNkIODadqL
	igVomNspQXEn90JjF/9MKXnMhPOuGP8SpzPbVrhaMkQBsonzl61BNjQYZhnC7j2VmKSsXvlwDh3Pi
	dpbTiT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBak-008Rbx-2Q;
	Mon, 20 Mar 2023 09:14:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBag-008RaM-1H;
	Mon, 20 Mar 2023 09:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 575F9B80D84;
	Mon, 20 Mar 2023 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157DAC433D2;
	Mon, 20 Mar 2023 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679303640;
	bh=gHTA93997ac/lT4FWEpkyp00sb8e4oMfl8zZDFoB+68=;
	h=From:To:Cc:Subject:Date:From;
	b=VZDDQSvIN70rqjaMoA2za6Lqic4jggpVTfq2CTOaGqBES5jzl/iukA657Bh27rpMu
	 Vhmt+gCKBeij1bhSeSpsXRS4vNxNr2bCOk2Wbv4BBTRVxxk5VkJyjAUNw1wB2bCWwB
	 VnpwI7MEohNBZgHas0hjz6L/F48MCeVRefyOSuIsq5zsHI3crpSzXBX6xTgTwkphmt
	 eRk/ajKdb/djKyl1JoP2YmOp71e4LSVcITs3xAPHzwPrJPNK4Rnw460ZElGAY1I82L
	 PDJDTqTtbs6hg6JjEjSQS+wA/TbuwBEy02fpk6QfXEQBNd4JZQy2fSky7iiyIddTQu
	 YdybK0M5e93Jw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt81xx: Ensure fhctl code is available
Date: Mon, 20 Mar 2023 10:13:42 +0100
Message-Id: <20230320091353.1918439-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_021406_603234_CA29C951 
X-CRM114-Status: GOOD (  11.55  )
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

From: Arnd Bergmann <arnd@arndb.de>

Just like in commit eddc63094855 ("clk: mediatek: Ensure fhctl code is
available for COMMON_CLK_MT6795"), these three need the shared driver
code, otherwise they run into link errors such as:

aarch64-linux/bin/aarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmixedsys.o: in function `clk_mt8192_apmixed_probe':
clk-mt8192-apmixedsys.c:(.text+0x134): undefined reference to `fhctl_parse_dt'

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Fixes: 4d586e10c428 ("clk: mediatek: mt8192: Add support for frequency hopping through FHCTL")
Fixes: da4a82dc67b0 ("clk: mediatek: mt8195: Add support for frequency hopping through FHCTL")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/mediatek/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index c707c6fe45a3..61e3266d2346 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -478,6 +478,7 @@ config COMMON_CLK_MT8173
 	tristate "Clock driver for MediaTek MT8173"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8173 basic clocks and clocks
@@ -686,6 +687,7 @@ config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
 	default ARM64
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
@@ -766,6 +768,7 @@ config COMMON_CLK_MT8195
         bool "Clock driver for MediaTek MT8195"
         depends on ARM64 || COMPILE_TEST
         select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
         default ARCH_MEDIATEK
         help
           This driver supports MediaTek MT8195 clocks.
-- 
2.39.2


