Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84347C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=; b=YbIjs3Hbx91+8YXRxzrVYXTnhW
	deLoje7+a8c4qE1hZ8M92WsXEWMSwDd8Tvzt2PZZnCztwsSGJ+xXcWVfIYI/UXjSJ+Tm3ReacJn+J
	Lgk5Uetizhy37EbAfhX/B/KC4NFE+CiTVkud462N3dYK6JKLmfz+uao+QS7YYoHQUxFCG5soK5IG8
	Q5iRnqp2qfCLHf6wulXKYef6Rc6o55mtz29juTFl5IrXu3xwdNEq8dAS1Db9p4M8z1c5BVy45esj9
	End0EYns0BLTwMKaflCiDgGTrgaV0iJC/s1kEmiXtRpNstzUi9jOKChrY6dUNRDNdhQxCGb3+Yblv
	aR8YE/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigo5-00BCHe-2V;
	Sat, 01 Apr 2023 19:22:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigo3-00BCA6-0C
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 19:22:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so15785973wms.2
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=wLou/172SsZ4tbZKAmsf4wdm/jkdhPJhgp/9PODUlSx+8zj3bvceTjgZUslKBzMWw8
         dbzF5WM+xXp7t01zz37q83r+zoMvSKVW3P/J28MwkqEbL9aNMV8iCK1aq/f4+7SIi4B9
         qp2UZBwhIDmh3rDtCB63WKwzAN5BUgdGepgfYA2wOSMqur9AYXlb5tF5t3JYnBT9m+FF
         QZNbjh2HDQTcX3YBnp/khnrydEiI2K5FE2h9klkr7WGo/ExSeTZ8Jium1tK606uJuIKM
         bxjPVjsLqxf1k5WstPx4prev8VXkZHddRS3F63SKw/dTy0euJ1u4Vad24HvY2PFiL49V
         8UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=Lje+hCrUDPUndm1PXH2MgGzqPKbeZVfCsGAQSj5k8qa/NW8LYELI6JMEoULEdEIvfe
         ktLf7eFl6XuDLVL+aZ0jYP10uuCr8hAfy5cFX0gdh5V5paqPsJtPeU0vgnFXUZxwkX4d
         Hjr6lHB9W/NFnbV8RDFjio9EbJE1RxeqZPTdgiLRNxPJtjsqVBV8ouI7oJyelZkjl/qt
         e4PDQfvofNLeq22BJYe4ElVmRA9QW3X1h1GR8G4/lHLK2eGjZg6QVAV8VYOdnnUS7h3z
         1PL7Ic9f3gbaE43lQeazhW9B3POE6PQ5nIis57crCOalMIkzIIH8P0LzI8E64Oidq+MN
         zZXw==
X-Gm-Message-State: AO0yUKU2TvJv8uxzxPEie6/iqi4ToC4PFtCGLRlSwK/ysFoYpict5tzN
	IdiuotE/sNi/svLMVbXMtDTTOg==
X-Google-Smtp-Source: AK7set9y5bHkZCySLIhsJfaK02RbOBp8M7OwMT91WfVTWaYaVc0pGHqd8wtNzjk/5/WSJSDGT1LTiA==
X-Received: by 2002:a7b:cd88:0:b0:3ee:7061:1bdd with SMTP id y8-20020a7bcd88000000b003ee70611bddmr22820919wmj.4.1680376950405;
        Sat, 01 Apr 2023 12:22:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id r5-20020adfe685000000b002e61e002943sm4791678wrm.116.2023.04.01.12.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:22:29 -0700 (PDT)
Message-ID: <93ffd73a-4544-5148-0159-1a9ea773c0a0@linaro.org>
Date: Sat, 1 Apr 2023 21:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove
 of_device.h
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
 <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_122231_389691_7BA2967D 
X-CRM114-Status: GOOD (  11.67  )
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
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


