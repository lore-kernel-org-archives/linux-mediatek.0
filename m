Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A5C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HZAEN1pSHljTcOR7awHYxx2pWXqQS8c8J0wPgHQUXc=; b=FcDnl7BZUlvc8I2OF1+obIcyrb
	zo0M9An+zJ3qnhJjEbOOOQmPdDmgCvlzKapmH6rOIBxyaZMc8Z3CIjgJBQfF9ozVA8XPkvQimv74A
	P3RPGbeEnsikloU+CRBCMI03qD/CSPewsAIs9qOa2yWXNZ67xbqt+R5knUjuMcHwPPxaHPf/zithf
	4Xba2M1hvQQ97qQvf6WT2sG5leSi2DN7TfciAgpPuSej54SYL5CThS4B9spGkPi6t2q+hC5/yCPhy
	ifFd+yI/LNyiNnM4SlFTUcSiE7Kn1K/vFcCz/vScdX8QHxrXKcmhK0JOin5sO1aIw+XvF9Qi+XJcI
	721vkviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLIS-001dYN-2g;
	Tue, 25 Apr 2023 16:13:40 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prLIP-001dX3-2K;
	Tue, 25 Apr 2023 16:13:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1prLIE-0004tQ-2k;
	Tue, 25 Apr 2023 18:13:26 +0200
Date: Tue, 25 Apr 2023 17:11:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Message-ID: <ZEf7uMIydCzxS437@makrotopia.org>
References: <cover.1680483895.git.daniel@makrotopia.org>
 <a426afba905ed4eb9878fbdc42b9f98e98c54e5f.1680483896.git.daniel@makrotopia.org>
 <20230425155137.GA19130@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425155137.GA19130@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_091337_755745_487662D7 
X-CRM114-Status: GOOD (  24.74  )
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

On Tue, Apr 25, 2023 at 05:51:37PM +0200, Philipp Zabel wrote:
> Hi Daniel,
> 
> On Mon, Apr 03, 2023 at 02:19:40AM +0100, Daniel Golle wrote:
> > Add driver for the built-in Gigabit Ethernet switch which can be found
> > in the MediaTek MT7988 SoC.
> > 
> > The switch shares most of its design with MT7530 and MT7531, but has
> > it's registers mapped into the SoCs register space rather than being
> > connected externally or internally via MDIO.
> > 
> > Introduce a new platform driver to support that.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  MAINTAINERS                   |   2 +
> >  drivers/net/dsa/Kconfig       |  12 +++
> >  drivers/net/dsa/Makefile      |   1 +
> >  drivers/net/dsa/mt7530-mmio.c | 101 +++++++++++++++++++++++++
> [...]
> > diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> > new file mode 100644
> > index 0000000000000..1a3d4b692f349
> > --- /dev/null
> > +++ b/drivers/net/dsa/mt7530-mmio.c
> > @@ -0,0 +1,101 @@
> [...]
> > +	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);
> 
> Please use devm_reset_control_get_exclusive() directly.
> 
> > +	if (IS_ERR(priv->rstc)) {
> > +		dev_err(&pdev->dev, "Couldn't get our reset line\n");
> > +		return PTR_ERR(priv->rstc);
> 
> Not sure if this can actually happen, but there is no need to warn on
> -EPROBE_DEFER. You could use return dev_err_probe(...) here.

Thank you for your comments. The series has already been picked to
net-next. Unless you want to send the suggested changes yourself, I will
prepare another series with your suggestions, and also apply them to
mt7530-mdio.c.


