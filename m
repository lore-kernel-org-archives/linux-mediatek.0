Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E7CAC58C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=; b=JX1QBPsAAwT2YS8rUCiNZLCaWK
	XlziSPuePVRGB8LfV7j8yMc6OMQPmITSpOHqesCiV5Dtf9xmdWPSw7uOpe/iPA2P/CiHVlnvfWbpW
	Ja28VQFUv3YX0zUNL0fMwnAj86WtSkpDhXKtQrsbUCg/PeHlRX6xdS+DQyV1Pjp0xVl2A4r/kpP1z
	p5pb1uJScJyjHezvKRaEPjcE/1GZJkR9i/F5WvOvfMs2uoDjUllmbV/hC5u2cugpIqW372f5nEvZV
	r1LWIu6qYm60mi6UmLTPKGxC0mFRqwsgWpicCc+pLbS9Qak8s+EgzmdvC8u5zs6uvr3EIgNjOQbo8
	GIdwhDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21K-00000008wcw-37Tk;
	Tue, 09 Sep 2025 17:20:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyyo-00000007cCQ-3mhL
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 14:05:56 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-567fb8be044so823649e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=fOrHRiSUspGy9QjTldyAq1tt7jzEeEjMcduRuS3czL3ujn0QL5UZdrCISBBdzGu5a3
         X2rNw7bTQJ6ri+ybopFOs7nayUC0srAT20Q8La7wKVfuFYRCuhgyL9zYjIKW/beo32xO
         lvTkOm/iaCyMBL2NiIu68+OQF2uSekVmJrL8iW2Hc2FBh9FhaZdM7D4B5FQvwdSPQGJ4
         JnZ7XPijkwft2Zj5Zl3ZccLHDRVttz62LcGI5ThhN65NrnuvDi5PQWTatqkBMSOjkxdj
         NsiERdZvKNS2FNxfxeWY6t9lpjXAhksLY+8qsFKbNgQbgPOk8YCc2q+yFgL5rZhizB7q
         FqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=rM1ztIc0adtksGRUUJCa8L7jGOp0lf3N7HpnCzFW73iy3j9FJZbkSqduC1vXdOHrWV
         M/V49mpObYIbvck+PfnoJDY7sHGCToIh71dzYdCcDMMOT1oVfw9uugvRH+JOHb9VvPw5
         lrFEd0HAFFLv86yrSC9HX20bLJzmyywRvovLlfOZ/WF15+6zVUuJ3HFxxkiTJhpq5mxf
         L0+z2+BVXp6aeViuwj29ZrNO6iNr3JhlRdqOST0vzozI87ydmDEMO5+SQ3yhD7p70WMY
         VWni9sB93S/ct0lI2XL41FdI0960XqlxpPI68xMOkN6JclmE2MrcwvxMvIy060WPvS+Y
         U55w==
X-Forwarded-Encrypted: i=1; AJvYcCUwgrghreYtz/hwta1OgXC2Rwt19byhcRnKeqNQfrnPB3fiXVhip1BBIO00BoRfYb3H8Ute3sLTuTv0/G2gig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKYRh5d2YGKXX1sfp8nzqMLgz3d5Avr1dsy2FM14ERQXO39WRK
	5LRu3/da8aWBPoOzT07U2pvIEfp1rHB6ykYuZLU6WdpV5OKPtvHYJjcdME4XGzQ9WxcEDGBPltz
	cN8qOoPD6R+ktmyVf7u39NZK1Bbx0t/HNtHTlToWcBA==
X-Gm-Gg: ASbGncukAk5t4mZQTRjg3S8Qss6VtqCjrr+s8Dsd6Pi9QUOwlur5PiG+bOkFg8n7FdS
	EhKxJb6xhTUimdnuv6ih/WNPL4n0lkQSL065MpWkXPtYzmjked/fMNNSLd+G3+dZwoEOuX6IyoO
	sWZ+a0kkMGPxsr4C+nhrkpaH7WEirCE3PwrFsG0XlkbXDRHRgvttBKypKrJm3o/vJGOxZdU3iQw
	CB4Q4W43P2nvE3wqJ3qYu78Qd0fcMHXwbOt+FE=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070555_013090_EF026493 
X-CRM114-Status: GOOD (  16.09  )
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

On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > TBH, I think those 6 all made the same mistake, i.e. thinking of the =
compound
> > > literal as a cast. Which is not!
> >
> > What do you suggest?
>
> Write it in less odd way :-)
>
> foo =3D (struct bar) { ... };

I don't get your reasoning. typeof() itself is well established in the
kernel and doesn't

foo =3D (struct bar){ ... };

evaluate to the same thing as

foo =3D (typeof(foo)){ ... };

? Isn't it still the same compound literal?

Bartosz

>
> > And are we not allowed to use C99 features now anyway?
>
> It's fine, it's not about the C standard number.
>

