Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDD4C27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 06:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oepipccJ4+xfU5ZrXbRCGP8qtlNKoyECJMJmUGJDpJY=; b=v0NoYofiZG64l/3OB4ff50W7ry
	ByNm9FoKhCvNEkXN82dTZlJ0QyCKr2doo11MnpNszInvvOwtyw1w1ANYBCKsL42AcfHsY9ZVXoj22
	TnLHtb6eesMQQ1c9gZimFU+++naBt1J228fbUtv0euCsj2VEXXSsvW8LHYX81Q2FhmvxopxdP4FQW
	3YrPHqXmwSmN+D2TP07nYpO1dWOY7pOLtJsCN3RGhDIAhYqEOEVbJgYtMoBq6ugvJ82k40zBcFC7d
	z2p5F/Wd80G/tr5dFEruTbGp4u4U+bv1JP6j6PtjMX/c9T2LnSm50ppQdRyiIfzw00HVBa7WIC/WQ
	gFU4DeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIjiH-00000006xQh-1g9c;
	Sun, 16 Jun 2024 06:50:05 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIjiC-00000006xPD-3ppt;
	Sun, 16 Jun 2024 06:50:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31BDC240003;
	Sun, 16 Jun 2024 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718520596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oepipccJ4+xfU5ZrXbRCGP8qtlNKoyECJMJmUGJDpJY=;
	b=nPovZ99vizahHrb9+csaQlYDereOrVESm1iKgeJv+z7U5QelYHYKWGbOhnECUgXNIbta+Y
	lYDd7pwaEHTudVGST8KuALea8IfEi4UF8pRHEzFLXReUBbZAMpkBtEbXCIS9xrZ+T6nnrG
	uqXjO+B3exmqcPQqMg6tNLKARyks0mfjcXpe+n3YZun2dhUNh4ct99MI/HcGBturj69PQ7
	fPx9XqL0AJlLya9RlPE5gkHgD+Xc0d7iU9Hp00eFQav8g1zk9lD9NaDzuV7FVWK77HjaBS
	AaZP6407I9ukj4gICe4YwX1jihFmZOAfhQxIpGMHo+wmWzMt7dqKms7yBcMA4A==
Message-ID: <a26d619c-fc63-4b2d-8313-210a37b1661a@arinc9.com>
Date: Sun, 16 Jun 2024 09:49:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: dsa: mt7530: factor out bridge
 join/leave logic
To: Matthias Schiffer <mschiffer@universe-factory.net>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_235001_275774_C5F41FF4 
X-CRM114-Status: GOOD (  23.43  )
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

On 15/06/2024 01:21, Matthias Schiffer wrote:
> As preparation for implementing bridge port isolation, move the logic to
> add and remove bits in the port matrix into a new helper
> mt7530_update_port_member(), which is called from
> mt7530_port_bridge_join() and mt7530_port_bridge_leave().
> 
> No functional change intended.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
>   drivers/net/dsa/mt7530.c | 103 +++++++++++++++++----------------------
>   1 file changed, 46 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 598434d8d6e4..ecacaefdd694 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1302,6 +1302,50 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
>   		   FID_PST(FID_BRIDGED, stp_state));
>   }
>   
> +static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
> +				      const struct net_device *bridge_dev, bool join)
> +	__must_hold(&priv->reg_mutex)

Please run git clang-format on the patch.

> +{
> +	struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
> +	struct mt7530_port *p = &priv->ports[port], *other_p;
> +	struct dsa_port *cpu_dp = dp->cpu_dp;
> +	u32 port_bitmap = BIT(cpu_dp->index);
> +	int other_port;
> +
> +	dsa_switch_for_each_user_port(other_dp, priv->ds) {
> +		other_port = other_dp->index;
> +		other_p = &priv->ports[other_port];
> +
> +		if (dp == other_dp)
> +			continue;
> +
> +		/* Add/remove this port to/from the port matrix of the other
> +		 * ports in the same bridge. If the port is disabled, port
> +		 * matrix is kept and not being setup until the port becomes
> +		 * enabled.
> +		 */
> +		if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))

Would be helpful to mention in the patch log that
dsa_port_offloads_bridge_dev() is now being used instead of
dsa_port_offloads_bridge().

> +			continue;
> +
> +		if (join) {
> +			other_p->pm |= PCR_MATRIX(BIT(port));
> +			port_bitmap |= BIT(other_port);
> +		} else {
> +			other_p->pm &= ~PCR_MATRIX(BIT(port));
> +		}
> +
> +		if (other_p->enable)
> +			mt7530_rmw(priv, MT7530_PCR_P(other_port),
> +				   PCR_MATRIX_MASK, other_p->pm);
> +	}
> +
> +	/* Add/remove the all other ports to this port matrix. */

I would add to this comment: When removing, only the CPU port will remain
in the port matrix of this port.

To not omit the original comment:

	/* Set the cpu port to be the only one in the port matrix of
	 * this port.
	 */

> +	p->pm = PCR_MATRIX(port_bitmap);
> +	if (priv->ports[port].enable)
> +		mt7530_rmw(priv, MT7530_PCR_P(port),
> +			   PCR_MATRIX_MASK, p->pm);

I see changes to have the code streamlined. Overall, I would appreciate a
more verbose patch log.

Arınç

