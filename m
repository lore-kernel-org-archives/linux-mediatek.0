Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8714C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIhhSNSnUwxjgTPYFm7S/0hwWM40o8GyyO97/j15IFg=; b=d13oiO1EbXz3t96RPfHb8kniKX
	kufp5kRjy0X7KX5B2J0u97uJrGLyoz2baLNFyKEnb763kAslEcJ8zNesi1poamFCE+6t7Oo5PBw61
	STACF9MuHgZAXS6DdrJFjFbX/8GULtmO7yWu7Dynhdx+4FiRQyYFnmz7INhE7Dd7ILQKfz4OiRXVK
	Av4ukD4ej8JUJnnLfnZMmvKjt5USTBrj7GTdTz4XDKzogXhkJWARcILC2FRrmdyP9pOzj7fgW3Ara
	no6mc790TTJg7mMWKB7/vo4qLPY+8EAJr/8Kwvp7UnGvCHX+nxHdyxsn3UsUQy/OBSMz4HWKTfmlu
	A3yIsneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawuV-00ApAb-QW; Wed, 21 Sep 2022 10:24:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawuB-00Ap87-CQ; Wed, 21 Sep 2022 10:24:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id lh5so12498704ejb.10;
        Wed, 21 Sep 2022 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date;
        bh=eIhhSNSnUwxjgTPYFm7S/0hwWM40o8GyyO97/j15IFg=;
        b=G9WT/UQGubvNFxWnL/o0yleoSM08Bw5rZ4oh9Cq8Ws4o55wR8QFPHLGZ4OBwtduVI0
         XuHnrt1+SQYDZldS/SUXodcrWAV8VoFl0Ls3Fyyw9e1IYCRgEcgJnXRKQgddXfzHo+uD
         XHP46DejS8sOitBMxgt0bOF/fuYRJvPtdkT8C+lFeka4OzXVamcrsXCwHlhVdrpXcZdo
         xlP6cWNEfYGat8SUOKeJmZri5hDkfNZr3Z1yICMNHkBwQeC5lE3M1ST84thcZg9sdPVl
         CYRoerTu4l7icXsMiZ5wKUznCNpk6TeFnmzMSDUAP+eFeNmNhrP2Y4eMnBsKy97cWQ3U
         q1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=eIhhSNSnUwxjgTPYFm7S/0hwWM40o8GyyO97/j15IFg=;
        b=hOUvm8XahIAfNxy6g+b8GDWMOgaB72R5/SrDArMcTLGUUO92h9h1lnBpWHO4O5N7Je
         4Q4EaWm/hVOlluj6M7PPFBJTJzdBaOtbTUXEAtXhPdRldAlgvy5NG6B7EEtsy5k1DaZC
         gaxHSAhaCCsrHZy/HL9d6VSYd/8HaGqkpi2DUpob6o2vIAMzC+b7zi9Y5plBVOFzRH4X
         F3GaG1uLrYypo0K/PADRiJcbscUPKQMIBAHtSbZJNb9IW7of3tnaXvCHhea1iOJdidju
         DKJ6y6YMmUaK7ibEZHRGxcj/Y8biz/LNsAgfB+8NoapNp0hNi1NMiMrFE7H03o11IT8b
         rTNg==
X-Gm-Message-State: ACrzQf11pcdCZEPlIpgtnUN6V7LI+DF5HUMIYpyB0vmuv6c4ueW8vfPY
	RMhCkn4nuIkIujKJS70f3XA=
X-Google-Smtp-Source: AMsMyM4/tQ/3iyKx28lNFLOxL9B4PbS2w3ASNsuN7lnWPKZ9DR/VYhQRB6uyEMozzstJbV/bbVLkzA==
X-Received: by 2002:a17:906:6a0b:b0:77d:2f20:69db with SMTP id qw11-20020a1709066a0b00b0077d2f2069dbmr19074694ejc.572.1663755872843;
        Wed, 21 Sep 2022 03:24:32 -0700 (PDT)
Received: from [10.34.6.160] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id fc24-20020a1709073a5800b0077b523d309asm1070024ejc.185.2022.09.21.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 03:24:32 -0700 (PDT)
Date: Wed, 21 Sep 2022 13:24:17 +0300
From: yassine.oudjana@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-Id: <H82KIR.LT5P242T2PJ72@gmail.com>
In-Reply-To: <0c2ef56e-5dab-fb79-fead-adb4acef4cc6@collabora.com>
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
	<20220919170115.94873-2-y.oudjana@protonmail.com>
	<4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
	<1860b0ff-5544-5e74-ccfc-beda18824927@linaro.org>
	<YQZJIR.QQOJU0071T1J1@gmail.com>
	<0c2ef56e-5dab-fb79-fead-adb4acef4cc6@collabora.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_032437_030587_E23928A8 
X-CRM114-Status: GOOD (  20.86  )
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



On Wed, Sep 21 2022 at 11:45:41 AM +0200, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 21/09/22 11:30, yassine.oudjana@gmail.com ha scritto:
>> 
>> 
>> On Wed, Sep 21 2022 at 09:11:12 AM +0200, Krzysztof Kozlowski 
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 20/09/2022 10:06, AngeloGioacchino Del Regno wrote:
>>>>  Il 19/09/22 19:01, Yassine Oudjana ha scritto:
>>>>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>> 
>>>>>  Documents for MT6779, MT6795 and MT6797 that currently exist 
>>>>> share
>>>>>  most properties, and each one has slightly differently worded
>>>>>  descriptions for those properties. Combine all three documents 
>>>>> into
>>>>>  one common document for all MT67xx SoC pin controllers, picking 
>>>>> a few
>>>>>  parts from each and accounting for differences such as items in 
>>>>> reg
>>>>>  and reg-names properties. Also document the MT6765 pin controller
>>>>>  which currently has a driver but no DT binding documentation. It 
>>>>> should
>>>>>  be possible to also include bindings for MT8183 and MT8188, but 
>>>>> these
>>>>>  have some additional properties that might complicate things a 
>>>>> bit,
>>>>>  so they are left alone for now.
>>>>> 
>>>>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>>  ---
>>>>>    .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 207 
>>>>> ------------------
>>>>>    .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 
>>>>> ---------------
>>>>>    ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} | 181 
>>>>> +++++++++++----
>>>> 
>>>>  Hello Yassine,
>>>>  nice cleanup over here!
>>>> 
>>>>  There's a catch though: as far as I know, wildcards are not 
>>>> permitted... so you
>>>>  should, at this point, merge all of these in 
>>>> mediatek,mt6779-pinctrl.yaml instead.
>>>> 
>>>>  Before jumping to that, though... Krzysztof, can you please 
>>>> confirm (or deny)?
>>> 
>>> Wildcards are not allowed in compatibles. In filename wildcards or
>>> family name could work if they are really going to match the 
>>> devices. I
>>> have doubts here. 67xx is quite a lot of different devices, so I am 
>>> not
>>> sure this will cover them all.
>>> 
>>> I would prefer one name (oldest SoC or lowest number).
>> 
>> Lowest number (and probably oldest too but not sure since mediatek 
>> naming conventions are a bit weird) currently documented is mt6779, 
>> but mt6765 gets documented in this patch and mt6735 (this one I 
>> know for sure is older than the rest) in a following patch, so do I 
>> just stick with mt6779 or do I change it in the following patches 
>> documenting mt6765 and mt6735?
>> 
> 
> I see the sequence as:
> 
> 1. You merge mediatek,mt6797-pinctrl.yaml into 
> mediatek,mt6779-pinctrl.yaml; then

And mediatek,pinctrl-mt6795 gets merged here too I assume?

> 2. Adding MT6765 documentation to mediatek,mt6779-pinctrl.yaml; then
> 3. Adding support for MT6735, documentation goes again to 
> 6779-pinctrl.
> 
> This means that you're working with mediatek,mt6779-pinctrl.yaml :-)
> 
> P.S.: That was also a suggestion about how to split things per-commit!
> 
> Cheers,
> Angelo
> 
>> Thanks,
>> Yassine
>> 
>>> 
>>> Best regards,
>>> Krzysztof
>> 
>> 
> 



