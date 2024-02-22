Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD01C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=; b=AejLwH/1mSxFK/ZT33NtDHBHjy
	IMabrXfImJMipu+hgO8PsYXmcW1RaiIkqxQZw01LXZsBIgYSRw/+uXv28oV4C9aqM3p3lzOCOyBdF
	jku94GfZld7GTU4SEe+BKc554DsQj45Apo1epP3PkjGyUsFleO5TeWrJlwP1P4u1CyqXdNLmdvRyv
	2+iN/CBRYjm0dCbLMizxcgmEbZ9a1N2SEofzvfi0ByJxlDcZf0b/ojGHL8+TexrX1g3wGs8pOR3Va
	Gy56L7QT09YrFq/R9iiXynYV7XdaqKpkZHwyNwr0X/uLaeq9yfKHg1S/KEzFOc8M4weZ7VC7O0gJA
	hW/z8+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdAjR-00000005Klv-1PPU;
	Thu, 22 Feb 2024 15:11:29 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdAjO-00000005Kk4-1fIk
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 15:11:27 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d2505352e6so35529701fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 07:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708614684; x=1709219484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=IfkavVjQ1gDdmjf+fATdrdQbLmO3+TPhV7U8Ydta1SUltuSQnsmfSmd3EhRqdw8DS2
         /XlxEsnctTWASArYyAyP0K33/HPhEZKRufWrFRTk0V7bZjB+/Pkih7f33mylz74ws6yx
         1qULHJBxsmNRZEaSfB4Cu0Zcz0FobVyo+flH3Ae1YvRHMIu9KWpo56QeFqoKKsgyo0Nj
         jx3Tar+JO/ZzMcG8lce9+JKebneL9TTRezQNFChSicTqL5+QxhE/yvvma7Y6SQlwpXnN
         yW5Q91J5P4khDtPrh7n5FnDt38IRUtB+3XZuHswyOh6vdYQStKBNh9tCoA56/vDA/5aP
         Z3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614684; x=1709219484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=icRtWjXIM3FjZzDuTc4/gV+RMxFGBD+Jw0lsd0vUQyv8p2V6Sz5hU+Mgo4S+1brF1t
         dQQaXvHrDUBtkn/QYVL5vEu2lwU7jeO3zq2Oo+v6ZR3ekRG71i4fheb0dBWpKSE/IIB9
         1L7YZP3DtI0VGpuRSzBonia05qBYU5hN1Xn1A8XEk2HeDIkdQRWf1EMTP3Y0AEOtii96
         9MWxreoI6W7OcMS6rfWT3kQIy7iFT6VEXh8i+xZLF5EG7Qh7AvemOgr2ntwd9lzV8uYS
         MPWRpI39dBOZCQyPdu4b3RbfAjODClBK8W9nqCjR2v62E8iMWhjb+DGAFTAttvsBIOGw
         27VA==
X-Forwarded-Encrypted: i=1; AJvYcCV4lHPeWY9eAo84ttlJx/EdTqn4Mn0THhzhP3Qadhms0dG6jxvfGc7pnIa03YfeLF2uCKY2WYlPqEOrNNnVQhLwWUUej06V+ARDx9y1jmcUNzH9
X-Gm-Message-State: AOJu0Yxp+29iUOu6DjcGS7XXsOE++9tvv1kYs9YW7PFTOILdLAUGqhQe
	AGiNHSKsqTk2jPqdHBfl23Mc8mzdfDbQNpXOBfLKQ/cjb54u+sC7QbuYE964/3uzn5cPJV+TAM/
	hMh5WF2lJSwgV59Xbu4mjrJrwl2IBTW8BS8e6ZA==
X-Google-Smtp-Source: AGHT+IGw3hbqPWYN/3vfhhQBFzrTvi1PbeoR9WvH0886TzS1KyGrr602I8E8lLCB6pIuc8bHxZF8tDM1xPYr0gG8zd8=
X-Received: by 2002:a2e:b166:0:b0:2d2:6002:c239 with SMTP id
 a6-20020a2eb166000000b002d26002c239mr1510902ljm.3.1708614684451; Thu, 22 Feb
 2024 07:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20240222145838.12916-1-kabel@kernel.org>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 16:11:11 +0100
Message-ID: <CAMRc=McWhC0ZdR55TMkkdVov=dwT0=H-4_c4J-bq0quRpvyoBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex init
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_071126_684945_8538D472 
X-CRM114-Status: UNSURE (   9.31  )
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

On Thu, Feb 22, 2024 at 3:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
>
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c

Yes, please!

For GPIO part:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

