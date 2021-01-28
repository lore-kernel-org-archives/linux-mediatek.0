Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBA2C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 17:09:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC12764DA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC12764DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGLCdvBVUGTWREg0h7mEK95ZRIl3WlOBTJNFLXup2rs=; b=NyM+b+n2iaDkjZzH91yTfvJCv
	0wBVWxx7KX85kprwW+25br5k7uX34l4YUWMAH3KwlNRVsLDX+WWmtVqbjEiBfBoGyAlJK8etaxMeH
	bdHhnXnrcjENgDKUssq89iWcHstHHkPi116q/7mTLWAi4pQU2xaJiGWqWCdyNergWVcfC2KqQDjQH
	27mBCtajZj7ewoi4q3ZMNTBF4IQW+JHmjiTmq6Wgb1y5+AqHQ2wkZykBX3Wt6KuMP+9ILWMLfkxTN
	mb0yKPpoEf+LJcvIP90yRJQljybk8e8Cegq6M981l3f7wD46EoLNqgkWa+qCrVPlap4cs79vXcoL0
	GAn6gS4oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Anb-000076-4S; Thu, 28 Jan 2021 17:09:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5AnZ-00006i-PL; Thu, 28 Jan 2021 17:09:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m13so6153599wro.12;
 Thu, 28 Jan 2021 09:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tEVqKu7FgZ3q3m21a4cGa3XUWQDQS1wP9EjmTKGEaoY=;
 b=MRqCu5mtJ+wjFomv0GrHbvuU3gJRB8Oa9rBSW5MmrlRHEI6YjzJuTGWjPDTjcpsHND
 TuNGR37KbLkob2dmJVtnnuU0F/1jBJlrTPnJtmRWjYAyJLHKRysU885nndZuTVf6Vcqo
 ij4xtisRWqKUMA1lpUCcji+T/PX0S8tNTuPf3aIZvBCb4RiZmQQc2g9lZt1c8COuyaX7
 0MEGQt945zI9rOjwYn/6lXKJtA7o/LnRTfv0u8Lu8zlATiCyKI6TZslsFY6dM3d7TmNr
 rSfxIi3c2RixwqbGMEJIa7sVRsuUuAoICvzmbMn6mQtC+GZhTp6ctwG+S1p7BJiNvP24
 MQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tEVqKu7FgZ3q3m21a4cGa3XUWQDQS1wP9EjmTKGEaoY=;
 b=a9/1X8VDWoxJCMvOVc/EDFl8VTdVeNtYwsiPKeDyU9qH4ZtnxpuDaLlaKERbyZZF8s
 V5g2P+Cjm/V3UhhmwGr0xrkRw8xN3r+5GN8EjhNNsdKzhmLbLH/FH7FuFOF2EJoFWlR0
 syb9A2q4FRRYw8UgrkWUh7fMjuubfingfkN6eINeit9ResN2DPiuXKCGKrrayaQ+9a0E
 diqCEklVERODWztsad7Y44d/bsuT+zn3S8zEidQPe3Zm6aPcYQLUp57kZL2R7/q8vJMm
 ElU9D9f6rIArqTMEt9teSo1F+ks9lpPx5uQx0QdvVD5sG/KIsYWWaLCjz6vMQjM9x939
 fVKw==
X-Gm-Message-State: AOAM531zoqbd8fjNWlMMfXG/YIZzCbyCKrBZQgvoCXo1K3eqvzglmJgK
 OpDaVvy3gqv8JSNc4n4FB8S7eGZvvNg=
X-Google-Smtp-Source: ABdhPJx3OAVUYMraz4xXNNRgbJXMdMzftTGhMi5Q+H8urVhjLESWRY74Z4FSwt4sUXjWfMNzL+fnMQ==
X-Received: by 2002:a5d:5708:: with SMTP id a8mr17187188wrv.211.1611853776675; 
 Thu, 28 Jan 2021 09:09:36 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d2sm8378815wre.39.2021.01.28.09.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:09:35 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: mt8183: Add missing power-domain for pwm0 node
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20210113215723.71966-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <78b5a9be-1d2e-fc99-85a6-296872761f25@gmail.com>
Date: Thu, 28 Jan 2021 18:09:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113215723.71966-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_120937_854796_50B9FC28 
X-CRM114-Status: GOOD (  19.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/01/2021 22:57, Enric Balletbo i Serra wrote:
> The MT8183 display PWM device will not work until the associated
> power-domain is enabled. Add the power-domain reference to the node
> allows the display PWM driver to operate and the backlight turn on.
> 
> Fixes: f15722c0fef0 ("arm64: dts: mt8183: Add pwm and backlight node")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

applied to v5.11-next/dts64

Thanks!

> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index bda283fa9245..8471c973dfd5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -661,6 +661,7 @@ pwm0: pwm@1100e000 {
>  			compatible = "mediatek,mt8183-disp-pwm";
>  			reg = <0 0x1100e000 0 0x1000>;
>  			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  			#pwm-cells = <2>;
>  			clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
>  					<&infracfg CLK_INFRA_DISP_PWM>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
