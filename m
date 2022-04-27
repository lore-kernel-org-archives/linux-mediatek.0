Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC1EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUphVqDl8b4omTZmaFV+63/yODN2NH1LUvyTIqH3aZo=; b=FaHqlOhwZUveca
	oCCRcKdwB1gF73l4s6dY6Ac+YfEu2YMEQbTVrn5StnrgSc1Sg4bgf6/6nKStavyYPcZc7rHGyOqz8
	dr9boNiB5sedVzKHJYHUmlz4EuuY9rHoZjKhYh/WG4W/uTEaEZjGkRVlOGWKzcGhNAyQ8CJteDGIU
	/Xx8tjeNcfFgUFYcfhi4pDOmFDN7eUlABVsioL+JRFJjUNELL8BA6EPxpPC0kby0I0fXiTvZ0WYAI
	SDnAsxOZPBMxSulkvCdMHcyVmOjc/ZHoCREOhqDHgpqHPEX1UUCNxbXpVaOlQm5Im3K/hdIiS+W5z
	pUWTkxTWnP4BWJh2QGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhej-001Wn6-Do; Wed, 27 Apr 2022 13:24:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhe6-001WWM-JG; Wed, 27 Apr 2022 13:23:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 78D631F4471A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651065817;
 bh=uRQdcys3z/Emz/ixII4iTX7rXIoznp7TRtvB9lmKeyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OX1E2DEzL3Lk67s5YbsSBKxcjsDM6MPwMEIjWY+Y/QyJwGNJUhMsq8KYUdn+8Hyum
 8aqBTffHO92lnKsSuhozqFrbGe/Zo/AJ5ylih7M1w6aAF/mdXKgvvDg3C2tDfu40sX
 w30c3pLWA6/dJbFzFOOKr3SPZa2Rqcmm6JqsPNmCLGPzkTU8UwQ+6Bu68Xh9Ubb1jO
 U+bFJmjQGNVZJHzaPCF9UGqWmdymZ2qajKhVWkycQW7dw4HucAK+vobR5w9s6Hg4dx
 SL4HGydx5PjViEHTTBGGJRP1cXsieo2nj2h9KudkzDwqd3Hkpz51rUgtwmbwZ3dftQ
 UwAvLcz5L+DVQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] serial: 8250_mtk: Fix register address for XON/XOFF
 character
Date: Wed, 27 Apr 2022 15:23:28 +0200
Message-Id: <20220427132328.228297-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
References: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_062354_801617_38653640 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The XON1/XOFF1 character registers are at offset 0xa0 and 0xa8
respectively, so we cannot use the definition in serial_port.h.

Fixes: bdbd0a7f8f03 ("serial: 8250-mtk: modify baudrate setting")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 28e36459642c..21053db93ff1 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -57,6 +57,9 @@
 #define MTK_UART_FEATURE_SEL	39	/* Feature Selection register */
 #define MTK_UART_FEAT_NEWRMAP	BIT(0)	/* Use new register map */
 
+#define MTK_UART_XON1		40	/* I/O: Xon character 1 */
+#define MTK_UART_XOFF1		42	/* I/O: Xoff character 1 */
+
 #ifdef CONFIG_SERIAL_8250_DMA
 enum dma_rx_status {
 	DMA_RX_START = 0,
@@ -278,8 +281,8 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 			(serial_in(up, MTK_UART_EFR) &
 			(~(MTK_UART_EFR_HW_FC | MTK_UART_EFR_SW_FC_MASK))));
 
-		serial_out(up, UART_XON1, START_CHAR(port->state->port.tty));
-		serial_out(up, UART_XOFF1, STOP_CHAR(port->state->port.tty));
+		serial_out(up, MTK_UART_XON1, START_CHAR(port->state->port.tty));
+		serial_out(up, MTK_UART_XOFF1, STOP_CHAR(port->state->port.tty));
 		serial_out(up, UART_LCR, lcr);
 		mtk8250_disable_intrs(up, MTK_UART_IER_CTSI|MTK_UART_IER_RTSI);
 		mtk8250_enable_intrs(up, MTK_UART_IER_XOFFI);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
