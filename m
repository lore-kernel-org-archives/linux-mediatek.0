Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534EFC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5wozgmwB4K3uhtLQG0ELPhsGFHRdp3FOmHAQorjhl0=; b=Srd1SqtsnajhvC7M7XfYVmqsQg
	tfkmabldWpvxofcXPFPm5NHc0fiA+HGEasA53ZZ2MacshxVgzrzGoW1Ixedu4otR82Qqjir/UcDK1
	lgn+kjgGOTyOQSGlaeF/rKKPh5nA+BIzVaS4FDwTRmG+PglH17mbW8Quseo55wh4+sLCp7FlncQKR
	Q3ba7ppXESmm4aGDCwe3Txl83w9W8ZO6LLMffVYH42SffFIH98EIamUnUPbb0ke7kDffwwX+zzQQR
	nLIU4Sh37zseeTJiVMRIJhOd2Dr7YAAJYCLwqig+FeZm2+VzsM6TgW+FkpnxdIRpsmCVM2ckhFwY+
	0EwVP7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYD0-000wcp-1P;
	Wed, 29 Mar 2023 15:59:34 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYCq-000wRa-0R;
	Wed, 29 Mar 2023 15:59:27 +0000
Received: by mail-ed1-f53.google.com with SMTP id x3so65243520edb.10;
        Wed, 29 Mar 2023 08:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5wozgmwB4K3uhtLQG0ELPhsGFHRdp3FOmHAQorjhl0=;
        b=G1NTywqNUd/5aT0t7RDVI8xNW75GrtDhfjpyQoj2P9AEU4raCL5Rj+MQ0aSciZAhaN
         p2TRryig9aLh/9Z760aCbT5mRaMB4EVjldbYXxhXme1usb3C3ZU3qnXEdCdkOul573ce
         vkPerL8OmeKSsBWBgvOdnt9B5WbKq47mulf0sxLSPqtlA8yprEqfn0zQXWmBS+P/7D8G
         Kta5YZQsuTLosmGkGbetYAMSl9/TfaiGpT8BTmwBYokojGMewwHUGRuq4+FZ90onfGiY
         8yFFvUaE7N5f62Nsm4hln2mvmmzPaGRmWSDifP9qJ0cN9QruG+WzE+xvBKI0/BclX/xs
         HPvQ==
X-Gm-Message-State: AAQBX9fVtcuxPpz7tJQqN5J9MATNpBolRSwaeIfrRXQe5bJAelpJieNG
	3obdhEpwNVB68etW79FKLGeVB/KfWUYchkSrkCc=
X-Google-Smtp-Source: AKy350aoH0YzB4EGxwWgRtfVzYdwc/jxafoqtAza3yowu+hrkNWR6MYo9KvzVJ1ZAz0kSvIrND9NAtkY2JWrK3waVKA=
X-Received: by 2002:a50:c34f:0:b0:4fa:71a2:982b with SMTP id
 q15-20020a50c34f000000b004fa71a2982bmr1623255edb.0.1680105560897; Wed, 29 Mar
 2023 08:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:59:09 +0200
Message-ID: <CAJZ5v0g2g7-M1cuvXNs=t-n6rZD7v=uS_rEPBQtyBBAq1yWJ7w@mail.gmail.com>
Subject: Re: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove of_device.h
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
X-CRM114-CacheID: sfid-20230329_085924_195981_2E65B0AE 
X-CRM114-Status: GOOD (  17.11  )
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
>  drivers/thermal/cpuidle_cooling.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_=
cooling.c
> index 4f41102e8b16..6f6daead485e 100644
> --- a/drivers/thermal/cpuidle_cooling.c
> +++ b/drivers/thermal/cpuidle_cooling.c
> @@ -7,12 +7,13 @@
>   */
>  #define pr_fmt(fmt) "cpuidle cooling: " fmt
>
> +#include <linux/cpu.h>
>  #include <linux/cpu_cooling.h>
>  #include <linux/cpuidle.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/idle_inject.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
>
>
> --
> 2.39.2
>

