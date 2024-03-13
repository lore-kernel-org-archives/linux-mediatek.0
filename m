Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C1AC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyH7YkiQiIP6w5g7eDOxwkAE9o1tF+zYeHL+jmj5IHc=; b=pWR71Kfc6x1yeLqxtZ/SmVWbPm
	h1K7GDuPIUvwYuxKxodd2VWdxRP9XOCGFDjmiagTQlGigdZtoWpctWtpXmGnCZmANev0NhQq+zSRa
	KCzDtFnunt4cZkVnoDbncageTSi89mDUJpS4Hq0QU17AK0/2gqI31GwfxRH4E6QQRD5DoHwTk0FHl
	NEnI9zTJICU7Oofaw2pfKOHmOsfvIG4PSXWJD6n1spopGkwCJfPamdrQ056z7yVhL0hhsksWCQKKD
	UmM/Lpj96HgsjFSLExkqTH9vqLHYpoqfYRozeRS0gU8q315wT4YvWA1lR/cnuxJzdIpV745nP4N+5
	rExzqMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKry-00000009V1a-21Ln;
	Wed, 13 Mar 2024 09:25:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKrv-00000009Uzz-1bzv
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Mar 2024 09:25:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33e94c12f33so3054576f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Mar 2024 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710321949; x=1710926749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyH7YkiQiIP6w5g7eDOxwkAE9o1tF+zYeHL+jmj5IHc=;
        b=vAUuhlj2ZPA0bQ2gutE6WIFlZ7kPk62JEmTuktwSkpxjmygSplFekcRNeq40bnQ14D
         hvBfp5NLKFY8Gh+NVxbX2bauJA5jjMU5eQ5hW11cnLEAaJTBQvzXF/fAFHzlKlSsRrq7
         2U1ktE+SK0JBYrg0O1szI40raJ3zELH5Xdx3wmZiU2kD4/7lCaeVFfXQET9mo8OMn2IH
         Q1+z1dRJRZmW5qyVnF3IQYZWA6Dkmucf0QO7e6UcD0hvwfxFEEjODpU8vhaki/EOvWMP
         bR3d7n+Za1c0A2kNh+NDQn/Oh27W/IdJccDTg3B3E+eg13RUSZZ8473msWpQawEcrCSy
         M4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710321949; x=1710926749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyH7YkiQiIP6w5g7eDOxwkAE9o1tF+zYeHL+jmj5IHc=;
        b=HcNGjr/HHpkAwqjePU2TiplnQrVBwz8YHr9836ksG/2DpzQuVa8CciZVWFitnIZogJ
         +YUP0TtKZJ+8pdUVqSRQBeTVRBammc8DOirUo/CQBRWqQZf3IJdcviY+t/L13uQwpDCi
         xOAf6uEy9GpPL5KDwZ70PmZ5s2AW76ywmv3vFQRHsQbIP4klaytB08g48ZdhBw0h6cCJ
         8Ij88fpzs8iqgDJKrNw9sOtrO0ydVt0AyNZJ32TcWW/JnroEi5zovI0Er02KrB7zRVOy
         TBP9EUzBDCqQE89h0XUSj+zIj8lepajV+L78qUbm+pnKeWQPn+Ojmo/u3kbvi8sB6j2+
         jYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYqXhf/ycqbx/yqh2n6ykq1F8ge13uWNHTso3MIvf+lPs2Sgk1kbRwEbgtUpmQlGU6/r+gypLq5dP44R8d745qBIm9/UliiLTQ3zFEqYPP1S3V
X-Gm-Message-State: AOJu0YworfTDOtRoS8ajUgiIccy6Ld3B3sQIj80XdnvyiOPmmNWa4U6a
	uloVSWMQ5ZKdisU77NmAUTRP0UxxCeSO1nwC89PI5YtuOh2CPPCXn4OnZBPJHpk=
X-Google-Smtp-Source: AGHT+IE6RKhX68BB8JP036wcs31tX2vaK1dT2SsxKwnYd9bqIpg8thAbw/4pniwxDU+cHSY8FkMLgg==
X-Received: by 2002:a5d:5547:0:b0:33e:7c19:dec8 with SMTP id g7-20020a5d5547000000b0033e7c19dec8mr1101938wrw.21.1710321949066;
        Wed, 13 Mar 2024 02:25:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id q18-20020adf9dd2000000b0033e90e98886sm8618380wre.71.2024.03.13.02.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 02:25:48 -0700 (PDT)
Message-ID: <e84183e5-c10a-4722-9138-27947a4ca0d9@linaro.org>
Date: Wed, 13 Mar 2024 10:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: add GalaxyCore GC05A2 image
 sensor
Content-Language: en-US
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
 yaya.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com,
 10572168@qq.com, hverkuil-cisco@xs4all.nl, heiko@sntech.de,
 jernej.skrabec@gmail.com, macromorgan@hotmail.com, linus.walleij@linaro.org,
 hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
 gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
 bingbu.cao@intel.com, dan.scally@ideasonboard.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240313054409.8073-1-zhi.mao@mediatek.com>
 <20240313054409.8073-2-zhi.mao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240313054409.8073-2-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_022551_464201_AAEDCDFA 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

On 13/03/2024 06:44, Zhi Mao wrote:
> Add YAML device tree binding for GC05A2 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


