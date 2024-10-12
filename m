Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868E9D1A447
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TExD6lpXamjjjy+cKE126WWHscJMcaANGocrzhJ0a6E=; b=A1Qwvw7oT5Ww+hVStWPO5ZDiw/
	Ox3gxX/bX/YoXA5FojOpWSeXFrtTo8xcRC7PPDQoEyAjGPopzeSMys/tUpupWYaxC/rrDkRN11Rd+
	OIYkh3nB+Cl6WLlkPzn9SwHWOiU4vbd4JdhQw216OIAz/WOz87mrcnF5j77MUGXgUJllNOGGDUJ0W
	k8DzjpAjpWk8EJI2/pMCrD3wqJvI4BFGTh89OEv1hONOr9StHgUuVBv8MvY4Sxj2AbfkcE3/ML/R/
	FCkUsH18vbHzhtS26d+iv02uqJzpAv80rtJ0wh80IKpfwsXVemCOGFyk+sdsGjtoCMQGMBq4t89bX
	bAyB4U1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szX4W-00000000nNE-2mHh;
	Sat, 12 Oct 2024 08:01:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szX4F-00000000nIa-1jyC;
	Sat, 12 Oct 2024 08:01:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a99e3b3a411so93198866b.0;
        Sat, 12 Oct 2024 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728720097; x=1729324897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TExD6lpXamjjjy+cKE126WWHscJMcaANGocrzhJ0a6E=;
        b=S6Jmvy/FXWsufZDhlKJmXFj6H9eQr94n/WbwREZLPGNjOgjEEghMpPWbvba6G37Gds
         gsDFxIf0xnxLkZWcheDDdHXOTwI3Mvk+AFV0C8lElMUfjYcOnkJh0b1qDpqTYQUX954t
         rHrgXKW1dgdj9u+B+6SkcnwGk82LfjIExb67ZyNJTuhkU3Rjt1xgsH/DoJ7Y2Wp3WoaA
         ZgYneOxVXmW879TkrZYZfCgXaV02KkERQxgphj+hiBCtqI47AIj2y7uL9GsNxnnVM+i2
         wVYbhzDsWTY2uNZqmAtFvtGLUGhXphJgU7cqu1bA7IJgUDXBvvC4SaOgjXvQJT74ubK/
         Ue9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728720097; x=1729324897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TExD6lpXamjjjy+cKE126WWHscJMcaANGocrzhJ0a6E=;
        b=E+8Z7D1+shdXckcBUFFxcQ5sMoK8Deo/Y5pPnVBTZlcqcsuCkyhuJhErwhi8+agfsH
         WWvA/yvZk/ornPFOW1GtEAj7gHv/xNiXQjY49yBTOnQXbXxRFCyu6F/f/DFTuIzQMXtx
         eKf4v7Q1lg3iRKpf3IsTH4atr2QHzwJ5x0+mzMAHvqvfx9KBVV9Ok063IN0x1b8ZgzKW
         IFMVNNT7SIk3rAHjKiDYkDxOmUJFyTtqcpa9ZFpW/oVDfB6KBGgY3H9pm+wo2g0oLsrv
         gZTem5RLFzaF0Iq8zti4FO0l8FORy/vKUMpvgffvgssPTVP+Mqto5bvobFIykXOGD0Ms
         kVmg==
X-Forwarded-Encrypted: i=1; AJvYcCUuY/o5q/Iv6WYFUJ7a6/0SLF3DnO8Nq3BXvw4OvKLPEz+YnH0dZqQ33fkcjGokW+4Cm/6zZllAV4UYsOhZWHI=@lists.infradead.org, AJvYcCV2wm79bDJ9c6mzEoNf2EX+Js+y8NbeHlfEa5FwJAWl261d+QAbWLVttyLnZbzhGtFkm1a8Bxd1+7EjmuUoKA+m@lists.infradead.org
X-Gm-Message-State: AOJu0YzO3JBLTbzRRwLW8YfJyfIEO3Q5zxFjEKnM+kPwFHzjT6DBfofT
	vkvLhAec89KOanNUCjouuvS6mPSpnLhbKiIkgwWyl18iswCM+wNe
X-Google-Smtp-Source: AGHT+IHTCePNmn1jdceOqiMTn3NmaQ5zU8ZoSXNad7Jbdr8bBJaYIvqEv+nMAc5bQFf24gN6hDBvDQ==
X-Received: by 2002:a17:907:1b0b:b0:a99:d587:6046 with SMTP id a640c23a62f3a-a99d587655amr193142766b.32.1728720094904;
        Sat, 12 Oct 2024 01:01:34 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99dfb3539fsm81883566b.134.2024.10.12.01.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 01:01:33 -0700 (PDT)
Message-ID: <9bbaad91-e439-4b67-bcff-538679b40b64@gmail.com>
Date: Sat, 12 Oct 2024 11:01:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
 <20241011165841.GA2504125-robh@kernel.org>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241011165841.GA2504125-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_010139_494524_5D000965 
X-CRM114-Status: GOOD (  11.89  )
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



On 11/10/2024 7:58 pm, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 03:03:51PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add DT bindings for the MT6735 pin controller, which consist of macros
>> to be used as values for the pinmux property. Each macro corresponds
>> to a unique possible pin-function combination.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   MAINTAINERS                                   |    6 +
>>   .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>>   2 files changed, 1154 insertions(+)
>>   create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> 
> This should be squatched with patch 7.

I thought so too but checkpatch said otherwise:

WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst

The above documentation says "The Documentation/ and 
include/dt-bindings/ portion of the patch should be a separate patch". 
Does it
need updating?


