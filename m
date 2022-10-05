Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7ABC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsDytsrXABRiHHLdkomit3W/4SQyAKiKJzv17uaMpSE=; b=lz6ylG7LYzhRuHP/GSG8b9voHW
	UdL9aCVE2dFQRnLUXWHlctB3tIGaYRcQeuMGx/0G5N0cH2REynj2sq+l6Vz66LRXsxW5q45NL2dgY
	+t8v+gYq/KS3fybaRmpskW+MW50E487YffvBn47C8y9HPb6nOcb9dyHfaY5IluHBkR8KHhdhc3sTK
	w2Y/KDd0BtbRQegw5VZQoESdkDTmIh1PFgzYe6JYG7svuK2rT0TFUN+pdwoV1s93tqujAmln+S2FN
	qO4RAoFG8kNI7VULDnfYydfzSB5H968y2PBwvdPHIaAqb1kzdg8SoaLRPpaK128EGPLt1Hl6+f8YI
	rdOztoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7Ul-00FDJi-Ff; Wed, 05 Oct 2022 16:43:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7LG-00F8uE-Km
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 16:33:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id a29so3227620lfo.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fsDytsrXABRiHHLdkomit3W/4SQyAKiKJzv17uaMpSE=;
        b=f79WZ1CmFqHwvH+p6fcw9MAZwCeE4Y0jytRrvpG5oNagbKEN/cGNhxlPfDTgAilmIL
         LRJwD/J5nWGLRSi7njSfd3FVREwQ5CEX8IOzVdF8u0kyJJ57IRIkLXOTvPecNi3A9V9c
         Tz6NWbOT3Cj04sVi1gyeZRh0uso8A2pmY0qHVA+8lFrgZB7eBS4xucXwtn0L7zGYI9fF
         C8gxBR7Zms4ORtGFCduxQONtzzsoZa2j+6tbzxtCyXlvoRLjKxFUjNKeC8uYEs2nSqUA
         WNq3lUsL8gxqYu3m7vVS+ON5miMOz0ikYD84TvhHaFFINKRHkJrfywUbvmNlradLvDPa
         qE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fsDytsrXABRiHHLdkomit3W/4SQyAKiKJzv17uaMpSE=;
        b=4E+7nA98fZ91SCdNSYHMz+6EKPvSM/2ruiDKIwMglJGTmu+wKeH3rSMnvow3if4OGY
         U3nXQkb4Lo6TZjjC8mWEsLQxShS5jypE5oqIasFa5v0EZ3t/Q7++l/iW3napelF6zU5T
         HtflbjHmZzVLjp2A9cl8J4joICaDHCn2rmD+OEuBeb82uEGKAWSW8C/uU5TWSDyqHqMF
         k8eCYJhglVdA98HpQSQoVXdwkiHT19RutDKY7WoKo4BmiS8PhYWI2CWBSV6jijuvSB/o
         FmhmWEkdXtFxexkwelcfPX+Pk4GjND/YVe4ohxaseC1k2PyWWs0Zkg2smWjtM3mVsaN/
         Zf5g==
X-Gm-Message-State: ACrzQf2sT9ufFPx4k8KsGeqihfr2nhyUenGz1THOBurFgbe88PRYEE1g
	Zm/hoN4xEO+JA9g1mDHWiNmk6A==
X-Google-Smtp-Source: AMsMyM6R1rJ0EDep0X30zwEZyQnjfv12SmZCyEK74LSEbsUR/NHwNWRbzWm06v352s5lwPYFNRhPig==
X-Received: by 2002:a05:6512:6d4:b0:4a2:5045:db6a with SMTP id u20-20020a05651206d400b004a25045db6amr249061lff.199.1664987630856;
        Wed, 05 Oct 2022 09:33:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651210d000b0048cf43c3a85sm2388561lfg.238.2022.10.05.09.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:33:50 -0700 (PDT)
Message-ID: <1f3ebf6f-117f-62a7-8e02-3e8a3bcf7e9f@linaro.org>
Date: Wed, 5 Oct 2022 18:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 wim@linux-watchdog.org
Cc: linux@roeck-us.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com,
 tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_093354_848150_2522B41F 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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

On 05/10/2022 13:35, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek watchdog bindings to schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

There is already work in progress:

https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Best regards,
Krzysztof


