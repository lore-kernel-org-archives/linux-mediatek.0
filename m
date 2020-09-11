Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F42C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 00:57:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48000214F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 00:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tw0Ndj7J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="FLH0ZPoi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48000214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdQx+y70asozwVfYMaz/YKsAyKmG8mqi/MqbduoGfiA=; b=tw0Ndj7JjClUs8UufQfoK6Km1
	0R2MbyaLr1Vtv5idM/7BWcztkYUPxrdZE67IWzaCwC7/JZsA5HhOkFczOJ7gTeTxkMFWgx4eM7+Ut
	yVFBc4aB17D9Vm2pgY4CdLwpx4pBhlNZSoNki6c4WJsHbQde/uwGtrPRO0NyyxJPetg07afNNGNxA
	zWsiRDF/8Rq6X28pFubwyht5C3U652iu8+xl/eh69JOUdYy5Kp87K21VJV3S3wUBo9Xgi2ItfOGDh
	kKtJk5IaEfHzIBA6L6RnUu87r24gO07HuK8IvsnRjuuGd7yEzTqruKMWgYD/I25InI+cr9LSsTzri
	zA+MKxSOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGXNI-0007PD-QC; Fri, 11 Sep 2020 00:57:12 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGXNE-0007OY-V1; Fri, 11 Sep 2020 00:57:09 +0000
Received: by mail-ej1-x643.google.com with SMTP id z23so11397224ejr.13;
 Thu, 10 Sep 2020 17:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
 b=FLH0ZPoi2B+nzLIURnXoKuWbMep6zKKPYC6feQLG4/bp/nGSAzqy6LdsXV3RObmTc6
 8YEO0znR4SkOvCAXPwiiYCi3FAjn0RenWwpx5dI/wvCOpBRBA+H/v0l7tO7VVNpkAYqz
 9fQt/MnfMtup4vD0lMBU5WRFoYhppvFPeLw+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
 b=OL55dVPCxW3vuXeUCvokQi4LRT15evPYMK4aDyq+MseK/Do/8hbTxe0pLaLXnREZkF
 GsYzuPVT7LO34jSYGqtF2X4IG2raFnj3Bg3vN2U5iFejsPQrCflHEOehi7xf+xOZ3Ur0
 r8TUC2V7GDnO7PgdayErsNuc17ZJ7FA3WfK9tMwmUNahVQCfi9x6jHs72ohkJ7w/FpNo
 Hk0XG/zDD29lrNebU75T3dH+0TLFkbA1dSinP4UzWAaOwL+2w722n3EncU6aK6U1eI7C
 xMUB8O5OOLsfhtJ39TCTA7jfnzMEqpBNNDOc3Eg/Xohd3IaHlTKqGgPgXyhn9l0kaNyQ
 GWaQ==
X-Gm-Message-State: AOAM530RiAxRvKuQFjF5gzQCimFyq5pzb2cRh637e0g2DfWYmL0MtpAC
 7esOrIdxyCKdhuSaOw+vfkqZb95GRKt7D9ylgJU=
X-Google-Smtp-Source: ABdhPJzN9op/B4tSTilqcYoFaNSXY5BFurioXjFk61As43aUOnnnkGmnc7IPzMBe//QTkgP458J0K5uPVCUqFkW/EI0=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr11306983ejb.442.1599785825728; 
 Thu, 10 Sep 2020 17:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-12-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-12-krzk@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 00:56:53 +0000
Message-ID: <CACPK8Xe8ufYxKA_Xh7D=TgocRFQ7BKFdm_Le-Ob-QxZWm6PZJw@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] ARM: dts: aspeed: fix PCA95xx GPIO expander
 properties on Portwell
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_205709_176298_B731E549 
X-CRM114-Status: GOOD (  18.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>

(This device tree can probably be dropped in the future. I heard these
boards were very hard to come by even a year or so ago, and I doubt
they are still in use.)

> ---
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 4a1ca8f5b6a7..03c161493ffc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -121,6 +121,8 @@
>         pca9555@27 {
>                 compatible = "nxp,pca9555";
>                 reg = <0x27>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
>         };
>  };
>
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
