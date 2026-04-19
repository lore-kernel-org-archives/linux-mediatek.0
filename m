Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE58BEA71AD
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Apr 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iw1iF7dNAsfFQcQhYxhaopT4CIuiJ9ePeCCPtxjashU=; b=QXVW8i+75SyKAX
	z1yTAMQHVF0hlgRsGX9kuS7esKFwQhW9liXaDXbf2m6qM+EOyihB+pmGoIIyTPY5Cgx7HuCy5OAVC
	238F28NR41k/S6I+uqnjUmL8hWqPD4qau4hdJ1RqOFck2seHhQ0IlG1IKcuQwQX4bP8P2JxkvTG80
	2UPxKBWeoY8sOD/wdzpuMfAHev8pyZ1TqcETapmyk4fDEF8mld4Z2OxbIvIbzQT+NfnsXYoip+c4l
	ac46X9amnCOJRWwm9D13dI752eGcdfHqBl0GtMtKBdqN+URPmmATt29gOyekUDFGMjnyKQBseMt2S
	+Tcbs9icPPI5NYec2xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZds-0000000669T-28V3;
	Sun, 19 Apr 2026 21:25:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZdn-0000000668f-1OW5
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Apr 2026 21:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67420444CA
	for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2026 21:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA91C2BCB9
	for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2026 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776633918;
	bh=VPpvhZnHqPvZTTZSZHq8wzi2fJSBw8ozWgwB8TOn5OM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OdSRI7Oe618HTNH8NyqZtcPnjws0bE+m/Y64W+7TLgbCMU+mF8IrK6RSl9I4JMXsq
	 Wrqmot9z2fahVxINLzh1FM6nuf+cRrKSJhgcIh9+BNEZKXHTcYRngsgf6TCqAcoHl1
	 xodsa4xGw9ztkJgqFMr33YkRTDOTt988CHDhQbDyX3ehUEkFjeCCJFIb06ns/1ZXLU
	 5Ys/8zB5wLJrab56YnDJed6AcFnI+aq5FYqQmesfKwdgaRytYM+FLvO0YCoDXlCPi6
	 QlCOJ/tg7KSyHpOhU2OhHrhw7QSR1BVZ/L+9sEtpT26kRn/Ef5Y4KHpsND/wbGYx9T
	 8bLssOUly6mdw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a283c44478so4065557e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2026 14:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98bwCtfp7WYxY1a/C88D5sG0Roni6/WOmbDCiq8Ocb+rcmeoU3GVcDuj/10hvwLxvm3Cw5rd5+UiuhE8m/4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB/zXt7RoOHPRLm0K5fk5LwvlwRNZ1+SOOXQoMAbwUAgw6K79i
	wv3+RAszfmfUNEN1Gq00MeOJonq67b7O10IzC0K9Obu4u7ImJjZ7OKPlMluchZZXwd3L53fD0h4
	aQvxkAaZJvA1WzmpW7oNlqn9OhUP6hj8=
X-Received: by 2002:a05:6512:2396:b0:5a1:15bd:b057 with SMTP id
 2adb3069b0e04-5a417183cf5mr2919080e87.0.1776633916921; Sun, 19 Apr 2026
 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com> <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
In-Reply-To: <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:25:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
X-Gm-Features: AQROBzD6GJfiRfmGUvsT5MRDRhLkl5NtG5OqsqcwlWbZ18Vb-NT9p92nuBlzqpo
Message-ID: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank.wunderlich@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_142521_128684_8D9EA43A 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: sean.wang@kernel.org, brgl@kernel.org, bartosz.golaszewski@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux@fw-web.de, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 13, 2026 at 6:59=E2=80=AFPM Frank Wunderlich
<frank.wunderlich@linux.dev> wrote:
> Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org mai=
lto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org%3=
E >:
> >
> > On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> > <frank-w@public-files.de> wrote:
> >
> > >
> > > Gesendet: Freitag, 10. April 2026 um 09:09
> > >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@ker=
nel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias=
.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@co=
llabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, =
linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartos=
z Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_=
direction()
> > >
> > >  If the gpio_chip::get_direction() callback is not implemented by the=
 GPIO
> > >  controller driver, GPIOLIB emits a warning.
> > >
> > >  Implement get_direction() for the GPIO part of pinctrl-moore.
> > >
> > >  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chi=
p::get_direction()")
> > >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> > >
> > >  please use the email i used for SoB in my linked patch (closes link =
below), the other email i use only for sending patches due to mail provider=
 limitation.
> > >
> > I can't fix this up because the closes link isn't working right now.
> > Is it the same
> > as the one this mail came from frank-w@public-files.de?
>
> yes, closes-link works for me

Fixed up and applied. Will be going in as fix for v7.1.

Yours,
Linus Walleij

