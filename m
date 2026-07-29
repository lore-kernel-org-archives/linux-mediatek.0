Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD0FC53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=; b=c39e0MenxzHsihb6ZAI908RCaI
	t40GZagGuX9QV4vnb28Fo1/6k5ZctbJQ2Xfz4Dv8SeVG4tH5j77XK9UYOF64qpzjc7JQw9n0rRTTZ
	O5tTbe6XYhzcDW6/qXj4Tu2WfKD40zHXKKStI3Y5AmplEZymTGSMzxb3jE8YURM/jTjeJWbm8EwUw
	DCOE+eX3pkVYnhxhNbTcGm89bFkAV7y6F+431ASqFYzirj0HvoLtEAz3XXr0AR+HV6Zbdm6/2iIF5
	La9DXs+xk3JlI2/Rc5Jxz+K9fc5fUTNyrMS3jLQg+z/MOSCVbBSjrfSXgZpfY4ILo4h5NyXZ12Cyn
	8EqAQolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9VP-00000008qpH-129q;
	Wed, 29 Jul 2026 18:59:51 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9VM-00000008qoP-47VV
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 18:59:50 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6aae384221fso825119eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785351588; x=1785956388; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=pUUKg62X/lHIkeOubkhuyDnvUVg/PEdBJg6ndMnwe2DqlIGAhr7xnLGZJuM3q+Jd3m
         /Q4VcXW6ZPL6TyK3b88ngnw4S0GjkCpcQR1HdcH0vp67RcAsghfbuM+P15MJBikcjrtJ
         9uL3UGqWIFAsZfMRdm/YGM1i8UKGjBZGK8gzO2v9m3/0jmTU7l0tz4HUa3GyloRrgEC9
         QzH9GJW22lsTKMwE158WqMeDMHcYkrV9OPFTM9DdL23I3TLeBKaDAnoV+MT9ahBSSAo4
         jM/qnQzylmCbCFKMzfCdryck3Us28zeDM2RVpWLDRBxTn5Oie0h9X90g2jx3lzhPR4Fb
         PvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351588; x=1785956388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=G/d6ozpJJTGycGpfHlvA5EVmj/jtNfsQKaZ7+mLP1yyOJH+cA0OfIYxxSCiwAs7OFn
         E8MQv2dYiAjx5XUpwQklI4QoAZMD9474MgDzBRNZo4C012cOQrvTFqYNoJ4w4m5gRfZ4
         uRniLunQL/nD76p4iz6kqzvsdabKfQNWh9ZSnyryGroVC8k56WReZB+teRB/qRqJKlNi
         qqxNBAmhUaa4qlzHhWnJFW3idLxvg5WByUTaTGr6hBdDDICuQuYvhw7r0Gf4LmKXj7g9
         NfW7n2sfJxTlW0NTGLgXDiXiLrv9/WCxLJ/HuhJIrDuUbl5PCjiks7amdF4iwamNyr2h
         osOw==
X-Forwarded-Encrypted: i=1; AHgh+RrY8MpM34V4BqysdHpliDBohOrEqA1uE3ijju3Gd8ra/25VNy4QUEpVJhettTqXbs0xMGhYZxAf8yzs+1nVlg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6yFnQoMuhCHWTqI4HkajnWtw2+WckT7AqsFd/rMmwUNw6uNbP
	3Dkcq3gjO1uCPDnUcXZu2iv/ECq7u4QYb2hqTlEYPs5xX5FkZPlAZqY949gWwS8im6g=
X-Gm-Gg: AR+sD1326gyhkmAyULeX9HfPZWwFjiPo3slzxKbi/L61sYz5sXhiZ7ygs/y1L9JoPL2
	219SQPLFE4R34acwCuF0p2vH/32r9kp3LjmFz8+td9FuR4S0hg2yId30PJFQ/nWLTjkBcNnVpey
	ZlDpdYpYUNVHCnLz+irW/QEX/IglxCk7gEhPv/Wa/Aoq+oiH3ryhvuL6AqpS2ebma7w19PDQfBn
	cUxlmAoroZQWBihVe/XrKZvk+4S5y7Jen4WOjnYcqFpuW7YFGMCSRlNZeYWb8D7e5ip7Nl4jgNK
	5OS7JENssI8U/WC7xO4WDCIG5UHqdWp4RzGTICa3F1r7wCwZxdTpAR1n1R1RQzpxMRVILvQqgRO
	y9WWr/mQOLyMHenZyC2Ae0cuPdEf1Pano8OXU04lFhmJKAncDpYXuJH45qBaLhuV80NISrRrMgx
	Ssy/fGiYZecYLWm1J7EOP9/At2oNQL1nGX1eXMG4CWeoFlyc2bQc6hSXYstlCiCfB+e3dfIWMXP
	L2yMbaO3yljCv9dlZ/sQFTCox3pOF9JhkJx0d4=
X-Received: by 2002:a05:6820:c92:b0:6a1:98fe:3da2 with SMTP id 006d021491bc7-6ac9697e7d4mr4033926eaf.11.1785351587691;
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm2603945eaf.6.2026.07.29.11.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Message-ID: <9ee5b759-30a3-4387-98cb-48e8c2f6a9df@baylibre.com>
Date: Wed, 29 Jul 2026 13:59:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
To: Carlo Caione <ccaione@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Julien Stephan <jstephan@baylibre.com>
References: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_115949_247703_6CEB1B45 
X-CRM114-Status: GOOD (  10.82  )
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

On 7/21/26 8:24 AM, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
> needs the debug UART and eMMC controller, together with their clock,
> syscon, pinctrl, interrupt and watchdog providers, to load the firmware
> FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++

It seems like this would be better placed in mt8390-genio-common.dtsi
so that we don't have to duplicate it for Genio 510. Julien can test
it.


