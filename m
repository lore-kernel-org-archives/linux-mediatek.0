Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5705AC7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=; b=3euj3KDRX+OkfBXzJOUColk/Oa
	saKN1Gl/xQwAKYO7goIyo+v2806fX5QDs0o4ht651aGzYM1FR9HJQobPI311NliFW3siGkk3U5emv
	D79lSiBkNzqiNpM6Qyyr5ld0TDxNW/6yHAr0lcNky8EU/+GkYBjl9wKZgjH46xPK3H50rK52KfbIa
	d0a+1C+HPxHJ28ZgwkfkVWPQ63JIb1qVqkOh01qYsXOr+6fEYtGHT/MeA7G1eRz4gmKKWbwvk4jg0
	U4V0tYLc0/5SFHhhswQlSG4LyVrdEu3obaouiSw3Ed/TJJHeSL9rV5qjIk7XUeuPQXvIucuZIGiXl
	mzlSM1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6hJ-001DDu-1V;
	Mon, 08 May 2023 19:39:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6hD-001DBz-1r;
	Mon, 08 May 2023 19:38:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96598a7c5e0so789856866b.3;
        Mon, 08 May 2023 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=LdKR+DvwekVyUqgb/OT5xTqhw/MViMQ2grjMX3F9EokLXqNtqQu+Yaq832aoIGmDUD
         lhFJulZucMOiVKprfDsGQg9GFm2RX72N6K4RFjcwnLALtfKYtElM4ySRQMBQ1AvOcDqt
         8P4dmntcKQTi5iP7QRCEAwIgDsBHatpoJLQksY2CBr0/CbuVNwuxoIne1er9XhoRQI+C
         Ifcf1ZXUagIN/A33dX2c5xKrqXa+QMwky6t/Mba+jSXTPJHMtanSbaWx9Uo87ctCq6Np
         FIonibR0S5vhRSKVOKruXgY14G/yJg8NCal6Ar8m/NHKoxaj1g7jRcJvWV+49tuOAONI
         5UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=jBOzs4Y1OFYhBm/wWS5Fm/Dyb6c018r+MQT9f1TMwfZHGb6tqJVQ7NqF02b1alLk3+
         8AmGjvmQ6EwQnQojPC3f3tZzXZYKumc6Joq8K+OOy0tqi5hbPjF2b+ZceX4FOBwEAnqy
         IAKaoznkTj0QcTtDM8syplxYs2rkleRCBFKU3Mx6FGEn/+Y/MNdPPDcTQ1FrLrDMn8KN
         IjP0urZTO5mBZNlBgAeWO3zKH18z5gtnarmEYvoMvTc94+fQQT1jl+7d7CTqlcWM+ORW
         hNjeMbQgV/jFtYEB2AbBMYWhoyhGKq4v4nt9dTtg0caDztIRsP+aTBb15Bal+FwsIyS6
         nQvg==
X-Gm-Message-State: AC+VfDxmrx9TgfR4Lt7oRdoYp7adSlDMgbipokP1XDSXn0j62Oiibktm
	0Xd4zsaWsL4XiyMexYc6THeIQgHi00FQk+YkT7I=
X-Google-Smtp-Source: ACHHUZ6dsVgo1prYYtLrJg0gIiYhBjQNx+st7OeU+cr1SkPuxS+S4CB5SSBSFTCcvBvNJKZ/6ClIl+DTCz2pkxjEmWc=
X-Received: by 2002:a17:906:dac5:b0:94a:4fc5:4c2e with SMTP id
 xi5-20020a170906dac500b0094a4fc54c2emr9330195ejb.49.1683574732223; Mon, 08
 May 2023 12:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de> <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:38:41 +0200
Message-ID: <CAFBinCAXQywWReBbqRCgB36gKGjhX9Tx6g-8OTewt_xipdhp3w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 01/11] net: stmmac: Make stmmac_pltfr_remove()
 return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_123855_613984_036530A4 
X-CRM114-Status: GOOD (  11.39  )
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

On Mon, May 8, 2023 at 4:27=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
For these two Amlogic Meson drivers:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

