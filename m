Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA11AC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmlX8Sm3Leh5ltQT6GP1xGXoMoMl62TznXLKZI0g4Mc=; b=1MOrjJS/jo+OaoveeTRNlULUEF
	+r1WRPwEs+T89qAse9ayi8b03d0nb4OXzsXn51BcosiQpLYmML7A8b09WAAttVIadiEPUFw5cVSrm
	XdR4TfEgB5yNiMorDEFMdaYtJijbA7fL+SwtRZ1FZSEaLbCGXnh8Ax5wf6o6nZvDSfFMsHyPspa0w
	FBH78pKlH77CJIlkcmwxvINSQNcijDlUrKdTW/UmY8Cv7rb15NZaTBz903oLd21RuvsIpiObkT6fB
	BK3j6CHdaljYjWPLbZBFyubPo1fxJU9qehikIPzV0SkM8DaFwhcIvtqZVRJYdW/TG/bl4gkddQqSj
	6j88gQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptYG-00BN0T-1T;
	Fri, 21 Apr 2023 16:24:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptYB-00BMzC-28;
	Fri, 21 Apr 2023 16:23:57 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pptXs-0001nT-1K;
	Fri, 21 Apr 2023 18:23:36 +0200
Date: Fri, 21 Apr 2023 17:23:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net-next 02/22] net: dsa: mt7530: use
 p5_interface_select as data type for p5_intf_sel
Message-ID: <ZEK4gVx-WQv0j2cR@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421143648.87889-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_092355_695144_66C56FDD 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 05:36:28PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Use the p5_interface_select enumeration as the data type for the
> p5_intf_sel field. This ensures p5_intf_sel can only take the values
> defined in the p5_interface_select enumeration.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 845f5dd16d83..703f8a528317 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -674,13 +674,13 @@ struct mt7530_port {
>  };
>  
>  /* Port 5 interface select definitions */
> -enum p5_interface_select {
> -	P5_DISABLED = 0,
> +typedef enum {

We usually avoid adding typedef in kernel code. If the purpose is
just to be more verbose in the struct definition, you can as well
also just use 'enum p5_interface_select as type in the struct.

> +	P5_DISABLED,
>  	P5_INTF_SEL_PHY_P0,
>  	P5_INTF_SEL_PHY_P4,
>  	P5_INTF_SEL_GMAC5,
>  	P5_INTF_SEL_GMAC5_SGMII,
> -};
> +} p5_interface_select;
>  
>  struct mt7530_priv;
>  
> @@ -768,7 +768,7 @@ struct mt7530_priv {
>  	bool			mcm;
>  	phy_interface_t		p6_interface;
>  	phy_interface_t		p5_interface;
> -	unsigned int		p5_intf_sel;
> +	p5_interface_select	p5_intf_sel;

enum p5_interface_select	p5_intf_sel;

>  	u8			mirror_rx;
>  	u8			mirror_tx;
>  	struct mt7530_port	ports[MT7530_NUM_PORTS];
> -- 
> 2.37.2
> 

