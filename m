Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51BBC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT1Bawu65dofWnLqYKShupetmi9+9xxGNcSOK8zsEhU=; b=G9pBEfbDcmaoeNl1bHfhH9tgSB
	ciBV5RRP/rLR1VaVBjGW3U03wDwt1NTxbgujXfmew9O4jA5ATLj2+jcujus+i2qztmBGeI1NsbRx3
	C+sfgP/579z73dcrJS3s7gbTzj0jaUjvwbD5cq4kmT4a1Ht0FaSVCzCjJkog5V9koM3ch6Dr61qFz
	mS4KmfEWCs1WlwLjddRn0zEa+9v2XRMf6lf+RPKJ3PFdIUHSd9sJknjGrIx3Yk2XyGBiuDKmIFamz
	7TA6FsrFTbv0Q+fueGGLsWcxFUFKNyl95yR+td+6ZbFQB1/57JTp3unICOnGmKcILX+EPOYm422c9
	i5uL1F0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ7E-0000000AYrv-2CvB;
	Mon, 13 Jul 2026 23:31:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ7C-0000000AYqn-0LcB;
	Mon, 13 Jul 2026 23:31:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wjQ6z-000000000zU-2AOm;
	Mon, 13 Jul 2026 23:30:57 +0000
Date: Tue, 14 Jul 2026 00:30:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Message-ID: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_163110_123262_EBB16382 
X-CRM114-Status: GOOD (  12.85  )
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

Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
'input', 'output-low' or 'output-high' properties. The error is
propagated by gpiochip_hog_lines() and fails registration of the
whole GPIO chip.

The previous OF-specific implementation tolerated such nodes:
of_parse_own_gpio() warned "no hogging state specified, bailing out"
and of_gpiochip_add_hog() stopped processing the node without failing
chip registration.

Some boards deliberately ship hog nodes without a hogging state in
their base devicetree and supply the state via overlay, e.g. the PCIe
slot key selection hogs on the BananaPi R4 Pro added in
commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
pcie gpio-hog handling"), as the polarity set in the base devicetree
could not be overridden from an overlay.

Booting such a board without an overlay applied now fails to register
the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
device fails to probe, all peripherals including the console UART
defer forever, and the board finally hangs when clk_disable_unused()
gates the clocks of the UART still in use by earlycon:

  gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
  mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
  ...
  clk: Disabling unused clocks
  (hangs)

Restore the previous behaviour by warning about hog nodes lacking a
hogging state and skipping them instead of failing the registration
of the whole GPIO chip.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..c433a095907f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -999,14 +999,17 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	if (ret < 0)
 		return ret;
 
-	if (fwnode_property_present(fwnode, "input"))
+	if (fwnode_property_present(fwnode, "input")) {
 		dflags |= GPIOD_IN;
-	else if (fwnode_property_present(fwnode, "output-low"))
+	} else if (fwnode_property_present(fwnode, "output-low")) {
 		dflags |= GPIOD_OUT_LOW;
-	else if (fwnode_property_present(fwnode, "output-high"))
+	} else if (fwnode_property_present(fwnode, "output-high")) {
 		dflags |= GPIOD_OUT_HIGH;
-	else
-		return -EINVAL;
+	} else {
+		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
+			      fwnode);
+		return 0;
+	}
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
-- 
2.55.0

