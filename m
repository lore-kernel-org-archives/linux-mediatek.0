Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7934FC761AF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 03:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=; b=C7JoRPLb/r6gGW+C1j8pqCIHho
	blJfoMEwZQESFS4m8Gf8jzdJqamtUKAa2XloxhCc8lFBii+iHgoapyr6TMjMPDCpyCrlb9D3XARbB
	Xoqy0bPtELudwvOpbvUYk8DljL3xLQVAnLAHaev9KnqXBXxy6xyOVwBC8cYMim8sVypnbBrWL/+Gi
	AbYKHjD8s9ZcN+Ud1aN5IYfnLjcVccPgsnP3vIXLzE4D7rCN0Ual6QhgoU1PNo4pDXNcufoglXt3I
	PSTUN2X8UZ9Zc/NRdMm0BsdZmjCKMV4SNF2x+b3oNGGDbBffd82H9Ay8VZt0BJGINKJsr05cJ/ohm
	9Afjc0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjNC-002T1q-0H;
	Thu, 30 Mar 2023 03:54:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjN9-002T0P-2E
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 03:54:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id z19so16925464plo.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=GfolM2geRXzvdw+ehZXpU8LIxL1xjz8Gj7iUHWYn0dQe/xK6gKP+jAnnfACd9dNas/
         V++Sm0TyABcLhhIGfP5TWHGwoCe9wculMPYuWNh8MX5dslq4eZGiHhMbH8QnfrjFjyDi
         1R02/q4m606IhgQClA65oAaxUmLy9Tlpoo3VU7hbegQucmzXRckhRFIw+Bte6EBu90qm
         Eybgi+WtfZP6vwZHlApEpFbN2Q1QBxtwJODT8JmI2ozap/CAX0ZDAlAhOh4ro/TsRICH
         q6vFusF7IDZ1ivkOyQ2u6hFyH7XuM27wai0R73hAJNlIGTC/gbz4+yD+DIAgG5FzF0WR
         8Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=DEKSjsxTv8Yv5b8Pt5yob8/vruM+rBF5dC7ccLPXNq2DvTAmZX1e+R4pg1JuNt1zjM
         wCtTcQ1sbSWZqlsGXJQWRUzVCHdA+WNk6SNFtbR3cTTWKPta8S/cVCyMr2uLVydX1EMC
         bcahw0kOETAtPnRlQfXEnG4O7QuNRaYNAvwSPP5+YB4poMw2trK8BAWZ5tYkNy3f8byK
         0yBP+9t6qCSY/V5dMGDNSL5l+DqK7TuSD4ynnqetAKbKagLvtWs/xWUFwrnslVmUyDVs
         2BgRWe1AZii7+GsvyUSgm4NUqRZEyHwMKsj55oI+/4TOZbr1F0JEjLP445iv1oZK/Q7b
         AIEg==
X-Gm-Message-State: AAQBX9e3mgIoHEz13XY1z0IOOrI1kTJHdT2CgJJSoY9zLhNHRpX7Pz2N
	jKU0wOxFmxRRYlShnKwaZBvt8w==
X-Google-Smtp-Source: AKy350ZtoosHc1UXvyJfiqR7/4WaAgxoUcypk7oVcM2Qe5NgerUZWsBCiwEUDE9iUeMBrzKflkrmgQ==
X-Received: by 2002:a05:6a20:b71f:b0:e0:316a:d62c with SMTP id fg31-20020a056a20b71f00b000e0316ad62cmr11170953pzb.60.1680148485691;
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b0062607d604b2sm23791281pff.53.2023.03.29.20.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:24:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Message-ID: <20230330035443.kowj26o4z22yg5f7@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_205447_732556_DDEA7EE6 
X-CRM114-Status: GOOD (  18.18  )
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

On 29-03-23, 10:52, Rob Herring wrote:
> Removing the include of cpu.h from of_device.h causes an error:
> 
> drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration of function ‘get_cpu_device’; did you mean ‘get_device’? [-Werror=implicit-function-declaration]
> 
> As of_device.h is not otherwise needed, it can be replaced with of.h
> (also implicitly included).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 1583a370da39..4321d7bbe769 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -10,9 +10,10 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cpu.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/slab.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

