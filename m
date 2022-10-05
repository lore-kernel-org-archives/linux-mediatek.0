Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C546DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI/g3/3re7PwEaGDnKo+G+NvZHj3bqwKKnku8VbtDtM=; b=uT6pNePKVG/JslGZPMDRV5u2hk
	6eYnA73QnlDwdRfHkEhiVbCgV+EEKLmSygoOHPIqkA8BYtVUavC8seCK/w3u1xWlb941Kl+ylPaRW
	MZOF/vsl0uzIisp78z3uV62SbrC3M6A1vE6garIY4PxG3P+gQfAp1Nm4wohybbR4QpEWDfdaX19Ba
	I3n8+PMhdkU0lwr2v+083fYHzWOtNpTXNCBh4FDG5J4nLZHihij/ht6cypMa2quKvNftnYHi6TvXi
	ePg/td3iIXcH/2gyxWRzLJQZIuUN8wiWHdqc2SVHnnlV+ieSH4WeThvhETGP3LHYkeiIBlqbxR+80
	iAJR/OSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzqM-00D3m3-I6; Wed, 05 Oct 2022 08:33:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzqC-00D3jb-40
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 08:33:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id y5so4908017lfl.4
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BI/g3/3re7PwEaGDnKo+G+NvZHj3bqwKKnku8VbtDtM=;
        b=Z86dXzqXz+SYjj1zXzoiabUQmRtiMe4sKp3h5T+0uCEFsi0dEW55EjHuqLpPqUbY61
         YhiSb/eLKCxkiYbCH2qEdaIs1AV08DbREtuaAM+Jpj9F4hL7bbTtpUEoydWxXaTP0m78
         Izm26WpMP48l9FzkGjRjrMLb3OHM7wRQFV0V80IMXtVf9W67gdi2xq+drYSImnCMVB8g
         JoGY2s+rYp3Z2uCVOEz/kM+B0XDYhC8gDtGsXCmOeJjgxD8n2tB2G1hgl8E5Bah/xilr
         EfPqcWI5EyzLZWyg0gb7ip+KCg2nspD9z6H5b6E0ku0NpWBQ5i34JKchjgIbTrrL6o4T
         vFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BI/g3/3re7PwEaGDnKo+G+NvZHj3bqwKKnku8VbtDtM=;
        b=SV8IrImobtrJSzNpqwg0VMg/APcmeYHEkGj9ZVHoP8eVcG1FV6UW6sRLBZu0IhJGx9
         2NY1A15IFv/0KkZtY1tLvsPMSAi3yFzWibL7VpTzkajQId3mpaOzLaL+C92zR3P24VmB
         5mVJmHqez0TzvZfL8osLC9z8q1xTuaf2aVxS6x98xjTT57RV+8wdFq4rbii9MonQqcmB
         er8VbhIsHi/Atbwj5NO6xLeW9+5TfZ7f9nqJRzRfzsGIMY/HCFMGoCFrryXGj7BdOVTF
         CRDn+7JfzhgkKXN036GKP9oYuin2QJHxQ+Evt49Cw7By/+LmWhknqel5CRkAo69bsCay
         E3cg==
X-Gm-Message-State: ACrzQf3tEfSe6S5nsuFYunI0kbzLt44af1Wur2bUiT+4TqAOSYmcqgGx
	L/++W19t4dkG/7ntPPsSFhzI9A==
X-Google-Smtp-Source: AMsMyM4cmOaxSLZB4Iospm4+LkqtiHdTJ1Zl+MLkRRS3nkF+D/K4wCCkbK3vJDkF+MbZZN6M9SmbZQ==
X-Received: by 2002:a05:6512:10c1:b0:491:4104:cf92 with SMTP id k1-20020a05651210c100b004914104cf92mr10906519lfg.211.1664958797623;
        Wed, 05 Oct 2022 01:33:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p20-20020a2eb7d4000000b0026c5dce1f9dsm1480903ljo.106.2022.10.05.01.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 01:33:16 -0700 (PDT)
Message-ID: <9004b427-66b7-f783-9258-4f6b893899ef@linaro.org>
Date: Wed, 5 Oct 2022 10:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
 matthias.bgg@gmail.com, sre@kernel.org, chiaen_wu@richtek.com,
 cy_huang@richtek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
 <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
 <CABtFH5Ld91S65RiDu4iSpFhAMiFWaQdj-yDRM79=WUkArpA0JA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABtFH5Ld91S65RiDu4iSpFhAMiFWaQdj-yDRM79=WUkArpA0JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_013320_169106_110E4242 
X-CRM114-Status: GOOD (  12.07  )
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

On 05/10/2022 10:14, ChiaEn Wu wrote:
> On Mon, Oct 3, 2022 at 11:34 PM Rob Herring <robh+dt@kernel.org> wrote:
>> This doesn't fix all the warnings. These still remain:
>>
>> /home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
>> pmic@34: indicator: 'color' is a required property
>>         From schema:
>> /home/rob/proj/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>> /home/rob/proj/linux-dt/.build-arm64/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
>> indicator: $nodename:0: 'indicator' does not match
>> '^multi-led(@[0-9a-f])?$'
>>         From schema:
>> /home/rob/proj/linux-dt/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> Hi Rob,
> 
> In my opinion, the root cause of these warnings is the incorrect usage
> of 'allOf' in our LED indicator dts as follows,
> (https://lore.kernel.org/all/27df85c30277a171ae85ff6d5b7d867625765d0a.1663926551.git.chiaen_wu@richtek.com/)

Eh, my patch was merged in July... and yours from September still does
not use updated multi-led bindings. Was it even tested before sending?

Best regards,
Krzysztof


