Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E62C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVpwhBhZjm4u1PvolKtSrwJ++hTN+rljYI2eWWd/rv0=; b=Jy5Di/mkFVDF5H/dZjjF84Ka05
	pKP9e9El9p03SBquLNjJ4MaBGLFBlPWNeQcAvpwiRbp030er0/gkz49MnqLA7gzsitGcpRvqTbYIg
	Uq6L0Z6MtjYFJAeIDfpIpHGX6mW6swdSk3KVExHo4FpyfV3mUhaXlKgkM2PaiYQuH2mJuJbf/YTkV
	MniEY7Go8SogNFzoNv86ryeq8MmBTOWA25gS3nQ/mkCqf9/OpWWed+1ls/DfD/GudIHgfRJbRj/PI
	Yylw5keK9/CxYxjL7/gmb8WB2WjE9d4u+osxBJi2Dk9TO0ZEnxkigg9/+m/GZdDbnMD/nuOt9MB2P
	wZ/xMebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zau-0030hI-1q;
	Fri, 26 May 2023 15:43:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zar-0030gQ-1d;
	Fri, 26 May 2023 15:43:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso167957566b.0;
        Fri, 26 May 2023 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685115782; x=1687707782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVpwhBhZjm4u1PvolKtSrwJ++hTN+rljYI2eWWd/rv0=;
        b=g1pKCw2HscEcTD2GSPzJcYYGnMv+ROG4mE/6/SigjSTX8eiwhWxP0BhCD/H4icUkHo
         r6IuwTfsrmcU4LAIJVM2PyWwd1bjjyBBr034WXEIrlxXQI/LVBM+E7EA0elIQDJ8Djtb
         N1wlACq8KMzwqpp2rfsQ9kL9GQYnAiEPPQIstlU7wg0AJ2zqHuo1am4MzLj4YdNLdQct
         /cOWOV/PTUtDKBa9rsYWxTuzYvyrgn8b/8WfUUnYgbaI+GfsAdesMSD87roP64nEs6pI
         pgHKPgiUm+GSZ9nCCBXCnp0Fx24vq8yR6H+DBI3k8a4/lJIQEgJk0VYRpcVzZLd3Ev3u
         vcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115782; x=1687707782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVpwhBhZjm4u1PvolKtSrwJ++hTN+rljYI2eWWd/rv0=;
        b=Lboh37iYyDxx5TFaCXMpIDhfKruxU/BEiVA9/WenMCviDyase/l7LYn4jghMi/7Qt5
         XGxhggDb6UE7ut42VutjtFWXuIyYRXGCsXCFl777520EpGX1oD7DxOfZfeQABV4E5r1T
         Ys1+zIOppkzMcpHF/N6CDoYAp+0SvcQthxaoj4E90ZMKXLHxo/B7gI5oJUZu1b3uq6kJ
         fI/EW11OuUwMkTEG3Hw0TkxIl/y5ngqxkrO5gWVW+2ybQYod4BcmwoYzqClmelWdhxG4
         FRKp53SI59I5SQqGKuYnsBOgViJyqDrgo4znS/Lu6SAUZfzCn3vlAd6xYyEP/JJrKjNo
         DH3w==
X-Gm-Message-State: AC+VfDzfIjgDFovusb5Seykl9mQvLlE9XdcBDP+FaSSp//9kjSAUTLEE
	MH2N/0YF17x2zbMX5tCfYPU=
X-Google-Smtp-Source: ACHHUZ7ENqk+5BVzxKJXJxcqn1R2u/aOB0IQFM/e6/2oz6itZMbKG26Hj93JeZvFUEvEL21RD2w5Sw==
X-Received: by 2002:a17:906:ee82:b0:96f:7af5:9e9e with SMTP id wt2-20020a170906ee8200b0096f7af59e9emr2410888ejb.53.1685115781493;
        Fri, 26 May 2023 08:43:01 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id gr4-20020a170906e2c400b009660449b9a3sm2266901ejb.25.2023.05.26.08.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:43:01 -0700 (PDT)
Date: Fri, 26 May 2023 18:42:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 24/30] net: dsa: mt7530: rename MT7530_MFC to
 MT753X_MFC
Message-ID: <20230526154258.skbkk4p34ro5uivr@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-25-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522121532.86610-25-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_084305_543096_357390F3 
X-CRM114-Status: GOOD (  10.45  )
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

On Mon, May 22, 2023 at 03:15:26PM +0300, arinc9.unal@gmail.com wrote:
>  	/* Disable flooding on all ports */
> -	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
> -		     UNU_FFP_MASK);
> +	mt7530_clear(priv, MT753X_MFC, MT753X_BC_FFP_MASK | MT753X_UNM_FFP_MASK
> +		     | MT753X_UNU_FFP_MASK);

The preferred coding style is not to start new lines with operators.

> +/* Register for CPU forward control */
>  #define MT7531_CFC			0x4
>  #define  MT7531_MIRROR_EN		BIT(19)
> -#define  MT7531_MIRROR_MASK		(MIRROR_MASK << 16)
> -#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & MIRROR_MASK)
> -#define  MT7531_MIRROR_PORT_SET(x)	(((x) & MIRROR_MASK) << 16)
> +#define  MT7531_MIRROR_MASK		(0x7 << 16)

minor nitpick: if you express this as GENMASK(18, 16), it will be a bit
easier to cross-check with the datasheet, since both 18 and 16 are more
representative than 0x7.

> +#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & 0x7)

also here: (((x) & GENMASK(18, 16)) >> 16)

> +#define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)

and here: (((x) << 16) & GENMASK(18, 16))

