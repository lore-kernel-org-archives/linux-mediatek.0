Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E0C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=; b=ZDx+tKqdqTPsW5f+qVdnINDNqy
	uibOCh5gPKMtZJ02KIkuwJ4YbclIhRgc6UIEIinOOwJI/sZQIZz0d+Qb5fcyVxxxWuQkUo9oMqk9U
	QezcCwu6JQbwlP58ltZVDvE8NM7XeX0bW2r/X5cYmAVPCYLEHW0jODCT4Ry2NmFrt9KaQSQhkqoDj
	4Uude+bx5Sfi4+WfR7Xb8Lui3tG3QAV/2v8TmVRbMJOpLPYxDuTsK/QMAN+C+dJFAPXZTqOOsPLXl
	gsEu9bsnhM1XbCWisgmWm/cZQCbjoEOyGEmQ5bvMCCPmG8DyUqp7vdyD7wt9efppB92hns0g9q76W
	YI5D+1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwie7-0000000A8HN-42xA;
	Wed, 19 Aug 2026 15:56:07 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwie5-0000000A8Gb-2G8o
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 15:56:06 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8f23e851626so8540596d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154964; cv=none;
        d=google.com; s=arc-20260327;
        b=e1MlEP8FgSDLAacca92aF/RV91BpLPlNDxPXJjSgrjxtfo2rxzxXil9plG491WAOkE
         pnFu3voTxGRCVrwbTeNqqv703qFdPdZroOMNd8R6G6iJO4PitVCBhw6wOB7Dcis1HIKT
         Gvjvfxp6Imp8QcEjFY5XBaLMCWMkDMaf8vUOy7ul+bad+vrbKLDTSSWW6OQfz4ewmeCr
         KE5j+Kt5oqN3Mb7vgRTQNEZ9Sy+T7wQmsSoZQJ823Rt9VBV9yLXYsZySKBgJ0FYMIcz/
         nlCKQKm7pcO9NJt1yIhpZKLYuBRFTcnI4eBuy8jJ6Id4qadTIQCpkC7p4o4EzLo7w1ba
         jm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        fh=TDS7kiORM9ygxLFDIVTTpZ8Thh73BnSXGNTncg0bcvY=;
        b=RmI0Ik3VA0U18ybJ2NJPqJ5MTkc8jJBsGASYbrmZfoiGquctu0wgJVw+0cdvX4eZAb
         n1ZYjuwTIvojP8MQobJiS4eAbWXSvAK+fBHw1yCwlboYm3mTXdLXAXARSkc0pLQCdvdN
         EmmEQ6/qHtLkjF8fiF6zRhxCxu3rlOMFysH61mzzvfwu1fnAGz/FvMyar3PmXhBcT2xj
         wPZB5GjJSKBzS6hzRy6JHDYTKb1JhYqGbDUKtfJT7mkwL4L7HqbGOL3VXiGoKK/qRySj
         mEz9cxvchi60FdbiKkVc5nywmcRp2cXofYUEfSo/TCVB1OdPFLfkEa985qIWOcZJM5/s
         wMBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154964; x=1787759764; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=XFvjOVt0IEvB/Nur4L/+YNTcqNXLLaQbqTfqJDmvoO+RdMmDU1w0inki0LMB7PAJxj
         9MXDkEHJm1+SyK6YVh1nv/703jjxgC+XWw6wMb4eGOrJHe/NsW2APdYyZf3YlkVf/6gS
         rnWreGx1hWR8CKZQmZk8rVfRn9C2e3mml3QFgrl2ysa8hsmBCR+pBkSTQbjKz13LyFts
         PhdohO1CselrPG3Dm9xu4dzyiGbSZBLHFUgKPFanXK+7sLrmTDWQBji/opX4t9AykMwE
         FT9VrdjTm3qTw+mgDGC+dMYsvO7PaEE7+XR5xRYBiyd6o2DWuhLj7w3u8SnuMCaGv1Uc
         qNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154964; x=1787759764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=PsNZDJbLqAy+lcNhpj7KjQWr+Bs0vgckUyVulXxFmiPoFqMoJXOdBC2bmFxxA664YF
         LP/8wOPV6jZ9Ct2Y/d4m4zNxLY/Jz9wN+mypQXDmMJtaDWOk43dIUrw3JOTZVEHShoia
         M0AdLpFiDxHUySOCO+sN6bLr2JBYdYeJA+E1aj9SZycXn6DGSkN8Km4IzQx6RQEH/Nqd
         g1hCdVQ9idUnBh5e0H6RtyEXaVmnnmPByRp/2yQB9FIuktr0iDtR28r4zZfGvrMhY2rV
         8tg+s3A7h46hMPvgkjD/yySJOOIoIThN+hH6QwuV/ZxKoOyqQurKx07ATR8PqEOp8ncD
         GcNw==
X-Forwarded-Encrypted: i=1; AHgh+RrFUz3ljmI396TDz6KEjIGfZXA6RJuMsBdK0pmRPTvqP7MGIHB5pGjxgG+m3Rhlxrj7HiA4u9ENn1Gq4U/29g==@lists.infradead.org
X-Gm-Message-State: AFuF++kv7/h/3JvBcTWkzFZq59rdb8jr+f8PCnXOnNnx4WEeAzIuBEbr
	iF2bE0PR11JuuQKs3qLZpLKuTyYw+quTXRKcp6VSWijMqQJN9GIqzmq+XeWrJfYVzUBvxH1cfE5
	SygQuC1Uq65HJs194J+IQsim3TwoEJdA=
X-Gm-Gg: AR+sD13318lWpwm4tCOAeuVA0NG5B4HIZUHeQH6e4a7bYqx6MbUTcWsLIj3ilrTx0dx
	jgw1cDkBwJK/hwy9IJFAp51cMZo5C44G8CFV/H9Sr3jmnGw8fG9z+7gvAA3QIQ+gGc7PjOlR8GY
	6WYWcZZjnftThvCv8VDIJV6AeXT30+ZPWayOHVjBCXZAkb2kFx6jmcIbMEFeRRgJGL1sAshOrLX
	U+KfUVy9WNVrsQmR01M/tR+KcoWhJougRGjjV5tA2HDaAf6ZYogZcI4+KB0iQNglm7fP9dZt/tT
	BLtb53agydPJuD/kc1QaKzc67wEoLtK3vGcSo+KTTA==
X-Received: by 2002:a05:6214:dc5:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-90c5eac9942mr52592116d6.27.1787154963571; Wed, 19 Aug 2026
 08:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260813083536.970196-1-ansuelsmth@gmail.com> <20260817134727.1f76d6dd@kernel.org>
 <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
In-Reply-To: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 19 Aug 2026 17:55:51 +0200
X-Gm-Features: AcwNN1WR7Zj_IFCR5YdVpGhfxkJspgU8SJdxW5GIgyyCDjlcNc7jn8kiW6V-vUc
Message-ID: <CA+_ehUyRKtuCtak5XD_1LUMEmLTn4JfeSDapsAEwo304uxyVqA@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_085605_649103_7CB5CEE2 
X-CRM114-Status: GOOD (  23.12  )
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

Il giorno lun 17 ago 2026 alle ore 23:02 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> > On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > > This series introduce a most awaited feature that is correctly
> > > provide PCS with fwnode without having to use specific export symbol
> > > and additional handling of PCS in phylink.
> > >
> > > At times there were 2 different implementation (this and the one
> > > from Sean) but Sean agreed that this can be picked and used in favor
> > > of his implementation as long as his case with race condition is
> > > correctly handled.
> >
> > Coccicheck says:
> >
> >   drivers/net/phy/phylink.c:1039:31-34:
> >     ERROR: invalid reference to the index variable of the iterator on line 1028
> >
> >   drivers/net/phy/phylink.c:1364:26-29:
> >     ERROR: invalid reference to the index variable of the iterator on line 1346
> >
> >   drivers/net/phy/phylink.c:582:7-10:
> >     ERROR: invalid reference to the index variable of the iterator on line 569
> >
> > I vaguely recall that you're supposed to make a copy of the pointer,
> > not just add a "found" boolean. Dunno if it ever happened but Linus
> > was trying to make the list iterators override the pointer on exit.
>
> Oh! I wasn't aware of this intention... I have seen lots of pattern where
> the last value of the iterator was directly used (if detected valid)
>
> It's and easy fix... I can send a new revision right away if you want,
> I'm already on it fixing this in the meantime.
>

Sooo should I post a v15 with the fix? It would be great to have this for 7.3.

