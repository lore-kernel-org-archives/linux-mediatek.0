Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2656BC7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGqkPEwwAUavSeei9EN10EkpOiDwc0KPU98JvOkeGrg=; b=Z3fCwvn95IN7H802nr77FHAaZd
	b8xMTTeeRTH+RGdXg5SeHqeIn1dODL+04bYCMw1CD3iR7yQOW/BYrZLn1qu1UYk6gOFdrW++XWh/C
	TQc4xMoWsR8ae5ycAwjWW4iHra3aN/OBnum9yD1w7exyDJeoN4paV62JBuz0LcYaWoZml2I/6AkAD
	8rqQokOCyRTpptsudWXST4P/2mRbG0TWRo4x39VLQdh+fFp0e6Ufsmk5h0fMVev44Bf8Cb0GGlrYQ
	nohuLk8nzFTR+Ynzg+fiBMB/W+FkRe4rZoSuiRw5BPFMo9h6WF76win+LZuz/nZmq6t3xqCiFymy/
	s8CdVNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XKH-002c3S-2U;
	Fri, 26 May 2023 13:17:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XKE-002c1T-1h;
	Fri, 26 May 2023 13:17:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9707313e32eso136637266b.2;
        Fri, 26 May 2023 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685107063; x=1687699063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sGqkPEwwAUavSeei9EN10EkpOiDwc0KPU98JvOkeGrg=;
        b=oRZs12wPYDV4ZHJF/NGbRuAA3DQsHTN2rPOmwlG1CakdIAm4fFKv1vDezhcIABhLEM
         ohp/IF6ZT7wftcQIwjZOdByfp84lhpPq+uQi6kEqGeIr1BMmfimLmQr1lFL6PR/YuFRF
         NuksyP51Yr6YDpLOGPyarUIQvMJhFFY5wJ88JSbLd8C6UnlQQFtLktAncD5vfWllTUXZ
         +t88BERHCrIa/t7QxHQgUvXT+31b9vG3K4HKKnPtEe00tJlFIe9rlBikFC0t2ysxB7as
         PTxRbahr9QfrisjHshRtTsooX8IH9+5Qcw37OX4CEgXSqf5KfIIN1a/4jfWxwQo8/V/b
         356w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107063; x=1687699063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGqkPEwwAUavSeei9EN10EkpOiDwc0KPU98JvOkeGrg=;
        b=Oi0XZX9EAlBxpJrXUOn6Rd2sLYNeEmH72Wxdfp+5XAcChkNBTlQ/whUlrm6QYt5Ea7
         OL1XUwOUdWuYZrrVGxqt6yVKX8H2sophiPLyvdyLACqtmVQely4OQ2EqohmBirDW56o8
         yGBZCw1Zb4zC9HPGs6ap1ntD1kDMXLZFu5YcRyEc7VrYsL7gbmMmMfpL+ePmed/B7qjO
         6TOs5ooqAc9oifbGSr0pnyUSR/Jp1Myfk1hICJSw7unzyO1/3js5f8df5Q8hfL0UPHIY
         5mhjFqFAhk6dm/3ecZMSkTHHOKLmI+C9W7wdk6v3HZvvSydK+Ye0p0EtPQPwHKnX6uCf
         XJGg==
X-Gm-Message-State: AC+VfDweAN/cv1Vns+hmc7AnFGqqZHTkEKrpPS2Z8V4Jz25Jc7kXkZKX
	7d20Ii2pdEE2mZm/6mWtL8o=
X-Google-Smtp-Source: ACHHUZ5L3LKf81sPQ1sp+T5rJCope7U7Ww9lPpw+UoLYYUsQolbeSqhC96HmdLhWRoMRFVYTrfanPA==
X-Received: by 2002:a17:907:9345:b0:956:fbd7:bc5e with SMTP id bv5-20020a170907934500b00956fbd7bc5emr2084037ejc.64.1685107062608;
        Fri, 26 May 2023 06:17:42 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906078d00b00968a2286749sm2168353ejc.77.2023.05.26.06.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:17:42 -0700 (PDT)
Date: Fri, 26 May 2023 16:17:39 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 16/30] net: dsa: mt7530: move lowering port 5
 RGMII driving to mt7530_setup()
Message-ID: <20230526131739.5mso5y2d3ieelasf@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_061746_585338_5280EB67 
X-CRM114-Status: GOOD (  18.63  )
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

On Mon, May 22, 2023 at 03:15:18PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
> driving of trgmii on port 6 on mt7530_setup().
> 
> This way, the switch should consume less power regardless of port 5 being
> used.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

This patch assumes that the MAC has its TXC ticking even when PMCR_TX_EN
is unset. Why would it do that?

>  drivers/net/dsa/mt7530.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index f2c1aa9cf7f7..514e82299537 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -933,10 +933,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  		/* P5 RGMII TX Clock Control: delay x */
>  		mt7530_write(priv, MT7530_P5RGMIITXCR,
>  			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
> -
> -		/* reduce P5 RGMII Tx driving, 8mA */
> -		mt7530_write(priv, MT7530_IO_DRV_CR,
> -			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
>  	}
>  
>  	mt7530_write(priv, MT7530_MHWTRAP, val);
> @@ -2209,6 +2205,10 @@ mt7530_setup(struct dsa_switch *ds)
>  
>  	mt7530_pll_setup(priv);
>  
> +	/* Lower P5 RGMII Tx driving, 8mA */
> +	mt7530_write(priv, MT7530_IO_DRV_CR,
> +			P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));

If you move code then preserve its alignment to the open parenthesis.

> +
>  	/* Lower Tx driving for TRGMII path */
>  	for (i = 0; i < NUM_TRGMII_CTRL; i++)
>  		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
> -- 
> 2.39.2
> 


