Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EFAC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 15:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyTsS0N9nnty1CNb27CMYPQxvCHWi9OMqi5a0wP9j2s=; b=Y8IeaTvKHNpR2xkku633m8jRHO
	cmD/twfQyLZZfDMuQehMm0XZAgubC3mTJX9AI/IQn+HpIis+WWM4VaTWmPWRGaesw7S8fqjf3C9wt
	wryLOBopaA1NfQNrc0RsvYXycidvfutTFP+/PfCshoDH5uLnFgtS4JIddOiMPTu0O5AfzNhzufPkq
	dbnzuFgiYXy+MrLPkG9gN8e3MC3t95VBnWMqYw+ozWpJrynSsmENILGgSfpeGw0da52vC+6KXipyN
	lbd6Iz1difmdbLrHUjb7ULjcZ/DdvSQ43AVA98w4BwyH7P0cOgQbfc6ownU48I4xPUQQGcLMxnwYF
	FK354YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ8a-00HPtL-16;
	Mon, 14 Aug 2023 15:05:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ8X-00HPs3-21;
	Mon, 14 Aug 2023 15:05:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c353a395cso595877466b.2;
        Mon, 14 Aug 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692025538; x=1692630338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EyTsS0N9nnty1CNb27CMYPQxvCHWi9OMqi5a0wP9j2s=;
        b=DhKCmnLAU3vKa+c63Ab3ZbNzOJF5Rd10Kc9ygOR9MdCgf33F1W2wJ+KLxDqvTOj7dP
         aeXZloIZpC8EASxfeo9AlS7585pYQfHzUDG5pufF80JqMDNlmxATLlRG6qpb5ITT60r8
         iJ7x+MfBG4vTJwiHfyTck1hNlMJDzBizDfuDpsYZGfNXpxPNEergJNzwhjE4vUcNDeTU
         EA61BjvUsLsffFjkerEvIUu1NLQzQwalozaMllc64X7vEK6czeGc9u5xkytnctpv1TlJ
         ntGAeQ3MXadQ0u32dgS0VjOBxadiFZ3j5KRRG7f8wz0kLXaUA5OifhNc1mpriCMxTLmC
         Zt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025538; x=1692630338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyTsS0N9nnty1CNb27CMYPQxvCHWi9OMqi5a0wP9j2s=;
        b=IzNYGbH9qvpeO43vQvYJmt97QewGRq47TD6gma5eFp99u0MaaMQ2vB0E+DtH5cZ3gf
         q+HXwIS3ahCzRE8KSg89d46uJu5CCAIJ1TxAC0Z8PcrVdXVcICniyGb0C+JmLhocO9RJ
         kGMEAxHTBF3UiGgLfiIcl8+PiMyxQJpqZdP0/cUYcmjXJXlKZGZyhmCwkGIbzqN0v96U
         bZIFMoN3a9ex/A0eyU8z/4FESaddRA+BbXjd3GCF32aolaboPhlmTg1ssuPtOS6bCEXQ
         gvzlkhR75DXcKCecKeg1P9xLvO1ffDu4vYghjJfDReylLJE7UjH6xMWPKJNms180NI37
         dJQg==
X-Gm-Message-State: AOJu0Yx6XhzXN+RB2Sj8do2jM7OPhG4ZSznwZ6CRyWp9DBQPJOfc0e8E
	rmsfYv9Xdpog1ZSQkO1quMk=
X-Google-Smtp-Source: AGHT+IFyqU7M7LIUAcZuycerhP4j/Ml64BlmKcgq9L+T+xxUcVhsh2dcGYhtmXx1QEU034EO5nJGPA==
X-Received: by 2002:a17:906:cc52:b0:98d:e605:2bce with SMTP id mm18-20020a170906cc5200b0098de6052bcemr7187517ejb.46.1692025537888;
        Mon, 14 Aug 2023 08:05:37 -0700 (PDT)
Received: from skbuf ([188.26.184.136])
        by smtp.gmail.com with ESMTPSA id g11-20020a17090613cb00b00992d0de8762sm5744792ejc.216.2023.08.14.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:05:37 -0700 (PDT)
Date: Mon, 14 Aug 2023 18:05:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: dsa: mt7530: fix handling of 802.1X PAE frames
Message-ID: <20230814150534.epuluw2gfldrtgnl@skbuf>
References: <20230813105917.32102-1-arinc.unal@arinc9.com>
 <20230813105917.32102-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230813105917.32102-1-arinc.unal@arinc9.com>
 <20230813105917.32102-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_080541_666126_1A33D21F 
X-CRM114-Status: GOOD (  17.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 13, 2023 at 01:59:17PM +0300, Arınç ÜNAL wrote:
> 802.1X PAE frames are link-local frames, therefore they must be trapped to
> the CPU port. Currently, the MT753X switches treat 802.1X PAE frames as
> regular multicast frames, therefore flooding them to user ports. To fix
> this, set 802.1X PAE frames to be trapped to the CPU port(s).
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 4 ++++
>  drivers/net/dsa/mt7530.h | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 38b3c6dda386..b8bb9f3b3609 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1006,6 +1006,10 @@ mt753x_trap_frames(struct mt7530_priv *priv)
>  	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
>  		   MT753X_BPDU_CPU_ONLY);
>  
> +	/* Trap 802.1X PAE frames to the CPU port(s) */
> +	mt7530_rmw(priv, MT753X_BPC, MT753X_PAE_PORT_FW_MASK,
> +		   MT753X_PAE_PORT_FW(MT753X_BPDU_CPU_ONLY));
> +

In the interest of efficiency, this could have been merged with the
previous write to MT753X_BPC, which would save some MDIO transactions:

	mt7530_rmw(priv, MT753X_BPC,
		   MT753X_BPDU_PORT_FW_MASK | MT753X_PAE_PORT_FW_MASK,
		   MT753X_BPDU_CPU_ONLY |
		   MT753X_PAE_PORT_FW(MT753X_BPDU_CPU_ONLY));

In the interest of readability, this is probably fine too.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  	/* Trap LLDP frames with :0E MAC DA to the CPU port(s) */
>  	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_PORT_FW_MASK,
>  		   MT753X_R0E_PORT_FW(MT753X_BPDU_CPU_ONLY));
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 08045b035e6a..17e42d30fff4 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -66,6 +66,8 @@ enum mt753x_id {
>  /* Registers for BPDU and PAE frame control*/
>  #define MT753X_BPC			0x24
>  #define  MT753X_BPDU_PORT_FW_MASK	GENMASK(2, 0)
> +#define  MT753X_PAE_PORT_FW_MASK	GENMASK(18, 16)
> +#define  MT753X_PAE_PORT_FW(x)		FIELD_PREP(MT753X_PAE_PORT_FW_MASK, x)
>  
>  /* Register for :03 and :0E MAC DA frame control */
>  #define MT753X_RGAC2			0x2c
> -- 
> 2.39.2
> 


