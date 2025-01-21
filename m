Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD56BC02182
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2025 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=; b=eQh/3/IxygAEKwJNWOZx8CJfej
	SSDYzBur3s4CVFAPF7le+W94sz707rn3QuHN0i+jhbcdqNGFJh399Z/dblyNvTCMrIwDV6tQYdgkd
	ufrvmKq9I2P5wy3TS6u1I5D+ReETIYfBddiBzqOTCjRMIE4audqv0IBCIdsaTtt6SME9YnMuV1KsE
	+0K37mVUxsHnA29Zhw0+jSZNU5gJyVzkLa9oFQ7/S1wmlhSvlPPt1Sv/3jVHQF/lHSfTFlyoVG1Wv
	ZMJNhigf/BVY7vQamUI6MYsoceK5HIwFMmBYMO2FhVBDrydHsmA71dVxkWsyuD3HnepYyaXxisYiR
	Hy5ElrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taArh-00000007SM5-19J0;
	Tue, 21 Jan 2025 09:48:09 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAqP-00000007SC7-0ZQD
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jan 2025 09:46:51 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e53c9035003so8351386276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jan 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737452807; x=1738057607; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=ivvCBlroX381SHtW+7GJTB5jI+HlLeue0QbC8nhEUTQU6g6OrFNQeYBmADj/Baw1cU
         uD5XPn3Y07jzzp2tLUKWTfryHBgUHu3+id6D3hl7nw73aMkYTI28HMJMmlalcSvPHKQl
         mXcS0G+QB8UcdQMxvk86EqurrjzC8DKvVNllBOHNhPMfLEgwUnBgraeIGWV/t8yjWyrY
         co+TWbnibTwbH4vjwzG9EW9kEjsdGX+W5jjjVWPUKaL5GA6DyDX3bCa+S8vw0/QwjIoZ
         9LQ6Nl356I3GsZ0HTAcXqMlXlGAUvsv6Er6uMkfw4P6yzOGsILrhenRrpVbZ9ddhaoj+
         V+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452807; x=1738057607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=VAyRM3qzaaD/5zytKC+EHqHUBsACgOn9MwTpl5IlyHXUMB/04+ZJtoMN/9S3SgBQww
         jczyFLTCbACHr8fGHClGaE52CrhGXspMQz6LtdOXr0KNxe1Rcv0cPSKipxRvuzZmqI0U
         rEOIu38ROv2WvggEN8xLc85h1nLVbYvHtr0h8Ea29FfuS2zbf7x89jiFjWafCXrgQngo
         Itu4r7F23+kJDblq5L5R8ALinxxeW9IgncbtqC47fXxpRmRqpvXs+xWSgjQirrEC1Cyx
         LnoYt72Jtao6WqVJ7j1q9sJMrIw/uESydXn1FoqO44EQjTZnxXw/cTVK/KqYkil5MGxX
         DuGw==
X-Forwarded-Encrypted: i=1; AJvYcCUTWN2HG2b6gRvw1+95FynV0UiaHoXZZ3/fJJaAp7a90bjYjAqzEZ6UD3OYbHJc4yRup89faJOCG+4pSSYvzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiRW1GUKqaD88J3tTHRmZeEgRqdmK2Pm4g6kub3fo+uZRmIjEm
	lb4tLEYXAmfycNwBU+FDNf+gGqMUnNrBaFRpSFpU6bEzmnY+gMuAY+9WHcx3udNVrJ5s+bf/x1Q
	FCSe047BbcIq9HSHtPByDuILRu7E2Y0D6xA94Rg==
X-Gm-Gg: ASbGncuwgSsE2zHoZ/Ngb/Mjl4cgKX+HjkuTLOb/bZuWuxEdAEa+HVWMwuXVHUbVH08
	3RWWTjyBlXeqzYcGLCE1J9giOwTAhnBy674rmHq6ThJHZEdPYfCQ=
X-Google-Smtp-Source: AGHT+IE4NvWjhVwcZefMFMPsNF1/yZL/+GizgE7O5W0l1UUq/sk+Rp9xLLX7buviHENqfSARwR8NAFZJ6rRHBgoskwA=
X-Received: by 2002:a05:690c:7344:b0:6ef:5ab8:2c53 with SMTP id
 00721157ae682-6f6eb68695cmr133051747b3.19.1737452807535; Tue, 21 Jan 2025
 01:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20250120153817.11807-1-ansuelsmth@gmail.com>
In-Reply-To: <20250120153817.11807-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Jan 2025 10:46:11 +0100
X-Gm-Features: AbW1kvZ21pVNkI7qM7rGH-9wFnhv5SdIw9t28_ewxvHO8LS13hlMrra20J6gTIc
Message-ID: <CAPDyKFpBtnsEfMg73UHdXzZvSNHaL8H4N1h6-2wAMnFWNTM75w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: Fix compilation error with Clang-20 and
 Thumb2 mode
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev, 
	Sudeep Holla <sudeep.holla@arm.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014649_201972_806DC01C 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, 20 Jan 2025 at 16:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> hooks are inserted via the -pg switch.
>
> This is a known issue and similar driver workaround this with a Makefile
> ifdef. Exact workaround are applied in
> drivers/firmware/arm_scmi/transports/Makefile and other similar driver.
>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/mediatek/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
> index 0f6edce9239b..18ba92e3c418 100644
> --- a/drivers/pmdomain/mediatek/Makefile
> +++ b/drivers/pmdomain/mediatek/Makefile
> @@ -2,3 +2,10 @@
>  obj-$(CONFIG_MTK_SCPSYS)               += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)    += mtk-pm-domains.o
>  obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN)     += airoha-cpu-pmdomain.o
> +
> +ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
> +# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> +# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> +# hooks are inserted via the -pg switch.
> +CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
> +endif
> --
> 2.47.1
>

