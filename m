Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E12C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dgxGjGPq9B4BTMs3oBF79nFKdG/JfMIEAxOn4RCl9c=; b=3iP3GMuih5fybclBrHZoI0vkQ0
	qa5UE2riP/6n8gvEpyrXLe850aAtiP6GVOoqPamfDsrp3PvAQlrGw36IHGQZT5OLVpZNKx5JqPnz3
	w7W9Iihusr15GPGtRuFJeD1mTOifGFzhT6aqFozX74v36erO0t0xuQOa0k975/E3RqBuW+KXM8OeA
	2A4te4eX1Cd6qnkEdUx8THQbFGgslJ/nAk4ytTqzS2wL0mPVUE+vWvStPgk0SrBqgh73hCSG1x4Wl
	esQi4ZIyUoYyGOLSMzHaXBtg+HuxhwtfgEP4idy4Pf9kQeMh+q++JAVfKt72/f9JbXl/C2p1Fz/28
	E/oe61Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zj5-0032Mr-1v;
	Fri, 26 May 2023 15:51:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zj2-0032Kb-0M;
	Fri, 26 May 2023 15:51:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f53c06babso159039766b.3;
        Fri, 26 May 2023 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685116288; x=1687708288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4dgxGjGPq9B4BTMs3oBF79nFKdG/JfMIEAxOn4RCl9c=;
        b=i0IAtIFhPzBl8gwRKkjpt8ZxONqxs+fOve/1EOjxDmnMugCzaxA2J6L/7fLUjsMhyO
         enSKvTaetZqRF599KOD7chSziRIOv1IxlgE+zG2zG2lop8yhx/U4xUX6IyxMOseBJd0n
         lROHBAnroUqG2MBQNrDh3DSdUTG4cevxIXgJ3P6d+4vmt8/iYIbgTt74SvTW108DrCXf
         az/pqLgcWChfJo1ri8MCi64oC65GygxACwjtBkHZip/fZw7DUiOQQ2Zzy32aJ2x6as/7
         ugeOFpcjV+2ZfyuQA6Nh8FmQ81CN9gskXpqxOBQejo9NXiLmdUds0cPL3NXUF6rFBcAK
         Km4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116288; x=1687708288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dgxGjGPq9B4BTMs3oBF79nFKdG/JfMIEAxOn4RCl9c=;
        b=JuyeZUaIW5OCDsvqfuYBCnigchpt5VoeX4NFvGlcSVZuA1Tt4We+v9MqqiIMpweDXR
         h/P2PuFQUVOaEN9zYtOoZ68+YrxHb07/LDBgj28oNajts228rB2f+LqG/lOSpXcx23WD
         0ILjL5tp8uJr2vomDfPFqsBwIDoA012gNN0wSy+w9Ze/q9fHxfs+PZi6yfPnXDG8keOY
         2e1YtEgcC39kZ1hIyWqVcHq6WmDLGAFu00Cfu1xvkdyHqV41hxtECjo7mbCMqJZ4wKKq
         kzQDqq8jFTKIiX8h8YQJkdYCrZ9cgW8DkT9J2aU4xt9C9osTYD7IyXBoj6OlCXnwjKBD
         XKCg==
X-Gm-Message-State: AC+VfDxWooBnLG9oMIxBXzl7rYyWI90esJv6DWYZ6nX9PZhsI8ErP5Cx
	d97s5S+FFWSDDvNmTRpWnUU=
X-Google-Smtp-Source: ACHHUZ5BbaM6qT+X4mipLLBDQrNNgEQTBj8wVNxUGWplmpGPdIn1TCwtHQVBX6Zt6AzlqGugCe+/IQ==
X-Received: by 2002:a17:906:fe48:b0:973:9521:cd50 with SMTP id wz8-20020a170906fe4800b009739521cd50mr2117091ejb.41.1685116288079;
        Fri, 26 May 2023 08:51:28 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b00961277a426dsm2283115ejc.205.2023.05.26.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:51:27 -0700 (PDT)
Date: Fri, 26 May 2023 18:51:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 25/30] net: dsa: mt7530: properly set
 MT7531_CPU_PMAP
Message-ID: <20230526155124.sps74wayui6bydao@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_085132_151872_3FAE5F17 
X-CRM114-Status: GOOD (  30.71  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:27PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Every bit of the CPU port bitmap for MT7531 and the switch on the MT7988
> SoC represents a CPU port to trap frames to. Currently only the bit that
> corresponds to the first found CPU port is set on the bitmap. Introduce the
> MT7531_CPU_PMAP macro to individually set the bits of the CPU port bitmap.
> Set the CPU port bitmap for MT7531 and the switch on the MT7988 SoC on
> mt753x_cpu_port_enable() which runs on a loop for each CPU port. Add
> comments to explain this.
> 
> According to the document MT7531 Reference Manual for Development Board
> v1.0, the MT7531_CPU_PMAP bits are unset after reset so no need to clear it
> beforehand. Since there's currently no public document for the switch on
> the MT7988 SoC, I assume this is also the case for this switch.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Is this supposed to be a bug fix? (incompatibility with past or future
device trees also counts as bugs) If so, it needs a Fixes: tag and to be
targeted towards the "net" tree. Also, the impact of the current behavior
and of the change need to be explained better.

>  drivers/net/dsa/mt7530.c | 15 ++++++++-------
>  drivers/net/dsa/mt7530.h |  3 ++-
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 58d8738d94d3..0b513e3628fe 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -963,6 +963,13 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  		mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_MASK, MT7530_CPU_EN |
>  			   MT7530_CPU_PORT(port));
>  
> +	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
> +	 * the MT7988 SoC. Any frames set for trapping to CPU port will be
> +	 * trapped to the CPU port the user port is affine to.
> +	 */
> +	if (priv->id == ID_MT7531 || priv->id == ID_MT7988)
> +		mt7530_set(priv, MT7531_CFC, MT7531_CPU_PMAP(BIT(port)));
> +

Stylistically, the existence of an indirect call to priv->info->cpu_port_config()
per switch family is a bit dissonant with an explicit check for device id later
in the same function.

>  	/* CPU port gets connected to all user ports of
>  	 * the switch.
>  	 */
> @@ -2315,15 +2322,9 @@ static int
>  mt7531_setup_common(struct dsa_switch *ds)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> -	struct dsa_port *cpu_dp;
>  	int ret, i;
>  
> -	/* BPDU to CPU port */
> -	dsa_switch_for_each_cpu_port(cpu_dp, ds) {
> -		mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
> -			   BIT(cpu_dp->index));
> -		break;
> -	}
> +	/* Trap BPDUs to the CPU port(s) */
>  	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
>  		   MT753X_BPDU_CPU_ONLY);
>  
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 5ebb942b07ef..fd2a2f726b8a 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -53,7 +53,8 @@ enum mt753x_id {
>  #define  MT7531_MIRROR_MASK		(0x7 << 16)
>  #define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & 0x7)
>  #define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
> -#define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
> +#define  MT7531_CPU_PMAP(x)		((x) & 0xff)

You can leave this as ((x) & GENMASK(7, 0))

> +#define  MT7531_CPU_PMAP_MASK		MT7531_CPU_PMAP(~0)

There's no other user of MT7531_CPU_PMAP_MASK, you can remove this.

>  
>  #define MT753X_MIRROR_REG(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
>  					 MT7531_CFC : MT753X_MFC)
> -- 
> 2.39.2
> 


