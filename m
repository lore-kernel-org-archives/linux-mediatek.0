Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC04C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hCHlkF5Z3NmTqMnInVbTSc5iAXn26gWIw7YwXQgkr4=; b=nvJ5PNxr5b535cN0eTmfAZFGIM
	EJtkOEIhjvzlqNfbK/BzofhOlOx7eCGLcHfFzWOu5lR3ru/tzOhsbDYRL5QvvIowFA4HX7uQ2MCKw
	wqswnEEt2MY4zPhzd4wrPyId1qp4gru/qeBVdofVZ2oChxUfaneYvnjsPnwZJyHYthTmy3pCYLyYF
	qfON+w/2tQRsKBTY584sz/8jNOekDlLBNMyBE1drx2ZdeA8qMXJhTUJIbtwSdCDqtHBECcIjtuxyd
	1xCRfSp3kIzN0t94n0bZJRHE+sZLnOFZvH+hAm54CcXomMsVFPm8kgVquw4JHTDPpln5oRgu0X5VP
	0gyofRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pignk-00BCBr-1P;
	Sat, 01 Apr 2023 19:22:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pignd-00BCA6-03
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 19:22:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so15785629wms.2
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hCHlkF5Z3NmTqMnInVbTSc5iAXn26gWIw7YwXQgkr4=;
        b=g6sUbB29tDRqwWFaUjnPs6EJpXE5M1cKRPU9iBTc0LRSeeY2pnemn3+Ow7d7VJL9vC
         1UPid8/hMd1vpO8Z1HH8wUfyfZNWK5WVNz8O2iOSwFulwT14iN6cAJ9k3kYRxszx/8J+
         ZfVbXmkh0pMO1XRkO2ML4wn90O4bBd4syFghP/pgtFlNifs4VINxjJrPhysz2kyaFa3d
         ut2cSJXOHIi46pQrkm23u6p9HDSNAX9mJNsPIRMYtwbQg8sSv434+Zoa59dQRAEnpuIW
         UIBhBPrlBG9iosFOv68C9vWhjUSSn5P/QoCed33C2PtnKJGt1PfFOt1XJFjzTE6pAOu+
         O3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hCHlkF5Z3NmTqMnInVbTSc5iAXn26gWIw7YwXQgkr4=;
        b=A9u4LlDMr/v4YuXdORvUfJz8rUw19rfDyeQDgVTaWajb2ouQ2TZRMHQOWELKnloVgb
         sTAopNBbeC1GgwOqu9DYmiXKOOKX/eI0ChvG/QsGcnYVKntlPLiC1DE2+SfYCV3Hx9bB
         2Jw8HVnWgVoNDMP0j4nUQxLqIcw9uzBiLmqhCWUWnmpeZvVfBJ43Z1gTEwoeJRPgExup
         hMMpaY65R4trIZ0B/7u1WbidjZSPS/6O0dmD00HwvrLU3DZzifccmYFE5jaGr+ogJo+s
         P0A31DeWjOrGDvS0+CI2339LvW+pbOj6THrCqiT0wW9B229wKj40QaIr4Txuu9j8uEb8
         g00w==
X-Gm-Message-State: AO0yUKU1qPXmBImWGq4/Ro1A+Nmq2mVrmNzARxVuUEDkO6OqjJaqwx8Z
	CLGM05odmOlp/roQtoVT8igAoQ==
X-Google-Smtp-Source: AK7set9h+h3Yx3+JglVGj8gMjIzM5W42Mci6pIwcqvCbd9w9+V46ksoIxY9Juxkx8HAEL/TqjQdSeA==
X-Received: by 2002:a7b:cb95:0:b0:3d0:6a57:66a5 with SMTP id m21-20020a7bcb95000000b003d06a5766a5mr22553123wmi.0.1680376923601;
        Sat, 01 Apr 2023 12:22:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id o9-20020a05600c4fc900b003ef6bc71cccsm14508987wmq.27.2023.04.01.12.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:22:03 -0700 (PDT)
Message-ID: <c0fdb192-43d1-760f-ccd8-2f9d5fe41a99@linaro.org>
Date: Sat, 1 Apr 2023 21:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/19] clocksource: ingenic: Add explicit include for
 cpuhotplug.h
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Amit Daniel Kachhap <amit.kachhap@gmail.com>,
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
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_122205_068851_8E471779 
X-CRM114-Status: GOOD (  13.42  )
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

On 29/03/2023 17:52, Rob Herring wrote:
> Removing include of cpu.h from of_device.h (included by of_platform.h)
> causes an error in ingenic-timer:
> 
> drivers/clocksource/ingenic-timer.c: In function ‘ingenic_tcu_init’:
> drivers/clocksource/ingenic-timer.c:338:15: error: implicit declaration of function ‘cpuhp_setup_state’
> 
> The of_platform.h header is not necessary either, so it and of_address.h
> can be dropped.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


