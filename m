Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C412C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLH/IXuPg0l6lkaXAjXGnQ2OZNNpcz8xiQ2cHYot5yU=; b=cnNPQTHc+82V9y
	s5v7mQUtcVUtXnnIQwrNBA8Of7o7GQbkvhdmJBPrWix1UmvYPNj43fNdaRNxqPjs8bz96Pm7+KjKb
	64vzmN4arc5Wxait/rUIBsXvznAzYBg4GuSgTJL8wC0uAraR5bmQeADrUe+GEILl1tbi2+23B4Nl5
	LElgVCJrUg25QAT+ux59vX+xF3jFFP+cSkHzXVp/7clyFwcUV1DLf5L6a6+8TQNmK9Y4t3kvnjLS+
	OM5HP0Tg2EsSynP8iDG+IZPdL0dOTCOOfY72eoI4mZJMlGsjjRfeJjbNMK1OMMgEer53fQwAbFVSn
	slBSe36w/dDXCljMgv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMCa-00FVtl-MO; Wed, 01 Jun 2022 11:07:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMBz-00FVaI-5x
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 11:07:14 +0000
Received: by mail-ed1-x52c.google.com with SMTP id er5so1636025edb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3osu7T3SV7pLFUm34eKitCGA5jgF7P0j4WJfxVS//Uo=;
        b=AVUhoQ/nFg8dyZ1q3x13KvZ7Drov/nf3LspoCrgYZT3+wsWj4NhiBCgxvM+7cOQ+J1
         SxX1OJbc/G/ncfQ1XBk4pYEJg8rN3J3vbvwUwov1+K+fP9klozW02WZ3tm7rdGURvd4B
         /g7c9mnF9FnQnPlz2rZ3gCYow/cKkxqZDvdhiq0zE1ViTzRZpAZGKhKUe6VhyvnAddO1
         CDZTfVB/2lh7WCBefCxQCGkl9pqev47arP5T4PlOar6ziMhbWm5EZXvPbsZCagz6H9fC
         FkURlKiX0Mr+kQne2/2TrweCIE7UaHyupWshlLfrbfiWpvgiXBjufGBMEf/gjeN5LDrP
         /86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3osu7T3SV7pLFUm34eKitCGA5jgF7P0j4WJfxVS//Uo=;
        b=iGEMUA3jv9Gr1yDW4LUN/Dl3CG2pf1JX4LR1tGdbzrMtiCot1vN8uxH1EFMLORzobD
         09bwJyXAsH5AoonMZ8PjrFepckeXh+Z1/K4Hv7l1MttT7UELeSBFtJiiFZA5cStUOmFL
         w1bJnWnfr8TLPMkcVlyrWJaVhXLbJKrGy+XEHNduexwUPM+3Y0qyWmvRcGtP5Hoqimhr
         IDFmfu9oWJONJi0kNcgl0MwJ1FpIa5tW/hLnsVMt7mnzEhdLxhorMu6voMHq8OyOjbgf
         DOIoHj3iZWxtatqbCpDulfALgBI42EQbmrFEL+0Q5sUT1D+L7l1YESBtf8rR46jkKUHV
         9JjA==
X-Gm-Message-State: AOAM5316HAVrzDqfWncp38vlUJIYfRz/7TKI4rYp3av3VhzQt8F5Tplm
	wiieH46xA+uZJHlqv2bfOZWpIA==
X-Google-Smtp-Source: ABdhPJzAj7OvNiQyM6nzDZUNqO/TAz1xsLnJbXtxMAkHg9+6yBHRkNb3jPVTDzszOc5c+1S5fxE8Vw==
X-Received: by 2002:a05:6402:3594:b0:42b:65dd:489 with SMTP id y20-20020a056402359400b0042b65dd0489mr52339189edc.222.1654081628855;
        Wed, 01 Jun 2022 04:07:08 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ay25-20020a056402203900b0042cf43e1937sm806712edb.75.2022.06.01.04.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:07:08 -0700 (PDT)
Message-ID: <c2f2a3a2-ea5d-59a7-eb84-d59b7d9bff47@linaro.org>
Date: Wed, 1 Jun 2022 13:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD
 integration
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <fab40b87-7471-83a3-d154-aa2da0b7d23f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fab40b87-7471-83a3-d154-aa2da0b7d23f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040711_319261_4ACC5831 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/06/2022 13:03, AngeloGioacchino Del Regno wrote:
> Il 20/05/22 14:46, AngeloGioacchino Del Regno ha scritto:
>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>> I am upstreaming more components that are necessary to support platforms
>> powered by this one apart from a simple boot to serial console.
>>
>> This series adds the necessary headers and support for the MT6331 with
>> MT6332 companion PMIC in the mt6397 MFD driver, along with some basic
>> devices.
>>
>> Adding support to each driver in each subsystem will be done in different
>> patch series as to avoid spamming uninteresting patches to maintainers.
>>
>> This series depends on another series [1] named
>> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper"
>>
>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>>
>>
> 
> Gentle ping to not let this big effort (with drivers depending on this one) get
> forgotten and wasted.

Yeah, but it was not even 2 weeks since posting and we are in merge
window. Please resend after the merge window.

> 
> P.S.: Mark wanted to merge the regulator drivers for MT6331/6332 from another
>        series that depends on this one (but compile errors due to said dependency)
> 
> P.P.S.: Lee: Reporting what Mark said (Full context in [2]):
> "I'll need a pull request for the MFD bits I guess, please make sure Lee knows 
> that's going to be needed."
> 

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
