Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzq+vIJia6Oe7/D+Sh+wrCg8ai+vibYcP9Z6Z0Gi+ds=; b=FdMLcwE2B6mIBWErNZx+PM/oF0
	4lU+upo+NpN0ucYjmy4rvgkyuPDDnBQOeFXnyNpDgzYHMJyU0LH4uajIMtaYnlxM2SeOgU/yoK9at
	5Bru4BElwYydqfnhSUsaEsubQ+jf8OFChjN8K3EZ9zWW45VCHJuONp3Nmf4nzirpX25lUoVuCaDbk
	UnlJn2IVx8cy4b95fnc481Jfui2Ft99WDIIYlwjH5sW74BSo4IPsZo/vFMz+qRPvA9rH3iSc9k9DE
	KeoVlseMg63caVzscg4BvtMvoDbyYffbKCqciKP9+dQlM8DC13oH4iLxM72REceePqSAir6XFyXFA
	uZI49l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBm-000vcS-1X;
	Wed, 29 Mar 2023 15:58:18 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBf-000vVt-1v;
	Wed, 29 Mar 2023 15:58:13 +0000
Received: by mail-ed1-f44.google.com with SMTP id r11so65309920edd.5;
        Wed, 29 Mar 2023 08:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzq+vIJia6Oe7/D+Sh+wrCg8ai+vibYcP9Z6Z0Gi+ds=;
        b=Nsxo9niHEpKrZ/kLUZ2OzbOJefM0ZD4Ug2wyRvhQCF2R9M5jLuIEntLHfcooIpBlGw
         R7rPq+eCjwo5rvXIOoiJA9v4N71Ld6Obj7FZC2WGJXAoZCJhDs0XXGRr8iboDfIe1IRP
         sSBEQ/4WOK7GwGsUbXFrhebJKr1t2NvA6OSQv3cR471SkXe0/on1u6HbtKt2yUV4hgcZ
         /0eVnt5x2Rll1kDQZpsWngkn5teOHDIwiMOYVnleGgtdXASqo/jCompzLPRpTXv4I5T4
         TSyXCvd/lLg+H6KvHYtB8eqGLdQmlyP3L3bBK5+eBkABjMd+aG2taH8WMMnUdEVYKt8i
         +Pjw==
X-Gm-Message-State: AAQBX9fBAS7JxvefieJjv5HVZXsDIMlLCkTIBSqpRBus26ber6BHxC9Z
	hE/1VC6ALYWl6adahAA+iXxzhugKg2QFPfmoXh0=
X-Google-Smtp-Source: AKy350boHE0zfBloqdcSNGmzBqUXXsRddCRy/sa5FfObdnxpOzEYGDjWB1IEyEgnL1SIEdbf4Xnc903CLkgoiq3GKuI=
X-Received: by 2002:a50:d49e:0:b0:502:148d:9e1e with SMTP id
 s30-20020a50d49e000000b00502148d9e1emr9950905edi.3.1680105487384; Wed, 29 Mar
 2023 08:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:57:56 +0200
Message-ID: <CAJZ5v0iBjt6Rms1QznB7LLvq5S2GcQRBmSXmT30rswTHtD7s8g@mail.gmail.com>
Subject: Re: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085811_632981_D812906D 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Mar 29, 2023 at 5:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 -
>  drivers/cpufreq/kirkwood-cpufreq.c   | 2 +-
>  drivers/cpufreq/maple-cpufreq.c      | 2 +-
>  drivers/cpufreq/pmac32-cpufreq.c     | 2 +-
>  drivers/cpufreq/pmac64-cpufreq.c     | 2 +-
>  drivers/cpufreq/qcom-cpufreq-hw.c    | 4 ++--
>  drivers/cpufreq/spear-cpufreq.c      | 2 +-
>  drivers/cpufreq/tegra124-cpufreq.c   | 1 -
>  drivers/cpufreq/tegra20-cpufreq.c    | 2 +-
>  include/linux/cpufreq.h              | 1 -
>  10 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufr=
eq-dt-platdev.c
> index e85703651098..f9675e1a8529 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -6,7 +6,6 @@
>
>  #include <linux/err.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>
>  #include "cpufreq-dt.h"
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwoo=
d-cpufreq.c
> index 70ad8fe1d78b..95588101efbd 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -9,7 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/clk.h>
>  #include <linux/cpufreq.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <asm/proc-fns.h>
> diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpuf=
req.c
> index 28d346062166..f9306410a07f 100644
> --- a/drivers/cpufreq/maple-cpufreq.c
> +++ b/drivers/cpufreq/maple-cpufreq.c
> @@ -23,7 +23,7 @@
>  #include <linux/completion.h>
>  #include <linux/mutex.h>
>  #include <linux/time.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>  #define DBG(fmt...) pr_debug(fmt)
>
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cp=
ufreq.c
> index 4b8ee2014da6..a28716d8fc54 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -23,7 +23,7 @@
>  #include <linux/init.h>
>  #include <linux/device.h>
>  #include <linux/hardirq.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>  #include <asm/machdep.h>
>  #include <asm/irq.h>
> diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cp=
ufreq.c
> index ba9c31d98bd6..2cd2b06849a2 100644
> --- a/drivers/cpufreq/pmac64-cpufreq.c
> +++ b/drivers/cpufreq/pmac64-cpufreq.c
> @@ -21,7 +21,7 @@
>  #include <linux/init.h>
>  #include <linux/completion.h>
>  #include <linux/mutex.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>
>  #include <asm/machdep.h>
>  #include <asm/irq.h>
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpu=
freq-hw.c
> index 2f581d2d617d..df165a078d14 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -11,8 +11,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpuf=
req.c
> index c6fdf019dbde..78b875db6b66 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -18,7 +18,7 @@
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra12=
4-cpufreq.c
> index 7a1ea6fdcab6..312ca5ddc6c4 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -11,7 +11,6 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
> diff --git a/drivers/cpufreq/tegra20-cpufreq.c b/drivers/cpufreq/tegra20-=
cpufreq.c
> index ab7ac7df9e62..5d1f5f87e46d 100644
> --- a/drivers/cpufreq/tegra20-cpufreq.c
> +++ b/drivers/cpufreq/tegra20-cpufreq.c
> @@ -12,7 +12,7 @@
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/types.h>
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 65623233ab2f..3ac4a10d4651 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -15,7 +15,6 @@
>  #include <linux/kobject.h>
>  #include <linux/notifier.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_qos.h>
>  #include <linux/spinlock.h>
>
> --
> 2.39.2
>

