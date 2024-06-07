Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89244C27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+n1UbeKOejJyQ0EsFqQB0hecGgVTeSZSMyL3P00Ii1E=; b=SAu+mMCE8kOEPy5jRNhgxsFqGS
	zkhT1KH73dmnT2NHKIIlKQu0fJD+aiF88d5CcEJLF8URgQSRAJIm3PvBchIyQ1PtWKX+SgqmsbL88
	IOCJOXywWPmARPRhz4+Irzl5Huqg4LWoBfncd3jhQie5DuSVAokIbzt7i5jbUh94dP9CMwLcfSrfq
	BCyV1Z/gaLEn3nHFJ3xpm/baCbRWJ2iyoXSHwsW9nKyfG28y+1cbMWBHac4z2COLHDeF5Noi1366z
	qzhVW5sQnc9RPXEoXK+eL+GAya+idPbW+LBGuKGPDwRBZ1re0MTsm8TAxm7NE3JU5OE66nj4sQKX9
	n0z6cDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTWS-0000000CmGH-199U;
	Fri, 07 Jun 2024 06:56:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTWP-0000000CmDv-0blD
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 06:56:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-35dca73095aso1559065f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jun 2024 23:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717743374; x=1718348174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+n1UbeKOejJyQ0EsFqQB0hecGgVTeSZSMyL3P00Ii1E=;
        b=kN76i83IpCNvwyzdYkCCVRNB1VSSWacqp+YhTNdX9orQhfBTg/oGhge/+SkuMzqXaA
         esfGOwDXBxx1GG5lbqlXpuozoC6gB4sXlnw8lh1CJbtNcAdTqg00rQbdq/iF9aRDnVLw
         p+W4EcS9/V4JOGezewF0x5NcDibc/QcZ+XXQJkBQ5i4fiiXddwxZzaeVRSakAOnS1Dj5
         Q35klxKIToAQrveOA99nJvkSolzOh0yLT7Z79+WBu+rnTpwWxI8b8IjXqNIaOgZX1ph4
         0MI6w1+DJKz5/7n4uTMiUhQuMkXR44s9m0nKZQWLcAKuJn/Ptzhizait5HAiF9S0zTAk
         OtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743374; x=1718348174;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+n1UbeKOejJyQ0EsFqQB0hecGgVTeSZSMyL3P00Ii1E=;
        b=nTT8iXj25Q4alPEm+WVTgC6TBWjDDRigIJdFOj6cJfYN0CdpBd+PfcE+I2dmxiibrU
         h5zmR3X1bxSJ0EM1ddayOTvV4r+4iK5boAY9a+KGtBZy2oujnxw3Y85o820PWxKblBT/
         sOt+aX+G1FvPiRv62sdQfTJmE6ct5pN3RwBVJTu1KVo12EXFhi2Tr+pyO4EqZEuWhlnh
         7fnClwEWD5IwCWMK99cVR0CGsaZ/I/NkiGqV0sGATp8XfALAM8l6klTELvdUpNSNqxuI
         GAI4VO+Exp+fTclc0JrtozI+s91SNZxwLOxr5vYm4axUQjmt3639uJvVeDk5aS2JBmXK
         VcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsRBeI47Z4GGlbimRyrG1zVRWChjy7yIQxUqJupk/xdTgdQPKi6lNz/JUfE7zPNhvxJQcCNrUJ7//97ppttNzICg89JE5CqSPFqVvR88pDcae6
X-Gm-Message-State: AOJu0YxGeDoEUouEwHVjpLXULnu2algofsFtXsnuPpD25mQm3//aUfbN
	2AydUZbc9ci9KxwLPLyoAsZKT85DJk547jvIdDtDPm3UNebbVm2gqENeKr2Crkw=
X-Google-Smtp-Source: AGHT+IHAnFvsJMX10rtGGRSCWAG59PxgESy1x9MXcjGORvB0Q46JVDA2haec2hIhIh5gy8TVv46KUA==
X-Received: by 2002:adf:ea88:0:b0:354:f359:7355 with SMTP id ffacd0b85a97d-35efed07c42mr1240127f8f.3.1717743373907;
        Thu, 06 Jun 2024 23:56:13 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29c37sm3338413f8f.24.2024.06.06.23.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:56:12 -0700 (PDT)
Message-ID: <b98dc404-1cf3-4042-b6aa-45995cc12294@linaro.org>
Date: Fri, 7 Jun 2024 08:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Kartik Agarwala <agarwala.kartik@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
 <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
 <c32b902e-0338-436b-85e1-827c48e0ee2b@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c32b902e-0338-436b-85e1-827c48e0ee2b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_235621_238243_1DE239B8 
X-CRM114-Status: GOOD (  10.71  )
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

On 06/06/2024 16:19, Kartik Agarwala wrote:
>>> +  Must be a child node of PMIC wrapper.
>>
>> Did you update the PMIC wrapper binding with ref to this?
>>
> 
> Hi Krzysztof, 
> 
> I apologize incase this is something obvious but I am still not sure
> if I understand what you expect here. Could you please explain this
> a bit more? I thought that you wanted me to convert the Mediatek PMIC 
> wrapper but it already seems to be in DT-Schema format.[1]
> 
> [1]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/soc/mediatek/mediatek%2Cpwrap.yaml

If this is a child of some node (PMIC wrapper), then parent node should
reference this schema. Please make the parent example complete and
validate it. Otherwise above statement - must be a child ...- is false.

Best regards,
Krzysztof


