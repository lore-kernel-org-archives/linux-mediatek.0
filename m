Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F64BC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLIjSxvkFoShCDz7/AeeChAXiJ9TCtnKs3s5wZ5JN+8=; b=F7dXkFbGNzKZEAGFjVGMkeCnWM
	kRqUSNM/pGSDVbdxq7gmZMiLylgaHnuvE4kIAh5U2toAFRzaw4i7zz30kw5NcNeI1SD4ecCwZhuMX
	KzhppmFCcw9VW1DMMA3dLrvisXNoNqXGmuvBz05ea/p4YKAEmYVmF3EH7fBgFoh55e6Ij9Sc22XR1
	+8BhoGyds6/fbDHSo5dOdSjr8kchwrxsgmpoObLlk6EJ3CiN/SPzd/JTUeCzyPOT6YFj+lpymhspL
	dPuAIJAdaUNYz2TJlMl7idtMjWhVqk7E3XxXkfXNIyZbH7vcyVFICzg3w0VebKooDv6TZunfnG/Ca
	M/XwXo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu8I2-003w36-0M;
	Wed, 03 May 2023 08:56:46 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu8Hx-003w1h-2l;
	Wed, 03 May 2023 08:56:43 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-559ded5e170so61919727b3.3;
        Wed, 03 May 2023 01:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104200; x=1685696200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLIjSxvkFoShCDz7/AeeChAXiJ9TCtnKs3s5wZ5JN+8=;
        b=OsIJlaizwkqyJKm4siEUc4BWiTo7uxw8iBY1y3gYeltAxFo6V6B/BGsq9kE5RRLX/g
         nYHDIdJvThJbuXD5vZdFDN+nWifR84dXBw0W3r3ym/328HvuE4dCPtTW0+i9x3zA7a60
         Pl8UgJHsOY/eAWgwSIyAnnpz6clkVYt56WfKolKRLxIupDWBi9GygPfyEDteMcXBr0Q5
         i+Er5pkJHSStdAj3w9BbRC9aDX9QEW3IubF8kugszI4+KDMy1yUICuwWVdtpiw6kPJVr
         aX7h+XvVcAgFGanvR6FkUtH/qO521w+e3/9q5vsBFHjavd4iImKQJpPGoIk7csOrHJ1+
         7oEA==
X-Gm-Message-State: AC+VfDxZNLJgMLYTXD4bTeaXGVWCXkwN16LtapyJN+wR1Zy9ip7bq85e
	NeHE0FyAiAuNRc/5G9WUb9hPDnqnLhVyJw==
X-Google-Smtp-Source: ACHHUZ7sEhaU+NT8WcsbX3k1LMeU2vu4Ld5xWsWxQxoHUEHIYJS+Gp/XEhHJc1bpz378rVwEu/9iuQ==
X-Received: by 2002:a81:86c7:0:b0:54f:e7cd:bb1d with SMTP id w190-20020a8186c7000000b0054fe7cdbb1dmr20462231ywf.12.1683104200349;
        Wed, 03 May 2023 01:56:40 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id m67-20020a0dca46000000b0055c935364eesm239647ywd.2.2023.05.03.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:56:39 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b99efd7c335so6896609276.0;
        Wed, 03 May 2023 01:56:39 -0700 (PDT)
X-Received: by 2002:a25:fc1b:0:b0:b9a:6f77:9018 with SMTP id
 v27-20020a25fc1b000000b00b9a6f779018mr19158460ybd.41.1683104199175; Wed, 03
 May 2023 01:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_015641_900754_A024AAD0 
X-CRM114-Status: GOOD (  12.13  )
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

Hi Rob,

On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:
>     'r7' : 'renesas',
>     'r8' : 'renesas',
>     'r9' : 'renesas',
>     'emev2' : 'renesas',
>     'sh73a' : 'renesas',
>     'gr-' : 'renesas',
>     'iwg' : 'renesas',

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

