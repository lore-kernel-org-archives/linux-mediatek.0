Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFBC54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpBVGXK2hwvv9G4vuoIjIOAjMy0hLwpCGg7dYfSa+5Q=; b=qOKulQnM+uXiHDftETdjrlsGo1
	q2kTn3/NDHwsmb24rwcVsvFhlVSlNQS7uMu8HMV/SmlOD65bIhFLt1klQJJ4RL5EhEXUZ0DtSNrpc
	npCwb9zoh8Zj7DgDrv/Wd5kWiffk6ke/EZZrhWuJbcYqHk1mOXdpTk78H2QW5Xq2y2xIDXrS4RYYq
	0Gby1lEdib/lbg908wCIfSXDgDQ0MMx7SYazr9gu0fsqU3udSwllBBtpihM/HEtPKf0RHjm9wd5MF
	jo0Zq230tInn0zCEFmUYLrcO67C075kZVGo2ZV+QikEbB6JQ9ATr3VfE+wlXmFRPPDysQ4eWQ5hXr
	B16sFwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxk3-00000004w5O-1b6z;
	Tue, 12 Mar 2024 08:44:11 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxjz-00000004w4Z-2wdg;
	Tue, 12 Mar 2024 08:44:09 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-609eb87a847so40147817b3.0;
        Tue, 12 Mar 2024 01:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710233043; x=1710837843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpBVGXK2hwvv9G4vuoIjIOAjMy0hLwpCGg7dYfSa+5Q=;
        b=ppnkVBgPUMG2BvZRx7H/3ufafu2iy9l3NpgmaP3iIK2UzHeHhCcTt7ooHElPAkAFub
         RrvmxJkmRsGLzrTYvB6ddWvRO/rPKaW3hy2HRtqO6cixbvzrF1ZWGgw//0t7a6nUG2yU
         Du0QPHpTeSLrhmbTT9DkkxAXoESRMOLK7/EXx3v9Tc8MRRXpKCr9xnCypuSplKQWQSdG
         wkoU/suXcM9d9H+vQ2ZWpD3CTkkneKv4jVyUZ+MxrMANbzCPt7eGwjXxYIP1w8BqzY9g
         H7yAVugiMAjWghw6tfs5HLhm7SQSgH3eP90q5IuFyA/mzz2nf/81mpTDhA9puLj9ZXyT
         +NYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKhJR+5WRRTn44QRbBphpqsMWORrDtCksCYOErHaPMISsrkvCJ57zrd+O27KzhfLfJFtOkJ+EAtm6NXESwYM3MbADW62ULJZtNIvc+KtKOU3tmaSPqtH2+hXAvsbbpCXSl42/cW3brTcfxGeZ8fN+27S0EsZumV6I=
X-Gm-Message-State: AOJu0YxUWC5Y1CTfoVKd+vPfQ7ZuA+9lZOoswdewngVm4PPONJvoPqrZ
	BsoDsBi6Te2kSrri0Z2xAOtOdSzfc3VT3Mr5OFBp2YO1reEgVxxPc1yN+pCwebc=
X-Google-Smtp-Source: AGHT+IGb3VT96PoTn1eI/jYIMTHfrzrTFuyt0/UJ/bNy6NOaNIXXOT1iKXndTiC0GINkLdZy6KiR+w==
X-Received: by 2002:a81:b667:0:b0:609:cf0d:9d64 with SMTP id h39-20020a81b667000000b00609cf0d9d64mr6237151ywk.13.1710233042958;
        Tue, 12 Mar 2024 01:44:02 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l31-20020a81ad1f000000b0060a3ac68cfasm1031188ywh.61.2024.03.12.01.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:44:02 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f4d8551eso40205297b3.1;
        Tue, 12 Mar 2024 01:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyK27bK4teiRBgkASBiNVRhdUyZVSngetphLYpXoBqxdX2tUUWOokbC7Wg/S7nOqPOp9CIyRtl3/kp5e5509VjFEYe7qUClBiyTKbmbgHrDY8M1JiIpqs4uCoJZBnXPZYRzfKj1Q0yN/QP6Oov7lIsiuX4ubSSkHc=
X-Received: by 2002:a81:4806:0:b0:609:a1ed:5558 with SMTP id
 v6-20020a814806000000b00609a1ed5558mr5385429ywa.11.1710233042268; Tue, 12 Mar
 2024 01:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240229204039.2861519-1-sashal@kernel.org> <20240229204039.2861519-12-sashal@kernel.org>
 <Ze9x6qqGYdRiWy3h@duo.ucw.cz> <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
 <ZfAUgYj0ksDmGuhN@amd.ucw.cz>
In-Reply-To: <ZfAUgYj0ksDmGuhN@amd.ucw.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2024 09:43:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdTG=r8CJOGg2+xqMbrJ_uA3_EkoU9F2gq+zok2cGJpQ@mail.gmail.com>
Message-ID: <CAMuHMdXdTG=r8CJOGg2+xqMbrJ_uA3_EkoU9F2gq+zok2cGJpQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 12/12] arm64: dts: Fix dtc interrupt_provider warnings
To: Pavel Machek <pavel@ucw.cz>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Chanho Min <chanho.min@lge.com>, 
	Arnd Bergmann <arnd@arndb.de>, tsahee@annapurnalabs.com, atenart@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	rjui@broadcom.com, sbranden@broadcom.com, andrew@lunn.ch, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, 
	matthias.bgg@gmail.com, magnus.damm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_014407_763676_D112A681 
X-CRM114-Status: GOOD (  21.59  )
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

On Tue, Mar 12, 2024 at 9:38=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
> > > > From: Rob Herring <robh@kernel.org>
> > > >
> > > > [ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]
> > > >
> > > > The dtc interrupt_provider warning is off by default. Fix all the w=
arnings
> > > > so it can be enabled.
> > >
> > > We don't have that warning in 6.1 and likely won't enable it, so we
> > > should not need this.
> >
> > Still, this fixes issues in DTS that were not noticed before because
> > the checks were disabled.
>
> Is this patch known to fix user-visible behaviour?

None that I am aware of.

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

