Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA65C61D90
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 18:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODiuHgN7M/3JDAnpT89vj5beY9SryfK9Bf3VZ+lCLzE=; b=UrN7MZZF8EA4+Jx6U5PU5GeVwk
	fq87Eag0K0n+Vota8iRNAFdmckr5XGVGE8Sa5ZIXJoBf/cnektcLJDBOBjlJZ/johTJCR/2AYrtnL
	ZvTEv/o+DQrrzpSAnxkZvpdxaT+SMOMNhh4qhabjBM89gJeV+ZyviP7eH1N9QrNVS10dAVKop1lcw
	+g4qf2pb8HitUU66/cTV3nVxw/NydldXcXtzjxBKPpY61/Yz+Ki5e4RjNtGGm/cj4la4oz+uXaNMQ
	+2bz6ZWFHwRpIzyk27Kd8yfIB0pNHzgHpU1fzkbXcHna4BvnXn8WpwUjIS+QtY+Mpbql6/MmOSH+X
	5Rv68D/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Vsw-00HWRD-09;
	Tue, 21 Nov 2023 18:54:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Vss-00HWQU-2v;
	Tue, 21 Nov 2023 18:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99EE2619E3;
	Tue, 21 Nov 2023 18:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E211C433C8;
	Tue, 21 Nov 2023 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700592845;
	bh=co9lMUzvw3BfxT6r7XtEhDDe5hhA8tulVxZdHRcAkE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISW9tAm/yGrJQpNo6XTzZkUNwdPwdPqYh/2v/hvXHUByZDPwQ2x45l+FnJg8xw3kz
	 VZbZm7KoTgiEDbrLU9AekSnhiiCC3LTKiakbme3HPHemzht88vslNhl6XeS7sbAWip
	 jAYCp0KSMXy/MqW2S8DpkDiutWV6gqpja3FuMgNkpwMHYrPeVwCmhWWAYY+Lua7Ceq
	 q+ykpM9z9Le4JQ2Gt1lUOgWFwH1Lq1HHJYBxyVFSNL2cqfLCMF2TywHu0OyTPKfH1F
	 Z7n5XSZ/nTZSlAVtjV7hEDbQwlSBf2IAV/b1UKGPaHHn3BifFxyjmzH+ASLEZZxks6
	 iIuYq8OzNfbDg==
Date: Tue, 21 Nov 2023 18:53:58 +0000
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20231121185358.GA16629@kernel.org>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_105407_053795_F5C8E19F 
X-CRM114-Status: GOOD (  21.95  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, mithat.guner@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:57PM +0300, Arınç ÜNAL wrote:
> There's no need to run all the code on mt7530_setup_port5() if port 5 is
> disabled. The only case for calling mt7530_setup_port5() from
> mt7530_setup() is when PHY muxing is enabled. That is because port 5 is not
> defined as a port on the devicetree, therefore, it cannot be controlled by
> phylink.
> 
> Because of this, run mt7530_setup_port5() if priv->p5_intf_sel is
> P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4. Remove the P5_DISABLED case from
> mt7530_setup_port5().
> 
> Stop initialising the interface variable as the remaining cases will always
> call mt7530_setup_port5() with it initialised.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index fc87ec817672..1aab4c3f28b0 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -942,9 +942,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
>  		val &= ~MHWTRAP_P5_DIS;
>  		break;
> -	case P5_DISABLED:
> -		interface = PHY_INTERFACE_MODE_NA;
> -		break;
>  	default:
>  		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
>  			priv->p5_intf_sel);
> @@ -2313,8 +2310,6 @@ mt7530_setup(struct dsa_switch *ds)
>  		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
>  		 * is detected.
>  		 */
> -		interface = PHY_INTERFACE_MODE_NA;
> -
>  		for_each_child_of_node(dn, mac_np) {
>  			if (!of_device_is_compatible(mac_np,
>  						     "mediatek,eth-mac"))
> @@ -2346,7 +2341,9 @@ mt7530_setup(struct dsa_switch *ds)
>  			break;
>  		}
>  
> -		mt7530_setup_port5(ds, interface);
> +		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
> +		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> +			mt7530_setup_port5(ds, interface);

Hi Arınç,

It appears that interface is now uninitialised here.

Flagged by Smatch.

>  	}
>  
>  #ifdef CONFIG_GPIOLIB
> -- 
> 2.40.1
> 

