Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA62C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ykUZcZURVXB/3zMYBdPYuNhDjgfUm115ZWrfevf/KU=; b=PfqpMXAqYBlCp+G0hdSGlR6ai8
	1cp5EbGgpQxdjwYRjD9+FVuYQMainkNi4TyeBKkNHuuZuPA5Dy7p7nEKoYvPDd2XNe3uZ3/NGt9Ej
	xBsrwv/pYzFGKfOj2PEwSUb8koJI286IIp7QcicKYqLo2NHA6Q0Pfi1dMA/HLnush8ynzaw4gAg9v
	v1eKl9YxM23nbJpVDWZgE/5zX8K6fZK/vOMcZ86xcdAj/rfMO6QZ4870Gqds3WWo3HebwZb/PD4pv
	zaJaoUXdnEnG5rHE28VEXEAQw2K10RXIAdFICmTd9onTPKzhXWgYKK/LePMAXbU/NhMemiX+py0K0
	x5GRWTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAri-00BNt9-CN; Wed, 01 Feb 2023 11:01:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNArX-00BNpa-Lk; Wed, 01 Feb 2023 11:01:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id mf7so31519590ejc.6;
        Wed, 01 Feb 2023 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ykUZcZURVXB/3zMYBdPYuNhDjgfUm115ZWrfevf/KU=;
        b=HCTpoDckU4A8dRNfpWfoQIuZW+ALGjdLX4rU7prLxk6M01ZWYWpVcRilDN5mxIrsi+
         UArefBzqsRd/Rd19nl46gU+sPXgTtURPMveAXUFse1PUcX/XlFGUq0MjB6hwKZnazc4m
         T2k0IwphBobMhA+Nhul1nPnj5SVF9I+vQTqJpHUjylI7EJDn8sJ45Vqd9tXAsOmBZtUn
         OfoDtfwJWQY6Ko+ShNP5W6zrPfNqPyDyPcIxod/OaMJf5TK4aniuPBPfKaFROfgn+xmm
         ttzpEF7kxi2lSnDneLu4w7ze1uPKvDzKrKAFSJHZ9Z/mWGCqv7oZ3gYfLCX4JybFY5CN
         gyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ykUZcZURVXB/3zMYBdPYuNhDjgfUm115ZWrfevf/KU=;
        b=t8pboi8yzKVhgex7xbTmjW7HZXbAiAy7u2F0tN2lSvuG6+/95SWk8ZFCwo13Ij10RL
         PqcqmeGsXbXVsJDcIVmDovZWiHE6+v8Qvv4vNJ+npLdF1OejPHVqeiOgRQXCkDa6iNKv
         nrHcPxkT7BCHVPKp5/UtVV7IuLkeS0s45bc6Gr4lfbd3PEXZCKiONlsHzHzTLhN0Ixcf
         9xyAfW7zV47gdSZNKO95qdVe3EAeNd7pSBLxH18wEpKXw4GSPCAoD1O1I19IPzUJweVU
         hq8WOoL/hk4xCKzmhV/h713Cd4P8fxRRGbOHpiu3EEykSrEslAxvw4WP8KrY9Amx0L/c
         aalQ==
X-Gm-Message-State: AO0yUKXz2H6kP7M0pGLppwYQdjrNoVo70CLl3Vh/7Dr8YknuvzdezyKK
	jpBx15skDQRQ24YX3AXnB8k=
X-Google-Smtp-Source: AK7set8htpLs17WtIha84GzJupQJaOVpvGk9F3VBPJU5BKY5qKjlqWwbP16VDKuDRQISkFpOpNTV+w==
X-Received: by 2002:a17:906:6a24:b0:888:d373:214d with SMTP id qw36-20020a1709066a2400b00888d373214dmr2528655ejc.29.1675249269292;
        Wed, 01 Feb 2023 03:01:09 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id g9-20020a170906394900b00872a726783dsm9811108eje.217.2023.02.01.03.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 03:01:08 -0800 (PST)
Message-ID: <618392ed-7d20-a49f-1ec5-b27850d71dec@gmail.com>
Date: Wed, 1 Feb 2023 12:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
To: Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
 <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
 <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_030111_727567_D85BC731 
X-CRM114-Status: GOOD (  28.17  )
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

On 1.02.2023 11:46, Michael Walle wrote:
>> Before I convert brcm,nvram to NVMEM layout I need some binding & driver
>> providing MMIO device access. How to handle that?
> 
> I'm not arguing against having the mmio nvmem driver. But I don't
> think we should sacrifice possible write access with other drivers. And
> I presume write access won't be possible with your generic driver as it
> probably isn't just a memcpy_toio().
> 
> It is a great fallback for some nvmem peripherals which just maps a
> memory region, but doesn't replace a proper driver for an nvmem device.

OK, then maybe I'll retry again with generic MMIO and without converting
existing specific drivers. That is what (AFAIU) Rob asked though.


> What bothers me the most isn't the driver change. The driver can be
> resurrected once someone will do proper write access, but the generic
> "mediatek,efuse" compatible together with the comment above the older
> compatible string. These imply that you should use "mediatek,efuse",
> but we don't know if all mediatek efuse peripherals will be the
> same - esp. for writing which is usually more complex than the reading.

mediatek,efuse was already there, don't blame me for it ;)


> nitpick btw: why not "nvmem-mmio"?

Because I read from left to right ;)
It's MMIO based NVMEM. Not MMIO on top of NVMEM.

Sure, we have "nvmem-cells" but that is because those are cells of NVMEM
device.

Unless my English knowledge fails me.


> So it's either:
>   (1) compatible = "mediatek,mt8173-efuse"
>   (2) compatible = "mediatek,mt8173-efuse", "mmio-nvmem"
> 
> (1) will be supported any anyway for older dts and you need to add
> the specific compatibles to the nvmem-mmio driver - or keep the
> driver as is.
> 
> With (2) you wouldn't need to do that and the kernel can load the
> proper driver if available or fall back to the nvmem-mmio one. I'd
> even make that one "default y" so it will be available on future
> kernels and boards can already make use of the nvmem device even
> if there is no proper driver for them.
> 
> I'd prefer (2). Dunno what the dt maintainers agree.

(2) looks OK, Rob, Krzysztof?

