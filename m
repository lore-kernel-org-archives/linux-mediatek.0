Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06466C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciTtYKEbBr+vQK3oiFVI2dnU7hwIdnBzRqy3mCB0PTM=; b=09bDkINWOQUctMfo1On5aGLqBU
	vUZ+kV3ys38u2IwU6MBUvpUuslM20Ovyp1Q+nrF8QiD1gYd7gbT2X4AtqvW6X85hb4BcJs5wHKebk
	fmH8w7pU1eVRYbXA7O8I6bkGXojNisCIoFZPBfBz6e02sozlwr3Td04CPw0ihZV4aDNk5B0UbYZtn
	TBRi4lKAn2lNmfIk2S4FMXQ5NtCV0wU6UTW7JQEL6UnHeYj4t2dl5+TTprlzWNeG71bkBzjmaxAZA
	gcHJhl3sONTLXOU5GicpGh3Hf5SegvSar+Tg8K7NDb7TmCgH5GjBqSpkRPp/YPsBLEyrx0M7f6Qyb
	rHuKUJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFM8-00000003a9I-3s4r;
	Wed, 29 May 2024 09:12:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFM4-00000003a8M-2c5d
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 09:12:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-354f51ac110so1823465f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 02:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716973936; x=1717578736; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ciTtYKEbBr+vQK3oiFVI2dnU7hwIdnBzRqy3mCB0PTM=;
        b=hHlbpwFDqQelx0FLWl67WgLXkmzH+FhPrF0ubKCeM7MSHvmC7Mzk9DSTj5B2xmbZyo
         7aQit0qnbLY9r6G5qBrkkOXWU9ImyUowWbR4VYJ4Em1KMWHVPwD/Tp+0B5j0YgwWXZvA
         0K/ra+92uScWA0000NvX8PaX64mUt0TsaRg9gQjn2NbS/4YAoN+rp+cu4YGy8y3nnPPG
         1eXTrx7G/DkSAt+6Lxu2ctSvn7TYVwDnm0ae9kSclckTD0fdiqc20w60JQ1pM6fvwhsD
         uFponIPmR9+PTzZTrzaP6vEv1dyBK5D6+dguKtpmxvo9lr3SVfAZFvIanIWVffzL6ayR
         Ex8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973936; x=1717578736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciTtYKEbBr+vQK3oiFVI2dnU7hwIdnBzRqy3mCB0PTM=;
        b=Yq/PomIl0FcwSO0m6fXftZrz8dMR3Ht9PT8d9I8QH0pFhNzwNyBKyyfMgwMnCUjp9B
         Z+/ezxTFSAnCA0Is/dsHPk3Lg3HdfUwHmEIn6bp74eTV/YGn3u8Whzjvsa14AEL3EY02
         C2lAeiibXEjM05oeIuOJ/L5pn3F2hpvsPeaCLhsCB+g7xkhcZpkgrm5/AEMTbHygh5LK
         WKi9s7MtJfpWSSmXDpK0FnRqkYtHZFIem4pQ+/aLMUqohTX8TFobW14GWJdr9V67bJ9W
         hyPb1l4auGTNES/ZDrv4LWxlAAy0Rg0+sII4k/9W8fOxQHVGKED0l27w08RC4vI5barK
         2OtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWucjOlUs/3NSIHlzjMKP+q0QY/S+PpMqnNfpaiMXesRN66acWPMQQ90faORL9+y1FbdEpLrfiz46PamueRa7yRw6PatXjGWwoTlhlcGdjInhkK
X-Gm-Message-State: AOJu0Yy+EKkPbJs92bMyAMI8NjcBnd0OT0lUk2VBvIkpS9s5VZZqUWwu
	mWMjpd4Vi2eCCcNnHJS0jEKorNv8TQvmJ0tgnDwfTNqf90Gbx0Xc+5f5GOY4jmo=
X-Google-Smtp-Source: AGHT+IGzTz+2XrrYGSweYUU8ur8Euj8k3ViZtqjUVGNlAHrRa8447ANMpaIZTurk5qHKqtB4e2nxWA==
X-Received: by 2002:adf:ee0e:0:b0:354:e729:c101 with SMTP id ffacd0b85a97d-35527056972mr12104266f8f.12.1716973936132;
        Wed, 29 May 2024 02:12:16 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c92f8sm14111197f8f.67.2024.05.29.02.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 02:12:15 -0700 (PDT)
Message-ID: <808db317-4cee-426b-a840-013a5e03098d@baylibre.com>
Date: Wed, 29 May 2024 11:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal
 zones
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
 <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
 <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_021220_706801_62F7C1C0 
X-CRM114-Status: GOOD (  15.41  )
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

On 5/29/24 10:33, Chen-Yu Tsai wrote:
> On Wed, May 29, 2024 at 4:17 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 29/05/24 07:57, Julien Panis ha scritto:
>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>
>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>> driver version.
>>>
>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> I'm getting some crazy readings which would cause the machine to
> immediately shutdown during boot. Anyone else see this? Or maybe
> my device has bad calibration data?
>
> gpu_thermal-virtual-0
> Adapter: Virtual device
> temp1:       +229.7 C
>
> nna_thermal-virtual-0
> Adapter: Virtual device
> temp1:       +229.7 C
>
> cpu_big0_thermal-virtual-0
> Adapter: Virtual device
> temp1:         -7.2 C
>
> cpu_little2_thermal-virtual-0
> Adapter: Virtual device
> temp1:       +157.2 C
>
> cpu_little0_thermal-virtual-0
> Adapter: Virtual device
> temp1:       -277.1 C
>
> adsp_thermal-virtual-0
> Adapter: Virtual device
> temp1:       +229.7 C
>
> cpu_big1_thermal-virtual-0
> Adapter: Virtual device
> temp1:       +229.7 C
>
> cam_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +45.4 C
>
> cpu_little1_thermal-virtual-0
> Adapter: Virtual device
> temp1:       -241.8 C

It's likely that your device has bad calibration data indeed. We observed the same
behavior on the mt8186 device we used (a Corsola) and finally realized that the
golden temperature was 0 (device not properly calibrated).

To make a comparison, we run chromiumos v5.15 and dmesg output was:
'This sample is not calibrated, fake !!'
Additional debugging revealed that the golden temp was actually 0. As a result,
chromiumos v5.15 does not use the calibration data. It uses some default values
instead. That's why you can observe good temperatures with chromiumos v5.15
even with a device that is not calibrated.

This feature is not implemented in the driver upstream, so you need a device
properly calibrated to get good temperatures with it. When we forced this
driver using the default values used by chromiumos v5.15 instead of real calib
data (temporarily, just for testing), the temperatures were good.

Please make sure your device is properly calibrated: 0 < golden temp < 62.

Julien


