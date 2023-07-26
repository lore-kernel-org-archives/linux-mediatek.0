Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63717C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPWzpufJv6n62uslZTbP65dBXeCecv6//7U8vz226A4=; b=a4mRli+yrNWSqBVbl0wdvpbOwQ
	jfYjOWVih+Kv6YDd3W9dCTwX8hhfGWeMZ62Qo67bfkiM5biHW74UpS7ByyaluyjAlNsRh8nqbfEuX
	/A2D4Jx09eY33Q4gOCsnJqBunOPQIgyzb6JhhJxAdAbVPpBngUV2jdR4Rck4KWKQ+zMte8/N2F9SB
	ALp/pfQLFkIaqIUhlPuGiRQPunI5Xl66Dgg+TU6CUqli/zgUaHSrs/eV3kdVmCXA/VL3EXIHPdxY3
	7Vfkuyyi74Y7pM4ybIkFCDSW4msAVrq2kXONmNjh7jyPlep7mj8Yk9/i7gz+9b0isG5yhJMYIwijp
	7SjXGNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOeSz-00AWOe-1b;
	Wed, 26 Jul 2023 13:22:13 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOeSw-00AWNW-1n;
	Wed, 26 Jul 2023 13:22:11 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so10419872e87.3;
        Wed, 26 Jul 2023 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690377723; x=1690982523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPWzpufJv6n62uslZTbP65dBXeCecv6//7U8vz226A4=;
        b=ewpF9oz+uxhIZKk+HzUv370fc6StqAv+3SfLkcmwF3t5VfkJFS3RbGlFqoCCyoynRc
         W8tOXEg1WJzADL8UXDNNoyqdobUJ9cpKVE0SNXiBf7ZlFgMJcEkt17f+vqVi++vFoysW
         0wXqYnl2qvhmh6/BVHYZ+WHProF1bCivgcoLiUa4EtjPkZhZMS8ABJY1CQHWFmbm6eHD
         lP77rpRYF/5JIePlt61ThEqkGf+tmcFnHh6kDyBe7X7D7qVqmdvYc7l9sNgDtISlllIA
         9W1DRoTQnLozR2kCMMkmo7/9Ivuv2Iwkt/PoMNWJ3Wg1tGqMhoBEsBf+CtpmJfIbV8kO
         nFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377723; x=1690982523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPWzpufJv6n62uslZTbP65dBXeCecv6//7U8vz226A4=;
        b=Z++4cOrl09SHQ75m6jRJ3RySEVmzxgxHBXokWwP5pDRtNV1uC1U2OMsEQaMCzV0haa
         B6sJT7fBM8L5ntk+hmoPbmKsuSaDrr8GHE11CoNDInyHXRY/vpfZqI+3dHb4RNdfckme
         tX5PNSvutlo5Lteym29F+STuqqgul2VvmgzIiiAJXoX/J1ddCgP/zxgX8BWvUrAzGvpm
         niz/uWZ/9IOYjJsel2MXqELdfTFCliSWbkphFyg6NDM+/4lUQm9LoMyOS2IyeAVf4wk3
         A/DLZ7jG5W2HQNGXe3Vm59tbdzgnGvi2FmA6ML0UcJHveC60jzZu7aml8JWvYWncWXVo
         XSNw==
X-Gm-Message-State: ABy/qLZmhfzLX965rHpyrutzws+76iICTH2TOre2VhdEMRxfCgZ8Tv3r
	U8FoFrIIpk+hRdE2ZbaqmQA=
X-Google-Smtp-Source: APBJJlGrVtjZgA1ReJiDb3S0p0zyLFY5w1xsxsReaY7BnpGYnv56qAkNuEZZeM3E1fI6AMEfVisIOw==
X-Received: by 2002:a19:e05d:0:b0:4fc:6e21:ff53 with SMTP id g29-20020a19e05d000000b004fc6e21ff53mr1406574lfj.11.1690377722464;
        Wed, 26 Jul 2023 06:22:02 -0700 (PDT)
Received: from skbuf ([188.25.175.105])
        by smtp.gmail.com with ESMTPSA id u2-20020a5d4342000000b003141f96ed36sm19868392wrr.0.2023.07.26.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:22:02 -0700 (PDT)
Date: Wed, 26 Jul 2023 16:21:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] net: dsa: Explicitly include correct DT includes
Message-ID: <20230726132159.rni7zc5ayu67tkxv@skbuf>
References: <20230724211859.805481-1-robh@kernel.org>
 <20230724211859.805481-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724211859.805481-1-robh@kernel.org>
 <20230724211859.805481-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_062210_598165_4718CBBD 
X-CRM114-Status: GOOD (  12.02  )
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

On Mon, Jul 24, 2023 at 03:18:58PM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

