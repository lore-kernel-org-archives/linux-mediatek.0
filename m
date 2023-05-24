Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE61C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXu0ixlx8Bs2sZSoysi/IhJBHkMW10MSkaolKltVuIc=; b=clwKjDq0RzeA6Z+cxtu1ZE5F6f
	a0JHYumKPyN5hmfweQfsxUILHJKIqV0aJcWmTA+vKs1Fmeu4PYrYZMaUT+cljbHnB2j27o2yDGppD
	9x32t0c516yGk8jqr4C6uewtsUBzzL0MbA8/tQSgnxO2uLZfTYM9CK1T9amKlZ4OAc8WucliJJP9V
	1EdhBmcRXCW8D5Ip9J05tMJwB1OicHOKVQ8z9nUl8SZJiQkOMcOrLexEH3woN5X0C+otC/YLu7jqb
	nrMNCjfQFa5LfXL7ucda47+u2iQEEV/4z0v+stQzOuiiXINFR65245dLtxn3ZFuG1Fvtw2On1c2hP
	aF2QR0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sdo-00EGIZ-38;
	Wed, 24 May 2023 17:51:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sdl-00EGHe-1p;
	Wed, 24 May 2023 17:51:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-309550263e0so1110631f8f.2;
        Wed, 24 May 2023 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684950671; x=1687542671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KXu0ixlx8Bs2sZSoysi/IhJBHkMW10MSkaolKltVuIc=;
        b=mnEHgyY864hpBjo7R5SdoPjJ7JaKoORJvAFOHIYOSexsbbh63yxp4u6N8189wW99WO
         aA/jkEaSFqPnDDQzJytp7oUWre0qxSomOoRo8wzLv2c3/z2sofe+h+0TAN7XrsHlqUtp
         hbjTvAGG/kLdZBUI6eufDe1xrm8BIS8JN+UO6Pp4n9tplrUGlIVlywDcG6Kp/DoNYkso
         0iq3Ka/xRlOmbnrHVKiOPgev9xXzisT1/F0CEd9HyqGUVyE0CoYzGx8jMlDzGCit6uuf
         An0elB2H8GGx6ywDd1bR0o8o2YEpR5b+gmsjUQyk9G0uuh8wmiAavVcsiJdQbcTkGMwt
         EW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950671; x=1687542671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXu0ixlx8Bs2sZSoysi/IhJBHkMW10MSkaolKltVuIc=;
        b=iciygSzuR9HaGimrj5rlNWdwxK4uElZxX2+LlAwb4gJMmqKmLDVkWP6DAaEh5WqslH
         XJhQUYZFgOxAUwCLKlpFCelYd62fDmyK5zmgadkF2iftJ1yxB5CszS+xJKJxg+tjCNPC
         EzzwQyqJ/jPyiK2iahwrYb9ft+rYVAQX/yFbe1SsBTwfGH/vrRi7nw+sR0G+d+u9cdts
         rUBtMu5VChV2rbmNUFvcxM8ebrSblc4sYD4sTAaHnK7PBe9o8VkK57e4hR8hLJZY99CF
         2JY1qOTLeb07L165YxT71KXATX3KffdcE72I5DVDHjCC53TUnR9aPmU89S/0LMn0Qs1a
         zAQw==
X-Gm-Message-State: AC+VfDxeeFGICLydKt25+8QI4Qn5Q0Fp8pn/ltuOOunlGdTtI0WSNKpZ
	4f6qww4vuyOLIWi/UX2AAss=
X-Google-Smtp-Source: ACHHUZ6nHg6JV7rZJSiLV0PyiRpmf9YqEVbQKw28lyWlqt6n76W+PRApJSwU7hB5sHXKVHqSoxPFrw==
X-Received: by 2002:a5d:6acd:0:b0:309:334e:ee3f with SMTP id u13-20020a5d6acd000000b00309334eee3fmr417808wrw.44.1684950670986;
        Wed, 24 May 2023 10:51:10 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d62d0000000b002fb60c7995esm15313560wrv.8.2023.05.24.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:51:10 -0700 (PDT)
Date: Wed, 24 May 2023 20:51:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20230524175107.hwzygo7p4l4rvawj@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105113_605236_01652316 
X-CRM114-Status: GOOD (  12.67  )
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

On Mon, May 22, 2023 at 03:15:10PM +0300, arinc9.unal@gmail.com wrote:
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 710c6622d648..d837aa20968c 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2728,25 +2722,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  			goto unsupported;
>  		break;
>  	case 5: /* Port 5, can be used as a CPU port. */
> -		if (priv->p5_interface == state->interface)
> +		if (priv->p5_configured)
>  			break;
>  
>  		if (mt753x_mac_config(ds, port, mode, state) < 0)
>  			goto unsupported;
> -
> -		if (priv->p5_intf_sel != P5_DISABLED)
> -			priv->p5_interface = state->interface;

If you don't replace this bit with anything, who will set priv->p5_configured
for mt7530?

>  		break;
>  	case 6: /* Port 6, can be used as a CPU port. */
> -		if (priv->p6_interface == state->interface)
> +		if (priv->p6_configured)
>  			break;
>  
>  		mt753x_pad_setup(ds, state);
>  
>  		if (mt753x_mac_config(ds, port, mode, state) < 0)
>  			goto unsupported;
> -
> -		priv->p6_interface = state->interface;

Similar question for port 6.

