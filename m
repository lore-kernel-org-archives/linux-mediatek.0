Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E0C47DA7
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U95ZWgtvdbuuMo3m4xl/IdVyw6SYbPt7+R8Z7mFsD5k=; b=dWOvF7V3EDULN+V8IAwk2lPfm8
	pHx+VBuC9YkGacFy9P9acW0TZNVbzhhUnm3jAxsTWUwJBAiKz6/Yz8IAlW6hsmOZGSS+5Px6uSpwT
	s5mwuS20Ux5UyiSkVCLePvCHLMzTrduW848D+lig2+PpDjQq2xaFo/lvW5LvX6/Hlrp8K+FnYWOMP
	WxfudIJ2zU81dvLjMRFE4s8oOYVhmDixeCbfj2/qQQO6Qiodkykrnt2jBU7Y9goVpsIVIGZQyyOcf
	7DSFIQO08zduAgD8LS2HOx0XuXsea3Z32TT92ON1qw4xZwm8xIQKbenGmxT8O/Kq9czTLiPY5wyMp
	RTEKRFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5GJ-00G3lP-1r;
	Wed, 17 Jan 2024 12:43:22 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5GE-00G3ej-1g;
	Wed, 17 Jan 2024 12:43:16 +0000
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:aa1:d2f0:f6b3:db6:44c:eeef])
	(Authenticated sender: isaias57@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id B2AF778034D;
	Wed, 17 Jan 2024 13:42:57 +0100 (CET)
From: Jean Thomas <jean.thomas@wifirst.fr>
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jean Thomas <jean.thomas@wifirst.fr>
Subject: [PATCH 1/2] pinctrl: mediatek: mt7981: add additional uart group
Date: Wed, 17 Jan 2024 13:42:33 +0100
Message-Id: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_044314_724149_03FF089A 
X-CRM114-Status: UNSURE (   9.95  )
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

Add uart1_3 (pins 26, 27) group to the pinctrl driver for the
MediaTek MT7981 SoC.

Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 7e59a4407859..ca667ed25a4d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -737,6 +737,9 @@ static int mt7981_uart1_1_funcs[] = { 2, 2, 2, 2, };
 static int mt7981_uart1_2_pins[] = { 9, 10, };
 static int mt7981_uart1_2_funcs[] = { 2, 2, };
 
+static int mt7981_uart1_3_pins[] = { 26, 27, };
+static int mt7981_uart1_3_funcs[] = { 2, 2, };
+
 /* UART2 */
 static int mt7981_uart2_1_pins[] = { 22, 23, 24, 25, };
 static int mt7981_uart2_1_funcs[] = { 3, 3, 3, 3, };
@@ -871,6 +874,8 @@ static const struct group_desc mt7981_groups[] = {
 	PINCTRL_PIN_GROUP("uart1_1", mt7981_uart1_1),
 	/* @GPIO(9,10): UART1(2) */
 	PINCTRL_PIN_GROUP("uart1_2", mt7981_uart1_2),
+	/* @GPIO(26,27): UART1(2) */
+	PINCTRL_PIN_GROUP("uart1_3", mt7981_uart1_3),
 	/* @GPIO(22,25): UART1(3) */
 	PINCTRL_PIN_GROUP("uart2_1", mt7981_uart2_1),
 	/* @GPIO(22,24) PTA_EXT(4) */
@@ -933,7 +938,7 @@ static const struct group_desc mt7981_groups[] = {
 static const char *mt7981_wa_aice_groups[] = { "wa_aice1", "wa_aice2", "wm_aice1_1",
 	"wa_aice3", "wm_aice1_2", };
 static const char *mt7981_uart_groups[] = { "net_wo0_uart_txd_0", "net_wo0_uart_txd_1",
-	"net_wo0_uart_txd_2", "uart0", "uart1_0", "uart1_1", "uart1_2", "uart2_0",
+	"net_wo0_uart_txd_2", "uart0", "uart1_0", "uart1_1", "uart1_2", "uart1_3", "uart2_0",
 	"uart2_0_tx_rx", "uart2_1", "wm_uart_0", "wm_aurt_1", "wm_aurt_2", };
 static const char *mt7981_dfd_groups[] = { "dfd", "dfd_ntrst", };
 static const char *mt7981_wdt_groups[] = { "watchdog", "watchdog1", };
-- 
2.39.2


