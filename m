Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE15AC47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yXAbaAJ66TkHbWq15zRnFaiYa65uZWNj5loVkRiAVs=; b=ZORwMTs5JxVhJLAMaquuaK9547
	9WHykWZl+MH0oAiPA5QR5TaHc9hP/VifszDEAf5N2Ykff+RypEHvNvwwWgy3hqtFRj/xeeRFNgj+6
	8+AqS11mvMFbinuq1RS+mqFpAvaseG6GHLJ2tyqbLfZ398xc3N+4qoLN/VGQMXy7BE90VIWed/zyF
	tYkL6BXyED5sJW8ap1f2DNt0skltc+i/qoL9I1ecAHDyaprtdoHW2KFAF3yMHHdPw6fSPmdYKM0bS
	rfCs0EAYC1jvMuhQOZU1xMWOZAZmKS4+DHtCr3fAgczzmxAHZaDPWTe7vRCOojVEUgiXawYwO0BZc
	WFcdp0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPYT-00EU4l-29;
	Thu, 04 Jan 2024 15:22:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPYP-00EU3g-2E;
	Thu, 04 Jan 2024 15:22:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a28b2e1a13fso72766366b.3;
        Thu, 04 Jan 2024 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704381756; x=1704986556; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0yXAbaAJ66TkHbWq15zRnFaiYa65uZWNj5loVkRiAVs=;
        b=cZ0ogNJweF5C4rEe8RtnSCcL7EuMf+dkCYn7fU3q75D0xGh7LcURlH9JFJe4g6uplZ
         otwXcvIw7Ei9O/dETt2o7uHf7cmlO7CLHrL8cpUaKHLeahBFSMZ5D6a2S5OoWPnYxavz
         ySQOkV6cqNnKa5/cS2qdU9Rij1jMNyahgdlctHcW+SkYvJiS6lF9mo9o6qNwaVvrbFXr
         lo/xwp7hgpdqY1E14V/zYBx2k9Uj/RBpPjWGLlhHbrc1hPg8T4y88EpnihpCU1xp7X0o
         gcx6o6wf6HZtYjo+xVymWL8X/YrOYqJ5+D7jXl8lZSd82t2vs3fhGq4PRoFv1ba/BQtW
         uTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704381756; x=1704986556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yXAbaAJ66TkHbWq15zRnFaiYa65uZWNj5loVkRiAVs=;
        b=Unt/k9nHCpIySd9rLMXvQTbZb2EXAFRuhqrfbSwQNWV5D3ZFqIdhBZFmBXgT+TqBFy
         VeHrKiQi6I8fp6Ue0USHVr54a7emg0CobqpCsT6g1ETnvzUSk3AX14mj/ZnEMskiO1h5
         eQDF+mK9r4SRtgaFTJdNvtEaXsYOz4br03p35LQiR40Z1BMFhb/yLrXh2Mb8gJ4hkPgu
         Ydl7cRNdR6/+lsAnNJtTeEySr/3UqBubg1Wc4rf4/dHA4LqzjF+8d/r0627WdlnMnNOG
         6JSKgMlFHPpiv8AZ03d1ljqlZJ2laRri9ciRTuLi8nDw0dy9ZZRtXO1S5a5Pzjn62KMF
         F2dw==
X-Gm-Message-State: AOJu0Yyw0Ok0myJY/DO+SAEgG5gJOQKVKw9B4qgkmxVfmDt5tmUrngch
	Hi+wq1VcdlyJoSoXArd1TDA=
X-Google-Smtp-Source: AGHT+IFaig8SeExL8gpob99TbO9syJO8daKzzf6+NKnsgHhhIwb1pKTLpp4QHIDVqUCo5i59VpnL9w==
X-Received: by 2002:a17:906:680b:b0:a27:43b7:ec7 with SMTP id k11-20020a170906680b00b00a2743b70ec7mr374799ejr.22.1704381755979;
        Thu, 04 Jan 2024 07:22:35 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id gg18-20020a170906e29200b00a28fa7838a1sm221054ejb.172.2024.01.04.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 07:22:35 -0800 (PST)
Date: Thu, 4 Jan 2024 17:22:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 1/7] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Message-ID: <20240104152232.jkoqiuwk3rd24rpm@skbuf>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-2-arinc.unal@arinc9.com>
 <20231227044347.107291-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227044347.107291-2-arinc.unal@arinc9.com>
 <20231227044347.107291-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_072241_754583_D33F1AF9 
X-CRM114-Status: GOOD (  31.31  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 27, 2023 at 07:43:41AM +0300, Arınç ÜNAL wrote:
> On the MT7530 switch, the CPU_PORT field indicates which CPU port to trap
> frames to, regardless of the affinity of the inbound user port.
> 
> When multiple CPU ports are in use, if the DSA conduit interface is down,
> trapped frames won't be passed to the conduit interface.
> 
> To make trapping frames work including this case, implement
> ds->ops->master_state_change() on this subdriver and set the CPU_PORT field

conduit_state_change()

> to the numerically smallest CPU port which the DSA conduit interface its
> affine to is up. Introduce the active_cpu_ports field to store the
> information of the active CPU ports. Correct the macros, CPU_PORT is bits 4
> through 6 of the register.
> 
> Add a comment to explain frame trapping for this switch.
> 
> Currently, the driver doesn't support the use of multiple CPU ports so this
> is not necessarily a bug fix.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 37 +++++++++++++++++++++++++++++++++----
>  drivers/net/dsa/mt7530.h |  6 ++++--
>  2 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 391c4dbdff42..436d5c311be0 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1035,10 +1035,6 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
>  		   UNU_FFP(BIT(port)));
>  
> -	/* Set CPU port number */
> -	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
> -		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
> -
>  	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
>  	 * the MT7988 SoC. Trapped frames will be forwarded to the CPU port that
>  	 * is affine to the inbound user port.
> @@ -3075,6 +3071,38 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
>  	return 0;
>  }
>  
> +static void
> +mt753x_conduit_state_change(struct dsa_switch *ds,
> +			    const struct net_device *conduit,
> +			    bool operational)
> +{
> +	struct dsa_port *cpu_dp = conduit->dsa_ptr;
> +	struct mt7530_priv *priv = ds->priv;
> +	u8 mask;
> +	int val = 0;

Longest line first.

> +
> +	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
> +	 * forwarded to the numerically smallest CPU port which the DSA conduit
> +	 * interface its affine to is up.

"first CPU port whose conduit interface is up"

> +	 */
> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> +		return;
> +
> +	mask = BIT(cpu_dp->index);
> +
> +	if (operational)
> +		priv->active_cpu_ports |= mask;
> +	else
> +		priv->active_cpu_ports &= ~mask;
> +
> +	if (priv->active_cpu_ports)
> +		val =
> +		    CPU_EN |
> +		    CPU_PORT(__ffs((unsigned long)priv->active_cpu_ports));

I don't think the type cast is necessary (implicit type promotion takes place).

Also, it is customary to put {} for multi-line "if" blocks, even if they are
made up of a single expression.

But without the type cast, it could look like this.

	if (priv->active_cpu_ports)
		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));

> +
> +	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);
> +}

