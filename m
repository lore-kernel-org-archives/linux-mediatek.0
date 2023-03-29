Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54A6C761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=; b=TjhK7+KoUAMzV09yI1FfnKtcmY
	3IQDPPdQ0Y8+j4jAtJX3w+Y9XhzRHL5O2eQWqQfhu3onFLHFCXSK2o6zQxRqfEfnJRqYJocbWUhnI
	U/RspX/yZjZKDc2xLiP/RI/zqhe1o6tx9lDV2Bu1ZKsPY1h1mEKry+eBCsYYSpY24Hi206o/UHtr4
	LCkjP+zuD3hihcKd2tuB5pPDIfAzBvaefleaYIuj0upLE9moJXSjWnR0PtPb3lb2eKsdRrBma+1yk
	EH02yyv3c+3ZOtab8xV/BP2bT0xxAxbGhTcuxtYxOATp/+0NDo+jWeS0n4YJWmzoAamvJ8ItLN4P0
	9R3nVgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYIs-0010K6-2k;
	Wed, 29 Mar 2023 16:05:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYIn-0010GO-27;
	Wed, 29 Mar 2023 16:05:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id r11so65428193edd.5;
        Wed, 29 Mar 2023 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=ZP8azEYR3T/kmocgq8bSZlNTouSdAv0pqNbONNvK6pjIOYfvW0EWRaDVO44E5sowbA
         4MGZKJiXz7VE108ciJQNXn5/hHquTqMqhb6tRaq9zC55es7aV4eyXx5sWcvFrwBw8u31
         DcptBNfTU6x5mTKuHF7vCiSdOphP7f1dZ5xyT7jA8pE036EK0r7Mwyj+wpf0qOtr4/dO
         PtsdhtBZV/jUZWdd6KSP5EkVxa9qFL2fQNK4V/Imeno6KN+BWXvR2ysex446RXd1SjcJ
         RuPjjhn8s3ln2xq7NpQb+o1cGn+mn2pwwyW/FTHZVbW4BbukRommLkvptqsBpXQc4gTR
         WTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=yHVKynP5S1reWV74KoCTwcqelMppDJ443/k7tGqQ3kIL2YMDkbY7fTF/pgSksSvc/a
         i0v3sOfRb2xN7m2iKSchnCJJ/LiwfFz4QXxIAO+1tXM4Jm32vqiz+VYxnYrrVska3bZc
         OPzGoH7XAOy9ZhdIjUDUZX3OL7FQaM0ulOpM9ew0ZRL6p6mUCaB4RIt2sW0SV74if8yj
         G+mhyIMdiqLzVl8/A7ZNOzztNxh/bpokdCATdkn9cJvc6gluPNwG6M01TZvIG0IhSQez
         3vF1QxilNNifa9y5py0LPXuEz7PMoB7eGrsYUmaXBykRbb5KfvsK+wGzVCcHEGvXp+n8
         1KPA==
X-Gm-Message-State: AAQBX9c3XGaCYukvo/xtZtZVobQvufDiUMOBb/vjfNjht93xQm7/yp7d
	fqNOYWnrtUvV4bJZzLDlRY4=
X-Google-Smtp-Source: AKy350Y0SxvEseTuQQeEwplPrjnDboy+i5rUViT0BUXK5Dv5qulkowom3JNTJJ/XP46pJIz4L/hzEA==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr20841888ejb.19.1680105930843;
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm15417251ejc.124.2023.03.29.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Date: Wed, 29 Mar 2023 18:05:27 +0200
Message-ID: <2672894.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
References:  <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_090533_717075_9D297157 
X-CRM114-Status: GOOD (  10.59  )
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

Dne sreda, 29. marec 2023 ob 17:52:12 CEST je Rob Herring napisal(a):
> Removing the include of cpu.h from of_device.h causes an error:
>=20
> drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration=
 of
> function =E2=80=98get_cpu_device=E2=80=99; did you mean =E2=80=98get_devi=
ce=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>=20
> As of_device.h is not otherwise needed, it can be replaced with of.h
> (also implicitly included).
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



