Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77530C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzO8/91tGaQC1AMwjfSYdhYHMsaQ5D7tkJV/EXbL1MQ=; b=sPFPQYlT3W4ef2Of8LC4bCjtM6
	gNTS6MUNME43jnq/quOBfA5hJ22b+ryy28BJP6bXo/3pw7f5eF9krvK1rDCMGCwU82hEmFRV0Gorj
	tk2S/cZ/jdV6JjmxrG64GBOTRs4/AWiJfdk3yU8x+bgIVrBWT0WorBOyyVPOwFqSIXnQoNFVdZ2uo
	mzYR3xra4MUjvjjNuDm8SVtB4kvM6iaVWmIMeifb2omtw6oEj28dxJF0QjvNyVq8Jt0K7ULF3+C98
	3r7PumtWOlKPwKdT5IzV7y1B4CvT23c6JaNRv3wI5QN1XToewOo7yA0F1CKsW2iqlU0mgzTU7Qf3G
	CxyKQTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZpq-0035dy-1D;
	Wed, 26 Apr 2023 07:45:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZpn-0035cN-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 07:45:04 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prZpl-0001uX-Ky; Wed, 26 Apr 2023 09:45:01 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prZpd-0001gO-Ow; Wed, 26 Apr 2023 09:44:53 +0200
Date: Wed, 26 Apr 2023 09:44:53 +0200
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
Message-ID: <20230426074453.GD4724@pengutronix.de>
References: <cover.1680483895.git.daniel@makrotopia.org>
 <a426afba905ed4eb9878fbdc42b9f98e98c54e5f.1680483896.git.daniel@makrotopia.org>
 <20230425155137.GA19130@pengutronix.de>
 <ZEf7uMIydCzxS437@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEf7uMIydCzxS437@makrotopia.org>
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
X-CRM114-CacheID: sfid-20230426_004503_760104_1EEF4D66 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Apr 25, 2023 at 05:11:36PM +0100, Daniel Golle wrote:
> On Tue, Apr 25, 2023 at 05:51:37PM +0200, Philipp Zabel wrote:
[...]
> > Please use devm_reset_control_get_exclusive() directly.
> > 
> > > +	if (IS_ERR(priv->rstc)) {
> > > +		dev_err(&pdev->dev, "Couldn't get our reset line\n");
> > > +		return PTR_ERR(priv->rstc);
> > 
> > Not sure if this can actually happen, but there is no need to warn on
> > -EPROBE_DEFER. You could use return dev_err_probe(...) here.
> 
> Thank you for your comments. The series has already been picked to
> net-next. Unless you want to send the suggested changes yourself, I will
> prepare another series with your suggestions, and also apply them to
> mt7530-mdio.c.

That would be great, thank you.

regards
Philipp

