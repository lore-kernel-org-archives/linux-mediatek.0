Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfCRiD7Z+fACC7FJsohmzNNbUDIo/chub7307x4gKfU=; b=yAjW3HeCUrpifW
	POGWZr9k+OUQk9CiUm2IlWpConJfqSGf5LGxl8cioaSCcBBkeXTDGJRyvd5H9PU1plq0TTKhTVqNv
	BCvzkUAnpAruCrfd9HPYzpF63M1sFtkHCtQaOPRhFen+Az9/3RPwIQdZ6bLzDkUNheG+qd/MBr3N8
	U3wGd+a4apsZbkQ6Yyvj9O6DyKxclkm/aoqMacIoYsz8vaLxVdulGNq5Xk+Mbt47j7DdQfuVyAI/S
	PO71AR3+DOSfqHZN3MBHnkportcyxqq8P1U+9xHYsKT1GcdnD3paNEZDI5pdSDhIwhd9dVe444G3M
	SrYaAYSoF5iqdT2YOgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNuS-001V9x-Rk; Tue, 10 May 2022 11:20:08 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNu8-001Utf-9a
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 11:19:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id ba17so19594249edb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u0y4f16c0SOxo3KwwVWJYxBGeIW5Ufwj7qZq0QGv9lQ=;
 b=qNAm9YJPmxvXVHcVJ7IIPrBaO39WMBuQfahQlJMJ9xSTS9HofGYt0F36Bp4m/pxkmW
 pJ804n8QK2Pn7+lT3YoCpvP8HCN7Q9VO2nhFI3WtK5AQfcZG8fwG8+gIVod6mSB7CeZb
 unaEiKt9vmpUf2Z9csxvGgL85ChRlx7adWRL2PdbQcgLNz6GGnq1OWDvC8D8PDieMcxw
 87/fW03PFqdj1Hb9CRJr7KvOza0ejirA9qzgkV1fJdWQtglx4QfpSLmjmtrcQhFIi1QY
 ZwfhqAWr000Qb/AU/Czz3464iHwqChSUmwpTviC7lPm024J9sUNyQlUUYvMJKIPEyGp6
 nCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u0y4f16c0SOxo3KwwVWJYxBGeIW5Ufwj7qZq0QGv9lQ=;
 b=FPyvOPwuMd+E+a/qUktUy2HA9BfxRi0UvS9Dc6pw1J26qqlIPxiiWMMDS7ElGhQHrA
 8qSIhV6eU+Ixw+SWsUUJcPDIcs8PaS6dXyI+7lO57T7N9pqYl4HV88TDnuk1bqL9F7ld
 Y/GHdmKGEnLwR++d5ked5QABaO4w8R3sp891z66zYDbHm6Yas5B1PmcppHKA2a13tWHL
 z8v06SuuCUwEg5yzH3ND3SolojeWieh2IAbLvr50Z3coOUYhF30ELwU8Z2IwA+CNESNR
 NbK1n1pzeteY23nrq7NzJSp7UTJQ0IWxLQMNeubKw+zoS2qr2fLUGOzSLx0Ek0DmaZt2
 aVrg==
X-Gm-Message-State: AOAM533WUvCQcanZykDReAanHOyvgerM5kIlSoEIoREBgmqEBIz59IFx
 FuVHAgGy+ky3O5quDIgH5Z9E4g==
X-Google-Smtp-Source: ABdhPJwllYKDvo2bMIM/15KAP3K8yYn+Ebe9XKBiKYD5ynUUL9BMaCIYSvb+Z5nNlh+dYhulwjptHg==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr22453853eds.313.1652181584762; 
 Tue, 10 May 2022 04:19:44 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042617ba63d2sm7391578edt.92.2022.05.10.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 04:19:44 -0700 (PDT)
Message-ID: <f1d477d2-13c4-2914-e520-4b2778e52e35@linaro.org>
Date: Tue, 10 May 2022 13:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
 <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
 <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_041948_357252_0D0B7813 
X-CRM114-Status: GOOD (  11.95  )
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

On 10/05/2022 03:46, Rex-BC Chen wrote:
>>
>>
>> That's mediatek-drm, and this refers to the HDR block in the display
>> IP...
>>
>> Though, I have no idea of what "ET" stands for in "ETHDR", so, it
>> would be
>> definitely nice if MediaTek can write the meaning in the description,
>> like
>>
>> description:
>>    ETHDR (E??? T??? High Dynamic Range) is designed for HDR video and
>> ...blah
>>
>> Cheers,
>> Angelo
> 
> Hello Krzysztof and Angelo,
> 
> "ET" is actually meaningless.
> ET is one of mediatek departments and it's where the engine from.
> Therefore, I think we will add description like this:
>> ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and
>> designed for HDR video...

Sure, sounds good, but then the node name should not have it. Please try
to find some more generic name (DT spec gives examples). Could be
display-controller, "hdr-engine", "isp".


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
