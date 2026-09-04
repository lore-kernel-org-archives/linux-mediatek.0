Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FAC624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=; b=33AsiskSS/LEvM30xOnguWwo3T
	3OcP3Hm3ZfYb5KE5HhicAXNEIhp90+v9kLsE1zd78E9LKRF/LBTvxQM3Rloh8St11ZgWT91CpypoI
	YCdDYyS/5r2C8XZ3Xulz+SDnavEarWNhyIUcp6GNZK6ZoeJf+B/WcenEks1sCpDUqn3odJFsdI5dG
	2pgYqCWT0hevJgnywiNZkruBXvwSWPc2iINIaCEb7J6ogX7P6egfEVH2UoCS3RA4gLJQjZBJ8apGy
	PgEZbidr1avF2JNQ3sl5GcSJpUd8NuZXfgX4m+Z4yXp3BIC4AnkEX3Jx7t9WMaxOAMgawXLl/Fgti
	T6tk4DNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PAC-00000001MU3-0m2L;
	Fri, 04 Sep 2026 08:20:44 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PA9-00000001MTg-0Grf
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:20:42 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf98dfso438175eaf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510039; x=1789114839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=;
        b=Xjt8NgQKQtV/R9KqjQ49uem3R+jTegKiz3DR6V3kVBjSbdRFNXDm1VavCacMC2lI8k
         T2Gnsr8CetkwTSBBRXBr+46RMzkwPrfo7FK9FrKde8DTIwtEVoKZ3SiJ9ZQdZHMuBGqq
         sxMM7ObE0mC+Vf1FLPxIkNEi/N+sFgieHY0c17VhiBmxCBVz07M1I85LG6EpMw/UoxT2
         IcokfYjcTfpw7jzd1VJVpLAZIxyR9p5T5KpzLvmCCtzw7seSKe93k4zShder2u0Nepkd
         X0yAfmgiajEQ3xIXgnWeaIp1v/vRmQ/aOH3Npb2JOmpzvSgUJ3xvTTpv2nKN3Q1NDl4I
         hyBA==
X-Forwarded-Encrypted: i=1; AKwUvBxEaDuehhQOjBD/td+IgQsql7+SvrAk8s3MhAhHpTx5xCt2qVej327MiOn+OwjFRmT3cFpo407cIU+TdPJPXw==@lists.infradead.org
X-Gm-Message-State: AFuF++n7hhYZvevrEs+jVnyfolawWs5yHKdXKUVMYOA8sfFC/iHtpxjm
	Rk8bvxAKRRUS5k/pWCmbPzkpsq4bY+nXZCUGgBtY1Aj8bIx7YNgYC/Ae7wgnwwuAaBA=
X-Gm-Gg: AYBFou0/+kRF1Tl1pNdC+O8FFi1C6vsct+qz9/2cZQbbbyjadWsSDizDzXP0Ay5qQxE
	iKWPiCTw7S7BHbmNBji3FJQRG96W9+rMc3t2Q9vjoRa1xkeYCNMY4H0pj+cuboQSk17ssYuS6wO
	HYT+NjW3YFOdnc8YKzhP+zWzFt4K1AI85DdV8gD8XIRM0Dw8RaKnZAr5a/HnpYXVS0MOdDZXEaf
	IkcYSbgelvzYTvx2GPIXjdji3rXfwa5E+NI3JmK6KoDq2+vCXWhG/Fhf5YKvqwQrM9xbaXOymNB
	RfmsjkxI3qXLGlphg46dGB8SOXXli0kZO1TJia1r/gTTHDLxeC39m9s1H2NN50J3eoa67RY5fYM
	piWeBIr1p0OGK8k6TTYyw/VydIUzObpxzR4kwCQmucaizafWTozaQCh4PoYg+mdAk8s1TeLrcck
	uV7TnVPW1AzPALijD/sBXjyfgJIUrMFjvlCmLNydCt7UMRn5x6b/WPGNcDIso1A2YPu/4TFiqGa
	PLQQgR6mamhjq0S00td2Yl+ag==
X-Received: by 2002:a4a:e904:0:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6b783c603b3mr910391eaf.49.1788510039396;
        Fri, 04 Sep 2026 01:20:39 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dcb85657sm2284329eaf.7.2026.09.04.01.20.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:20:39 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f48c750afcso642903a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOdIii2gCP24eqvY32L83fdJkeCfgHDxttlrXK17CvkkwUY+er6tYLyYH4nHBtM6Wg5txzcAh85LzN+vAN6A==@lists.infradead.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr984477137.7.1788509665014; Fri, 04 Sep 2026
 01:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-23-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-23-s-vadapalli@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
X-Gm-Features: AcwNN1UYeUOEoTpTj0vmkU4IKRIpHFGa-g95RrL_FdgZr5R39yo0yU6G4UOZ8vE
Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 22/33] net: dsa: rzn1_a5psw: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com, 
	clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org, 
	rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, 
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn, 
	kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org, 
	vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_012041_127286_DBB35B85 
X-CRM114-Status: GOOD (  15.06  )
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

On Fri, 4 Sept 2026 at 06:41, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

