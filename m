Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3690C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODcrbPcnMCSSoamca2F6ZuB3LHikG1Oo3r1FOts8V4c=; b=n7lbOSGcom/tlSNd4Hfp7oxZMC
	widB0tFRscTkESxCvZZUnJ1ZAHiVDnxmrmSzkVQAX81CvnO2Zdcbbd2E30jwCup4UfpZcUUrbxm90
	26EGCAdLObQJzwXpNVrCTThhhVV10gERpkdmcSheoqn8awSDzG52N3DMm5qjtrR1sfjzmxECVcEh5
	iImThRiu0Km7nw363Oa3us5/1PATjxFPPLpsgnjqcLKUkzdP2jxWF9pRhZuLr1Pe3GMfkK4iJ0g86
	hNagl4rPXpG4GedpiqQUgV49zfxbnEiA1SC03joiLSrAoJYkJCYbY0+X6FK3WstSE2ZG4Or88ldb8
	WUqy3dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMt7-000yte-7x; Thu, 06 Oct 2022 09:09:53 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMt4-000yqQ-6G; Thu, 06 Oct 2022 09:09:51 +0000
Received: by mail-ej1-x634.google.com with SMTP id qw20so2481064ejc.8;
        Thu, 06 Oct 2022 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date;
        bh=ODcrbPcnMCSSoamca2F6ZuB3LHikG1Oo3r1FOts8V4c=;
        b=O6ITMpBkGQ1urboVjRkxd8KYLN9uP+y0IIo/cf4zzrLKl7P1Bqn7CdvLWwKcC3M/5Y
         Id4wtwCKPPPKMG3GZQfgIJpdg5gHWhctohHKrrkb64+gtFljcykZgas12/8BhRW0ZjRV
         Ilnp/IphwEy/7gy88QQqHBQrzh7Qq1QqIgTcq8MF8iPj6qZREa7OzwXcbPvd68l+9o6E
         kKsZq0xHtVN7DZ+2QXyIWW9lbbNrSLAoe/IOViDIyRB0JBJC0ckj4un3Vwvx5ih9yAtR
         6upfwI5IEC7Yu4q/mbMbcN7mgoFGSJlEwQwDWwAP+5PHt0HPneY5eQcKl1uWKePOmwOi
         LyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=ODcrbPcnMCSSoamca2F6ZuB3LHikG1Oo3r1FOts8V4c=;
        b=clgNauWdlYiLKU2/y8gAeunqmlBpnbOByU57pLD1wuN0xdtZH/HQWIZ98/OUEi58F8
         1qyIe9080SewXZLE5ggy2hyLHpABwrkAJtupCaprI70/f+bCBOz2mQ0yznLvOANIw6sY
         HcvCiyv1hDQfsiqxo4LDx+LiN4+56maFHJ1XkJUXbngGN/SwRtELaScXNBmYpWpNgWgt
         uELZZd+/XLYWGRcDtIIFGBQp35gdaJc9zhREiXglVnYw2+1pq9UP1lUHL6SggCKizeAb
         ztGyUiJK7M7tztTSbBAJOU9HeCgpwFRhQSeAQWlHO11fcrHrAIlVtVdkgcIYIcaLsSon
         VHfA==
X-Gm-Message-State: ACrzQf0zrEPgj9q4vv24vR9KAUlqPP3FE8tdW2dZcezbrsbk3v9ntR3+
	wfILo2ASamu3G/1aotlyX3Q=
X-Google-Smtp-Source: AMsMyM6NskjxS+PhyY75K/LPrChZI6R4TpD3VQ9478iz/K1Ew1itC7L8OMA3fWU03XTIMFHg+V/nYA==
X-Received: by 2002:a17:906:7007:b0:6ff:8028:42e with SMTP id n7-20020a170906700700b006ff8028042emr3160836ejj.278.1665047386560;
        Thu, 06 Oct 2022 02:09:46 -0700 (PDT)
Received: from [10.34.19.122] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id la15-20020a170907780f00b007812ba2a360sm10184397ejc.149.2022.10.06.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 02:09:45 -0700 (PDT)
Date: Thu, 06 Oct 2022 12:09:35 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-Id: <0SQBJR.LFLSOU16ZA311@gmail.com>
In-Reply-To: <17e4cfb0-e423-9cf8-8af1-588aed4481a5@collabora.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
	<20221005174343.24240-6-y.oudjana@protonmail.com>
	<17e4cfb0-e423-9cf8-8af1-588aed4481a5@collabora.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_020950_293439_8159792D 
X-CRM114-Status: GOOD (  15.06  )
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


On Thu, Oct 6 2022 at 11:01:29 AM +0200, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 05/10/22 19:43, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> The document currently states a maximum of 1 interrupt, but the DT
>> has 2 specified causing a dtbs_check error. Change the limit to 2
>> to pass the check and add a minimum limit.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml   | 3 
>> ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> index 73ae6e11410b..483fcdc60487 100644
>> --- 
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> @@ -47,7 +47,8 @@ properties:
>>       interrupts:
>>       description: The interrupt outputs to sysirq.
>> -    maxItems: 1
>> +    minItems: 2
>> +    maxItems: 2
>>     # PIN CONFIGURATION NODES
>>   patternProperties:
> 
> Nice catch.
> The right thing to do is...
> 
>   interrupts:
>     description: The interrupt outputs to sysirq.
>     minItems: 1
>       - description: EINT interrupt
>       - description: EINT event_b interrupt

I didn't know what the interrupts where exactly and if either one is 
optional so just to be safe I set the limit to 2. I'll do that nex time.

Thanks,
Yassine
> 



