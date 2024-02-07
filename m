Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8328C4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z2UzrcQJ/APxKpzdv1JN9qsAxCXd38NlN9+sOrG6qo=; b=22FUqcCNgKMJrAGpCV1g+cs61z
	/OaTlAy9PmCVU+bX+cIAO930ieFgkCZnLu3nSmt6iyI5MUp2lN6vEOWBJxhKuHHIRRk7DW5tScO3k
	XVtgHpS5y+Gj+yvIHG8dMKQpMNWyXQqOY8GqorJhAHbCk9gboD1sOVX6oFXbrtkVIurgwDc/fppse
	ceeqwCSp+Igj0uf5ubxYd89+o1tHtX3iSP57jRCCsA6inbbCvRqQsrtTrHi4XmsdMQTXyzECIwQ9a
	mMDtIl4+TXIX/CMXChxSn27m7UCCPPwleFi42bB2xzY9iBTzQsiWlPb+dj4G0ZYldtXVMJ27ZrQdT
	MJOCPWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXafm-00000009l5w-0DJf;
	Wed, 07 Feb 2024 05:40:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXafi-00000009l5N-1d1E;
	Wed, 07 Feb 2024 05:40:35 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5600c43caddso213030a12.2;
        Tue, 06 Feb 2024 21:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707284432; x=1707889232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Z2UzrcQJ/APxKpzdv1JN9qsAxCXd38NlN9+sOrG6qo=;
        b=O+nbkL5aVPYgTwwDEfDGhiQTET7gdEZwA98J00yFIBGn1olDF9b7z/cO/tVM0bQFDY
         0iDAfg0HEInaIPa8H0Tq6U2/Q0e9FF6TfAwBprkX2htxyQgwyhk+zzyjrH6pg7pwmhxW
         tKoMaAyoUnXZO+eCKJZQHRlmuH/iIA389VzcXfRT3G/SLCEI2jKhyy7CVPDOci2vIjL4
         Pl/drf3FGvHJ1/HD2xCLMpLCjY6VUyjezCx9emjPLfxal7pbkOmF3hrZ0nEHCQcwUqZc
         56Yos8KFSbv/+CVrBiuHFvDYAJjQOrJ9Wt8+7CGxls8dBrH8DYqv8elBVZi4fOI/tzsV
         7kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707284432; x=1707889232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z2UzrcQJ/APxKpzdv1JN9qsAxCXd38NlN9+sOrG6qo=;
        b=qnWufNVVDcQWoW0XjSFiM8nzdRWJmpt060S/VqARGBKs0TFSNUfm7wQJC0lGOnOeuw
         /qsPdJ3SRI2mjkNhUWi0I4mo/+MoVG7I9tUtdOgstyoCUBNJjdVDCkaX2lH/91LQx07z
         M2DbFNmC/q+JSVxh7lEx8CR4ZGwJ+bN6Pr4ixy+XuZfmkiz+jBam2nUu2LqqXRZDgeUm
         +IuMpVMtQ50wQNVGXHHq3Xrh0FZHSBW3WMsbkVfFkBmBNpdkbRHdXjSoZzvCBrqjsz9D
         eTNPA2LyT64MF5rHu19Cl4C44mPo7PBOQvCFJcYaEwHp/7FlSGsYfhEeWA/YOy8se6OS
         U1NQ==
X-Gm-Message-State: AOJu0YyXEkMVbUMh9laYdrikfY6pVsLdADxrj/keAp0uu0UtXImIgnAC
	mwOAqcKxe79FekDxG5jicrxgul/3d6CQ336Flz0suBIDnzK2oDSu
X-Google-Smtp-Source: AGHT+IF7Z/TIFjcYgFkXXQWuWiw6bLCi+9S9KWbHb8+GwD0IVhpLBatu/7E5ufmZHcN6hAImTs4ZSQ==
X-Received: by 2002:a05:6402:8d6:b0:560:7543:877 with SMTP id d22-20020a05640208d600b0056075430877mr2829068edz.3.1707284431797;
        Tue, 06 Feb 2024 21:40:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWW3rLQcUY/Yvx8vUF7o5a9vPwpmRTSIIDVws7TixpvlcwpNSb4X+1ZpVx/kcdrRfVeHzeBInS/fB4n/LOcyEN4ovMcf/Ur+T2tqrDFJnjX6iILLQZRgS+n+9XqhBcGi2cv/C6/kudRa+Xr48+cVEAlfxt3tCrrjMKIdiVoC7tJD1HC0IE1gjUjUurGqzYnxeZ1JMHDpYnQQiYBsIDiLOvlh0dYMk7uSLl738dyV6cdq3MVVjjvPBFSkbS7sVAZ68CuxMA0tIz+TblxfwTm+0stuQdoqO+bSUyX3wF7H431+IhcmWrLcKaoOHI2mtzt1EnFw2jsXhwja8uAU/32SWkaNhu4dQorFvrwXuM/y4wGNfNNmQAubuxPJyO6LMdif+ueuoAvKfPGaLPG4I2u8TLrtZSjttoeAdMzGgcRB7/OFyCTwNy/vUsqpCN6qOhb6eHD79qDYs/kT7KUlh2H56Pvwd77vUc+DeaUm9eF65xR9kI2SkZ9cr8jmIaK0fhxB8Im6rvMn7olEO3gD1q0OWr+FhOuoZ6KIpvyQKdAiQx6bsqg2Llc6XBsC95k2Om/j5UxkC0Ib/JMH1Fc6RJ08YPaJbyMI8nF5d0z
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id h31-20020a0564020e9f00b00560743d2a4dsm283344eda.61.2024.02.06.21.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 21:40:31 -0800 (PST)
Message-ID: <b75897ce-a6e7-4e7d-a41c-c6466d9d746e@gmail.com>
Date: Wed, 7 Feb 2024 06:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: vendor-prefixes: add acelink
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231207080512.3688-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231207080512.3688-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_214034_450702_091C334D 
X-CRM114-Status: UNSURE (   9.70  )
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

On 7.12.2023 09:05, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Acelink is a Taiwan company providing network products (routers, access
> points, switches, cameras and more).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It's 2 months now that I'm waiting for this patchset to be applied.

Can you handle it now, please?


While at it please also look at two more pending patches:
[PATCH 1/2] arm64: dts: mediatek: mt7986: reorder properties
[PATCH 2/2] arm64: dts: mediatek: mt7986: reorder nodes

