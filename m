Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1458EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DxNxzdYg2Gd1UoiiK/RSd/MZ7RJMS/NxPqm3JHVevEI=; b=ZB7Zz0leueh9T7
	DTW3m3KzY7Yyz+64UPmqfJSHSaOXoObQIAly4F+d6IZTHRJl7C/1p9jrypPBlRBLl0oxM9LxRSFNY
	P9/+loJpRD4stXUHZ3kKT+eovJPPk3j27anV4FAKyvVZOmhWC9kWlVJ5dh1du0WDOIEvZffQuYtu3
	Iu1a8yBGpGrnFGuwaVT52zWp6c9hJvEBhaDsi923l8oBlOhsazYO81vVAGJwO3Zry29t72YSPljcv
	MJ00+8As20EFOxq+rRpT2qkJz0ug4AXzwt16lIzf9iuBvAB28t+1DXsUO6gUBwh7nRPFBvGTOorFa
	BnyFHQE35pF/QsUYMCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCzy-00Dm0S-AL; Sat, 08 Oct 2022 16:48:26 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCzn-00DlvV-2k; Sat, 08 Oct 2022 16:48:16 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 03C8940111;
	Sat,  8 Oct 2022 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665247690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxNxzdYg2Gd1UoiiK/RSd/MZ7RJMS/NxPqm3JHVevEI=;
	b=v05q0/shnTZpdt0ltREShkAQJu6etlGixgI+/hhmxQIWaT/YqZ1mSi9NJEIMdFzf6gXmGa
	PTHY4Q1bBLvau9HM1pvOswnfX0ZljX4ShI35/jIgzr/6sY/zKi1qTywF+xQgOGfxhXr/U+
	oAQZbmiepXphvtQ3pEiZNfaCgTwKdbo=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3B9F310042C;
	Sat,  8 Oct 2022 16:48:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and rts/cts separately
Date: Sat,  8 Oct 2022 18:48:06 +0200
Message-Id: <20221008164807.113590-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9c542c94-e206-4f0b-99de-2c03d23c5142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_094815_294999_181381AE 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Some mt7986 boards use uart rts/cts pins as gpio,
This patch allows to change rts/cts to gpio mode, but keep
rx/tx as UART function.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index f26869f1a367..95f32e62e02f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -675,11 +675,17 @@ static int mt7986_uart1_1_funcs[] = { 4, 4, 4, 4, };
 static int mt7986_spi1_2_pins[] = { 29, 30, 31, 32, };
 static int mt7986_spi1_2_funcs[] = { 1, 1, 1, 1, };
 
-static int mt7986_uart1_2_pins[] = { 29, 30, 31, 32, };
-static int mt7986_uart1_2_funcs[] = { 3, 3, 3, 3, };
+static int mt7986_uart1_2_rx_tx_pins[] = { 29, 30, };
+static int mt7986_uart1_2_rx_tx_funcs[] = { 3, 3, };
 
-static int mt7986_uart2_0_pins[] = { 29, 30, 31, 32, };
-static int mt7986_uart2_0_funcs[] = { 4, 4, 4, 4, };
+static int mt7986_uart1_2_cts_rts_pins[] = { 31, 32, };
+static int mt7986_uart1_2_cts_rts_funcs[] = { 3, 3, };
+
+static int mt7986_uart2_0_rx_tx_pins[] = { 29, 30, };
+static int mt7986_uart2_0_rx_tx_funcs[] = { 4, 4, };
+
+static int mt7986_uart2_0_cts_rts_pins[] = { 31, 32, };
+static int mt7986_uart2_0_cts_rts_funcs[] = { 4, 4, };
 
 static int mt7986_spi0_pins[] = { 33, 34, 35, 36, };
 static int mt7986_spi0_funcs[] = { 1, 1, 1, 1, };
@@ -708,6 +714,12 @@ static int mt7986_pcie_reset_funcs[] = { 1, };
 static int mt7986_uart1_pins[] = { 42, 43, 44, 45, };
 static int mt7986_uart1_funcs[] = { 1, 1, 1, 1, };
 
+static int mt7986_uart1_rx_tx_pins[] = { 42, 43, };
+static int mt7986_uart1_rx_tx_funcs[] = { 1, 1, };
+
+static int mt7986_uart1_cts_rts_pins[] = { 44, 45, };
+static int mt7986_uart1_cts_rts_funcs[] = { 1, 1, };
+
 static int mt7986_uart2_pins[] = { 46, 47, 48, 49, };
 static int mt7986_uart2_funcs[] = { 1, 1, 1, 1, };
 
@@ -749,6 +761,8 @@ static const struct group_desc mt7986_groups[] = {
 	PINCTRL_PIN_GROUP("wifi_led", mt7986_wifi_led),
 	PINCTRL_PIN_GROUP("i2c", mt7986_i2c),
 	PINCTRL_PIN_GROUP("uart1_0", mt7986_uart1_0),
+	PINCTRL_PIN_GROUP("uart1_rx_tx", mt7986_uart1_rx_tx),
+	PINCTRL_PIN_GROUP("uart1_cts_rts", mt7986_uart1_cts_rts),
 	PINCTRL_PIN_GROUP("pcie_clk", mt7986_pcie_clk),
 	PINCTRL_PIN_GROUP("pcie_wake", mt7986_pcie_wake),
 	PINCTRL_PIN_GROUP("spi1_0", mt7986_spi1_0),
@@ -760,8 +774,10 @@ static const struct group_desc mt7986_groups[] = {
 	PINCTRL_PIN_GROUP("spi1_1", mt7986_spi1_1),
 	PINCTRL_PIN_GROUP("uart1_1", mt7986_uart1_1),
 	PINCTRL_PIN_GROUP("spi1_2", mt7986_spi1_2),
-	PINCTRL_PIN_GROUP("uart1_2", mt7986_uart1_2),
-	PINCTRL_PIN_GROUP("uart2_0", mt7986_uart2_0),
+	PINCTRL_PIN_GROUP("uart1_2_rx_tx", mt7986_uart1_2_rx_tx),
+	PINCTRL_PIN_GROUP("uart1_2_cts_rts", mt7986_uart1_2_cts_rts),
+	PINCTRL_PIN_GROUP("uart2_0_rx_tx", mt7986_uart2_0_rx_tx),
+	PINCTRL_PIN_GROUP("uart2_0_cts_rts", mt7986_uart2_0_cts_rts),
 	PINCTRL_PIN_GROUP("spi0", mt7986_spi0),
 	PINCTRL_PIN_GROUP("spi0_wp_hold", mt7986_spi0_wp_hold),
 	PINCTRL_PIN_GROUP("uart2_1", mt7986_uart2_1),
@@ -800,7 +816,9 @@ static const char *mt7986_pwm_groups[] = { "pwm0", "pwm1_0", "pwm1_1", };
 static const char *mt7986_spi_groups[] = {
 	"spi0", "spi0_wp_hold", "spi1_0", "spi1_1", "spi1_2", "spi1_3", };
 static const char *mt7986_uart_groups[] = {
-	"uart1_0", "uart1_1", "uart1_2", "uart1_3_rx_tx", "uart1_3_cts_rts",
+	"uart1_0", "uart1_1", "uart1_rx_tx", "uart1_cts_rts",
+	"uart1_2_rx_tx", "uart1_2_cts_rts",
+	"uart1_3_rx_tx", "uart1_3_cts_rts", "uart2_0_rx_tx", "uart2_0_cts_rts",
 	"uart2_0", "uart2_1", "uart0", "uart1", "uart2",
 };
 static const char *mt7986_wdt_groups[] = { "watchdog", };
-- 
2.34.1


