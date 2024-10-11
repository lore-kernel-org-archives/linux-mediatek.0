Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32D0D2447F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yol/CqMflojZ91zDJ6BWlrykjb5lk+ms5wvr74ezf+w=; b=VP88i7MzzNfIAbYyvITKlqzmzz
	0mh1hWFJR9PkP+EoP8idcbTlUnkrkV1zFDkE94rM7vS2/43b/rHcs3mA7esAMdK2GAXxKEnCWhjAG
	eMue2EV66LBNyForraSnh1/l+7YlTMgID/a+itmRQpLw2YzXNCglgroBjBTUrNDC1pRmJ9upW4eJ/
	1a7sP1kcEPAw5kA0MeASEpd3dVNz/L1awAVZyspEAkT31pZc6SORW7NlEyuJ2V4Xp79WClsv79pHZ
	+suZ5ula465TW+3hqkVNrD5wRJtIjjT5oUDEKvkJjDXIkfHKHBff/whh6IRV28PNhX+DYtE3HkgW+
	Hbq438yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9er-0000000FTpI-2brc;
	Fri, 11 Oct 2024 07:01:53 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9VM-0000000FS4w-3BCr
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Oct 2024 06:52:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fad6de2590so25054941fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Oct 2024 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728629523; x=1729234323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yol/CqMflojZ91zDJ6BWlrykjb5lk+ms5wvr74ezf+w=;
        b=TAd7NL9U5p01eBHBsyLDw8guw6X14Wiias/W0v5F6r0r0T88Wzg/maBOsq8uMBd/LK
         sl3ZhiYvxDOm3FsMJkWgyDGFmskwPAgiYQV4S2jRV9w1qusfbzNYxQP0/gffVjLg5EAJ
         WV8LBm8M2WxTH4Sv/2/ns7GyFxrSrlgW9Wz6fAM19HFzUNpoWiUsaRXwnjr8gPpzncgY
         PaoU1jS0uQL6PV1uixoDfl26m6rprjYbXFk8wZxbdEHmACp3JdFe+Et/tRzISAI2uSmH
         uoqrB01bc/cBMWCL9HqkkEc+5O9SwYb1bS/kWG//5aA2GrICzCvki53T8oXlC0iEyCJN
         00Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728629523; x=1729234323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yol/CqMflojZ91zDJ6BWlrykjb5lk+ms5wvr74ezf+w=;
        b=rMrqs0dwGb188/VxUo4nMEgkofLaKUqbGycZo7MtFUJ2HmYe8J2yDGpQwJqsxmTnvn
         ESI98u+hZ1btfHcUB56lWknjSJuNTnJIUB7DAhTfNfiQXt43FWiyqwwf7DlmCNu6b2Wi
         XWw/OTRLhjz5brlpugTJf0E2GK7DryCcn+UeEzNAroZBDvRcS/axJMCjV/PIpnG7g3FG
         SZXJfR80EYXwAPtWa7j+juKXFppzsXyhONSaQOEyXLqxxTDqEjeMkRMqXRZQLSQvqcZv
         jgYDRxgVWiQ1llLEysQEykEyZjJzpjbaJJZlqXcA7NZqiKX6fbQMtfixouzWepVNJrH9
         qSbw==
X-Forwarded-Encrypted: i=1; AJvYcCVJL3xIgn1SriGWGIAVvmh8lKSd/P/66Y2NIiUBRDdbIdEsoaG7tpMWtmD1NBiId2lcJXJnux/VmgxkCp5k4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx86cviJGdLv24NcSO3vcJwC3rZtP1SgBRJux2rF+2rKYrivhp4
	hhS8EcQiDDSPQjUFkpF5T1ux6qOQAvNRTPRaL68RZErlKSItz9443oCHr+R9XzU5fDnfV/Z+cuI
	9lBU8aai4i8BxvPUAChMnP2ROnTMtImFiATVSYw==
X-Google-Smtp-Source: AGHT+IEL+j79y+MejFM6HiX8V5iKw9ViH8TW+NbeQoNVhAz74UvZoFsQPZ4rGjCGTgCqCqgVNXiU/grYNIrmU/CAJHE=
X-Received: by 2002:a2e:a587:0:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fb32744f3dmr8696101fa.19.1728629522773; Thu, 10 Oct 2024
 23:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org> <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk> <20241009104821.GF276481@google.com>
 <20241009105550.GG276481@google.com> <6707a8ec.df0a0220.376450.293e@mx.google.com>
 <CACRpkdanpA-wq0sYv9HRF=uVeAX_mW4LaKhE8i6TgC9+0d7bCg@mail.gmail.com> <ZwhKECIpL7g7ZGEC@lore-desk>
In-Reply-To: <ZwhKECIpL7g7ZGEC@lore-desk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 08:51:50 +0200
Message-ID: <CACRpkdYxF23-Py=eOZHodeR-RvkYGen_+hn_BtiU+tCPva8BXg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_235204_824358_FFE582FD 
X-CRM114-Status: GOOD (  14.23  )
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

On Thu, Oct 10, 2024 at 11:41=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:
> > On Thu, Oct 10, 2024 at 12:14=E2=80=AFPM Christian Marangi <ansuelsmth@=
gmail.com> wrote:

> > I think you want a separate GPIO node inside the system controller:
> >
> >   en7581_gpio: gpio {
> >          compatible =3D "airhoa,en7581-gpio";
> >          interrupt-parent =3D <&gic>;
> >          interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >
> >          gpio-controller;
> >          #gpio-cells =3D <2>;
> >
> >          interrupt-controller;
> >          #interrupt-cells =3D <2>;
> >
> >          gpio-ranges =3D <&en7581_pinctrl 0 13 47>;
> > };
>
> So far I implemented the gpio functionalities in the en7581 pinctrl drive=
r
> (as it is done for other mtk pinctrl drivers) but I am fine to reuse the
> gpio-en7523 driver for it. Do you prefer this second approach?

It's fine to combine GPIO and pin control into the same node, especially
if you will have a combined driver for it, then it's more or less mandatory=
.
I only wrote this looking at ansuel's sketch.

> > This will make subdevices probe and you can put the pure GPIO
> > driver in drivers/gpio/gpio-en7581.c
>
> We could actually reuse gpio-en7523 driver (removing the gpio part from e=
n7581
> pinctrl driver) and extend it to support irq_chip. I do not have a strong
> opinion about it.

Code reuse is always preferred, if possible.

Yours,
Linus Walleij

