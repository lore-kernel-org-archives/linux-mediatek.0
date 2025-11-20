Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA25CF9C72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=; b=NDJ/Fh01GiSvhBvDdd0nNB2ELC
	YxB/1LUFMRUwu6HahH+OKJxhU/7sveoEqx/Qgr2STNYpi1tEkAVBGWwx3r06GlZWBf5mSYm4hFGWy
	j1rxZ5h1qhrVyXufnyGXW9qYQTRFFFpBFZB+lKmXgQZ5LvAad6k3ya8RgRXwpcKNf5F2DKdF0zckf
	fwFotNoqG61QIWnd021jqnesck5i36BMXlw/QUh6a8pg98INMxwpkf4ODHSW+937cLiBuV5bjOVaD
	XyZltntBdQU+0lI36hqTucxB9yOLYtPrjPYe4P59FYw9NeV6l0IKUaAoo4lf5f2rjC8LH9CTC07Ho
	nBIiXMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Do-000000074hD-17QM;
	Thu, 20 Nov 2025 17:13:28 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Dm-000000074ge-0aqB
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 17:13:27 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b73161849e1so299589666b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 09:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763658801; x=1764263601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=jWt6JP3IR3j1dmDI9vQZgyS4r0VG/aNhqQ37OwXmTl7uPlfWvb5y7a8VsD5q/0djK5
         L6UpraDLoSjHnuYTUiTBQbytYmVntALXLIQVozIxxbabcHCUs6VZFFeEf5Dt3Hly4hjP
         9It/8h5jwrVDaJJTPQd7/PY06vaqLwkKfYKC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763658801; x=1764263601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=rwahgxmRgkXtw1jjsIaO5NR70Ggkrr7DqOVC37FZeynixyocjfccV/devkHISgVZls
         5VAx7NJ4/PBffoWvTmQY0oIMmvzJDJTwKNrth6A6GSVP1bcOooOl7QE73WooYEVaKNR0
         MzxHRRbOjDNkmeLYlVBCTlYJbTyKx2iB5lG7zXdgmJBv8qzcCgEpNRk4jCklQ2t+6Q8Q
         zGLgNXLa/HfmaQfTsX83vvKOnhyzuQc/+lXEWZjsdDB31HetSux6ZpR9vjfUcH7qDXjI
         Qys/D8QP38Oqgcarzd0B/7IgeBnZG/sDBXH31mOvnTBDbi3+l8+OQt7yk2QFgbuBEbt0
         y1jg==
X-Forwarded-Encrypted: i=1; AJvYcCXPN+zK9V7+ZLvSgMmAVaJYlQHB7mFPO0WuZlhPLPvXlwV8i/zgLtTiX4pzUlZbBXSRB9rdZL2gSVsbA22aLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrSXZW/dyMpTfq06xwYqmP67OqQj1QcN8XCqNOPaz96aUSpkE+
	zPG4OqJSGL/LiUwQmc778EO0DX/H9hM32fh4L1uotYuEDYgDVuFkQzos2eFwTnFrkgY6bqzE14T
	yKF7cV9zV
X-Gm-Gg: ASbGncvxb/tXI08y1tPTNaBh0DHsAOTlBkstUCYtschCJbtjpsMbwPUgouoCK5630Ow
	iedfRrl0I7sle5PlkCBUaT2sD7OX1+BJc049ttr10nZVwOZYp/0FvA4ifxnY8wM4c69vKUiYbHi
	AKnbbPgCJMj5WWOBNPs4o88jK0Uj7+jclIrUHV4D2lTq4lDHOr/DoKtPmLEiGkPCO2m11sgmaCz
	OCJr8SkCx5oNN0Uivi5XDSeOxiLSOqqDyob+7M3RTUGaPjYwN/LaJQN1GYJGCn0sFUElv/qzUWU
	8S+bCTizISgIE4h2tZtmXuwZJHeFOWFJ9oPIMUHrQHPEB4fwsuyrxHs5KK+UY/dKqjO+GiCaOtO
	X/PeijPysTC7pJ3VprWZUMgGlQay8AhPLYQkJ7xvjzWpzX92BStA8UZnkS04YEv6MTQ+v5teD1B
	mgbP11mjOjXfOWAnNk5ogEsok6jsbyLbr2yHsDeyjccsjF0fUzHA==
X-Google-Smtp-Source: AGHT+IGu8RMLKzLo8BOY170+z7iR0pY7fxNUrGGhL+R+TWqAS3vdTV4sDAKNyytwuJuzGU8ZHuK/sw==
X-Received: by 2002:a17:907:3d87:b0:b5c:753a:e022 with SMTP id a640c23a62f3a-b76588b14b8mr335110566b.29.1763658801175;
        Thu, 20 Nov 2025 09:13:21 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cefeadsm253909466b.6.2025.11.20.09.13.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 09:13:19 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73161849e1so299559366b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 09:13:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1iPthLLuOqUb5CS0KAn5vjXwHuPNQK/EgPs6oKsXv5QDc2pLg6/mPUn2ez7j8HKpjTHqmfYlLVygtlKmWBQ==@lists.infradead.org
X-Received: by 2002:a17:907:84a:b0:b72:5e29:5084 with SMTP id
 a640c23a62f3a-b765869343emr280912466b.4.1763658799257; Thu, 20 Nov 2025
 09:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
In-Reply-To: <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 09:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
X-Gm-Features: AWmQ_bk3aT3ZuUmLknvARxMmblGOEsNctHWpwZyyDwMRW7H291WIp2zvCdFNcjo
Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	incogcyberpunk@proton.me, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091326_244518_D5BF250B 
X-CRM114-Status: GOOD (  19.36  )
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

Hi,

On Thu, Nov 20, 2025 at 9:04=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index fcc62e2fb641..683ac02e964b 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btus=
b_data *data)
> >       if (!btmtk_data)
> >               return;
> >
> > +     if (!btmtk_data->isopkt_intf) {
> > +             bt_dev_err(data->hdev, "Can't claim NULL iso interface");
>
> As an error is printed now,

An error was also printed before commit e9087e828827 ("Bluetooth:
btusb: mediatek: Add locks for usb_driver_claim_interface()") too, it
was just a different error message. Previously the NULL would have
been noticed by usb_driver_claim_interface(), which would have
returned -ENODEV. That error would have been noticed and the message
printed would have been:

Failed to claim iso interface: -19

So that error is merely changed into:

Can't claim NULL iso interface

> what should be done about? Do drivers need
> fixing? Is it broken hardware?

Personally, I have no idea. I was mostly trying to get the regression
fixed and, after looking at the code, I was convinced that this would
get us back to working at least as well as we did before commit
e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), plus we'd still have the device_lock()
in place to avoid the problems I noticed earlier. It sounds as if,
even with the error printed, things were working well enough for
IncogCyberpunk.

If someone wants to analyze how / why `btmtk_data->isopkt_intf` would
be NULL in this case and if we should do something better to handle
it, I'd certainly support it!


> > +             return;
> > +     }
> > +
> >       /*
> >        * The function usb_driver_claim_interface() is documented to nee=
d
> >        * locks held if it's not called from a probe routine. The code h=
ere
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thanks!

-Doug

