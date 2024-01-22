Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FEBC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJtoHJTf8+XexIu1jE0XJRKaRM7JxcnTxF+MvONlBrE=; b=GC98a2HYlFTCTKkLWfl8s16lz9
	Ulc2tGY1jby8/0E8rBAKvhgaDU/YkXh9UNxrR3CE061xNqwVz8N86nwWTutt9/NURyIwvL4BPfori
	/wteQCiCC22HgXANzNb2WE9RNXfOW6IRENJHD6Z7jeepmuEuaGkLQehU6g/SVo2/JTaPwbS2wGJMk
	gJPbEzf4d379NyrA1zjeIOuL9Tn+kjWx+jHT2QhHKTal8DPcFzu0lEl5ZE2XzaAZUh0HH+VrZxnVV
	vlGKwbBF616Jiao3dCd3JCcfxJegDo1HGo2JIAlKOlZY5ihwQaN7nYGh8lqwSFy9sjnZHQheS3SWY
	LCLRYrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqNg-00BEa9-2M;
	Mon, 22 Jan 2024 09:14:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqNc-00BEXM-1d;
	Mon, 22 Jan 2024 09:14:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so38268155e9.1;
        Mon, 22 Jan 2024 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705914847; x=1706519647; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJtoHJTf8+XexIu1jE0XJRKaRM7JxcnTxF+MvONlBrE=;
        b=k02ZeL41lCBEb+sPW9GjevwNT0KlXnoi7pq1R2CMd24tOb5TIaPOaNH2eIJgOgVHkx
         y4tcq1L0ySxrD05KALV0frvtP1f8TclobsMAVovNcQNF3eLFjhOVze7XomREpp2D1eui
         WGbzvEDeC2bc1tP4MhobnIqu70qnz1SGRC9eAyagM3INCABy9xRZ5BgNsiXL/0KsNu8H
         5Qoa49D4E09AeY8LsUGtrseW3qnptxOrkyF/syRh2eP7qad1/knxiZ3ZGQgjyN97P7R6
         dVOnKD9G9Qhr2KudS3l4WeJKGhiJJqYClG1fRD45yR8Qh2PIsGYf4HGhUFvei/6hXM5h
         EwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914847; x=1706519647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJtoHJTf8+XexIu1jE0XJRKaRM7JxcnTxF+MvONlBrE=;
        b=wWdFfOPYF2CC/TWKRF+LpHSViPtKpPHp62lXxgIhlfNUTnR9IxmfoWj/rmfRH/ESCJ
         Dn83ri0c6xR1xS1sfhI83amkuRfvEIwcfOq6fcmZ/fvT9fsslnZeryEOscjzkOEr5Kl7
         Ju2mzWTRgY743RLBzgPm7jEhCP69HRd+uwfGHoQzjj/TBfkLRuPXKHeO/W7fQ08BOMeM
         0Y/mfWlv8bcS2WoFB6iJiqH/P8r7GISp4mEgyCfAzhHZzV8nLCG3fVlcMxAW5znuuCDV
         38m6uY2ifzG8urnZ43pF4g6tspqyD8LQnSPqbq774qTDkMxhQSiim6f1wQYc8srlF9vq
         /FbQ==
X-Gm-Message-State: AOJu0YyzoVU5ocF5cn1Kb9t3e3Vsiecf9S4aVq0Eq8DaEN/LKKKRBh81
	16WBxNnWNzIdA061PBbLdSrUzZ7klJAixDoatEfgwU96CmstKD/c
X-Google-Smtp-Source: AGHT+IHilrUOGWBhigCUyk2uI9CIxdjZPNnxB3xAR0RRJB/Ibc2npJy8kdjuDi5dIB1SbiIhxdFYrA==
X-Received: by 2002:a05:600c:4794:b0:40e:57f2:5948 with SMTP id k20-20020a05600c479400b0040e57f25948mr2001657wmo.72.1705914846940;
        Mon, 22 Jan 2024 01:14:06 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id i6-20020adfb646000000b00337bc2176f6sm13310550wre.81.2024.01.22.01.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 01:14:05 -0800 (PST)
Message-ID: <d9591107-cce8-417d-a8a3-72482d939c9c@gmail.com>
Date: Mon, 22 Jan 2024 10:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] Improve IRQ wake capability reporting and update
 the cros_ec driver to use it
Content-Language: en-US, ca-ES, es-ES
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Raul Rangel
 <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benson Leung <bleung@chromium.org>,
 Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 David Gow <davidgow@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <groeck@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Len Brown <lenb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Paul Barker <paul.barker@sancloud.com>,
 Prashant Malani <pmalani@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Barnes <robbarnes@google.com>,
 Rob Herring <robh+dt@kernel.org>, Romain Perier <romain.perier@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Takashi Iwai <tiwai@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Wei Xu <xuwei5@hisilicon.com>, Wolfram Sang <wsa@kernel.org>,
 chrome-platform@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240102210820.2604667-1-markhas@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_011408_577893_60FEC01E 
X-CRM114-Status: GOOD (  21.94  )
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



On 02/01/2024 22:07, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
> 
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
> 
> Some logic is added to the platform, ACPI, and DT subsystems to more
> easily pipe wakeirq information up to the driver.
> 

Patch 9, 10, 11 and 12 applied to the mediatek tree.

Thanks!


> Changes in v4:
> -Rebase on linux-next
> -See each patch for patch specific changes
> 
> Changes in v3:
> -Rebase on linux-next
> -See each patch for patch specific changes
> 
> Changes in v2:
> -Rebase on linux-next
> -Add cover letter
> -See each patch for patch specific changes
> 
> Mark Hasemeyer (24):
>    resource: Add DEFINE_RES_*_NAMED_FLAGS macro
>    gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
>    i2c: acpi: Modify i2c_acpi_get_irq() to use resource
>    dt-bindings: power: Clarify wording for wakeup-source property
>    ARM: dts: tegra: Enable cros-ec-spi as wake source
>    ARM: dts: rockchip: rk3288: Enable cros-ec-spi as wake source
>    ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
>    ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
>    arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
>    arm64: dts: tegra: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
>    arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
>    arm64: dts: rockchip: rk3399: Enable cros-ec-spi as wake source
>    of: irq: add wake capable bit to of_irq_resource()
>    of: irq: Add default implementation for of_irq_to_resource()
>    of: irq: Remove extern from function declarations
>    device property: Modify fwnode irq_get() to use resource
>    device property: Update functions to use EXPORT_SYMBOL_GPL()
>    platform: Modify platform_get_irq_optional() to use resource
>    platform/chrome: cros_ec: Use PM subsystem to manage wakeirq
> 
>   .../bindings/power/wakeup-source.txt          | 18 ++--
>   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   |  1 +
>   arch/arm/boot/dts/nvidia/tegra124-venice2.dts |  1 +
>   .../rockchip/rk3288-veyron-chromebook.dtsi    |  1 +
>   .../boot/dts/samsung/exynos5420-peach-pit.dts |  1 +
>   .../boot/dts/samsung/exynos5800-peach-pi.dts  |  1 +
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 +
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  1 +
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  1 +
>   .../arm64/boot/dts/nvidia/tegra132-norrin.dts |  1 +
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
>   .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
>   .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  1 +
>   arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
>   drivers/acpi/property.c                       | 11 ++-
>   drivers/base/platform.c                       | 90 ++++++++++++-------
>   drivers/base/property.c                       | 40 ++++++---
>   drivers/gpio/gpiolib-acpi.c                   | 28 ++++--
>   drivers/i2c/i2c-core-acpi.c                   | 43 ++++-----
>   drivers/i2c/i2c-core-base.c                   |  6 +-
>   drivers/i2c/i2c-core.h                        |  4 +-
>   drivers/of/irq.c                              | 39 +++++++-
>   drivers/of/property.c                         |  8 +-
>   drivers/platform/chrome/cros_ec.c             | 48 ++++++++--
>   drivers/platform/chrome/cros_ec_lpc.c         | 40 +++++++--
>   drivers/platform/chrome/cros_ec_spi.c         | 15 ++--
>   drivers/platform/chrome/cros_ec_uart.c        | 14 ++-
>   include/linux/acpi.h                          | 25 +++---
>   include/linux/fwnode.h                        |  8 +-
>   include/linux/ioport.h                        | 20 +++--
>   include/linux/of_irq.h                        | 41 +++++----
>   include/linux/platform_data/cros_ec_proto.h   |  4 +-
>   include/linux/platform_device.h               |  3 +
>   include/linux/property.h                      |  2 +
>   36 files changed, 350 insertions(+), 172 deletions(-)
> 

