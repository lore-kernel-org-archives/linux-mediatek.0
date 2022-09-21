Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB09C6FA90
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiXy5ZIaldVPRdkC0O1dXknFlmQtPsl+IQZh9q4Cgmo=; b=vfLo1ei4tGVgaU788a+S/7Fcfi
	k5hlNKKjNzK19Qufpc3fFOjn8Mh8dAFzjYvwuGP0orEqriaNVYXIjZuqV1+MES5JNc5ho2H/tsKLz
	r+v+v23URzKBAgfX9d9m7jl/siPq7zTN6erQeLxRNKve+2CGTkQKJGhJ4XXBNU560sHy5EHctKpV4
	V3t6Vlw4xJ/iP80/al6ToNusxBqTF73CfsXAKbyPmTRbqAFbaB6iYSQ2L6OkspsJJnzBPmkCy16Kp
	WNiummWxjPqrxts6pmEkBOld2y6Kq03qYWHDISV29x7ty8G1G21ogq+mFAd8t99ctHdKpxme3RlUW
	c6/Y0opA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oattQ-009U40-0j; Wed, 21 Sep 2022 07:11:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oatt6-009Tu7-54
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 07:11:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id u18so7677169lfo.8
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wiXy5ZIaldVPRdkC0O1dXknFlmQtPsl+IQZh9q4Cgmo=;
        b=BNWeozDy1dKboNi6UK9bXjuRFkSY55U3BDN4+3Qq9dKjQPYnJxKQzyMV9NS9gbfT0Z
         7hjI0sUzfTo8iAhQ/mvIcUwuPsG5nfoDQ3bJXuUH7zUymrDAwlo3qF25z5yxuhnpkfQv
         sz+JtUst9JhzKCNnpVaKaVZulJT8eVGh7IRKbJHjv2TZYOq7vK8lokKDyLFcDduKwBG5
         gwznPs7AshqOMlIcUut0mCwUxZ+91gDbwVCrxaPq1JK6XH+zwfxhjXfXEO5HnoPbk73X
         gc+ouQVeSVZ22tggHhOAtQqHHfxbsrp0m0ch5KqGK4RvqfvlZbFaSI4sv7nFlwKv2HuI
         3SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wiXy5ZIaldVPRdkC0O1dXknFlmQtPsl+IQZh9q4Cgmo=;
        b=1u1o5jllTk6KVUh3xxut1iajK56vTvMROZgyUiNN8K0BDfkCzsITOC5x2HwLWqeF/u
         T1Ou3nDqaTMyTt3Jm8fjgUIdajyEK9lszfamoF+F6VqEqkB5Kx3zKgGMxg3b9hSdiDth
         tBGE9JH257CIDjESrMcMroou4Xj+0gGkkVeELr0PAQyTYRmHZRsgli0g0j7Sc+9L9k8Y
         ZU286qXXsY3HLUiom/pu8xW/9bYz0s/MdAkLTyel8EBJkpUmJptgWV8nGugGzLLBVL1n
         k6Mi8zl1BJ23hkFaJ3F4kBBieynL6+w3Ni7kcV4zjqvjmIA5WNi+0sPqWMEc34Zh3Zbf
         XmWw==
X-Gm-Message-State: ACrzQf1//f7Hy08oj56hD/whG4vFeIgLHcBWJ1GoBtbRUKLDdhdvCeFN
	PDvOtqawaOWFWt63WmNtKfmWIA==
X-Google-Smtp-Source: AMsMyM6S3qg1XzFgFQZ4Arx5bMNo57o7Uhkt5ibKjTwMAKsPl7xPucNJNMl7abyEQ7e0sR6YFidK7w==
X-Received: by 2002:a05:6512:20d2:b0:497:a29f:cada with SMTP id u18-20020a05651220d200b00497a29fcadamr9075345lfr.45.1663744274292;
        Wed, 21 Sep 2022 00:11:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651c119000b0026c18aa8587sm309565ljo.75.2022.09.21.00.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:11:13 -0700 (PDT)
Message-ID: <1860b0ff-5544-5e74-ccfc-beda18824927@linaro.org>
Date: Wed, 21 Sep 2022 09:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
 <20220919170115.94873-2-y.oudjana@protonmail.com>
 <4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_001116_241412_7BD3C7E4 
X-CRM114-Status: GOOD (  14.54  )
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

On 20/09/2022 10:06, AngeloGioacchino Del Regno wrote:
> Il 19/09/22 19:01, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Documents for MT6779, MT6795 and MT6797 that currently exist share
>> most properties, and each one has slightly differently worded
>> descriptions for those properties. Combine all three documents into
>> one common document for all MT67xx SoC pin controllers, picking a few
>> parts from each and accounting for differences such as items in reg
>> and reg-names properties. Also document the MT6765 pin controller
>> which currently has a driver but no DT binding documentation. It should
>> be possible to also include bindings for MT8183 and MT8188, but these
>> have some additional properties that might complicate things a bit,
>> so they are left alone for now.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 207 ------------------
>>   .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 ---------------
>>   ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} | 181 +++++++++++----
> 
> Hello Yassine,
> nice cleanup over here!
> 
> There's a catch though: as far as I know, wildcards are not permitted... so you
> should, at this point, merge all of these in mediatek,mt6779-pinctrl.yaml instead.
> 
> Before jumping to that, though... Krzysztof, can you please confirm (or deny)?

Wildcards are not allowed in compatibles. In filename wildcards or
family name could work if they are really going to match the devices. I
have doubts here. 67xx is quite a lot of different devices, so I am not
sure this will cover them all.

I would prefer one name (oldest SoC or lowest number).

Best regards,
Krzysztof

