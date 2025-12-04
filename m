Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF5ED29FAC
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=; b=H0uy6cldqSVZB2cjy1u9bsAY4b
	Vp7PMLzxTbR8tdcG5jWQkTWnQahIXRyIC7+vTZzNqReurSQCLUbHE6CvFpjaVJSIsEcPDu48+cyqr
	+lLDDVM5lhpFzChWL6Bkxam3HSbdqo3N0FZVKy4xtcxeoGBlu/60aezUe5eVIgeVOO6/G6x4vB+jI
	uGvZCU3qqLw4/diDRGGzFDU9FnvH/CI57o+TSYPPkf6yzQlu9/qGD/KgKgxkvbysUl+ONInFqX0tW
	x3CBekPnxzbl1FbwyUhpGtNIB0gwp8x4WenxyNGNvAVYxwsO5HG6lJ9yfjlSWznW++/8XvkoIq8Ao
	VRva4s6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDxW-00000008R2s-1Xjm;
	Thu, 04 Dec 2025 18:21:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDxQ-00000008R1b-3ofX
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 18:21:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b53b336e6so92936f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Dec 2025 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764872495; x=1765477295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=;
        b=mhpbC7/R1GFmePTZhaRf2w9O+J1mEz0YO+3oHoeoJn14ZhGMiqEwP5QmAubKRPnqnT
         8C7CiRDz0yM1b3jLbGRJsiBaQfEE8OvITo7NdLeqt/aEiV59xLaoTRgAhtDcPH/LVGNt
         O7szyy2bMA9rB1hJkOWSGJYOjYivVG8SSivBnnlkB4rdbL+qClv3ldilz+AUGDb8mFMP
         yDzHEu4xzAh5TNi4UlghPKqLW9l5PVID0L8ejHws1qw0GeJtijifaGcONA4CqHWLZVdi
         nErRPWZX/oEswfbQzn0Q52tUuU0dKZ6UA3RD0Pdib975AFVsA5yLaLASyquN91s3vI8i
         Ki1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872495; x=1765477295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=;
        b=eYBA50ZESukC9XCTU7d4jxakuSiuKYzk3FnPT/Bqyz0iSUMsi2+9IkUD0Veo1y8Bas
         n8E1WBi6OBngzcxRrDxpESNlMqbqLnwQAPWcZUVH1Z/v58VTgIPQWYLkA14oBPIRwjE1
         roTCbPclwecef0mpPsE3vU+GxCGzLels9hIpdms4NltgaImJONbaZ8kvwrV0s+zT339j
         vN5G8qAaNuBK0VveHfWQ07NY13wpb/KUi0KtaJVz8TbvbvR3e45t64Sb2T71mm/gWvKp
         ivEV6LuK/MMxC7UfAw3ecW719gYk5kXM4WO+3bUEHg1YKkg2Pqgo39N8PNosfHflir36
         bmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZdmMKsu7x40WcsR69I+uO1eUIgaG24vc4J2RXHNI4ibiZHKJo/qQfTxcUnnQZnaN+t4I3pQR4NEm5kiG3xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yztu16gjXhVMKTnb70ldtWaCXsSZLknNdWHOGiFh4NnjSncHrB4
	uxH23rWhCDDoeE66n5bpUxRXj3EzxHi+ZfRau591Gz9V4Y/44H2FfIQn
X-Gm-Gg: ASbGncuipCjBSTxFP1nJ+7uSzGDTbMkxHFTfvZ0Bzc4ErKNI6Sqfyl46JO5haE5OSS7
	onK5n6MrH7Le6aPX+CeSNpIf3AzNS7TvrORz8ZfmmW9EyigLfFuhPWfGIp37OCalcuScTQMbbRO
	9YvhdRsIm7QK8nJaL0s+2R69V6j44YBunHIBmi1aPEYaj6TOvQAGZSbs6lUii6cJNyTTUhr9Agu
	NbAUv+XZcW08UY8kEuWiwoCfG142wphOckThUUA1bmv228018D0gmkCDlFbgSrIMP4qkxWKHzt3
	DP1Kdhk+hYe3f78YoMexUZe3TK6XuGvH11cJYJgXCweKwSLZcLN4RQ7nu1cqJ3rERdMbm/CBPNU
	wHNM831Fw0X2Elet1Q5gHV0xF6yYePL3HALYq3uMS2K8M21BBjgNeucVF0Dz+/48CfFy2q+lcHU
	KoKy0=
X-Google-Smtp-Source: AGHT+IEzgG4TzCJXxABGuutxcIrI+o/G6IuaOtE2bigp/vNM2WwpcI6tNhb5bLyGJf4XeLf7rYmrFA==
X-Received: by 2002:a05:600c:8b42:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-4792ae634e8mr38393335e9.0.1764872494836;
        Thu, 04 Dec 2025 10:21:34 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm45669115e9.0.2025.12.04.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:21:34 -0800 (PST)
Date: Thu, 4 Dec 2025 20:21:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frankwu@gmx.de>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204182131.gfqwy566gjzd7dbx@skbuf>
References: <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
 <20251204160247.yz42mnxvzhxas5jc@skbuf>
 <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
 <20251204171159.yy3nkvzttxecmhfo@skbuf>
 <178afbeb-168f-4765-bb0b-fad0bcd29382@kernel.org>
 <aTHIulPW055AyLW_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTHIulPW055AyLW_@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_102139_082585_BEECDFA8 
X-CRM114-Status: GOOD (  25.65  )
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

On Thu, Dec 04, 2025 at 05:45:30PM +0000, Russell King (Oracle) wrote:
> It would make sense if a single GPIO pin is used for resetting
> several devices, some of them with an active-high reset input and
> others with active-low.
> 
> What matters for a GPIO pin used to source a reset signal is "what
> is the active level at the GPIO pin for the reset to be asserted to
> the connected device(s)."
> 
> If we have a device that requires an active-low reset input, but there
> is some form of inversion in the path to that input from a GPIO, then
> the GPIO _should_ be marked active-high. If the same active-low reset
> input is connected directly to a GPIO, the GPIO _should_ be marked as
> active-low. Thus, to assert reset, writing '1' through
> gpiod_set_value() _should_ assert the reset input on the target device
> in both cases.
> 
> This is why gpiolib supports software inversion - so software engineers
> can think in terms of positive non-inverted logic when programming
> GPIOs.

Thanks for this message, to me it brought new info which I didn't
consider before, which is that if there are *future* boards where some
sort of inversion on the reset signal (likely due to it being shared as
you say), they should be described as GPIO_ACTIVE_HIGH, but this patch
locks us out of that possibility.

If I may bring one more data point into the discussion: the switch
binding specifically requests not to describe shared reset lines
(because unrelated drivers might reset the switch after it probed):

  reset-gpios:
    description: |
      GPIO to reset the switch. Use this if mediatek,mcm is not used.
      This property is optional because some boards share the reset line with
      other components which makes it impossible to probe the switch if the
      reset line is used.

so I guess that the probability for a reset signal inversion, even if
it exists, to cause problems in the GPIO_ACTIVE_HIGH reinterpretation,
is still low, albeit for a completely different reason than the one I
initially claimed (which is bogus and Krzysztof was right to challenge it).

> Sadly, we keep having people mark active-low signals as "active high"
> in DT, and then have to write '0' to assert the signal. These people
> basically don't understand electronics and/or our GPIO model.

This is the case we seem to be in.

On a scale of safety, having quirks for the affected device trees still
ranks a bit higher, though.

