Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B2C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNYT42o+Do+WGXJABDHdnKjDYOgndsXuitKJD1bWb2s=; b=y3LI4u4RxvM7CZEK04Qs0WSKbH
	iZ88tVieh0+lB1UHwS31A9IHzAjAzooV4JJT4JC8YrEMHi6xzBWi/ShKdr3Td3QBUht/sP7BgG2oD
	Txq2BJixF+1hQ8S0TPAC7/wdhCzw4SAIJPxYmecGZTipaaNKLdsvM0bgFcY7Ows5+wdxYY1YENP6i
	IQ05pfeUYi44niyovLAO8HIWP9i//D1BHhoW7VAZP5ljJypr5pLUwccmuMaEqNJhjjnl0iVdgVMrJ
	oSdL6Tk+UNMHphSN9ZZm3Yq0FwllG0sECgSHNlpvDgWGejWcYag13us3AtTe+vVQwL2jrLocCqPRD
	MBL+HA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prKOU-001Vw4-06;
	Tue, 25 Apr 2023 15:15:50 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prKOQ-001Vv6-1z;
	Tue, 25 Apr 2023 15:15:47 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1prKO6-0004ZF-0X;
	Tue, 25 Apr 2023 17:15:26 +0200
Date: Tue, 25 Apr 2023 16:13:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 10/24] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <ZEfuIHET4Nva0hj4@makrotopia.org>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
 <20230425082933.84654-11-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425082933.84654-11-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_081546_672260_2748D95F 
X-CRM114-Status: GOOD (  19.72  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 25, 2023 at 11:29:19AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> On the first code path, priv->p5_intf_sel is either set to
> P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.
> 
> On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
> mt7530_setup_port5() is run.
> 
> Empty the default case which will never run but is needed nonetheless to
> handle all the remaining enumeration values.

If the default: case is really just unreachable code because of the
sound reasoning you presented above, then you should just remove it.

> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index aab9ebb54d7d..b3db68d6939a 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -933,9 +933,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  		val &= ~MHWTRAP_P5_DIS;
>  		break;
>  	default:
> -		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
> -			priv->p5_intf_sel);
> -		goto unlock_exit;
> +		break;

I suppose you can also rather just remove the default: case alltogether
instead of keeping it and making it a no-op.

>  	}
>  
>  	/* Setup RGMII settings */
> @@ -965,7 +963,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
>  		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
>  
> -unlock_exit:
>  	mutex_unlock(&priv->reg_mutex);
>  }
>  
> -- 
> 2.37.2
> 

