Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3134C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n3970YVJgScIYsLOLOJ40pOvrh5QeCEXyrxgVLgCzM=; b=3ESRdOP64qTENl2TIKN731YViq
	ps5W32a8vV7PrUYeVb0xIESiiOTlZHZQ+JwHE8rQSYEmVyd0kkX2XUgeJeKSUnaPLaodiDJPS8k3O
	e0bUAHFBwMVfSG0pt8reAOX4MuMLA+p7LFZAuQiVH4Yf7YZLkRsElSMuYt+71CYSS+FUYKjdMnbsY
	mCzZZpv17Q/ZC9gD9h9Gv9dBSuc7sGAlIIUJrsDPS1S332WUnC7aW4VPwIqt8lEFoW/WH2tQw5kwz
	2vmXtnwQXKbKEsUMgwZZUbXl1iisLPvAPWfXad7Jrw1KtG47Jo5opywe3TWT4myY1d+5WPK0Kuyr9
	hMXSqZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piavt-00AZHf-0X;
	Sat, 01 Apr 2023 13:06:13 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piavq-00AZFm-0u;
	Sat, 01 Apr 2023 13:06:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1piava-0008Q2-1A;
	Sat, 01 Apr 2023 15:05:54 +0200
Date: Sat, 1 Apr 2023 14:05:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 13/15] net: dsa: mt7530: add support for 10G
 link modes for CPU port
Message-ID: <ZCgsLFT6dwhCsAyE@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <89ef48606fdbe896705a57a65a85c22cae01936e.1680180959.git.daniel@makrotopia.org>
 <8f213456-af0b-3047-d7ec-865fecec8142@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f213456-af0b-3047-d7ec-865fecec8142@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_060610_325824_647C5AF9 
X-CRM114-Status: GOOD (  20.86  )
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

On Sat, Apr 01, 2023 at 11:56:43AM +0300, Arınç ÜNAL wrote:
> On 30.03.2023 18:23, Daniel Golle wrote:
> > The built-in switch of the MT7988 SoC is internally connected using
> > a stateless 10G link. Add support for 10G interface modes to silence
> > a warning otherwise occurring when the switch driver is setup.
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/net/dsa/mt7530.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 3a4682e71e746..ac666da2d10dc 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2618,6 +2618,9 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
> >   	case PHY_INTERFACE_MODE_1000BASEX:
> >   	case PHY_INTERFACE_MODE_2500BASEX:
> >   		/* handled in SGMII PCS driver */
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GKR:
> > +		/* internal stateless 10G link */
> >   		return 0;
> >   	default:
> >   		return -EINVAL;
> 
> I think it'd be better to make this explicitly for the switch in the
> MT7988 SoC.

I decided to rather introduce mt7988_mac_config (a noop returning
either 0 or -EINVAL), mt7988_mac_port_get_caps (allowing only USXGMII
and 10000FD) and mt7988_cpu_port_config (setting CPU port bit in
registers but not caring about interface mode and speed other than
USXGMII/10000FD).

The updated commit adding MT7988 is here:
https://github.com/dangowrt/linux/commit/595c940cbee90b5dbdc8173974a007fefe641550

So then I dropped
"net: dsa: mt7530: add support for 10G link modes for CPU port"
because it is no longer needed if all this is done explicitely for MT7988.

> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index e5347dd2521b..f7542c7f60e4 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2666,10 +2665,13 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  	case PHY_INTERFACE_MODE_2500BASEX:
>  		/* handled in SGMII PCS driver */
> +		return 0;
>  	case PHY_INTERFACE_MODE_USXGMII:
>  	case PHY_INTERFACE_MODE_10GKR:
> -		/* internal stateless 10G link */
> -		return 0;
> +		if (priv->id == ID_MT7988)
> +			/* internal stateless 10G link */
> +			return 0;
> +
>  	default:
>  		return -EINVAL;
>  	}
> 
> Arınç

