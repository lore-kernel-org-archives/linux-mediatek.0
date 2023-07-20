Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3A3EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifHxT1z6hiXEJ3OG+UDLq27GRDHcAHJm8XLdM1GHGAM=; b=V8Frz4TGZekRvxIeNztEXTTRpJ
	WxxluTU2tBIiN0MaMQi+hn/MOht65s3QW9MQp4amtka4L+RjlCe3rqZUJz7oHoGMyMm5imQeMpV/Q
	6nRGoxdEA6jpXFcjtUqOd2n/5LmHlf4aI2PMS1iZ1MiUtJXBz03ATRLUDQ60U96cIGnseyyAl6Kh5
	35NRZ51vmRoDeB1txsbVDViG5ouOWKlFWiuEQBF2WQbr5jbl8sjxu3B4Zh8in9Qoty3BQqZgASafr
	7631HCXPlbu/1L/CFube3b76IMjj2aC1k3FJYOIVIN/URT4IL609oWhP0YtnnI9BZXrKFlRyoSYSj
	1DqioYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYsv-00Bz06-1D;
	Thu, 20 Jul 2023 19:00:21 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYsq-00BywV-29;
	Thu, 20 Jul 2023 19:00:20 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5216cf475e9so325728a12.0;
        Thu, 20 Jul 2023 12:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879613; x=1690484413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifHxT1z6hiXEJ3OG+UDLq27GRDHcAHJm8XLdM1GHGAM=;
        b=BRXB6sVjWX32dveJSFDnorGHQGuTHmI7w9BcpvmWQ3MoV0Ufcj0OxEKKC9mTA/t39Q
         sU/jNe3u8k8a094tLeKA2DPC0IefUdGwSCf8klAtEMZy6brgjsGarC9B5Boqd1AqwDlq
         13FcUQm+HC9saLp0fYM0Om1E6/ZPT0uG9UNi2vuOZm/z5rrFZCH++CsyQDlBksp10YUl
         HcNUfLmaQB0fzNNnhHFQb9/wOMYJyxtjYfaB6h+IS0he8jT8Um712oKkl4zKAIxohJu3
         zCMLN4cz75YojQX3zs2IhmiyrklZiiFRY04zLFKettSPTaHVwXiHo7LM9mSzRMTa2vCO
         hCaQ==
X-Gm-Message-State: ABy/qLZ7rH+qHYejazwGX8b6a36ljLc4jp4euJSkX8dIHllkXLEB3nQa
	7srLRlRY2I0PLwspelMzcfvBmXDKRKud6dPf0I0=
X-Google-Smtp-Source: APBJJlEnEO3zGpkZmjkvUh0XPmsJDERM4tmhfHj5H6iFn/o00COpAjnx9vtnIP+Yogzok+BZuamJs4bzUsjIpcDB0rY=
X-Received: by 2002:a17:906:530b:b0:993:eef2:5d53 with SMTP id
 h11-20020a170906530b00b00993eef25d53mr2631666ejo.0.1689879613338; Thu, 20 Jul
 2023 12:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com> <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Jul 2023 21:00:02 +0200
Message-ID: <CAJZ5v0j7FjmJytcRs-GPekxwsED-SC2KucDVa_tCoELLkRDPKg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Balsam CHIHI <bchihi@baylibre.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
X-CRM114-CacheID: sfid-20230720_120016_733317_7B4902CF 
X-CRM114-Status: GOOD (  17.54  )
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
>
> _DEFINE_DEV_PM_OPS() helps to define PM operations for the system sleep
> and/or runtime PM cases. Some of the existing users want to have _noirq()
> variants to be set. For that purpose introduce a new helper which sets
> up _noirq() callbacks to be set and struct dev_pm_ops be provided.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

and please feel free to route this how you see fit.

> ---
>  include/linux/pm.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index badad7d11f4f..0f19af8d5493 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -448,6 +448,15 @@ const struct dev_pm_ops __maybe_unused name =3D { \
>         SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
>  }
>
> +/*
> + * Use this if you want to have the suspend and resume callbacks be call=
ed
> + * with disabled IRQs.
> + */
> +#define DEFINE_NOIRQ_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> +const struct dev_pm_ops name =3D { \
> +       NOIRQ_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> +}
> +
>  #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
>  #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
>
> --
> 2.40.0.1.gaa8946217a0b
>

