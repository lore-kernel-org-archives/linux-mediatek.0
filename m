Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAFEC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxfecajh7LakVWsGzhfvx2yBPK9ZrfliTdUgb+tNhHc=; b=r2SfPgNctZolU9z5WNhUEt0B2d
	BNu7nLfDwYVmaqePEzY7MXwJGgl37Xio67DWOE0baK0PLwn9/2OnfoLvqtEwChc6xm6gf4AYCh3Vw
	qhC68gRG3P6U4CaX0JjVQw4mWr9rbKvTJewGH+7PTehPzXiIrqiNgdHPOXVb5EXjk72hFQ2wI1W8E
	wPtj9e3prphySwnPXYTRw7VlLgADHDHhklnXxqZzz6m+o8LNTfE5p/iU3Ciqb+6fTsKTJn410Fw7A
	gRF6a/UKxqPrZ/B3NZgaCYhIKL/A7MZeXZJADzJtntIBzUnIMC6q1fZ8orzDH4QBjIZbuhrpwZhFz
	phnY1kpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzkU-005JXf-2y;
	Wed, 19 Jul 2023 05:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzkS-005JX1-37;
	Wed, 19 Jul 2023 05:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fxfecajh7LakVWsGzhfvx2yBPK9ZrfliTdUgb+tNhHc=; b=c/SzMu3rfgxgw4Vk8eP4T2Xqf+
	EIw/cdoYxkky908dlI3sPvmr9VjaZcn4QiZtaRsK/wquqSt7APvy6UFtvgF1e1zlwDjwVYN8SqzzE
	UNPsrdXlpFxxGBCN8yPZ04zEcC/ofPOjwv6G6QVRtD9HVkrKMaeCvmjHmpVeLsqVatIxVlV/HmN8j
	C9mGT1yq3zwONbgxUtaLI8ZZ6jqchxf6bklqxIKcBMkJcEFkFho3Z6mHNSTNi+HsnpwMw9ZE7QtED
	665CzAupmdUEjNn/GzKoG5lL/zYzNE7DPpo+/Q4lYi07zFYjZdZUzNiTQ95Qn8CBa2bMDWHObjpk9
	fV14p81A==;
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhX9-00BObn-1t;
	Tue, 18 Jul 2023 10:02:21 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1b3f281c4e1so4300287fac.3;
        Tue, 18 Jul 2023 03:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689674531; x=1692266531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxfecajh7LakVWsGzhfvx2yBPK9ZrfliTdUgb+tNhHc=;
        b=cV4IRcfDxQhUCpabzZHCEUsFRZRPQ8tmGOOUyH+/4k6tkPznu7EknJGSPGKGVTjyGr
         1xQQsNmTyavFufRAMPvbEtIhf5o/p4M0RqMu+rkqcpxYmjwZYvfNn4EarXGTkIEBOX59
         HOZsO/V8OZwhY+k5wOmhdzZJ/yGE7cf1SYp+kLFJGQUYJ7z+XaWyzl9j9Aw9c4Pv1qFP
         c7Gu4lnvysDU3eDR6OXCC6/ErOq4Y9U0an3OVkrA6GNdQ8JC0L8dZX3WGAqMawT2ZLOQ
         uAbO3K2w+D0hSl68rnlYRtuArR+btw3mG6U3AN4LuOJaTjdJKYZfzmUSF+6teQpoQjhH
         U/cA==
X-Gm-Message-State: ABy/qLZ/TiuAxo3MAs9sLdSPHXKtNL9gvsBCqu8/zOqRsy6iHs0PwZBj
	KEAm9jFZ4JfyJjON0Z5wIpa81UAo81BJtQ==
X-Google-Smtp-Source: APBJJlEKXmvUrmWF/9TDZeY/xk+UZaPNYGA3ZTA8jc9eD+1w6q2WPmA2K4Xlzcjy7wg6rcW3bAPgZQ==
X-Received: by 2002:a05:6870:611f:b0:1b0:3cd4:76d5 with SMTP id s31-20020a056870611f00b001b03cd476d5mr16687332oae.37.1689674531460;
        Tue, 18 Jul 2023 03:02:11 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id h5-20020a0dde05000000b0056d31a089e9sm349207ywe.126.2023.07.18.03.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 03:02:10 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so5652801276.2;
        Tue, 18 Jul 2023 03:02:09 -0700 (PDT)
X-Received: by 2002:a25:13c8:0:b0:bcb:9b43:5a89 with SMTP id
 191-20020a2513c8000000b00bcb9b435a89mr13444895ybt.61.1689674529762; Tue, 18
 Jul 2023 03:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com> <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230717172821.62827-10-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2023 12:01:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_4wmim_R0oA=4df8-0JKGwTkJJMxEiZSMwtVtv1wuFg@mail.gmail.com>
Message-ID: <CAMuHMdX_4wmim_R0oA=4df8-0JKGwTkJJMxEiZSMwtVtv1wuFg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] pinctrl: renesas: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
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
X-CRM114-CacheID: sfid-20230718_110219_770240_EAD6706E 
X-CRM114-Status: GOOD (  15.36  )
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
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

