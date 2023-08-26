Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A5CC83F15
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSQl0qidGsKfBylr7BZSO7Stx54RSZyMoElMCxG7bng=; b=FwnmOF05aymiHMUHWVrwTUUfkS
	hTw+1ONphEhj6de9Pp2/SmV6iT1lgeTdhOgnRRmMC0i395LvUYspnGrHoXQJTMUHvHN0u0/48Ka8h
	OuMy6w72P8Jgf1fUQi1X+0lORuXsQwJWkue2xLfJMaRVUE4jsAla9f8orQagnPpvZd170pJedkqIK
	PjOFWAxz1Jhg3Oxqi4YsHQXEStZDFluPnxVdPJyn2ajZS6kzzPnuipsekQViKYSR6LkoleHyNmcg9
	nYS8/90ju89HAfO17VkUjrFOW9q2DQE9cLWPd3sy9HPn1BgDxR/9kCvdmblnwrGBbhBm9J4rd1Esn
	LHksH7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa09Y-007Dn9-2e;
	Sat, 26 Aug 2023 20:45:04 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa09V-007DmS-25;
	Sat, 26 Aug 2023 20:45:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qa09K-0004GO-0C;
	Sat, 26 Aug 2023 20:44:50 +0000
Date: Sat, 26 Aug 2023 21:44:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt7981: add additional uart groups
Message-ID: <11db447f257231e08065989100311df57b7f1f1c.1693082594.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_134501_688171_AD666EF6 
X-CRM114-Status: UNSURE (   9.77  )
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

Add uart2_0_tx_rx (pin 4, 5) and uart1_2 (pins 9, 10) groups to the
pinctrl driver for the MediaTek MT7981 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 0fd2c0c451f95..7e59a44078590 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -611,6 +611,9 @@ static int mt7981_wo0_jtag_1_funcs[] = { 5, 5, 5, 5, 5, };
 static int mt7981_uart2_0_pins[] = { 4, 5, 6, 7, };
 static int mt7981_uart2_0_funcs[] = { 3, 3, 3, 3, };
 
+static int mt7981_uart2_0_tx_rx_pins[] = { 4, 5, };
+static int mt7981_uart2_0_tx_rx_funcs[] = { 3, 3, };
+
 /* GBE_LED0 */
 static int mt7981_gbe_led0_pins[] = { 8, };
 static int mt7981_gbe_led0_funcs[] = { 3, };
@@ -731,6 +734,9 @@ static int mt7981_uart1_0_funcs[] = { 4, 4, 4, 4, };
 static int mt7981_uart1_1_pins[] = { 26, 27, 28, 29, };
 static int mt7981_uart1_1_funcs[] = { 2, 2, 2, 2, };
 
+static int mt7981_uart1_2_pins[] = { 9, 10, };
+static int mt7981_uart1_2_funcs[] = { 2, 2, };
+
 /* UART2 */
 static int mt7981_uart2_1_pins[] = { 22, 23, 24, 25, };
 static int mt7981_uart2_1_funcs[] = { 3, 3, 3, 3, };
@@ -805,6 +811,8 @@ static const struct group_desc mt7981_groups[] = {
 	PINCTRL_PIN_GROUP("wo0_jtag_0", mt7981_wo0_jtag_0),
 	/* @GPIO(4,7) WM_JTAG(3) */
 	PINCTRL_PIN_GROUP("uart2_0", mt7981_uart2_0),
+	/* @GPIO(4,5) WM_JTAG(4) */
+	PINCTRL_PIN_GROUP("uart2_0_tx_rx", mt7981_uart2_0_tx_rx),
 	/* @GPIO(8) GBE_LED0(3) */
 	PINCTRL_PIN_GROUP("gbe_led0", mt7981_gbe_led0),
 	/* @GPIO(4,6) PTA_EXT(4) */
@@ -861,6 +869,8 @@ static const struct group_desc mt7981_groups[] = {
 	PINCTRL_PIN_GROUP("uart1_0", mt7981_uart1_0),
 	/* @GPIO(26,29): UART1(2) */
 	PINCTRL_PIN_GROUP("uart1_1", mt7981_uart1_1),
+	/* @GPIO(9,10): UART1(2) */
+	PINCTRL_PIN_GROUP("uart1_2", mt7981_uart1_2),
 	/* @GPIO(22,25): UART1(3) */
 	PINCTRL_PIN_GROUP("uart2_1", mt7981_uart2_1),
 	/* @GPIO(22,24) PTA_EXT(4) */
@@ -922,9 +932,9 @@ static const struct group_desc mt7981_groups[] = {
  */
 static const char *mt7981_wa_aice_groups[] = { "wa_aice1", "wa_aice2", "wm_aice1_1",
 	"wa_aice3", "wm_aice1_2", };
-static const char *mt7981_uart_groups[] = { "wm_uart_0", "uart2_0",
-	"net_wo0_uart_txd_0", "net_wo0_uart_txd_1", "net_wo0_uart_txd_2",
-	"uart1_0", "uart1_1", "uart2_1", "wm_aurt_1", "wm_aurt_2", "uart0", };
+static const char *mt7981_uart_groups[] = { "net_wo0_uart_txd_0", "net_wo0_uart_txd_1",
+	"net_wo0_uart_txd_2", "uart0", "uart1_0", "uart1_1", "uart1_2", "uart2_0",
+	"uart2_0_tx_rx", "uart2_1", "wm_uart_0", "wm_aurt_1", "wm_aurt_2", };
 static const char *mt7981_dfd_groups[] = { "dfd", "dfd_ntrst", };
 static const char *mt7981_wdt_groups[] = { "watchdog", "watchdog1", };
 static const char *mt7981_pcie_groups[] = { "pcie_pereset", "pcie_clk", "pcie_wake", };
-- 
2.41.0

