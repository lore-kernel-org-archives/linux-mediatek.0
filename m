Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A750C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdeLo/HEqDcBsBJZCtTsZcIieSbE3G0c5YaVE49SxhM=; b=bU2ckpWCFCQLO3Bwtdy+m+FvlZ
	/TaGISfi7B+anlCeo2rmuzXILv/8+nvejWt/22GU5G+0c9zAxynDzPOPXkObOohrDB2kNmeQYO+LY
	fcV5Zn7boj0LfDqAmK9VFLlsSrqg8Znmy0C8yTWbX45u2eTbYtmdbYVtpPPNL4OhR35i5VzlLxRAm
	Teji2TiC4smm9P4F5c06a6n3DEHC4mA9qokFJuG3nEc++gyWvglfEgnrZqJHflrvlBS4ERDuSoZXp
	1AR6VpoJ7c/nBkf69Pc/q18dGTk7QNebaAbbspprKhZoAjhJiO3gBb3MWDd0XITpxgq6fkRtP5WQd
	l5KIv4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1v1-008qwq-38; Thu, 28 Jul 2022 11:43:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1ul-008qlv-Pe
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 11:42:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id w15so2408501lft.11
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZdeLo/HEqDcBsBJZCtTsZcIieSbE3G0c5YaVE49SxhM=;
        b=D/2g/QjrEK8fnbPdip0C4HLBdUCVf1+o0vuESGDzjqER7MbdY0B/Po3zAuvNBt1e10
         WO9vbtKX1sn1Mu/grWuVAdCAk9DappVyhyBvldWRSQNsVYhYtRdhOIM0YQEwBPmKCuff
         Y7cSyaTCaGporSRlv5/Sy4MK8wgwiR8GV//hfP0+8em4n8ySU+AcxdUxUEj0ZheyLkhe
         nV5yFu32FsGqrNXaykZNMJMwAFl1ZmYVP1mVXadkm5gLrqL4OS4uskymswtd9GIMhzLP
         2FtQcW0QmnwVl8wd6enixv3vQek9QkAlT1kBOIFtDdVX35ki7EJ8FCeT19d9rWUdid4K
         ZA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZdeLo/HEqDcBsBJZCtTsZcIieSbE3G0c5YaVE49SxhM=;
        b=qEB7p7bA6S0BxtpQXqq7EJuc0QJRp/TM1eiPjKWdx8Fe7vQq65FfwqCVtzhjKIg3DR
         +/blHQ6K2ilysDwW97nyZ2V6vNvDNyStc2TM/XZDwyBNEYlGympOOB1JOuTbysUq9jSL
         1xNJp/DjSenFwZBm3fWjR5ySJUZLMvi3qrCtB6HhvuMnmlS1RwYggXSKldO2UYPr2UcK
         smFzFlLCN86CjpM9zp5nGVDrLLjiQ4YrIUQQ/WYwdg/XUPVl0K2vxiHpo6C2HNWzJPWz
         fg42r20zw+F0kaDxAXaP6yx51j2UPc1IdCCUQ0JHdM2jFxmXBVET4YZh0c99jI7ljnQZ
         AB0g==
X-Gm-Message-State: AJIora97ihRm5l5tGnHQMHi0KYFB5fvyVosSoX9xa9vBq/NoH44W/da4
	O01BrVI1G5S6n75kl2CQPPQEsA==
X-Google-Smtp-Source: AGRyM1vj/7RBruIhGdOeZdiOwv0g82Q6nua4rpfJQIzPlJvLjQrz3CgmbPncXFOcdWxaf2eze6H8Lg==
X-Received: by 2002:ac2:5b1d:0:b0:48a:718b:d21d with SMTP id v29-20020ac25b1d000000b0048a718bd21dmr10235584lfn.488.1659008569059;
        Thu, 28 Jul 2022 04:42:49 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t11-20020a056512208b00b0048a78c1fc1dsm162825lfr.111.2022.07.28.04.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 04:42:48 -0700 (PDT)
Message-ID: <a810ec42-825c-1a85-568f-b70f04b58280@linaro.org>
Date: Thu, 28 Jul 2022 13:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: spmi: add compatible for mt8188
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sen Chu <sen.chu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Hui Liu <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726103729.24525-1-sen.chu@mediatek.com>
 <d0d24ba1-e870-2ba0-8259-c405cb029d2f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d0d24ba1-e870-2ba0-8259-c405cb029d2f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_044251_879652_7DD94D97 
X-CRM114-Status: GOOD (  13.35  )
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

On 28/07/2022 13:29, AngeloGioacchino Del Regno wrote:
> Il 26/07/22 12:37, Sen Chu ha scritto:
>> Add dt-binding documentation of spmi for Mediatek MT8188 SoC platform.
>>
>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
>> index 2445c5e0b0ef..05801e0199f9 100644
>> --- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
>> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
>> @@ -20,6 +20,7 @@ properties:
>>     compatible:
>>       enum:
>>         - mediatek,mt6873-spmi
>> +      - mediatek,mt8188-spmi
> 
> I think that you'll be adding a SPMI node that will have:
> 
> compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
> 
> Which means that this is actually wrong, so, please fix it by
> adding items...

I wished bindings were not coming along but with DTS so we can check if
submitter understands what he/she/they are coding...

I also wished bindings in schema were used for testing their own DTBS
without sending.

Ehh.... :(
Best regards,
Krzysztof

