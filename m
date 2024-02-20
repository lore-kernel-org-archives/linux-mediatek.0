Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD61AC54788
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6V+rVntGm0bOfQX7UIre1kuKHlkaeQH5c/FoECJBeI=; b=P94u1bWg+RbENBU8iekleEiwDH
	LhxNhxac5LWrnYCF3uzOzEQSYaEJP5jneWGaAWH8nZgvyJ0GW77Hw8jfszayfOFKwtgy23Lhyw040
	5iIecUBRQFEbz+atKGY65wVC2ALzoSWnaB3C5+n9Cmxk64vjgFjzfSJ6aaUwOWGJ5ycf/wHC+KHk1
	KpuLzStYj32RYZSu0Ltunl+UtHTfOkTPmC+TObfaUheet1CkEdHKVAA+3zjYJ+0vkuKC9Us64zV6G
	0fKe5ChL/brVUJnUAI/AFTPcr1VTrEbi00mGXaROJF/gq5+8u79ZK+riV5KbcDJ1BZw9MVN/7ETv3
	OAi8Qtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcRvU-0000000FEbn-1sEh;
	Tue, 20 Feb 2024 15:20:56 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcRvR-0000000FEay-00ca;
	Tue, 20 Feb 2024 15:20:54 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563ed3d221aso6727751a12.0;
        Tue, 20 Feb 2024 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708442391; x=1709047191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6V+rVntGm0bOfQX7UIre1kuKHlkaeQH5c/FoECJBeI=;
        b=Wpbe48MRHlPTW2NqkKtVig2Du4+BU0QCWFAdwaAwtQ6YFR0L6X4uF3v5ghO2Gha/Vd
         2JkdP3xsoIwLL0Xk4BbAQ9yPm6M/NWc+3i5AURbIfiHEFaY6vbAm1uif2Cx3sybUMSFH
         osQ4PmwE8uuK7Vx25t2gmUXn8iAvnIm8NYMx5QF7FpRKY0sopXebFwSEM8s1zeZ8VLrt
         FSNK2SCzb2y20asj3NXhygfyqCVrXzrCoo3U/hklbRKPi4ip4FMMlphJsND9sMmZ0U6X
         bGlBRhUgNnIHkSVPsPXRxy4U0MUIA1lylhQtN6Q8IHIEuIgbPyD9lRmUw3saNhwcR1X8
         o+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442391; x=1709047191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6V+rVntGm0bOfQX7UIre1kuKHlkaeQH5c/FoECJBeI=;
        b=Stx9DkvT2xqe3AA8nt1nutKUdcIG1HoIqU0WDtO6s+PWsgoNFDhYn9wY7lXTQTvDwV
         HZKP9Qpydm5ptz3kdxZGdNc/WqS1xrf3vEwxaD2qAUuAtxqiMIgEPZtFmTzC4vMPfPrx
         Kf/vVf9/Aniy5hzfwltyZSEnv8gWlIDSD6BCGg0i368qCQjdg7YXt9tUbV8TyEtYoaa6
         wrb3zWQHtg41sRndB0ND05xqNrHbxuDUkuV1JypgscgA55kzTpp6Mo2rlwVbkDNvELNc
         gzr7vhda53ohCBi6zxfeOAn4ztEwaaTIOkD3BHNkLyyoPa16MwF1xCDiH13AxT5app6B
         O4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoyLJK9uk20jacVihnUgKkFa5/+TW9zzjmsZu0ig12BCUX8iKW2l7zwLkCecITE45lWKH3TzCb3vtJ7rH95F/DWaVb6Ccc3OI2+zy7huJaBNECN1AE+5/ko6Fr087sD/c/9iObf7zuQ+psiHf2ma3NbNDIvX8Dxjs=
X-Gm-Message-State: AOJu0YynuZt5+JoND/maqQ2m/TvpV2eYaTLAayurpHjSzdGH6+asV2EJ
	G/vA0/y5JhtOEMeoU7huMoejPhCL7QIK5yQDehGdEWBpQBk9mkdA+ChsnVIbaju9nyjBpGGrp/3
	w8IATFCB9UYbZWJhM5echgNPiuxI=
X-Google-Smtp-Source: AGHT+IHBktehyWtuPC8JEh2f3v6ZPaKc7tieXF4JIjb1uKLdxCvS6Vf9PHPXLkJ7d4YELA+8vPBi/rm2rEx/UyXknd0=
X-Received: by 2002:a17:906:fa87:b0:a3e:c6de:e5ae with SMTP id
 lt7-20020a170906fa8700b00a3ec6dee5aemr4612713ejb.0.1708442390911; Tue, 20 Feb
 2024 07:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20240220012540.10607-1-zhi.mao@mediatek.com> <20240220012540.10607-3-zhi.mao@mediatek.com>
In-Reply-To: <20240220012540.10607-3-zhi.mao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Feb 2024 17:19:14 +0200
Message-ID: <CAHp75Vfbc0jE43Z-trFRnFdT5SxvJN+w2x7hS4vHuF5M2kTXgg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add GC08A3 image sensor driver
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com, 10572168@qq.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com, 
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com, 
	macromorgan@hotmail.com, linus.walleij@linaro.org, hdegoede@redhat.com, 
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net, 
	bingbu.cao@intel.com, dan.scally@ideasonboard.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_072053_051895_5996A3BA 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, Feb 20, 2024 at 3:47=E2=80=AFAM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:
>
> Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.

...

> +#include <asm/unaligned.h>

Usually asm/* go after linux/*

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>

This looks semi-random.
For example, _at least_ the array_size.h, bits.h, container_of.h,
device.h, err.h, mod_devicetable.h, property.h, types.h are missing,
Please, use IWYU principle.

...

> +#define GC08A3_DEFAULT_CLK_FREQ 24000000

HZ_PER_MHZ ?

...

> +#define GC08A3_SLEEP_US  2000

USEC_PER_MSEC ?

...

> +static const s64 gc08a3_link_freq_menu_items[] =3D {
> +       336000000ULL,
> +       207000000ULL,

HZ_PER_MHZ ?

> +};

...

> +static const struct dev_pm_ops gc08a3_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(gc08a3_power_off, gc08a3_power_on, NULL)
> +};

> +               .pm =3D &gc08a3_pm_ops,

Use new PM macros (pm_ptr() and friends).

--=20
With Best Regards,
Andy Shevchenko

