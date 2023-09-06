Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAABEB8FAF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrCIcjF1rY1mMD/Gu+r4tbPGrpOuOBfXe5P30B5qf1Q=; b=mv24QODM14JAngWZiT7fASeX13
	uNQ7PZMthhwHe0kYTEADWKX/zVrll2wzf3zyVm/FAHuIK+C+dsNbjgipqX9FIYNdaE4yNHeAI5+oV
	rqIaMpQZjxiogk0NmMFGUS7ldxT/DH/97cVVnAxumq0Ta3QvTM+pBUA8/xcDGRQPgG1cCalN1TUr2
	rrLXw/A9TfzbIjN8ll3Hcbixyctlk2Zi8HYhxyU5VS04sKuYYQONAiWoLLo9Xnf/iGiPlom8kpHRi
	DPaKuIwppRmMh8CbiqzUGTAzTmWgky/GEMj5CGyLhIUPwlU+pyh5QBn6EfuVuS5Csb3CG7FghzXz4
	2wrbtdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqHE-008PeU-0z;
	Wed, 06 Sep 2023 11:00:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoDA-007nJS-1c
	for linux-mediatek@bombadil.infradead.org;
	Wed, 06 Sep 2023 08:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RrCIcjF1rY1mMD/Gu+r4tbPGrpOuOBfXe5P30B5qf1Q=; b=aNIcnJfoJLIZari4eFXnCQJVYX
	+r+qdoLhPBFZDtR2AY4wrvRcWizLJPLG8CRysCA1vgYH32woMABnn9A4TxB/KT8SjlYMuckZFFOeJ
	gm/fvdal4vvgydvyJFjq/kSne4ULj65KTtGzBNIq/53TrFASn10p7Sy4fTTsAlQmuBYz56euvwJ3/
	YkRgd6uw1y9vFJ5R55saw2mVs5+2bQAdJJpeBTwACm+orbfIQyX8+lAj3aO1qr7gpfO13fPmINCVr
	m87sidZGP6wRGOhKDQ4ggPkbiQZspOA8lYn6+b1f+NJHm0wcxOOpeK47th+HHWR8w2FbkuXvOvEy7
	pc9968vg==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoD3-000zYq-2E
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 08:48:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99de884ad25so524917866b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693990105; x=1694594905; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrCIcjF1rY1mMD/Gu+r4tbPGrpOuOBfXe5P30B5qf1Q=;
        b=qH89XQ3MLpMnWlWtoKHEYHOCgMhkj8gvP3V2qQbV/eLnTLALulCB8TyqgsYCChOHmK
         HsIgFNoa/VSRVQXEka+CcoSvOE0JgDyT0vEbS45+YaCsGMIfx30eML6ZY24BLDGTFVpB
         DkhyfHelG3dDuQZp8AaNOigTBl5tMcsEzQ6qtB2Djc3Pbs5XjNiRgFV6C8ExhWRjOKgg
         agrEkKimrr8JGNdvUGlGQU8HoA+1mBwHpyaKiWJWTlqhU5w00rZzdzR1vHE9qOffX7NT
         uCfb3qcZ3gTg+aicMB6604c8Px5w9nTUfLp9XNU8cvh201+//20f4xmykM4mSyQqHyru
         Q+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990105; x=1694594905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrCIcjF1rY1mMD/Gu+r4tbPGrpOuOBfXe5P30B5qf1Q=;
        b=ah9Em0CAoQqAE9nXB0BmTVo+p+Fbw0jMdtZldJH3BOPxhImEaBbKgbI/H44x+o88DE
         GYZJFx6Ef8dsf8zNV2xKdh1hx0T/JNNs84wcPFhr7ZLD4PSGVnAJ2YJVSf3IWd4J89te
         ycZ3suBHfdrLqcy1rSuMnajJHcR4PgEqmpxWK9+ZMfEyUm1ZfDp2Rj44wm4yLxplEuAa
         ClD27rr8ozAFiiAu2rpVQGeEUB0BHe4iLzE1yfyyZ0OcPAfQ1B2B2yZLd5lGxsNYJ9uY
         JD5kro4aQZveegl1sIMBE8OS/Eac4vxzeHSv+d0ehw15TTyrZKAHxBF99Fq1nZ4diy1Y
         dTWA==
X-Gm-Message-State: AOJu0Yw9Z/+ACr4sxst4xrFByXmpxvvZCS2e5T+aNWXSwcv1TtkMZTu+
	FgQdVDD+TGbnFLDTLmpI2Q8TFQ==
X-Google-Smtp-Source: AGHT+IH8UP4xS9z1tEun/6EHP9/nk72OwvNjGqpg0zwCljUObKiMg7WpCrPYbEl9OzalF7MYJfPYtA==
X-Received: by 2002:a17:906:cc4e:b0:9a2:292d:ea63 with SMTP id mm14-20020a170906cc4e00b009a2292dea63mr1570271ejb.37.1693990105263;
        Wed, 06 Sep 2023 01:48:25 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id ov22-20020a170906fc1600b00992c92af6f4sm8841374ejb.144.2023.09.06.01.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:48:24 -0700 (PDT)
Message-ID: <a3ed9856-a87b-5cf6-26b5-ff2b19234a8a@linaro.org>
Date: Wed, 6 Sep 2023 10:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
 <502fc7b1-a32d-6901-3a45-d2aa0e0c3849@linaro.org>
 <20230906083237.GL7971@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906083237.GL7971@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_094827_965345_B997BCC8 
X-CRM114-Status: GOOD (  26.90  )
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

On 06/09/2023 10:32, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Wed, Sep 06, 2023 at 09:27:07AM +0200, Krzysztof Kozlowski wrote:
>> On 06/09/2023 01:31, Paul Elder wrote:
>>> Add overlays for the Pumpkin i350 to support THP7312 cameras.
>>>
>>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/Makefile         |  4 +
>>>  .../mt8365-pumpkin-common-thp7312.dtsi        | 23 ++++++
>>>  .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>>>  .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>>>  4 files changed, 173 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
>>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>> index 20570bc40de8..ceaf24105001 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -56,4 +56,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>>>  
>>> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi0-thp7312-imx258.dtbo
>>> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi1-thp7312-imx258.dtbo
>>>  mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
>>> +
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mtk-mt8365-pumpkin.dtb
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
>>> new file mode 100644
>>> index 000000000000..478697552617
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
>>> @@ -0,0 +1,23 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2023 Ideas on Board
>>> + * Author: Paul Elder <paul.elder@ideasonboard.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +&{/} {
>>> +	vsys_v4p2: regulator@0 {
>>
>> Hm? Is this a bus?
> 
> There are multiple instances of "numbered" regulators in upstream DT
> files, for instance arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi

That's the only example I saw... I fixed it now.

> has a regulator@0. There are similar instances for clocks.
> 
> I understand why it may not be a good idea, and how the root node is
> indeed not a bus. In some cases, those regulators and clocks are grouped
> in a regulators or clocks node that has a "simple-bus" compatible. I'm
> not sure if that's a good idea, but at least it should validate.
> 
> What's the best practice for discrete board-level clocks and regulators
> in overlays ? How do we ensure that their node name will not conflict
> with the board to which the overlay is attached ?

Top-level nodes (so under /) do not have unit addresses. If they have -
it's an error, because it is not a bus. Also, unit address requires reg.
No reg? No unit address. DTC reports this as warnings as well.


>>> +		orientation = <0>;
>>> +		rotation = <0>;
>>> +
>>> +		thine,rx,data-lanes = <4 1 3 2>;
>>
>> NAK for this property.
> 
> Please explain why. You commented very briefly in the bindings review,
> and it wasn't clear to me if you were happy or not with the property,
> and if not, why.

Because it is duplicating endpoint. At least from the description.


Best regards,
Krzysztof


