Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC59AC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21FW/ps6w72COqJhRKciuA90x4Eoc5olANM925Qr3S4=; b=kV8e+QTz8XjJHzY1SgUMBLEqew
	c8nOlxV/b3zliMwDCHzQ2ClEppEylTMarfpiBfzxP9mkypGijT1g9TgsqjbyiWz9qpB13ccinnZki
	HtuGme7+rLmGC2G93vw4tH+jWaofACaqT1yGylG4EqjkH/kbmZNePbUzLBjeAFqCOINpUoQ3WM9po
	NWGjc9nYkXB2eGn5Cg/xeoP5lrV1B09lDDzkFExLe5X4cYdnPQxiHKtDOEn06QbiJsudrI1mjapUM
	c/FXgpi3gsS6cuoGOF8dX15q/Fjhy7l+Kit4uPDROxvFKXqoQWQaHQWI6V+OHs7otGWahfFdtIxTP
	ZK1Mxx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prKxL-001ZbA-2T;
	Tue, 25 Apr 2023 15:51:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prKxI-001ZZL-1j
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 15:51:49 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prKxD-0008Ej-9G; Tue, 25 Apr 2023 17:51:43 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prKx7-0005jY-5n; Tue, 25 Apr 2023 17:51:37 +0200
Date: Tue, 25 Apr 2023 17:51:37 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v2 13/14] net: dsa: mt7530: introduce driver for
 MT7988 built-in switch
Message-ID: <20230425155137.GA19130@pengutronix.de>
References: <cover.1680483895.git.daniel@makrotopia.org>
 <a426afba905ed4eb9878fbdc42b9f98e98c54e5f.1680483896.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a426afba905ed4eb9878fbdc42b9f98e98c54e5f.1680483896.git.daniel@makrotopia.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_085148_579623_A5511B5A 
X-CRM114-Status: GOOD (  20.92  )
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

Hi Daniel,

On Mon, Apr 03, 2023 at 02:19:40AM +0100, Daniel Golle wrote:
> Add driver for the built-in Gigabit Ethernet switch which can be found
> in the MediaTek MT7988 SoC.
> 
> The switch shares most of its design with MT7530 and MT7531, but has
> it's registers mapped into the SoCs register space rather than being
> connected externally or internally via MDIO.
> 
> Introduce a new platform driver to support that.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/net/dsa/Kconfig       |  12 +++
>  drivers/net/dsa/Makefile      |   1 +
>  drivers/net/dsa/mt7530-mmio.c | 101 +++++++++++++++++++++++++
[...]
> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> new file mode 100644
> index 0000000000000..1a3d4b692f349
> --- /dev/null
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -0,0 +1,101 @@
[...]
> +	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR(priv->rstc)) {
> +		dev_err(&pdev->dev, "Couldn't get our reset line\n");
> +		return PTR_ERR(priv->rstc);

Not sure if this can actually happen, but there is no need to warn on
-EPROBE_DEFER. You could use return dev_err_probe(...) here.

regards
Philipp

