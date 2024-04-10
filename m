Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1384CCD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4kwkorErv8tb8SzoHtazPQP+BQoahujJfqdWOv/amk=; b=xLkZcignCWZFZS5Z+OJIcvlaIs
	bFoUvyqBUj2Mum7taJYwE5oOzpZF6BToWjlZ0G1j/s3gFK4gNP8p8RIRP56lv8xFjJ/ni5/FbdGYZ
	SdAY83UJAm9Hlvap08EWxwlZf0yOpIbqVrudrtFLqMJHR3IC4kc9GXYGR/t0pPt/OZjEiGy6P9nJz
	hr+onJ6FK20QIz0SU4MjL97MvymvE0N2AbzWcE6WIzIwPy1EX66qVa7zNYxBaHTu5ka99LYqMmktw
	WwolOuzGJmprEGIIUaIL7oBZQqQlW9CGh3m8pgzvjBxtkJZCMwgIWwefZIpZHzxmmQPOT2M9mKwLt
	UoQ4+8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUGc-000000069DV-3uKq;
	Wed, 10 Apr 2024 09:29:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUGZ-000000069CC-2UI4
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 09:29:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41691fb4c8fso16852425e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712741353; x=1713346153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4kwkorErv8tb8SzoHtazPQP+BQoahujJfqdWOv/amk=;
        b=E2voV4a23YmrqhVzxcSocbq8Qqqjl4iSnfDI9CKHuyCpfsb1hLAO/09Y9ZvilDIhKG
         dUISNS8XfLfINLzn8WxPCNW6gAotEWUiTyyI8H++7stU4c+m2kqR0UEEs5pVILs9mVSl
         wtvDFvF+zKO6fyBXNuAuecjguTgkiuiepaHOy3s+kuFNMzmi/mZZuIK0HgsNqUgW7CCz
         KB5HKE0I0D1/stNbW2c0gXsviwswKeKGrcjCDfSswSLtB0VhWubhOzUdvBTW2wx3umTP
         aCXkul55fhwpcY0HszQnO7zTf60JYGusgZMTWQMU1O/9p92PMzEP51H5BSPdgEboT3gM
         89JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741353; x=1713346153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4kwkorErv8tb8SzoHtazPQP+BQoahujJfqdWOv/amk=;
        b=YaBqMfNkrw4dT29u6B8/vHu0mD/ZufiKLGpqvyKVZDGcajGnI6L3p6E/sTaTWr7Hn7
         PXzJ/jsO3Bhy5n1EV/d5Z7PuN3vnruvOoqsQsWYLlw6Ty5jTnZa1aH+77cLSoXpcYXAA
         trXy4e2V9G4S2B+NapQUhu3iwtQrhoECcKGaRWK0OzlYFsHFE9DdvE4ZZXUftKr1Cdb8
         MPWKgOhiVfQz91tLVgRtPe1L9pGMEDXcXs1/0FMpyZpFiAYAa4BP/ppFPxNxI/xpDz4z
         5HcFJ4vCfUD3dOSJ5x6JVd8uKy7rB4+Q6485mseBqr8y36CRtpBZy1CaPq3I/5AuqQry
         GFlg==
X-Forwarded-Encrypted: i=1; AJvYcCVA1WgDZ0AaAsi+UhaMT+8R4ktJ0XOa2gVN78v6InWHmEWT63OjFw7j4/le8SK12R8WFA5p6CFmyB5vUES3sSRXYCZsxpdo4TXolUF68YxwljAJ
X-Gm-Message-State: AOJu0YyF0m6ek1Xb1h4e/eORd6lVbVPLos0HhPzafOQajBD2HDatBHBs
	wg5nw5+I1rpzgk4NhV1Iwu36S5DL5yz/cF9fMFHifHUDUYOkqbmTQsqgMDA+0ms=
X-Google-Smtp-Source: AGHT+IFvXyauqU6yE1hhXxe+82hSR7xjimh79oxs60By+238847k+6MrB7Ys5sLNSFw6IjHtaU72FA==
X-Received: by 2002:a05:600c:5252:b0:416:643c:8946 with SMTP id fc18-20020a05600c525200b00416643c8946mr1274626wmb.17.1712741353432;
        Wed, 10 Apr 2024 02:29:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b004168efc77d1sm1698186wmq.39.2024.04.10.02.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 02:29:13 -0700 (PDT)
Message-ID: <9ecf2158-10d1-47b3-a02f-54a4cddbf426@baylibre.com>
Date: Wed, 10 Apr 2024 11:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add
 audio afe document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-1-16bb2c974c55@baylibre.com>
 <e0b48da7-b33c-45e4-b3f3-a6d71bb0afe2@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e0b48da7-b33c-45e4-b3f3-a6d71bb0afe2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_022915_813724_5E0E30C6 
X-CRM114-Status: GOOD (  16.19  )
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



On 09/04/2024 17:46, Krzysztof Kozlowski wrote:
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        afe@11220000 {
> Did you implement the comment or decided to keep afe?
> 

Though it was clear according to [1]:
"
Audio Front End, this is the same name used for other MTK SoC, to be
consistent.

Cook a new patch serie to change "afe" by "audio-controller" for all MTK
SoC would be great.
"

I want to keep it and fix it later with ALL other MTK SoC.
You didn't answer after that, I though it was ok for you...
So if you don't agree with that, just tell me to change it instead of 
let me think I've the choice.


> BTW, whatever "consistency" you have in mind, it does not really matter
> that much for that example. And for sure do not add incorrect code
> intentionally just to fix it in next patch.

I don't get your point.
What do you mean by "do not add incorrect code intentionally" please ???


My PoV: I implement my bindings aligned to ALL other MTK SoC, which have 
been validated by you in the past. I can understand the copied code is 
wrong, but I've suggested a solution and you didn't NACK it.

I fell like you bully me. Are you ok to stop insinuating bad things 
please and tell me directly if a fix is mandatory and if you are waiting 
for a specific one, tell me directly to avoid this kind of unpleasant 
talk and waste of time, I know maintainers are busy persons.

Beside that, thanks for your reviews.

[1]: 
https://lore.kernel.org/all/eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com/

-- 
Regards,
Alexandre

