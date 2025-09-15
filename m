Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A0BCAC597
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QL6gP3Qlq6nhXSIyL/KX4mU/56R/zzSEurn1SoO7Z+8=; b=v++4mrlG4nEfpXs2/3KhfCdc7E
	RZquQcCF00x02z1QW+PNFLSmZETkh2gABTZ63ryJlw6SZ0LXmVEA6hFACmlrh2yGV+m+mxa3bfXvk
	1cbhNzS4Fus3tlhCmQgrwt1ZVFuHMaWm8qUC4akqUkKc4YGRtHcCXQcXlJK6l1Fqp0BQ8qrkE5iEq
	fVMKODx4O/aie8KAV1bWkoEdTF8fEHJpLGH7figj4PZTZBz5dWErumpetGG1+TSt03yrSaj0rNwez
	HQDk4mPHZgt8K83UghKTEz/hUz/GbtpMiI/ku3+pssjkmV9VjF5ayruqGUtHbL27UXnp8oKbViR0+
	LLT6EORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8v9-00000004FYM-1EWD;
	Mon, 15 Sep 2025 13:07:03 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8v7-00000004FWq-131R;
	Mon, 15 Sep 2025 13:07:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uy8uq-000000005ys-1732;
	Mon, 15 Sep 2025 13:06:44 +0000
Date: Mon, 15 Sep 2025 14:06:37 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Changqi Hu <changqi.hu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] tty: serial: 8250_mtk: enable baud clock
Message-ID: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_060701_285844_AA14D705 
X-CRM114-Status: GOOD (  11.66  )
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

Some MediaTek SoCs got a gated UART baud clock, which currently gets
disabled as the clk subsystem believes it would be unused. This results in
the uart freezing right after "clk: Disabling unused clocks" on those
platforms.

To fix this request the baud clock to be prepared and enabled during probe.

Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")
Suggested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 drivers/tty/serial/8250/8250_mtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index b44de2ed7413..9329ed1f759d 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -475,13 +475,13 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
 	int dmacnt;
 #endif
 
-	data->uart_clk = devm_clk_get(&pdev->dev, "baud");
+	data->uart_clk = devm_clk_get_enabled(&pdev->dev, "baud");
 	if (IS_ERR(data->uart_clk)) {
 		/*
 		 * For compatibility with older device trees try unnamed
 		 * clk when no baud clk can be found.
 		 */
-		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
+		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
 		if (IS_ERR(data->uart_clk)) {
 			dev_warn(&pdev->dev, "Can't get uart clock\n");
 			return PTR_ERR(data->uart_clk);
-- 
2.51.0

