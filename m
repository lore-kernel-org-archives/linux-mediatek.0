Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3F4C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1bR56IqKqOsxuwkSHrydMHa9KKLbHNZNQKlBX5dtWc=; b=B800/CqO78W7wLLdGBMMaNpXHZ
	oB+CNETYIVK335hfewuVd5e4Kny5/Bwhk3DrvI4WMbx6e+HAU3vIUhx4KqCBpETcIk9q9F6pGESH+
	sDbzTJlK1d46KtXPnUQJax7nwlx/ISFV8ZCZIrD4fKr+lSjdByZDKzpspEBEkuc9llm44BJHmLt6y
	KKehmNf0zDHmU0TxCKDaohow0FBO59oEg7d1wuYDyJ9RSmd6SQTMGmNqPWuUmIsJSjgZFvuotmwHa
	2n9ssMhCj4UXI53CjJ+hT1fkbUSCw4Oa7w53LuMS/FKf4tj+6febMRWvV/3IGmpeSF/bWaiYat5o0
	xJXQbknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxNh-00000004rQ8-2bci;
	Tue, 12 Mar 2024 08:21:05 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxNc-00000004rOO-3GIB;
	Tue, 12 Mar 2024 08:21:02 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609ff069a40so44776847b3.1;
        Tue, 12 Mar 2024 01:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710231658; x=1710836458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1bR56IqKqOsxuwkSHrydMHa9KKLbHNZNQKlBX5dtWc=;
        b=w21roOHurR0RjOA4FKDY/jRdURiauDOnePARH0gLsjcM8oK8tdzoOQIrD9eBM29q3a
         OPjo8h9uq6paUIOkxNiCSs+/SgvnXBhCveiCGB3Q/E6g2angIim+2SKhkcWHSxv0PL/c
         nUAbxRgMS7UFC20U8hsiK7OCPDw9w2Qfh2RuY69WpAUTu7ye8gXYLB6zn7KHXYxm6pUS
         tMii3W0Yfwd+dunWLbRIk3jT9RZq7rDqP3EHgAYnr0YYHd74QhL+y+dert+tmTZes/Bx
         sptUY82BPpManDOchMEbZk+XLCM2kgZ2GwQfJw7ohyrXrdEiNepPUoNICFd96DWwUHW+
         HPdw==
X-Forwarded-Encrypted: i=1; AJvYcCWomlxid6C7WbqJTz0FSRm1zmUudS1h/8vJ6t5ZnNgixV4nyNIkYw5bjsczkRaNVdm9PfW9YYazGqvN1vs/P1GMC8geX60MPxmdUiNyoUy/UEl0jcYwESA+iopdGLUqIMz1Da7m+HMoqREod1ZpFApHXZZgQobDzWo=
X-Gm-Message-State: AOJu0YxwTzBhmMEBbsfet3oq7bo8OYnydfjTv1kO9lGBcqm9HfeQcCzN
	i6Sv6WP/LM5PsZx/bd3xd4YDskxTmhZe7QbTvyZDx1ZPG38Sf7FspmSoOrCh5Xw=
X-Google-Smtp-Source: AGHT+IG3W73llC5mD52jKR6o36VizD6DdCi6mB8wK+utSxI8AWG+jlh/287V/SZE8eNVjnwenUERJg==
X-Received: by 2002:a0d:f082:0:b0:609:513c:a8f7 with SMTP id z124-20020a0df082000000b00609513ca8f7mr8152175ywe.0.1710231657761;
        Tue, 12 Mar 2024 01:20:57 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id g187-20020a81a9c4000000b0060a0f62c589sm1771627ywh.137.2024.03.12.01.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:20:56 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a068e26d8so41906577b3.3;
        Tue, 12 Mar 2024 01:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYjLx8MmwpQQPP7faH9ovagu3zJ2aYEHrZLKJhSCKtanIoJHyFKWvVdWxGwbse5u+CM7KXPizNnwm1q3s2fyJHXYGuuBmaELtwEU6xbWiHEDeIihLw+cGvXN9z3pJDywf0zK2Wg9Ts6MgQXy4YJXUB9oKvZ4/IkcY=
X-Received: by 2002:a81:a105:0:b0:60a:243:547c with SMTP id
 y5-20020a81a105000000b0060a0243547cmr8805841ywg.44.1710231655739; Tue, 12 Mar
 2024 01:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240229204039.2861519-1-sashal@kernel.org> <20240229204039.2861519-12-sashal@kernel.org>
 <Ze9x6qqGYdRiWy3h@duo.ucw.cz>
In-Reply-To: <Ze9x6qqGYdRiWy3h@duo.ucw.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2024 09:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
Message-ID: <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 12/12] arm64: dts: Fix dtc interrupt_provider warnings
To: Pavel Machek <pavel@ucw.cz>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Chanho Min <chanho.min@lge.com>, Arnd Bergmann <arnd@arndb.de>, tsahee@annapurnalabs.com, 
	atenart@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, rjui@broadcom.com, sbranden@broadcom.com, andrew@lunn.ch, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, 
	matthias.bgg@gmail.com, magnus.damm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_012100_888737_00C5C961 
X-CRM114-Status: GOOD (  18.51  )
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

Hi Pavel,

On Mon, Mar 11, 2024 at 10:04=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
> > From: Rob Herring <robh@kernel.org>
> >
> > [ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]
> >
> > The dtc interrupt_provider warning is off by default. Fix all the warni=
ngs
> > so it can be enabled.
>
> We don't have that warning in 6.1 and likely won't enable it, so we
> should not need this.

Still, this fixes issues in DTS that were not noticed before because
the checks were disabled.

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

