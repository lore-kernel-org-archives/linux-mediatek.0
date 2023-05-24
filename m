Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D9C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfGLZw2z+tAZr+6s+X0j30LWgWmr1sjapi3S4gBoOoE=; b=3zX7FAW8W4OfP2fzILknibUnam
	ghQG7z8dzjet4yzrrfgTwksBxSJRrX5jqk4HgX1Cb/51Smar9aknTjTfl+5ESWthwqHTSlP28GGYw
	ox1Xgv6c+hgZarpunX6Go78HWeE5I4v4cAC2uDdUbjQo2nXVkyIei4ahOOREMWysxafw/JWbo+FIV
	/jwCGfCi0lT3WjhVDiLXqsSntApv8KV6/wDew3BVtI6zg8+j/VycjGwjKL2Z6O4MAMinmdbVCvOv0
	os9R8vML3RTpZs9xS5Ck7KmaZCRg7qTImKtIdhXhHg2ujn/zAJVNbNTg/a+iSd+YRMEzwF4dG+PY2
	uEqgGGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1suz-00EKQh-24;
	Wed, 24 May 2023 18:09:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1suw-00EKPf-02;
	Wed, 24 May 2023 18:08:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3078d1c8828so1116008f8f.3;
        Wed, 24 May 2023 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684951734; x=1687543734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfGLZw2z+tAZr+6s+X0j30LWgWmr1sjapi3S4gBoOoE=;
        b=q2Qo/qX8aKcmWcJF6gy59FYxkIpVa4M3ttp6vJ+895IAyMYhWwyvmHZem4b3OklFXl
         3KLIxPfVtUUv8qJ9HNCGa/v53XeaPDZuKXiLlesaPC32z4XP3PE2JyZ4Ynofa0TBT705
         E1FjhXeuZ4i0Eg5AkY2inXfcyNxBglrgJHM670xgpSxvu6Z3Hzds9Q4H2ncmz9NOOf3O
         g1gwwenCgUxADya9eQADwSIeoztpdPxbhc3Lz+AzlyfGReHz98nAhGGu771h5lYH0CPt
         b1NYobKxN1J9+4j4YwIuyDAYMmlPmbylhJyrKYk/CUXNowj4iu0fAUMdkfd3QSIceg7H
         8tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684951734; x=1687543734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfGLZw2z+tAZr+6s+X0j30LWgWmr1sjapi3S4gBoOoE=;
        b=VRSzhge4ZbnQEMxTCNJllXqB5eNCQlwBdfSqPGkLN4PvGMaZtUpnp1XypxHjqyG2HU
         1iph3gsxTKvVm8ccAhOIN45OBoIEto1n4oXQrO/eM9VNn2z5/NueFwxuVrJPwxJpy2N0
         uc05gj5YFqg/zP0xM2m0xMXrIFz+arIH4DFeGZQcO8FR2mVxgDSkggbTK1j4eFzVjCpC
         rs9jW1VANYpj9le90zCbDYqKI5abqS00ISTsK9D8/B53MH0szPglpz2Qi+ci0azKkuqp
         6t8bn0oh+dts/khqh/tKqUPi/b6zWwr5CFHI+PcanooR049ab3Qc8ScMiPSoaDtLJEOo
         cZZA==
X-Gm-Message-State: AC+VfDxC/RXMHXKDPfhPBGsiI01LO4JnjNiD7aq9rYEI4O03IJ97Va9E
	ZDgn8BPNTxFQR8CQa6ci6G4=
X-Google-Smtp-Source: ACHHUZ7Sf2YAfb5nZ0EbMpVeLJE07iRbAvLYuxkXBi3WWvgytfj3s06KheXiSrJJ0jg3a742Vzfx4A==
X-Received: by 2002:a5d:5384:0:b0:309:566f:3cd with SMTP id d4-20020a5d5384000000b00309566f03cdmr405284wrv.6.1684951733913;
        Wed, 24 May 2023 11:08:53 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003f4283f5c1bsm8637601wmq.2.2023.05.24.11.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:08:53 -0700 (PDT)
Date: Wed, 24 May 2023 21:08:50 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 10/30] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
Message-ID: <20230524180850.7zelk6x2dpiwmnw6@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-11-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-11-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110858_074528_E9CD1446 
X-CRM114-Status: GOOD (  13.85  )
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

On Mon, May 22, 2023 at 03:15:12PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
> things than setting up port 6. That part was moved to more appropriate
> locations, mt7530_setup() and mt7530_pll_setup().
> 
> Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
> and move it to a more appropriate location, under mt7530_mac_config().
> 
> Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
> pointer.
> 
> This is the code path for setting up the ports before:
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> -> mt753x_pad_setup()
>    -> mt7530_pad_clk_setup()
> 
> This is after:
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
>       -> mt7530_setup_port6()
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

