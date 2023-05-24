Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA339C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87ZCxQxTbVlKyzkUBnd4j43LV2JM7FHJHvdF0cKFlQQ=; b=tIN5ebdxn6vLqW7kF6Se4CmP0w
	QTk2lDbzDDIoRSGXuc4oK7fi0RnbFwIPHP7p3Qw7G3Ec1YlsNtC0ejMH6/RJi0wAb20xuE/TlPIGz
	Q8YYGb+LyhsMiMt4UEvid4/3SM826AxrrpbAMKAVwd1JZw6Y9FqpoOEqBLDLmrD46BBU+p40VKegH
	1HgsQBdU5T8ynwE7czsFGwjHFf1KITL8Pi725fA5RY2H7yD/I0XwwRfPVwCR7ByTASs5iHfGyW5Ni
	7ySkPPlZEjD1BI5Qc4/2tPxL8gqnnlcO/vPxZ7jvW+jtghOYqpz+wXeZuZhHbjidFGj9LwOoJD4Pp
	Tf9VATKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1t1A-00ELXo-2J;
	Wed, 24 May 2023 18:15:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1t17-00ELW6-2D;
	Wed, 24 May 2023 18:15:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6042d60b5so14206255e9.2;
        Wed, 24 May 2023 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684952115; x=1687544115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=87ZCxQxTbVlKyzkUBnd4j43LV2JM7FHJHvdF0cKFlQQ=;
        b=VbBXmu69uh2gs0RMb+R7/foz1uQKVq/j6oHNX547qBl9t+AzBFUP1CF0w/YXiQHoJJ
         29rLQkeoO83pZRz0t4dESuYe2Thpebmo7IM4DjpLzyB5HPMz5AIxtPghdpemrkKWB2UL
         yX2Mm5a0sZUVvSba4Dw103/TcQ3LEAY4bDD948jAt22q/QcJGp6zMhwg4OzqINO2y8t7
         j8xydeHTuE8QCj8guqMq1hLPS0O0bJctnoyHum4EGVY9l2eakOh4l3j489OdjdklKa27
         XFWba9CqLUvxG/qwUyK74Vu5ETED/2EQRQXR6hnS8nDctCZ99sX5JXIRfbjrj9xrzfwo
         4QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684952115; x=1687544115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87ZCxQxTbVlKyzkUBnd4j43LV2JM7FHJHvdF0cKFlQQ=;
        b=KInzTa8eILPb3ZgtpyaQvf5gvHKLsVRq/hqc9hL7d2BdWxeDaCsHPtX0GQfoR96t7B
         jKhqqVAjSiRAYzdZ67E55ecFQg81h4fKlhhjqrY+VrkCzE3xIhqEQ32qQdB3Xrcw+D8C
         0if6Sk5RHuCxqhkUtLpBk03Z7BhhB5kMFhpdXPebXUcjbzNv9B7FoNI1X5nxa8oNR6LK
         th5Nju80BRHtS5yF46ZV05pz/zyZHOgbNYcucs2hiit0n7IQzXDh+21fqKyXO9nnVNdG
         9oug/OJRrz2vXXlgkV5THpjcV2KG+X9lXnGWnoQyVNojN7CZP+iH7aPnMTUGWqIlV/s4
         XVzg==
X-Gm-Message-State: AC+VfDx/ydEcVTiqu1ZvcGI35jYsAO1YCx2bkLuqelFsNfsWJFxn2kUU
	JtKrAEf3HYdiTJYOF9hBHcU=
X-Google-Smtp-Source: ACHHUZ7FS9+AodX+nKeevqNznXZks1d6+Nsqsfu7Ns9jz1kUkH/m3dvKLOkzaIyMguQB4V8lerzsWA==
X-Received: by 2002:a7b:cd14:0:b0:3f5:fff8:d4f3 with SMTP id f20-20020a7bcd14000000b003f5fff8d4f3mr541358wmj.7.1684952115423;
        Wed, 24 May 2023 11:15:15 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b003f42461ac75sm3107977wmf.12.2023.05.24.11.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:15:15 -0700 (PDT)
Date: Wed, 24 May 2023 21:15:12 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 12/30] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <20230524181512.tmll4ijpijmc5fea@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-13-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-13-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_111521_729787_43D67F5D 
X-CRM114-Status: GOOD (  24.90  )
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

On Mon, May 22, 2023 at 03:15:14PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The crystal frequency concerns the switch core. The frequency should be
> checked when the switch is being set up so the driver can reject the
> unsupported hardware earlier and without requiring port 6 to be used.
> 
> Move it to mt7530_setup().
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Do you know why a crystal frequency of 20 MHz is not supported?

>  drivers/net/dsa/mt7530.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 049f7be0d790..fa48273269c4 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -408,13 +408,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>  
>  	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
>  
> -	if (xtal == HWTRAP_XTAL_20MHZ) {
> -		dev_err(priv->dev,
> -			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
> -			__func__);
> -		return -EINVAL;
> -	}
> -
>  	switch (interface) {
>  	case PHY_INTERFACE_MODE_RGMII:
>  		trgint = 0;
> @@ -2133,7 +2126,7 @@ mt7530_setup(struct dsa_switch *ds)
>  	struct mt7530_dummy_poll p;
>  	phy_interface_t interface;
>  	struct dsa_port *cpu_dp;
> -	u32 id, val;
> +	u32 id, val, xtal;
>  	int ret, i;
>  
>  	/* The parent node of master netdev which holds the common system
> @@ -2203,6 +2196,15 @@ mt7530_setup(struct dsa_switch *ds)
>  		return -ENODEV;
>  	}
>  
> +	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
> +
> +	if (xtal == HWTRAP_XTAL_20MHZ) {
> +		dev_err(priv->dev,
> +			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
> +			__func__);

I don't think __func__ brings much value here, it could be dropped in
the process of moving the code.

Also, the HWTRAP register is already read once, here (stored in "val"):

	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_HWTRAP);
	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
				 20, 1000000);

I wonder if we really need to read it twice.

> +		return -EINVAL;
> +	}
> +
>  	/* Reset the switch through internal reset */
>  	mt7530_write(priv, MT7530_SYS_CTRL,
>  		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
> -- 
> 2.39.2
> 

