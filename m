Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA52D1D895
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=; b=BqT84VULZ8a4EzYwkckb99Icvr
	pZvXUGsPIt8WCMQeCu47Xpz04F5T71sY8ug49BLoKz+92GeVBn4BHFCrChsELqO6CgPcDq6Wlt6py
	lsNQs8mavR+D+93qIu1vpCj0s4J2fP2+GWCUD89A9+9O8MYqesnXjZxzqx9XfzQqivm1mUvmLweQL
	k0S4+MqEHz3sjgDgPzQb+XQAA3KMy881z8DHnGkcqCIWX3LuXCVCLAdhTQLWvnqLYstebvkl8eEG9
	wvcGJwPv7Pf2Q8vRnLf/tHo4a9SqfshT6rp/kJqeW/bhxlmkeDGE9yxl+1m9TQPaKBKraHCNnbrqV
	zaSHUh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lwK-000000098VK-3ho3;
	Tue, 15 Oct 2024 18:06:36 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lvM-000000098Gd-1KtU
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 18:05:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3173689e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 11:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015533; x=1729620333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=V7smkosi88qntWUQxird6aIjWHV5r9xUVKxbbOquIFlbuM/RlHG25fwd5NGkHW1ke5
         DUGkk99GrwfyVC9Z9EbfundiZS/a5tNScBw8it/+jrAa8Vc6LUDOZ5p311UxX/63f0vh
         i5twayFseuqBBW3k0+KNNWmAaAoSqUsqwlE70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015533; x=1729620333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=gvOyXiFyeMrJOdtf2f0SJWKwOHQpejC1ceF/TuWGPAc1nvBw/JOMfj2qD6qKSHgINf
         PG8JXRJLguP778nt7kEdHZllvRYVQljQjM0HSt2s4HTGk1WB3kSUDldpsWS+f9qN1c8m
         lQWUqAnT+bg8ZQgN/bHaP23htqUiQNnTGzfhl8ukm+d2MRc7zoywIIvBxkXq9OA5nbXk
         csgmtDKXyblT4vxreVdtqgfUMtszH0YbiH3/MQnnnD7zmMMLl/j09b6uB/FM3D52ziB4
         Dom7LkhktrIUIEUdbydjyWLdlL8Tuor/ie/mW6M1TI8PgwN2iMXJKoB0feOP1Rl5nqA+
         A5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCX1vRXUWZq9T+g1EOe3IYYIMmN4gq9rZwizhZdkxnOJkPg0jSDZFtbQU61xi4lXqv9fiXJoBRd1u7EBSB7VQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+C0z9orcFwDHIX660GknnRY3limYZ0jZAibjgpo52odC/2q5
	qk+edT+L2KXlGnjkMvXrkSGxxPcUqovJR7srwlOiwdD+ONsTCpsHBDd2k3mDuZ7oGsrzETaK2Bc
	bP/Sd
X-Google-Smtp-Source: AGHT+IHA3c4ch7jGADS1bIrFDfIQURe1dX7cM6NzEbaJ9ycljr6ZS1XX1J2GnRUkw6wxm4SA80k0lA==
X-Received: by 2002:a05:6512:1086:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-539da3c9083mr7774150e87.18.1729015533395;
        Tue, 15 Oct 2024 11:05:33 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00013c21sm224511e87.270.2024.10.15.11.05.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 11:05:33 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a007743e7so1195991e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 11:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4J9zK3m13WuQKNazrEnXGOLAsceVUKwz/U+M+PHN805j4ahekU7VKcZxWxaZFAbvpTWgE3GmD3bgsWRzQCA==@lists.infradead.org
X-Received: by 2002:a05:6512:3046:b0:539:d9e2:9d15 with SMTP id
 2adb3069b0e04-539da4e12eamr7412619e87.29.1729015159647; Tue, 15 Oct 2024
 10:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_110536_412811_9C9CF0B6 
X-CRM114-Status: GOOD (  34.09  )
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

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component prober. For any given
> class of devices on the same I2C bus, it will go through all of them,
> doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree.
> The status for all the device nodes for the component options must be
> set to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Maintainer expects this to be merged through I2C tree.
>
> Changes since v7:
> - Corrected Makefile item order
> - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
> - Added include of "linux/of.h" for of_machine_is_compatible()
> - Switched to simple probe helpers for trackpads on Hana
>
> Changes since v6:
> - Adapted to new I2C OF prober interface
> - Collected Acked-by
>
> Changes since v5:
> - Adapt to new i2c_of_probe_component() parameters
>
> Changes since v4:
> - Fix Kconfig dependency
> - Update copyright year
> - Drop "linux/of.h" header
> - Include "linux/errno.h"
> - Move |int ret| declaration to top of block
> - Return -ENODEV on no match instead of 0
> - Unregister platform driver and device unconditionally after previous
>   change
>
> Changes since v3:
> - Include linux/init.h
> - Rewrite for loop in driver probe function as suggested by Andy
> - Make prober driver buildable as module
> - Ignore prober errors other than probe deferral
>
> Changes since v2:
> - Addressed Rob's comments
>   - Move remaining driver code to drivers/platform/chrome/
>   - Depend on rather than select CONFIG_I2C
>   - Copy machine check to driver init function
> - Addressed Andy's comments
>   - Explicitly mention "device tree" or OF in driver name, description
>     and Kconfig symbol
>   - Drop filename from inside the file
>   - Switch to passing "struct device *" to shorten lines
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
>   - Make loop variable size_t (instead of unsigned int as Andy asked)
>   - Use PLATFORM_DEVID_NONE instead of raw -1
>   - Use standard goto error path pattern in hw_prober_driver_init()
>
> - Changes since v1:
>   - New patch
> ---
>  drivers/platform/chrome/Kconfig               |  11 ++
>  drivers/platform/chrome/Makefile              |   1 +
>  .../platform/chrome/chromeos_of_hw_prober.c   | 140 ++++++++++++++++++
>  3 files changed, 152 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

