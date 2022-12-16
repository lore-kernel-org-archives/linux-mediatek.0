Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3964C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srPGSkjRgSgmuXTtwPpYk9AtNMtiqHmM6C2t7J2QNjs=; b=P+cmAlWgx4tAdeJ88GCyYj7E2u
	CvIp3Z8eq47C8Xhlt6E4otbYHRPqrbNFslMSjys8DkKgzAZjCCZ49/XY7Wq2AiGzS4lvTTJ5rcKpp
	nYTbqlF34gXbVQ5cubzdlKL5mvV36ycxJiKPm2kXxTHSgj9BGgAYRgbGyh/zJ4Ury1yNil/+tkNDb
	J96ANTEdtYH3KDT1xS6lkOR+86taaFUlcvfMXkKv3c6twcajm8k1dDdS0NTFwN9vdtfCVgmwmNc7k
	dZzGtsru+MmfdetRYCPTrNvc26JpQQnXn5l7Psyvg8rhyAhft5l8jcMhFWiVItKkMPh+d863iyrS3
	PBsblaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AWf-00FDFF-Jh; Fri, 16 Dec 2022 13:13:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AWU-00FDC6-Dm; Fri, 16 Dec 2022 13:13:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so4131816wmh.0;
        Fri, 16 Dec 2022 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srPGSkjRgSgmuXTtwPpYk9AtNMtiqHmM6C2t7J2QNjs=;
        b=hsmZvLSHOY4Gmce5AuAjDP3CdbZyUN4ZcCWXfe6Hu2zgyTtoHXBJ1/4Rp3W7Fb/WhW
         R9QXsemVceSXujcfo3j5g8hAnuVStoYy2POpEeT3+h+kHPbQ7VP/4EUbz2fTEt4tUSl/
         YPA+15MEQp3XTD70m0uR595fUFu3RZtNlJWzvSsRTENBb4EdSMJcpUQiuGGBMv+4GdeI
         c+NaRIKyDu5xmZbLEC/JEFNyAoW66JQYKKNjyGtMg/l1GylqLmBHdYuim/0IzPoG2CuP
         t2+khJ1TukQ0dPHTUUGkxp1G8hV+KKoLttkOxnKe93y8lFk70e7O9NFYKrXVa3wKgQXg
         9LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srPGSkjRgSgmuXTtwPpYk9AtNMtiqHmM6C2t7J2QNjs=;
        b=Mq/CjVL9DxMOg6cM7mQTTXEPzEQzLtFek36DCcAFbSeylmfvXeXcAG8bVMdXVL4yTI
         uarwi9wUVm+nm7G0S3vxB6xrLU8Dj2ZMqfbJoNY0yOI7qpVeeGmonrPBpaFanE85F8RC
         O7k3/hGbsFzchcJtsWyYJDbRXrT2LJHgDpBfCt4NpN3oIZauFWt00p/DzlHQFkSRMC+9
         TQCmdPIwgEcwBxeg7rHV7d0R6IS+s0Zy3tyemBxW2qbT6D09jhXIjOaAGq3iE6RSucV+
         B4RrjZQm/pDmXo0QZ+fhC0l4b75pecd8kfpMjS56RchvIIipIHWgznjYZoxv60rf/3co
         N3QQ==
X-Gm-Message-State: ANoB5pns1nupY63IUZs9/YKzZ5FFgRe5gkEbSEd1ZvenhRr6cZe2v4va
	l1VX8uH2Ch0lbXtUF0KrrQpno4xXbJJa8Q==
X-Google-Smtp-Source: AA0mqf4VYPUaZ8JmceOcI/t0ITzDEnO81loaT+P0eo4prEQVB/kIi7P+5EVL3AGS9kVVZ4ZjwXVKwA==
X-Received: by 2002:a05:600c:2286:b0:3cf:68f8:790b with SMTP id 6-20020a05600c228600b003cf68f8790bmr25238681wmf.11.1671196386532;
        Fri, 16 Dec 2022 05:13:06 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p16-20020a1c5450000000b003d07de1698asm9567660wmi.46.2022.12.16.05.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:13:05 -0800 (PST)
Message-ID: <5412b27a-b5a1-351a-495d-3ba7e022302a@gmail.com>
Date: Fri, 16 Dec 2022 14:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/5] MT8192 Asurada devicetree - Part 2
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221102190611.283546-1-nfraprado@collabora.com>
 <CAGXv+5GY5f4UWR982cY0vzUuk7aB4BSa_FcKtku1ELatMr4Dwg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5GY5f4UWR982cY0vzUuk7aB4BSa_FcKtku1ELatMr4Dwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_051310_490529_EEE0EC80 
X-CRM114-Status: GOOD (  15.28  )
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



On 30/11/2022 04:11, Chen-Yu Tsai wrote:
> On Thu, Nov 3, 2022 at 3:06 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>>
>> This series improves some more the support for MT8192 Asurada-based
>> Chromebooks, by enabling some missing functionality, namely the internal
>> display and audio.
>>
>> In addition to that, aliases are also added for the i2c and mmc nodes,
>> which should've been done while adding the devices in the previous
>> series.
>>
>> Some notable components that are still missing support are:
>> - external display/HDMI audio (waiting for [1])
>> - GPU (waiting for [2])
>>
>> As part of testing the audio, an UCM file was used, which has already
>> been submitted upstream [3].
>>
>> This series depends on some missing dt-binding properties on rt5682,
>> which are added by another series [4].
> 
> Hi Matthias,
> 
> This series has been floating around for some time now, and has been fully
> tested by multiple parties. The rt5682 dt-binding changes have also been
> merged.
> 
> Could you queue it up?
> 

Applied now. Sorry for the delay!

Matthias

