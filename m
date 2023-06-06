Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8120C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YScY1UjX9AdjPO3LUvmrwRHMUCozTWDeiHmroKKD6oA=; b=yN0zbvzrNC7t2hF4d5ZUeuwkjC
	evs9k7dYY9ZyWSIufQY/WJLrJz4Nu9Ctm+FpRextpRR/60mBJHSGAp4aMk/TMRNDWe/BPLO5os8Lf
	TqwY1i1Ud8XkrNtsGWLxDs7YHFpp3zE/zwPyVOmG3ggxiB11/Q9eJmnlo3sOFXxtupHI54pNhnozA
	Y2j7FJ5t2R/zR12/TJ0oONWptGzxUGAKGJbjUaR1Ia4EuEAvMzEYaVGya5WmAGA4iYHiPbylZhiZi
	rcMSrpYg276rYdNre7Qf31kV/vkCqN+7NCOxzKSSQRm5S4frrzuQMP+W39bs0zjvl2tMk8LuM5Pi3
	j8VLtzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QHE-000Nts-0W;
	Tue, 06 Jun 2023 06:34:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QHA-000Nrz-1B;
	Tue, 06 Jun 2023 06:34:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so18599145e9.1;
        Mon, 05 Jun 2023 23:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686033274; x=1688625274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YScY1UjX9AdjPO3LUvmrwRHMUCozTWDeiHmroKKD6oA=;
        b=TKI41HF12vkyd2mjuw9ikl45D888WzPYyq/c+Fu8MvyOfs6IC+Fj85qDJ4CXD9AdFp
         9p1WLXkKuHdvfr3zf8YrOu+zwpT15fRVcQDNbNUOcSkmKaXgPZAsonRu845Xv9yPcx/J
         BndOvEVLGUlZeuwSTb7g79d4edxN7/EzNHTk7dcx1CWXmlFF+E45hSaLCk2NsPbkdr4n
         uTXcD87dcuC3/hWtRcDHaD46ybNDOSF9tvKc91wQ0JN7efEmJcAt9nKlAll+vfCI4GjM
         koT+XuSy2MW5L1W7tMzcCDOmWHXQBf/gLs/MjJfKXs98swSGZL0h0iSgY1XX647xuL/0
         LJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033274; x=1688625274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YScY1UjX9AdjPO3LUvmrwRHMUCozTWDeiHmroKKD6oA=;
        b=MhqP7u3Dt7pQ+we+MtjmVSCJr1G9sV85VXynexu92f+oi+Zh2B+ovQ6ihhoXQ7ZGbW
         9mYwCnXftqgz0ZPCL5Y2JRXRieNgt05Zkuh9uZPdETtSj1paBIGvD6XYvv2/Dkw1HfxL
         3WP7LHPLR78eNeW+9SJ1yXDOZWIiIAvi6lnH7KXcDigHH+NfFJUpfNZAw7hpL5QIdgBh
         3gZeY8Fcvsyc44rc2teoMtL8pQ7wrNCHy8rszPv7EUz0o8tOpqLSfYSd7gKog3QWoQnr
         rbeJFzcavooTqH8+etKAAKZzUEP1KP6nyqmnLnzLymI8GGMoQForJHY8MywP+Coqw+VN
         /PdA==
X-Gm-Message-State: AC+VfDw3qDWocJjb17KJO3WlYGc9qxr1g1Y4TggADxbfzDgW5piREEEv
	2bssEXaS+SstbAYj4xxsgiU=
X-Google-Smtp-Source: ACHHUZ7D1BuPEsMDTVS1CtwL4aZn9kxPQUlTrWyIhdsrDD6PTh4+b1PaLCt8/CkOaGJolEbHEi66vQ==
X-Received: by 2002:a7b:ce09:0:b0:3f6:906:1194 with SMTP id m9-20020a7bce09000000b003f609061194mr1130720wmc.18.1686033273522;
        Mon, 05 Jun 2023 23:34:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600010cc00b003077a19cf75sm11509618wrx.60.2023.06.05.23.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:34:32 -0700 (PDT)
Message-ID: <1dc6354d-80f0-1f22-0af8-0ad84b2f15f5@gmail.com>
Date: Tue, 6 Jun 2023 08:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Add missing dma-ranges to
 soc node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, Yong Wu <yong.wu@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230601203221.3675915-1-nfraprado@collabora.com>
 <511269ce-2493-1d21-d8fe-a9d78828e018@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <511269ce-2493-1d21-d8fe-a9d78828e018@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_233440_404474_4E168246 
X-CRM114-Status: GOOD (  17.09  )
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



On 05/06/2023 11:45, AngeloGioacchino Del Regno wrote:
> Il 01/06/23 22:32, Nícolas F. R. A. Prado ha scritto:
>> In the series "Adjust the dma-ranges for MTK IOMMU", the mtk-iommu
>> driver was adapted to separate the iova range based on the larb used,
>> and a dma-ranges property was added to the soc node in the devicetree of
>> the affected SoCs allowing the whole 16GB iova range to be used. Except
>> that for mt8192, there was no patch adding dma-ranges.
>>
>> Add the missing dma-ranges property to the soc node like was done for
>> mt8195 and mt8186. This fixes the usage of the vcodec, which would
>> otherwise trigger iommu faults.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> ---
>> Matthias,
>>
>> this is a very simple but important fix for the vcodec functionality.
>> Since the vcodec node for mt8192 was just merged, can we please get this
>> in in this merge window as well?
> 
> +1
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Applied, thanks!

>>
>> Thanks,
>> Nícolas
>>
>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> index 7ff183c35494..a3612de8e9d1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>> @@ -401,6 +401,7 @@ soc {
>>           #address-cells = <2>;
>>           #size-cells = <2>;
>>           compatible = "simple-bus";
>> +        dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
>>           ranges;
>>           gic: interrupt-controller@c000000 {
> 

