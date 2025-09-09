Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE2CAC582
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=; b=raQjhG2na4qqerJX1EtNWv6g/M
	JyA2vsT6hVRL1azehN+JRatN1J8DvZyKLH850xq4RWO41XCJV8uYV7AM+I7lOSLGtMxUtr7oYAhfI
	K2BNZjhgTitJFhwqp6DSCyzeG1cZUNI8Agu9bU5Y6Vem+92xax+w/hRGipXW/DoTkt5TR8DKaBTO0
	yI/TUy2SFMUUY8dNtX9sAwBJn1dhSOFhCeLnvYpgmrBdRYUqb4QkSms/PP92XcAos8xn5t0EaIb7f
	gwGT+ZyGOkn64wKibbdAdthqE7lalasaS196YwCAq162lMYqd8oTQcZoOTUOIteyUDJOf0MXFWeOX
	QoipHLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20t-00000008voA-2NyA;
	Tue, 09 Sep 2025 17:20:15 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyq7-00000007YfI-1sXn
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 13:56:57 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso7029582e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=Sp8d2xwmKwr3jVr5l9GXWmWjIi2tquewIqa+ZdWdW4Fylf7gKvhpj+hFX43xSvACv1
         cxvMXotkw9Nm8EW2KGfoscZsjYtWyRPQmMzW0z5BM3EpoUWmIDCbVTcwtixKPryiAtOv
         W041K98FfQyU0wCbje7kF7xU37YcXbx+rBXNION5MndJARMAd2Z3BHcn4vzODJb1o30t
         W83oOjRrxccGo+b+z6agsUAAkOJmiZQhBmGyKYZYHFQasanA3wQJPG87YaNzlKda0axL
         gy8x3++EYVVBlyZKBn4SP+7w1CIMIDpFkOjdvkwO7xDRszuqDyddS2T1Wgj8+PQ/Qk2w
         mY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=EVutt3/+ALLkxtceRk0nG2VZiip+b1QWHpPKrP4jhKCxG1WhH2raR7eCuMvf1KI+Fh
         z4y3y6jllJxW6uaZdI/XmUwWyae0Pcng7sLMLYpAFNgqKv+TnP4adhdsjKw44eXoZlAP
         iKZPOJaAiRXghf3AXD7PyUX5rWKE0pX7tRfX595N6iJDFy1kUWHxAcG/52Ol7laLSBxE
         X0iqK0cE+8vfxCZKxmzI8badUYrwwmNn0uS2GvQ0f1j6i53f9L7Caz69wiQ0gwlXKIO+
         tUEtojs2p2eWXSW0yRf3yA5SI6Il20znyvy+istGilBpexmrTtaO6D8cg49fUarHSF9C
         BVhA==
X-Forwarded-Encrypted: i=1; AJvYcCX9hNSiyGCnaeOKhoK5sca7br5Hheafjtzfi21N47Co1s4okrCYRmOIT0Vea5jgalR2qgjU39hWWr6VtOX5sg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl1BKcDB9Z9gNfPqEiht6H2EflHjXk1QWBDAQgPOm16fMW0hgf
	as5123quldqJA4iLKvSutqKTE8lcZTU1M1XqEJSdluBUIF8qhh46mn8FTzR0eEiqcMu0WFfzmaY
	QUXvKK40rlpWBhL4BWZy7e03QuPi43eQy6P3t62veww==
X-Gm-Gg: ASbGnctqxpUWjVrbDpKBL3wuUwk+0TccBFSGclIZazNbQu75DOJn6aPhN2Hjb3P3WvL
	A+sOrq60k9c7p69tVTpebfLQ50ZPv6BjUnIOah6ukNQQQcQLzgnhC6m2U3PIjaafLyTLSk7Up5I
	lhiAJ2irHgeRkObfGRZxrf/Mt9Q298YUWByTg+LPf6QcxNXocQXxalUzvXk8wy+4yyR8KOzRhL2
	TrLdVqcy0gRiQYXG5OVdahSwD2xE8JfNCiyrnIBvuSH2HomPQ==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250909_065656_123054_A39A5B52 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> TBH, I think those 6 all made the same mistake, i.e. thinking of the comp=
ound
> literal as a cast. Which is not!
>

What do you suggest?

And are we not allowed to use C99 features now anyway?

Bartosz

