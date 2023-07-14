Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE48EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B/F9N2Gv0nlKZ4Pjku6eVDXCPCkPx+J5+8KkbLiGiY=; b=P1qA9g+k6vzHrlZgrv1Otr5N4s
	RyQ4ANXer76LmN4w5Qeo8Bnph5D6vGz3FZMGdKteGiJ9cZGy0B3HsINiFwBgL6y1YRDLHa9RB5OX4
	3uNz5yaIGYrrKTylPzyxcVV/gwgtRmjJ3Rz5B0YO3XxBcx0h1FFiS6N0H+8mKQpUl3ruyB/p2HjVG
	k+fu5UneA/uB9nO48th5pcwegXuHKWVmvJL7WOriHDOg47gXCLIzshQXG5z7AA99VGS6YvIi+pEir
	Cy1dqd9yLji6jFPw3u+xR/ZLSw+CKoZQFqJxZN6I0tN7JyxYrRUFp/pTgsukvkvHCuGkm2xDGfb0+
	P1Mqvaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNva-0071hF-2r;
	Fri, 14 Jul 2023 18:54:06 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNvX-0071fY-32;
	Fri, 14 Jul 2023 18:54:05 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-991f9148334so51458966b.1;
        Fri, 14 Jul 2023 11:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689360841; x=1689965641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9B/F9N2Gv0nlKZ4Pjku6eVDXCPCkPx+J5+8KkbLiGiY=;
        b=HuhPx7a5fgjXPb2U9DV8Om76Ygh9/2mWtjC+9DuQ6xj/zRgO0zIG7FUBVQYP9hixKS
         m/nWIO9FJUfkYxn+xYG7/MmgkHtnRoCpObaS/TZvO8LuaJvJX7nFpsP83gZFy+CGTJzz
         yJ0jGH0fyEJ5ezpQJtF9wjScXBJ62Yc+IcFQnfkPfa1nNdNCAOHq/MU7bH889ZjTH+Qa
         HjsXvQdKU1jUmwwS+CiZVuCdEI4Hra4O7dcQ5CGdyXNRAikw48kjMlE+kcbPZVbDRGr2
         eEEuHHUlFH4na2ZpZq46obeZIjhN9EZJE824Hq7x7im+f/4Lh2ZOzDQoY4pxl38FIOra
         HNgQ==
X-Gm-Message-State: ABy/qLb9RErkLvHfGAnRHiy9mDPxJPdhW8KaZfPbNqj8u6l24DxUUhUY
	SvFBamkgQ578xujnTTsPMa3m4z57+qxAAsejkiI=
X-Google-Smtp-Source: APBJJlF43PZ1lXNODVSZ5tLMcK1J342n26C3wDGe2qLpc28UYX43wFxXrau7trMesO0FmTeAhdOBJDUWmhSkVS1o3IE=
X-Received: by 2002:a17:906:d4:b0:993:d88e:41e3 with SMTP id
 20-20020a17090600d400b00993d88e41e3mr3819919eji.4.1689360841175; Fri, 14 Jul
 2023 11:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174414.4054011-1-robh@kernel.org>
In-Reply-To: <20230714174414.4054011-1-robh@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Jul 2023 20:53:50 +0200
Message-ID: <CAJZ5v0giP7EXPdkcgXa0QP4nLg7ZutVcO60BMcQHSVdVAUDLjw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Ilia Lin <ilia.lin@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_115403_981511_2A22F6C1 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, Jul 14, 2023 at 7:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c  | 4 +---
>  drivers/cpufreq/mediatek-cpufreq-hw.c  | 3 ++-
>  drivers/cpufreq/ppc_cbe_cpufreq.c      | 2 +-
>  drivers/cpufreq/ppc_cbe_cpufreq_pmi.c  | 1 -
>  drivers/cpufreq/qcom-cpufreq-nvmem.c   | 1 -
>  drivers/cpufreq/scpi-cpufreq.c         | 2 +-
>  drivers/cpufreq/sti-cpufreq.c          | 2 +-
>  drivers/cpufreq/ti-cpufreq.c           | 2 +-
>  drivers/cpufreq/vexpress-spc-cpufreq.c | 1 -
>  9 files changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/arma=
da-37xx-cpufreq.c
> index b74289a95a17..bea41ccabf1f 100644
> --- a/drivers/cpufreq/armada-37xx-cpufreq.c
> +++ b/drivers/cpufreq/armada-37xx-cpufreq.c
> @@ -14,10 +14,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/medi=
atek-cpufreq-hw.c
> index b22f5cc8a463..c93e14eb6221 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -10,8 +10,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>
>  #define LUT_MAX_ENTRIES                        32U
> diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_=
cpufreq.c
> index e3313ce63b38..88afc49941b7 100644
> --- a/drivers/cpufreq/ppc_cbe_cpufreq.c
> +++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
> @@ -9,7 +9,7 @@
>
>  #include <linux/cpufreq.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>
>  #include <asm/machdep.h>
>  #include <asm/cell-regs.h>
> diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c b/drivers/cpufreq/ppc_=
cbe_cpufreq_pmi.c
> index 4fba3637b115..6f0c32592416 100644
> --- a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> +++ b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> @@ -11,7 +11,6 @@
>  #include <linux/types.h>
>  #include <linux/timer.h>
>  #include <linux/init.h>
> -#include <linux/of_platform.h>
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-=
cpufreq-nvmem.c
> index a88b6fe5db50..4590c2570086 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -22,7 +22,6 @@
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufre=
q.c
> index fd2c16821d54..ac719aca49b7 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -14,7 +14,7 @@
>  #include <linux/cpumask.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/scpi_protocol.h>
>  #include <linux/slab.h>
> diff --git a/drivers/cpufreq/sti-cpufreq.c b/drivers/cpufreq/sti-cpufreq.=
c
> index 1a63aeea8711..9c542e723a15 100644
> --- a/drivers/cpufreq/sti-cpufreq.c
> +++ b/drivers/cpufreq/sti-cpufreq.c
> @@ -13,7 +13,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>
> diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
> index d5cd2fd25cad..3c37d7899660 100644
> --- a/drivers/cpufreq/ti-cpufreq.c
> +++ b/drivers/cpufreq/ti-cpufreq.c
> @@ -12,7 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/drivers/cpufreq/vexpress-spc-cpufreq.c b/drivers/cpufreq/vex=
press-spc-cpufreq.c
> index d295f405c4bb..865e50164803 100644
> --- a/drivers/cpufreq/vexpress-spc-cpufreq.c
> +++ b/drivers/cpufreq/vexpress-spc-cpufreq.c
> @@ -18,7 +18,6 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/slab.h>
> --
> 2.40.1
>

