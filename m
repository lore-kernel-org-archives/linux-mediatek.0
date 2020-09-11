Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA7EC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 00:58:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF0B208FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 00:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSKF3bgm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="I/FT26ZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF0B208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hfXplmbUECRWBgSTHtthcz4zetDbdgWhlaiNUa9mj84=; b=cSKF3bgmGyxluKKqWccj/t3Rh
	E+enHOhjVYav/4ZwDVUaCM01M7Ns7CHQhvTra3rlT9FynIwnPQRZILD2g4cUlxeIbz3jlYKqXSK+A
	+Rjv15cHD2wR/HwIa5cMbZyQkiw/IZogorEiHiIp+TGjPbd0LjudfEgy+ELfP7TZU5F7AZ2j+Mol4
	vtjQ1xc+RGs5C+4rooDlNr0EgLHvC7vN7xrjlvtptxSOEf94S78g5hP1NVBDOYdJgqfNLp8J+4tSR
	qzih0k7rv8IVrtc94J22Lt313lgBD5vAZB0/PqV8C7ijkb04VcbTBerw4HpEkHf+ZC/QzIU/5XOTg
	ptafxdyzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGXOS-0007XE-8P; Fri, 11 Sep 2020 00:58:24 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGXOO-0007WJ-0m; Fri, 11 Sep 2020 00:58:20 +0000
Received: by mail-ej1-x643.google.com with SMTP id p9so11463588ejf.6;
 Thu, 10 Sep 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cxz6Kgxq7jatws0G3p9mdGTrUWQSctB2DFS0bYO6Ojo=;
 b=I/FT26ZMke89o+R7EJ2Aje+2MzCZNT4TZP901O7MUuoJylUVJUgvF6AjdakQdO8NiZ
 DF8XXBbbppuRdAhjbROMcN4jfDcF+D/mUw5hFL+4KEUIjbi5j1KEw2Witb7aD1VSkp55
 LQd/F9LQzLy3MdX8zgLSt4xC6PpWFIjZHey9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cxz6Kgxq7jatws0G3p9mdGTrUWQSctB2DFS0bYO6Ojo=;
 b=X5XfFBvvQMxOtwzDiN15J9uAcyQm6NkATsN5KJ5dnmPGS9QBNqyODkNgqcncGN4qWR
 rBSu0pzROY2OJEDUC+esoY5NS4L8Catm3+ajqM1YilM3oSEsDnlkJZx+XIkc+QEGeXws
 FK95m3HGhb5uzoIDpTfVYczeZeIr1xStKdXSosvRTESNdTcdNzhsZX60qsfHn5U6mvsC
 9VcVJ7SN8eRqhbk1jJP+2yVapOjj1afhTZgQf7wtV+ED/Cq314M49lbApz2czRzsxrxm
 kRg/ufW70LWJ7/4X0Z+ZHKgpL7UZT+ae2Rb6uhQY43Ma00dz88xJH/q9/0OeqiM7BuxU
 67kg==
X-Gm-Message-State: AOAM531YrTkSjV2tYUgF9yg6AsJdnic8jUK+fBMC0eDRs9FRk3iZKs+C
 nTvBkocQJQO89i0YISUPnR3Hf/yMz2lpkdghTgE=
X-Google-Smtp-Source: ABdhPJzAAzwOGCqc8Dnsefhddi0bmKYOxyuP9uc74zjJGVpiHt0ExaXYevQVTAi52dogax1ztBNqJ2xxXB6fQgx+i2U=
X-Received: by 2002:a17:906:7cc6:: with SMTP id
 h6mr11643958ejp.266.1599785898793; 
 Thu, 10 Sep 2020 17:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-13-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-13-krzk@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 00:58:05 +0000
Message-ID: <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with
 dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_205820_058702_754FE45F 
X-CRM114-Status: GOOD (  17.39  )
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
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

This is a bit ugly. Do we have to go down this path?


>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts  | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 1fa233d2da26..0aa437486a0d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -560,7 +560,7 @@
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               smbus0 {
> +               smbus0-hog {
>                         gpio-hog;
>                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                         output-high;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index cb85168f6761..577c211c469e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -827,7 +827,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus0 {
> +                               smbus0-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -852,7 +852,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus1 {
> +                               smbus1-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -900,7 +900,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus2 {
> +                               smbus2-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -925,7 +925,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus3 {
> +                               smbus3-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -992,7 +992,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus4 {
> +                               smbus4-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1017,7 +1017,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus5 {
> +                               smbus5-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1065,7 +1065,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus6 {
> +                               smbus6-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1090,7 +1090,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus7 {
> +                               smbus7-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
