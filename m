Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17BC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLjmIxWBZXYFaJoEDrFA76LxUvZ8/QKRwm9su8En8/U=; b=t+ajfrLv1yXL3eP/tkIwM8WouJ
	yokRLOaHedm0VgldO+tDsXGqCLJTfkL/flqoWWc6twr/bID5+0W4hkorEAFr9FpIJu9z/9iqqgY1e
	X1Uo2EGlpEy988ov50xmfw3bSi6XZCnmEaPFVaUF/+rHU/D+ZQ34AF1ZU4ieQTqzlKsEDJg/SRlmO
	2pLrywEYXT5Y5PgIjXCwEoZ76mBJk/2y8tbMxwoPB7mGYPwXj7Fzmoq5pM2OfP+b6t3TdIXvKAQs+
	1mPpzW0NuoSjfbVzjfEZ8rv7/0rgnlRyVZXH46KnlUmvMXNniIIQEs2AmvQ5wp7xdce4uwZQjSNe6
	V04V3PkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0i9u-0000000FaNz-0Z8G;
	Sat, 27 Apr 2024 13:32:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0i9q-0000000FaM4-30DV;
	Sat, 27 Apr 2024 13:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=uLjmIxWBZXYFaJoEDrFA76LxUvZ8/QKRwm9su8En8/U=; b=E8
	SC4q7cnxZuKZPZHU2E87r6vMH+XWnFfdlKPoMLVhloayciK5L8OphMvdgMQkONjPXJFapa2sdqeMj
	Yod6kuuzZs4XDpfSqd4rh66ERJmW9TeHL6tH6OIZVBNjs6kTjD9U/1J2/QG26Z/vh2+zF5GzC4mJe
	S5Z3EE/oAp/LrnI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s0i9S-00E90w-N3; Sat, 27 Apr 2024 15:31:38 +0200
Date: Sat, 27 Apr 2024 15:31:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: do not set MT7530_P5_DIS when
 PHY muxing is being used
Message-ID: <7c476e63-5747-4128-af97-13edc252a263@lunn.ch>
References: <20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v1-1-793cdf9d7707@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v1-1-793cdf9d7707@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_063202_779236_683C5A0E 
X-CRM114-Status: GOOD (  22.19  )
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

On Sat, Apr 27, 2024 at 02:24:42PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> When the PHY muxing feature is in use, port 5 won't be defined in the
> device tree. Because of this, the type member of the dsa_port structure for
> this port will be assigned DSA_PORT_TYPE_UNUSED. The dsa_port_setup()
> function calls ds->ops->port_disable() when the port type is
> DSA_PORT_TYPE_UNUSED.
> 
> The MT7530_P5_DIS bit is unset when PHY muxing is being used.
> mt7530_port_disable() which is assigned to ds->ops->port_disable() is
> called afterwards. Currently, mt7530_port_disable() sets MT7530_P5_DIS
> which breaks network connectivity when PHY muxing is being used.
> 
> Therefore, do not set MT7530_P5_DIS when PHY muxing is being used.
> 
> Fixes: 377174c5760c ("net: dsa: mt7530: move MT753X_MTRAP operations for MT7530")
> Reported-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Hello.
> 
> I've sent this to net-next as the patch it fixes is on the current
> development cycle.
> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 2b9f904a98f0..07b6da3ae97c 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1220,7 +1220,7 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
>  	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>  		return;
>  
> -	if (port == 5)
> +	if (port == 5 && priv->p5_mode == GMAC5)
>  		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);


It might be worth a comment. It is not obvious that
priv->p5_mode == GMAC5 means the PHY MUX is being used.
mt7530_setup_port5() thinks it is sufficiently obscure that
it comments each case.

	Andrew

