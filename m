Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FDEC77B7C
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Apr 2023 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=; b=PKAHT9V7OAQxII+BNqGjTQoLdi
	wMIU0B18F/kofa+ih7JIx9PMVP79N9+83o6PBQ/FbhXpS/bHa6iraZst4FnzVKRw1Ya76iCUa+nFR
	3MPN8DHWNzW/m2NG2CXx3MnT/4NDfUa7TkHfeWQW6NpON5Ehb+SSSJZv9MGkCc6SMMRlEQ8wBv1fZ
	rhajoS02kdBsZmzYzFXsnggt+VV2eAxM/qaeJmnpstkICo5IInOU2+gAvxLgkO+n3CMg2YvjGwOH6
	YKlGAk/mRkf8y9Pgsm2a9veaAE0b+xf7UyIPv9I8YnsHb5wOIgFrZlIP8M2HsirrEIhezH/+WOOzO
	UlSNmeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFf-00Czyu-0w;
	Sat, 29 Apr 2023 18:24:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFc-00Czwj-10
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Apr 2023 18:24:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115e652eeso19274879b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=osIreuhFqrOaZAAl/27+IK5Hi1AB1StDT3MQB4UJdmyvLv00XqfYnZDOR5DEup+Zbc
         EMMhztAPOHm+IIUb2Jko/Ql1Qxequoi14q5q6ioXxwV6ONNbTHbCpppQsquBotBv7NZA
         0xsoGYgWKOy6+E6yOM0QJd1lS7m7Gz/d+GxIdfE4O363XFxvr58OuzUA8yahfjRkgl76
         daFFl6DyngHfFxsVeUlgdYpwovv5SK9w21aq217ZLhFo3Y8jm5Njv+T6oNvGK4lJj/ES
         nDCkxSdKHcKkITKghp2NRdG/dKj2tCryrSlZDF5O3eK56lzP0kExP10+gizADZGE0dho
         uu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=LyzXZVHxwvwUPBtP0aI1ntTl1vgAE26WEhnXOH+NKU/vbKwYEW88i9j6Yn+Qs2VsPc
         jxTJ3IL5vokk2snQqvbNJHhRDhAGMo1rX0DzmplS+xpmlea1L7DG4PAsjXeowHd93U9g
         e3rXdA+QlqPIbyk0kBEFNA+2lzLdoe7K4BlvcrEW/Q2mV0+BvH0DGL77K5vfVLyHamiB
         STipIaynL9hqeLP2Yj0s72dZutIPyRD/UpdXsNfR/90UOLPbhiCNpNteWPvRtAbFlUIE
         ik+YJEAti8EkohCPA7AhXWy2Pq9j7dbmwzxR5OouN1X1DkKqBoApPY5o/lPNiI+bLGyA
         aZSA==
X-Gm-Message-State: AC+VfDxversQ9yZLY0fmBuBignFucFxEmOSdJxp6xu4kvaFnO9hbG5RB
	+5Oc2D6kzYH4Y5GHllYMivEiBg==
X-Google-Smtp-Source: ACHHUZ56+SNdXMph8Hdac6/dfoFg0Vhv/AYaUOOmwxyPYiHuY8kgDpOram8U+gPi6EA5PyHcO2u8+w==
X-Received: by 2002:a17:903:41cf:b0:1a6:d0a8:c70f with SMTP id u15-20020a17090341cf00b001a6d0a8c70fmr11307108ple.5.1682792690325;
        Sat, 29 Apr 2023 11:24:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001960706141fsm15126026plb.149.2023.04.29.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:22 PDT (-0700)
Subject: Re: [PATCH 08/19] riscv: Add explicit include for cpu.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
CC: davem@davemloft.net, robh+dt@kernel.org, frowand.list@gmail.com,
  linux@armlinux.org.uk, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
  daniel.lezcano@linaro.org, tglx@linutronix.de, amit.kachhap@gmail.com, viresh.kumar@linaro.org,
  lukasz.luba@arm.com, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
  angelogioacchino.delregno@collabora.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  thierry.reding@gmail.com, jonathanh@nvidia.com, tiny.windzz@gmail.com, lpieralisi@kernel.org,
  sudeep.holla@arm.com, agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
  anup@brainfault.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, Marc Zyngier <maz@kernel.org>,
  vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, sparclinux@vger.kernel.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
  linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
  linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-3fdcd7ba-9d00-4521-a55f-367cf53f5f12@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_112452_347939_BB34C9E1 
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

On Wed, 29 Mar 2023 08:52:05 PDT (-0700), robh@kernel.org wrote:
> Removing the include of cpu.h from of_device.h (included by
> of_platform.h) causes an error in setup.c:
>
> arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')
>
> The of_platform.h header is not necessary either, so it can be dropped.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..dcfa4b6fa4b1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -8,6 +8,7 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -15,7 +16,6 @@
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> -#include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

