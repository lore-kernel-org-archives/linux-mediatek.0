Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C59CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGqXhKq0oVLFGXkOOmdjpXMuEBL+BCbru1yFH/7p29U=; b=C1SjgKQGOx0bGzAGbVAQogDOu6
	45cA0O59a5IuX55+Uk5u8dSmClPpE1Now1/fazLfjCF1dCemJuaofEG3FNqU5MAJvg57f/o6T49Dm
	4N815FadhpRHmbtFDbESTQQxDRZxtQVf+7KGpsM/GqCCPUe9+jklGegoOvC9FK5Ys2yY4FzSz2KbU
	0oXWXY7Skv3r5b3zoGMEkpUpvIFODEF7pYsFrSgv3iWnSxI3e0zrsVKDwzJqeMjwNVNe30MxcUqIB
	WQT9Lo/qWhZ6LxalVEDN3/BmROj8NVqjQ193R9nH5nF6YQ/NLNLRc64qi0qW5uP/9dp6Ut4O3P7m/
	l/7QpvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st42c-00000002E7u-3x1U;
	Tue, 24 Sep 2024 11:49:14 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3xv-00000002DKL-0Ttb;
	Tue, 24 Sep 2024 11:44:24 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so4524602276.1;
        Tue, 24 Sep 2024 04:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178261; x=1727783061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGqXhKq0oVLFGXkOOmdjpXMuEBL+BCbru1yFH/7p29U=;
        b=XJ8KSshppT0B9iQdxzyJY8ZOJ9VQDlqUL/HcUHUWGsP6+uRreCwnyQXRtsegJFQ/VA
         AWH2+jHPCNNyxUdlTGhnUUhCzZYGCTiCcJquELqEu6WUQTn1NTdXOcko0T8Oy6KOir2K
         SLUOkU2odeT7r+kO86ic9jJZGxKbiwvok3RT+pppVo4LO6bJYKQK6TyGEytpcKag8md3
         GSSrEsqmSyaU+4HGcDP93v1KTe+LX25mRUF4QyMQ6cubzluxyXhz+1QhTRe7hFn7fWbl
         QcWj5tTrz26xD6r2hA7Dhzf2WOl9Z4+Krtv1xmJBcAnmcH4R9asfFbFZ0LxHbNhE3utd
         NhEw==
X-Forwarded-Encrypted: i=1; AJvYcCWtoNLvlY/qTRJ8Cl7q+Adv5JrPQ0kkdhLoRW3oManTPDSZDhVK/OeXMi7LOOF7ux3gm1P24XAJuiY1FZkALzY=@lists.infradead.org, AJvYcCXC/Exl0hzmx9l+Gw1BmPcvV9tlphoEGE21lXmbudQb7HBEVgCqlTSfetMNpIA5CMcdeWSyztw4wMfQtnbHYBoJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwJAYBvdJpzqNnLR1bWfNYEdpuiNhLEAL88+4iDgd6/uRC60Pcy
	Z6OA8R9QWyWjVtyIhXQukljA+BKFXLmcDU5XMAsJW9ktTgUDRpzLQjOmdZT/
X-Google-Smtp-Source: AGHT+IG3gNa04+rPLs4N8FPNCi2Wh+VYF99wZBxJCT0Lh2DSmmTFPsG6oWfcVg24AF+rJR0qkUSHyw==
X-Received: by 2002:a05:6902:2313:b0:e24:9a82:eb9b with SMTP id 3f1490d57ef6-e249a82ef8fmr1249440276.0.1727178261207;
        Tue, 24 Sep 2024 04:44:21 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2499b0c378sm207183276.26.2024.09.24.04.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 04:44:18 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e20a8141c7so6768447b3.0;
        Tue, 24 Sep 2024 04:44:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8f/FGyEAvw8FzgAD/CSholRy9Oku7yIDtk/F2f2MlenPQhXRcVEt+hhUQgEDVRe21vOZ4vytq7nLqon570xc=@lists.infradead.org, AJvYcCVj9E4Qf6tLYGwgj2R0FixWNJL2iHXh40vZQY7zO+YiaEgWnRPLCapxjLwQpqrwFSFe5o7oYDHzZ3zwtQXtXVcY@lists.infradead.org
X-Received: by 2002:a05:690c:d82:b0:6e2:993:917c with SMTP id
 00721157ae682-6e20993a219mr25327247b3.2.1727178256981; Tue, 24 Sep 2024
 04:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com> <20240226-audio-i350-v8-1-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-1-e80a57d026ce@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 13:44:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtm+jGbbLXnCjPZZu_ZwpR-tCRuwbz0iQxUPkXG=g09A@mail.gmail.com>
Message-ID: <CAMuHMdXtm+jGbbLXnCjPZZu_ZwpR-tCRuwbz0iQxUPkXG=g09A@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] ASoC: codecs: add MT6357 support
To: amergnat@baylibre.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Nicolas Belin <nbelin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_044423_180004_B14F8B6C 
X-CRM114-Status: GOOD (  20.53  )
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

Hi Alexandre,

On Thu, Sep 5, 2024 at 11:08=E2=80=AFAM <amergnat@baylibre.com> wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>
> Add the support of MT6357 PMIC audio codec.
>
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Thanks for your patch, which is now commit 5e2404493f9f6028 ("ASoC:
codecs: add MT6357 support").

> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2501,6 +2502,12 @@ config SND_SOC_ML26124
>  config SND_SOC_MT6351
>         tristate "MediaTek MT6351 Codec"
>
> +config SND_SOC_MT6357
> +       tristate "MediaTek MT6357 Codec"

Does this need dependencies?  The driver uses regmap, but it's not
immediately clear to me what is the backend (SPI?).

SND_SOC_MT6357 is selected by SND_SOC_MT8365_MT6357 in the next patch,
but I guess there can be other users, so making the SND_SOC_MT6357
symbol invisible ("tristate ... if COMPILE_TEST") is not an option?

Similar comments for the pre-existing SND_SOC_MT635[189] symbols,
but at least SND_SOC_MT6359 depends on MTK_PMIC_WRAP.

> +       help
> +         Enable support for the platform which uses MT6357 as
> +         external codec device.
> +
>  config SND_SOC_MT6358
>         tristate "MediaTek MT6358 Codec"
>         help

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

