Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6730C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhiuGHeCY6mb/VmM9pba3c4hvDQmt4O9Ky61+mVEOwk=; b=hDGXW9k/CPcvXBqoRHs0lYlQak
	ea5OkjB5cuS99/8wKPrZun+go7Ix8c/rdbFM7kx1w66H60BRD5yiSEvldxHUCaboqztJIU5uUAsJX
	nwZml+ucfjZDCfCF6F80HS984+O24EQboMdofPX59K5521tqdg9UCSDEu8va1cNMwYaJzpej3AFgC
	AtaV4U1fjOiXAkIBgWW0T5SokaA9xf1QG83MTSVegoqaLzJev9nP4L9C7IaV8eVynp9U4RzLEJJuM
	Bk4bvKNfLG3niLuecbFMXSkz8iJc257JjF7v+On+4wYx7zNQlxjIpnNSen/15ASU0PzzA8A26PiVF
	4OfG7i/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYui-0019mj-1Q;
	Wed, 29 Mar 2023 16:44:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYuf-0019mA-2E;
	Wed, 29 Mar 2023 16:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OhiuGHeCY6mb/VmM9pba3c4hvDQmt4O9Ky61+mVEOwk=; b=eWu+51WoLOq0vVZsd+3V0xa2jK
	oOut7+dM/ujZkhoVXuWyL30qr5aHHQm64/eiEDYiFQ2geOo/BA2VpSLfDgxWR++aYRZxrpcadrevs
	XwY1I+hpueS0a1Fy5BsaHFu7/Tw99gsBi9ZGFsMGRZA348uwtzIXqvytn4hmZkvKuE54=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYuc-008mg8-7K; Wed, 29 Mar 2023 18:44:38 +0200
Date: Wed, 29 Mar 2023 18:44:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [RFC PATCH net-next v3 12/15] net: dsa: mt7530: add support for
 single-chip reset line
Message-ID: <452c4d28-dc1b-4726-9bec-7065032de119@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <0f696278bd8d13121a500f80cfe2f806debe4da5.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f696278bd8d13121a500f80cfe2f806debe4da5.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_094441_729209_F1F4979B 
X-CRM114-Status: GOOD (  18.59  )
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

On Wed, Mar 29, 2023 at 05:00:06PM +0100, Daniel Golle wrote:
> Similar to multi-chip-module MT7530 also MT7988 uses an internal
> reset line instead of using an optional reset GPIO like it is the
> case for external MT7530 and MT7531 ICs.
> Add support for internal but non-MCM reset line in preparation for
> adding support for MT7988.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/dsa/mt7530.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index c6fad2d156160..fd55ddc2d1eb3 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3066,6 +3066,12 @@ mt7530_probe_common(struct mt7530_priv *priv)
>  			dev_err(dev, "Couldn't get our reset line\n");
>  			return PTR_ERR(priv->rstc);
>  		}
> +	} else if (!priv->bus) {

!priv->bus is being used as a proxy here for MT7988. Maybe it would be
better to unconditionally use devm_reset_control_get_optional()? Or
move the reset out of mt7530_probe_common() because it is not
actually common?

	Andrew

