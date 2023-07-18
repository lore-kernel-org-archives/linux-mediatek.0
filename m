Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E3FC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMWNFsiRP079B5LYbYLQZfm+Mzjz5LU2gLm2aCCBKHU=; b=g40oJoIUp3mCPi0e1WjfXXO/BL
	3shrUPKCXkWUrt0r3qRO36po/sq40EW54B60gOXfkikSEvV+7XbSzCo3JjLlfwFa4eCzEV9eOCshZ
	oFPl+BczeK6NgxA6mfur9jX854R626h1jh5/Guc6IFEG+EDZ3yEMxycqTHdzvrysrZtY10qQH+G1H
	PwnAq2wBaHXAyauqhLE+bgTm1iMJdQ2YsTmNLfFkG2bkY8IgjAgroVWS4cq3KEJPqfjmXHGPP2jjd
	59RKheeNrtpjC9DrEVQRj3yYPMoVVx//pP8u3AtnhqD9oJ/NLOXoGC1EZ81hkdp3oPJZe7Q+xrMMD
	iXmjm6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0sO-005qhH-2G;
	Wed, 19 Jul 2023 06:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0sN-005qgB-0R;
	Wed, 19 Jul 2023 06:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iMWNFsiRP079B5LYbYLQZfm+Mzjz5LU2gLm2aCCBKHU=; b=Z0OWbI6ZbC1UWl/jyarH2UaKIA
	w9HbqRnKnVkGaGliTRZ8m8PqFq1DKqxvkuIvCxOgofIcVkS4TK1h846QOgdspqSB2qVyn4cJfvcU0
	jJfk03MRQN/BLSV7Q7ZQ25VzIZ4gLJD4uE/jWZ4VL0xjcocYDMsTb6CXQjAMIIs3UXVYZgvUmfdVt
	qKAGmCEo3MSrg7AsIs71Be+2p/OS6DA85Mmy9fGADXU8TMZBnyy/Tv/wQkh7nGzNGO389F3DLROhR
	EnlBNOiVfMoF+Xw/Zk0mJuBU2mhBwPw627z2yw+bsDAc6aVlYmcKGb0rzs6GriermCwoX41rYOVXJ
	Le/p1CFw==;
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhWP-00BOax-2T;
	Tue, 18 Jul 2023 10:01:36 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5774098f16eso58105207b3.0;
        Tue, 18 Jul 2023 03:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689674488; x=1692266488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMWNFsiRP079B5LYbYLQZfm+Mzjz5LU2gLm2aCCBKHU=;
        b=JfsrcL6h16lEJz2AW/RRoQT5KMtd567I42Q67BkCujIBdqrWdUADl21kL/zbkJEiIj
         3Bn/HQHtF4Y/S7Sqd/jphdkVsp9G7uhxj/Tx7/YX/4QJXi4p6WQt+ei2m0edmETuS9dB
         lYRyKLu8EPvU7gL70FtZRA3gxgRlPYavJQdbGh4uH7vtVCvUpRnd1Cn6jPgKTfluWoY9
         WdJ8KDI6iTb2gpF4WeTfW++T1kPj0fu5Q1EtMilD6cjqLdJ+N6Vom3MKKnlvubEQSgQj
         yeWl91BFORA4HcMqF32vd76UcQTu9Pyc6U+e5Q+s8+eN2TS3EaAVN+ZGZ3rI+uVdrdNj
         WIeQ==
X-Gm-Message-State: ABy/qLaiCZIoVPitt1wMxfPDfsWlLO4aBxDVkIdYJRmBe2RUDGGWbA+p
	uxQGrSRpE/GMfQsexKEbrhiO/Vg7ux0Fjw==
X-Google-Smtp-Source: APBJJlFFYYZgKUyaLMrAvPIjUyWQVHGwh19ea2bvuGrCwL1DucN8tJqCeHjxWEHUdo98E+kW3x4KvQ==
X-Received: by 2002:a0d:e645:0:b0:583:4be8:73e5 with SMTP id p66-20020a0de645000000b005834be873e5mr2721548ywe.8.1689674488678;
        Tue, 18 Jul 2023 03:01:28 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id o84-20020a815a57000000b0057085b18cddsm361509ywb.54.2023.07.18.03.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 03:01:26 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-cc7863e7b82so3451555276.0;
        Tue, 18 Jul 2023 03:01:26 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:ced:271:950a with SMTP id d7-20020a5b0c47000000b00ced0271950amr437150ybr.47.1689674485821;
 Tue, 18 Jul 2023 03:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com> <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2023 12:01:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgRDrWwQ6PKtgDE1Kmbp_zsmfrbswvG9Sq30zUVMZRAw@mail.gmail.com>
Message-ID: <CAMuHMdVgRDrWwQ6PKtgDE1Kmbp_zsmfrbswvG9Sq30zUVMZRAw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_110134_902887_DC69754E 
X-CRM114-Status: GOOD (  15.79  )
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

On Mon, Jul 17, 2023 at 7:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> _DEFINE_DEV_PM_OPS() helps to define PM operations for the system sleep
> and/or runtime PM cases. Some of the existing users want to have _noirq()
> variants to be set. For that purpose introduce a new helper which sets
> up _noirq() callbacks to be set and struct dev_pm_ops be provided.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

