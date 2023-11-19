Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63917C072A2
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjBUe+8pD5EhysloSQei8tIcX5fvkeXnqi/PHKa743o=; b=XFMB4UlopDHQQPcAwCwITMiXZb
	ZKeTg35JNTTqDrS3aGRObCGCJZNvcVokkhlK0jfopAZHA89T7tBLrMqe4FDpw3A/1ExCfU0IxUGhP
	LnzRXi/oDSE+sm3/00SL64brxit+gQcesedoqbh2WnvMb58+lmsIYZ6wVHWPUU8III3oQ7eTYefB2
	CAfsRzM2RJ7W08yxM7rCkkjjpR1bhA6UbO5WxucV9jklTw6OnC9MuTFXfpLGnl5uZwyBwwewj7/gS
	C/0iDkIhDORyNDoNUCp+gl7GbzXmAF0TPGJXese1dVZKMpNSuD1y9AMtsTa00rfPEa9DRvRaBT+fi
	IAAlJquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4grp-00AAFh-1B;
	Sun, 19 Nov 2023 12:25:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4grl-00AAEu-2d;
	Sun, 19 Nov 2023 12:25:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9e62ab773f1so483107566b.0;
        Sun, 19 Nov 2023 04:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700396731; x=1701001531; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjBUe+8pD5EhysloSQei8tIcX5fvkeXnqi/PHKa743o=;
        b=lPHPnG2K6QYU9sSMhNn+i5t9U67Ys9W6Sn5741LnwqnFnWpHvicLT8Y/Zjspel0p85
         OtMm7vRjNh8/EOA4Y9P++mAhCof3mOtK0TTwNrhLIz+W0vHjc8avYh2YWe1gXp8SsS16
         TlRsAmzzgTQuIplF7YKb6ETrpGsQ7IDww96f3T5SFC9ntefRwJKAMOO3K/927n4yWgYi
         lx4Sy83ey5W/Q+dAmCEFvelePmj7M0EqoDO0O794l7KbC8QDil9SMGhS2hBQHrP74DcR
         fl3pwsy4bSYOxV/0qLPac1w7sI9xr+hcgLIaMSmXlLFl6QLP9gdFXgdeWNWCeURW3MI7
         ba1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700396731; x=1701001531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjBUe+8pD5EhysloSQei8tIcX5fvkeXnqi/PHKa743o=;
        b=Fg+kPCVIKSyhslKaP8wILaMxziao+mDy2yf17PS9/SYNW2AA5WLCqSd7KgaWh+bNVF
         DgpJiiLbWgzfRijKOtHXqZasU9oCrB6BRLrO/eh1f6mdEweCofccO+aqqnVZL010qm08
         5rnSowsTeFCL+m/82TZ3rRQ0xsICfubxqE9mq5Ro3kD9SJssf3VHo131DFZToAf7uKqx
         vge5u8j+h8swS7DmPe/JqK3sfOlaeEiz6BNQJXawzgjpMRGGmNklid4Do0Mx92P0GTz1
         cv4/m23QgRDyvr+FTc4j9uzOr55B2P2C9XevUiCOiBXzf8X5X7d67Qg3amx9ESiL3q82
         6N5g==
X-Gm-Message-State: AOJu0YwDBJO6E4A6VnqnRlrrgMjuxwdA9lbPs1zdI5DcZxiYIanaH6U6
	x8PVRpDaIo3OtKQ7jTKmE00=
X-Google-Smtp-Source: AGHT+IHmRWTR6dkvNCQRdmHyDpQY38kA+br73Yvjtw+tD15hi2UZKyom9XBHid029R8bKNivscPAGg==
X-Received: by 2002:a17:906:73d0:b0:9de:52b:6938 with SMTP id n16-20020a17090673d000b009de052b6938mr3045764ejl.9.1700396730896;
        Sun, 19 Nov 2023 04:25:30 -0800 (PST)
Received: from skbuf ([188.26.185.114])
        by smtp.gmail.com with ESMTPSA id g25-20020a1709064e5900b009e7e7c0d1a9sm2824311ejw.185.2023.11.19.04.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 04:25:30 -0800 (PST)
Date: Sun, 19 Nov 2023 14:25:27 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 01/15] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Message-ID: <20231119122527.ccp56obhpofvc3vo@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_042533_879077_CEBBF355 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:51PM +0300, Arınç ÜNAL wrote:
> +static void
> +mt753x_conduit_state_change(struct dsa_switch *ds,
> +			    const struct net_device *conduit,
> +			    bool operational)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	struct dsa_port *cpu_dp = conduit->dsa_ptr;

nitpick: reverse Christmas tree variable ordering

> +
> +	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
> +	 * forwarded to the numerically smallest CPU port which the DSA conduit
> +	 * interface its affine to is up.
> +	 */
> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> +		return;
> +
> +	if (operational)
> +		priv->active_cpu_ports |= BIT(cpu_dp->index);
> +	else
> +		priv->active_cpu_ports &= ~BIT(cpu_dp->index);
> +
> +	if (priv->active_cpu_ports)
> +		mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, CPU_EN |
> +			   CPU_PORT(__ffs(priv->active_cpu_ports)));
> +}

