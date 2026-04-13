Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE972EBFD10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=; b=go21HdaPpJh59Y3f6QDO5sO2Zh
	+Yh4KvvZrp5s4CFfMGW856ZUTdxK5F0bUtnyd6e+dfigwRcoMStcHXiVttdteh7J0kPyJidVww641
	+1Kl9yNrtK4++7HbH4U1VpQttPr0wnk0euK4PpucKj4uU4oB2WOuuJHzPmCvJsf9neapBNyIfJq/C
	2fvY697Rwvp5klUNBRsy6NlYyBcAwikULVflk89IqoD9f6p4MZMWMk+fRVg6uwcOBo2ZchQ3YToOt
	5/P3Ue3/NzutDLBs2h+Y/M4Fq563p4YaGJnjAGG/b+FMV0Ar/qMa+CtDcytePmhPsRku1UHh5myBX
	QUKrQcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCET-0000000FCsK-01Xc;
	Mon, 13 Apr 2026 08:01:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCER-0000000FCrW-1bHv
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 08:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B71144206
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA8BC2BCB3
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776067278;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVL+C4Zlx2UQ+13koLXQcEPQGEYAoHM+f0LLebzDe96Dwb480JRfo4MTchku3dCTW
	 tBITlIPs0vJiPMM/IcM1utoDatp++soq+yU/OBW8rP657qOO/Um+Bw1vzea9K0/sMM
	 e8isoJqw6QJ1XzoI69f/4RW3I+sojwEV6MmZXeF9oM4HX2u4Rhj+wZUwDLBj9oNMVB
	 lfZPSCWll3xebdJ2uP5P3ykgSg7h5pa9dx0NBarNfmiVMFYgLOjEVZWyNj4jciBJ0e
	 SyRRNNrnhMnz0zgec1XVgwfnbVmeIRxM7mYfmMkuqdHzQ+pd2hcdHrX4BMM3Gwgie4
	 1zDEbHlo1Po5A==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651c7ddf514so647892d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 01:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9EYXkdH4nQv6WVTyH7cXNLDwAU1Z7nOK5rpSCV2TzOPQuag4rhZYW99gXo4SQUzkXDlq8UjTHjySpdiCvmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt7prFD62npGPs+x5BqXvnBQ0Qs/YL6s/GW5kCEn4MCHSd/poW
	zySJADr1t+BbUwe/fAf4/EVtiD56ud564q+83Z6OT5qbJTDBXrffFKIwTmb2ItlSS9qKCbudq57
	T9vN4LK4WbNGjg5EliU0dKWooc/eTwKU=
X-Received: by 2002:a53:e1f9:0:b0:650:1d3c:2ae4 with SMTP id
 956f58d0204a3-65198a7ff99mr9464905d50.19.1776067277379; Mon, 13 Apr 2026
 01:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com> <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
In-Reply-To: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 13 Apr 2026 10:01:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
X-Gm-Features: AQROBzBVbNkZQd5M-JIcoCwBqTnfC8gpTQhwy0nP69ggr9JlXF4NUsZC_rYcX28
Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, 
	sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, brgl@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010119_485606_3EA11982 
X-CRM114-Status: GOOD (  10.40  )
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

On Fri, Apr 10, 2026 at 11:24=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:

> > Gesendet: Freitag, 10. April 2026 um 09:09
> > Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@kernel=
.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias.bg=
g@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@colla=
bora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, lin=
ux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartosz G=
olaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_dir=
ection()
> >
> > If the gpio_chip::get_direction() callback is not implemented by the GP=
IO
> > controller driver, GPIOLIB emits a warning.
> >
> > Implement get_direction() for the GPIO part of pinctrl-moore.
> >
> > Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::=
get_direction()")
> > Reported-by: Frank Wunderlich <linux@fw-web.de>
>
> please use the email i used for SoB in my linked patch (closes link below=
), the other email i use only for sending patches due to mail provider limi=
tation.

I can't fix this up because the closes link isn't working right now.
Is it the same
as the one this mail came from frank-w@public-files.de?

Yours,
Linus Walleij

