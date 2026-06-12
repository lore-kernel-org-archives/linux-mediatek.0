Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FC6CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=; b=wqwV7cnUaAnBx8HM1gfjbPmTCg
	JXGcJ+49LTf8K4KvFdyGxdOunzSqED2VQq4AxacEeglNwz3Yk4SnM/52tOVD2GpzyCKb1mIsHVrbH
	vwVaBNx8LbKZ4jl17MJ7EdTP6S1/nmwrwb7EA96rCuyZLbPoNTI50kbxWcT5+WKsP+2kgw5imywR7
	1SIQeZFvFOwdQrYsBoOorLbRI2+Mbd7tZHk0dbhMDyLqyus8C66MqSAYMTR9Vg5Y8W7rJoqZqzjCm
	nlbM0pMztV/cbO9kf5hIy5XZUUZ7ZlAsQqpB1eJM6tR+1gvtNbfoq8e3JsJWv6RW/jMMOaOcGIx2B
	G3EJYJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfo-0000000AV9a-1O9e;
	Fri, 12 Jun 2026 07:51:28 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfl-0000000AV7a-2dvF
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:27 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7e16f05fd79so7549147b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250684; cv=none;
        d=google.com; s=arc-20240605;
        b=CHf2YilK/HejbNrqk2G6bsGzI1e0u1CSjE5bTbMIcXPZeDJ9SjHy/oweITdxSwjWgl
         +d4wooGMfbSIurDM5uhqhJDeccc9Yp3Jxi5RKEIUP4IDGQBcySTEAquqRnknXTlsBVIw
         AxVNIPavAbrYecHhIlVHuE1aovfRUbMSM0Gs0RbWEQcpwHCbLxeivdlAtINHvWM1i6wE
         gy62GU2XJAZP1YkpDwa3UzoThui/Mqt01MdsgKeQIbskWen+nRk1SmpHG/RpgU8iF80m
         Egrw6QrYTMZDQ81ERTwKiZrMRuZKwUWziH33DviC2MY2GEoZAZdjdmqkYPOJqfKi+Shy
         iVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        fh=Wheh+/R4TE2cF7F7Eau7q0dJRrAM7QtnYyInPQwmXSw=;
        b=SwuS8CWZ7L9qmOCX8yjnqTzI/s70nnMsu0/xVtTTJq1iwFtOG4pStcu2HjhKcH+LYn
         6hdZ5OehJiczcmPQXR/g6WAE0vogARfwnjFzJbqgp90G0Eqob69JX8mEBqP2sku45nYw
         Ca/vL2NA5inBdZt7GfF8XIInJpDgXNpRsbERWs4H5mqYwXElJyf/u77slG+MLuxi331C
         UFv0gwi+BqOqTDtDulNDj7xKi48+yulwGpX+AjFHK4KupD07KjLvfE62ZXfTVlXI9WQy
         gA61JF4/5AjBlHalsPjueXc5ognU9IRNeSM8Qc9PODUFxNTBonTdEmOsgfu60gMHyQ00
         F5xA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781250684; x=1781855484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=JOhF6nOIbCfUZAzO2UuSe0qzd2eq4vdOYELm2ohhzadLdFxsnS9creqTVabmmv8SgY
         tenPr6AnFgaQQna83MK46w0fKrsZ5hYL7laWujJgaV3o/fOM/gEWxv8hEB9imHnoLM9N
         evD53XulURY/6DfuOnr2yp3w5QsRgbTOTo5C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250684; x=1781855484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=mSu5RsNEsc10RiH1EVYhJ+pusZFzZhrMlqtrgcgdiIxIea3F0fnxFJ0KaYZ05ZpNaA
         TW+g36JCpbWcI3UvsZpp1HnbrSRZybhfJK2Z8pavuIchT8vQtCMc8gyFZOrrxecoXcix
         Bi2lV5GErOBK/nZtA8CMjr0T+5mifO/6fBv/pWg0LJgYLeZru5VQw90d1GGX+zvOvDwg
         eOY1FfWmtgPtiORTv8AkZmS3TwjCi90yoLrml2G0xpPwI+FziPR25v5jxURLqsNkPdNi
         2ogbthe8UubBGyIwhdiJkxTLeZ73b54BCEZOMaE/s2aM/cb3f17VuAHGZPxNZexPc2FQ
         fX0w==
X-Forwarded-Encrypted: i=1; AFNElJ82KClR6Dgx6xp/i7yfCcsZWVYYrwm9exiQZ/WxyziFsgaXHoBaNvpK3S/ghm8eoBzrjZhIodKE+FsX6NzYng==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywju+ZMPbzJSiuidF1iqGbGRGbhLWFVdiW9HClMSnmG+wEIAsob
	8w3dP6tBY6p+sxAo2u+BvggXOaZyAoI25BFKqJqYUdXp261bfXxhESdJ1i3OYBIRdZna3oN6RhR
	Fkll3NJy5GDW3M1VOFMNdCkPGbIJd4rO6wEL8lBGL
X-Gm-Gg: Acq92OEbum2wQ52azq6FCiEwQlmTERZ2N1SWAmMjX5gW5/s2NYySW3rPla4wGE/hroh
	O3N+2NbVVHcr7qVGtqNFzl+RD5MIsBnbB8Qd83/iGf9nTSKRI7ShWL2xgkCuVR2hPvyL0PiJbiV
	FOx7AsQYcr8AI8meWp7nW2BZ2QObeHP6NLPTN6TPnjcY2d3pWIfa8VsZAMtrbT5WNA8YtBuGALM
	iGNIp9jgJMowRuN9cyseIwS+NMNv3/cK2lusqMu/sMTY4QebK13Z9P3+MunMjvwyP8BoH5e0RxD
	m48EGy4O
X-Received: by 2002:a05:690c:ec7:b0:7bd:73f3:7a70 with SMTP id
 00721157ae682-7f7b8523999mr14898787b3.32.1781250684397; Fri, 12 Jun 2026
 00:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
 <ailytpKQcvYTUH7j@ashevche-desk.local>
In-Reply-To: <ailytpKQcvYTUH7j@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:51:13 +0900
X-Gm-Features: AVVi8CeA8ndBvqsmj_bBdEg4mr2h2E0R3_zPJJzKBFEx0mTdugBDzHIodwmMGm4
Message-ID: <CAGXv+5FrD7abUvw5JgZECcGBvtOOpezDtmUrCRmVAbDx0ApxhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005125_839755_1BCD8A3E 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Jun 10, 2026 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> > The addition of power sequencing descriptor handling in the USB hub cod=
e
> > requires dealing with deferred probing from pwrseq_get(). The power
> > sequencing provider may not yet be available when the USB hub probes.
> >
> > Return the actual error code from hub_configure() when it fails, so tha=
t
> > the driver core can notice the deferred probe request.
>
> Makes sense to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> One nit-pick, though.
>
> ...
>
> > -     if (hub_configure(hub, &desc->endpoint[0].desc) >=3D 0) {
> > +     ret =3D hub_configure(hub, &desc->endpoint[0].desc);
> > +     if (ret >=3D 0) {
> >               onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
> >
> >               return 0;
> >       }
> >
> >       hub_disconnect(intf);
> > -     return -ENODEV;
> > +     return ret;
>
> Can we convert to regular pattern, id est checking for errors first?

Sure. Will do it together in the next version.


ChenYu

>         ret =3D hub_configure(hub, &desc->endpoint[0].desc);
>         if (ret < 0) {
>                 hub_disconnect(intf);
>                 return ret;
>         }
>
>         onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>
>         return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

