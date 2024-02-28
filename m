Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55B1C5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xocoGi8jKEcXqPEtTlyaHDUAiTj4nvNkNUKJpHO28io=; b=ZPwnfNK63DNCiNL6/vJhdW8CMO
	/P7cxeJya07jAP7K/yqh6PORi5/XEM+bng1/0/BeLHEOl3kezDevDuuXqtQ1N9f8fxI9W9J4IX/wp
	XOq0LImuaqDtGuby9kl+cTCw2elBVhiIcsF/3pJPHbBQ31LqpER2kClM+KbPXJXHZeB3ADXvMA0aa
	0LWPUJ68YifEUwlDjWDyOL8jr0Tsowzf5wylVgzYT9h7WTguvr6vf5vdVMf+ydUGu2jwhtW+STsrS
	pK0LFFjubrLN9H8Ri6TmRQYgCU72um6eI1BbtbOt8t18xQHZI3C8RB0/RDU8JN8f9swDF2N27ZoDH
	E4fOrNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNZ4-0000000AG8p-07lh;
	Wed, 28 Feb 2024 17:17:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNZ0-0000000AG7x-47uK;
	Wed, 28 Feb 2024 17:17:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so41210a12.0;
        Wed, 28 Feb 2024 09:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709140669; x=1709745469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xocoGi8jKEcXqPEtTlyaHDUAiTj4nvNkNUKJpHO28io=;
        b=M8q+qCEjjR6X1sj5EByyJwgAUY94mJv1uRqkgKeykne6sGS8iSm80V52VN10LFLHuh
         f4+/U6SYfrMM7XT+tFflgAGUvUUXy9kQGaRnp3+pXYKp22NutU5ZywgNxTrt8e2U4yK/
         PWgAkswKr19DY5jdDc7523ZXoRqXkCohQbZWYZBt9FJu8vs8CULsPCWTA7/Wt0pDOf9g
         AjW72zxj4kKLf+n483jOk0UdlmB/2ewx1sElHTmTP7u78vne9o6e7kv7Gj+PFVQ786/z
         Q5fKCgWdGqMr+dZcWki+HTvJaC9KtI7e/ahF+gI3ayrdcSX8E4wA/UDMRAmn4+mFMALI
         ZxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140669; x=1709745469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xocoGi8jKEcXqPEtTlyaHDUAiTj4nvNkNUKJpHO28io=;
        b=sRO2JmsJosk+5ZO2/Upk4b67siYB0Rial1OUMo991f6zpCMo8K8hp1046CJkhcoLcr
         rG+jWJMZWmqc4Jh6o6c81rLBKeaTT1foiZt4e0zOTg3pmYm2LMK99AMS+uJAEWWx5oSy
         a9a665eM7Y0aMGaq2vfFr3uuMMTOT0wb+ExBvoRd7bh1ReaaPIlte1rpVJB2LajDQAsp
         Iet3XQFiozDWS1Sbbv/1SYUkrkPvSHIz2Zc2itmXlEJ+BaY07C3iirTrTshPiKukrCh3
         FQ4ZkdXmEyRD7YCPkvn+1J/htJt5fUSgyy3e0NHplLDa5r7Iccsu4rtFYYDePKNlHznK
         xP+g==
X-Forwarded-Encrypted: i=1; AJvYcCXaMDuI/Vcm9i988aQJSHELKPrJAJ8uCbdQltqxIEWO4k/xemzoHMDcyEZ8++eE5UEsXETNLMyenlqs2gYwllsAPivysrl3A85W7I4JHx7wdSHJ2fNb4PAOds0HkHrxVqg8a+HS4ZKnAoWbbFli6P/SOKYbPqrsYgA=
X-Gm-Message-State: AOJu0YyoO0kvEpuLuBm72zN34WLFbtu+H9GIX/R0pS+H2wtnOkaVvvbp
	CxyZYd6OsIGR1HRu6mNx3XL7c+KWEPLQvKvt8U3vzAJ3L42oRy4xiP3iZRfi7ZcdLAWg73irJTE
	2gNyYU7LqWAePWJsNXd8cQ3V4TY8=
X-Google-Smtp-Source: AGHT+IFjbMeUiMmh+ASt59pWEkhNEGqIxUc5Cn9H7DqKZvTv9qyojAX2JuTlbI9fMFKSxGAxUhpxUu34ayPjbjE+CM8=
X-Received: by 2002:a17:906:c353:b0:a3f:52dc:7872 with SMTP id
 ci19-20020a170906c35300b00a3f52dc7872mr214495ejb.62.1709140668947; Wed, 28
 Feb 2024 09:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20240227013221.21512-1-zhi.mao@mediatek.com> <20240227013221.21512-3-zhi.mao@mediatek.com>
 <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
 <b4889fad324ec88eb3a22f51b0aa512cc93bd2cb.camel@mediatek.com>
 <CAHp75Vd=X9e4rOJabF4AbzGRZAF4BiNJa-C4ivOoQb7kAMy3vQ@mail.gmail.com> <Zd8g81wBXyfMvPhB@kekkonen.localdomain>
In-Reply-To: <Zd8g81wBXyfMvPhB@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 19:17:12 +0200
Message-ID: <CAHp75VfXY=Hv_o_CYe8sNYoBa1vtYWuk4Sz1M91XUp0cf4HjnA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: =?UTF-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>, 
	"heiko@sntech.de" <heiko@sntech.de>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"yunkec@chromium.org" <yunkec@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>, 
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>, 
	=?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"10572168@qq.com" <10572168@qq.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_091751_054300_76F5CB17 
X-CRM114-Status: GOOD (  18.26  )
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

On Wed, Feb 28, 2024 at 2:03=E2=80=AFPM sakari.ailus@linux.intel.com
<sakari.ailus@linux.intel.com> wrote:
> On Wed, Feb 28, 2024 at 11:22:13AM +0200, Andy Shevchenko wrote:
> > > Another, I also reviewed some other sensor driver code(such as
> > > gc0a08/gc2145 and imx/ov), they are all the same.
> >
> > They are also problematic. So what?
>
> The situation is the same in a large number of drivers, also outside the
> media tree. It's also not trivial to figure out which header should be
> included and it tends to be that if it compiles without warnings,
> developers won't bother trying to figure out what should still be changed=
.

I spent about 20 minutes reading the code. Yes, for inexperienced
developers it can take 3x longer, but still, much longer time was
spent on writing that code to begin with. So, the headers are a part
of the evolution of the code. And now it's pure technical debt with no
excuses to not fulfill.

TL;DR: It's (rightfully) assumed that the developer *knows* their code.

> I wonder if this could be automated by using the C preprocessor and a
> small Perl script. :-)

There is a Google project coming from Clang people or so, but I have
no idea of the state of affairs.


--=20
With Best Regards,
Andy Shevchenko

