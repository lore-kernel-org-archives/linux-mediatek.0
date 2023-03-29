Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4E0C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv45vqNNvk7gfjj9ywv5t87xL9EGo+L1vyvtzDS68LU=; b=P4ZDhL2XmlEWvt
	E2yIpV69kJEo9e4M0OxRNdhX2rRePm0d7OB+hyRD0bOTB8NPt0jKY8oGKXNOOqDpfXwdq/9MQfft/
	cWrbZkwFMYFqJpan1gMhOeUFAOcBaVG4AfsaHLHMfB2jhqGcSDYHc6TgK3qW+fObn0rQfZXM0XATO
	uFDfqJRtnkYvUb9fxfTJOMfdsJ65WkPc5+aCaVjnXGDqq27vsI4INIs+kf8Gh6d9Qit5iKCksi2HM
	f1ZbO6SWsWbv8qr1fbuSsA/rhUKhRGGCvSVof6h8daYHCVgi2SMF9TKW005RzKx8BK8jua2r5EybG
	/FITNWKIqorNl/TWOVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYAq-000v3P-2Z;
	Wed, 29 Mar 2023 15:57:20 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYAm-000v16-0k;
	Wed, 29 Mar 2023 15:57:17 +0000
Received: by mail-ed1-f48.google.com with SMTP id ek18so65300250edb.6;
        Wed, 29 Mar 2023 08:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mv45vqNNvk7gfjj9ywv5t87xL9EGo+L1vyvtzDS68LU=;
        b=wan2cXi0N+Pl6l5DqJjs1dkI3WZFA2l1dqNedFmIXDTME+KLzgwwBph4luGoOActwJ
         c85baZwuaalxqGhD9rxvyLQiPcbPPhw1jRC24ZvPQ/qfpsSFkM+73GLFkauD/KVVtzGr
         vUqJi6pQifCVKS2IloADkOnxwuQgKcLbLz5EOw+kj+j8inmU8fonO2lXqd6jNBtmrkLo
         DNAic+kDawgbj9/FGJzzNG9D6G/5ATi2+WMKnBjBEiumW3CKBalsZRr4Im7MJhUovoyU
         KFDGJF73GS00I8BxgBB4Bdx6Sis1bDkZDdeTGit+/rCeTq08N9Z7pujD3YT1V6CGgxBC
         +yNg==
X-Gm-Message-State: AAQBX9dIJ/jpSYsChhLjfzGsfj5NISG1C9pr9XNMEeCX1ID3fXdTArzu
	yfnAMfcAokOgk2VtDBOOE7d37GJwGAAMb5Tz
X-Google-Smtp-Source: AKy350Zn6h38w2yjxfvIrrw/9HTWdRKBDOF7Mr35oHitHjDVXxEoWMU2diDNrqh6/N1lGRTd/+utjw==
X-Received: by 2002:aa7:c859:0:b0:4fb:78a0:eabe with SMTP id g25-20020aa7c859000000b004fb78a0eabemr20880731edt.14.1680105431338;
        Wed, 29 Mar 2023 08:57:11 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm17086281edd.66.2023.03.29.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:57:11 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id y14so16282158wrq.4;
        Wed, 29 Mar 2023 08:57:11 -0700 (PDT)
X-Received: by 2002:a5d:591c:0:b0:2ca:4533:5d6a with SMTP id
 v28-20020a5d591c000000b002ca45335d6amr4154237wrd.7.1680105410028; Wed, 29 Mar
 2023 08:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-6-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-6-581e2605fe47@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 Mar 2023 23:56:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64tNZa_LCUpHBbBUdpftB_Dms=oHcb7ZAD42qL-ov73hw@mail.gmail.com>
Message-ID: <CAGb2v64tNZa_LCUpHBbBUdpftB_Dms=oHcb7ZAD42qL-ov73hw@mail.gmail.com>
Subject: Re: [PATCH 06/19] ARM: sunxi: Drop of_device.h include
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
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
X-CRM114-CacheID: sfid-20230329_085716_267190_23F05C1F 
X-CRM114-Status: GOOD (  17.91  )
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
Reply-To: wens@csie.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 29, 2023 at 11:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Just drop
> including of_device.h as of.h is already included.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Chen-Yu Tsai <wens@csie.org>

I doubt this file would ever see any more changes.

> ---
>  arch/arm/mach-sunxi/mc_smp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index 26cbce135338..cb63921232a6 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -19,7 +19,6 @@
>  #include <linux/irqchip/arm-gic.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/smp.h>
>
>  #include <asm/cacheflush.h>
>
> --
> 2.39.2
>

