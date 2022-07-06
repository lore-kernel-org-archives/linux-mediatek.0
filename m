Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D031C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHzDk8iDFWu26W/brex+TMJ8rS3+AlVCn+1TtO/d/+w=; b=e09dnq1jiq6iWn+nH3cIz2lmWW
	iA4JmgRncc4N5Qrx4jnGubSY9jrmfBIprA0JhYD8iRDRMGMycyB6XP6e/BxRWeuIKwF4Ew3MbYGLI
	NQZjxQqV+YK3md9s4P6pc5BNAnCmDJO4iK4/k+HINBz521kALfwLtCZ/mvcbrSuHpB7w8YZ2K9i9B
	VQsIdLbFXgMSM+VXRtAa3AepoWrkCGa+26XU5DnTep4FHiqtE86BEApIUD8hH3zvw9cwwijaUKQXm
	9kUZlSZufeUq2/8riVyOdoyCIE1YDM2SFQ7EGdZupGjtPAKskxw4N74MqgezGpIVw4isUH19f22P3
	lmVfqK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o967j-00AfXd-6m; Wed, 06 Jul 2022 14:35:27 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o967g-00AfUI-0F
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 14:35:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id j21so26313950lfe.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vHzDk8iDFWu26W/brex+TMJ8rS3+AlVCn+1TtO/d/+w=;
        b=J6aEaA93f6HARN0t/xaA82XJaM88rLxgWepc8chGBv0nECRXeki8VoeFiLxbk0bD0W
         NECJ1vNaouHr3IyfPJEcxgkOj5p/xbvUvyLBpytO37yN5u2UmbJsFcNzJcn8NDBHt48k
         JOlyQBmcRJvvQf8MhHEF3PAlZN4cTRpAnGlU0PTzFmYT9irpHiG9yN6guR4setcg9okh
         dl+iEju53llS49uZgo+DBoF4kdjp+Zf0F1AVuNlEU+e+xQx0H65pxWjQK3ephirk+aB7
         y80eFot9nKxq9aXCX7zRAlAlSMsOjjstIDgHEv/NqvjjABvIw66RIQ3wHPtNeQ4dNH2w
         yu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vHzDk8iDFWu26W/brex+TMJ8rS3+AlVCn+1TtO/d/+w=;
        b=uC/SSQQZnBL3PtM2B/CIW27A7o2sh4gqW3zkPQnBgg1mxacpJIk/cW0gQXf6UCCwa+
         H6MfMG9wGde2ySnE1kgn+6ijixl1P8kHKUzpsg0lEKrBLhMkRWp5fmMOz6EPA97W2tdb
         miKXGCHbtH8z8DgMd7ckju32R9DcNKEC2kk8PbbyCmEkFkBam4o+t3g6WEor3hFX7A5W
         6e708AzYWDVbJyEkuWkc3L+8G6vqE2BpbUPK2KeBsTUoqq5iQJLVwdT/th0UdwA8f3ip
         btvx7jbfiGr95ZevWfnUaoPOETgkW1txq2lZTF3WtvJAfn1wiaYBsUW9w97lmOKS5Wep
         Amsw==
X-Gm-Message-State: AJIora9zmRgkUSMfLRRF0Q7qa2hGkTUGAkbyKQJCZ6YrAjFB8aFEG9w6
	hNgME3IRmDT5movl/taXwVp7Dzdq6TroB9eW
X-Google-Smtp-Source: AGRyM1vZt21fHb4CPWwcERIsmHIfne9uEYyXkXvwQU6KzIQn9abhEBmceqxhXa74eYVxw2w3BF7y/Q==
X-Received: by 2002:a05:6512:32c1:b0:47f:9d5b:d558 with SMTP id f1-20020a05651232c100b0047f9d5bd558mr27803365lfg.488.1657118119332;
        Wed, 06 Jul 2022 07:35:19 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v23-20020a056512349700b0048600adb5d9sm425876lfr.10.2022.07.06.07.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:35:18 -0700 (PDT)
Message-ID: <27c99ecf-75ab-1798-2b59-3be397d153d0@linaro.org>
Date: Wed, 6 Jul 2022 16:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-9-tinghan.shen@mediatek.com>
 <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
 <17203a8a-407e-30cf-79de-352716c3ebce@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <17203a8a-407e-30cf-79de-352716c3ebce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_073524_132038_92C52DA8 
X-CRM114-Status: GOOD (  17.50  )
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

On 06/07/2022 15:41, Matthias Brugger wrote:
> 
> 
> On 04/07/2022 14:38, Krzysztof Kozlowski wrote:
>> On 04/07/2022 12:00, Tinghan Shen wrote:
>>> Add power domains controller node for mt8195.
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>>>   1 file changed, 327 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> index 8d59a7da3271..d52e140d9271 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> @@ -10,6 +10,7 @@
>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>   #include <dt-bindings/phy/phy.h>
>>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>> +#include <dt-bindings/power/mt8195-power.h>
>>>   
>>>   / {
>>>   	compatible = "mediatek,mt8195";
>>> @@ -338,6 +339,332 @@
>>>   			#interrupt-cells = <2>;
>>>   		};
>>>   
>>> +		scpsys: syscon@10006000 {
>>> +			compatible = "syscon", "simple-mfd";
>>
>> These compatibles cannot be alone.
>>
> 
> You mean we would need something like "mediatek,scpsys" as dummy compatible 
> that's not bound to any driver?

Yes. syscon (and simple-mfd) must always come with a specific compatible.

> 
>>> +			reg = <0 0x10006000 0 0x1000>;
>>> +			#power-domain-cells = <1>;
>>
>> If it is simple MFD, then probably it is not a power domain provider.
>> Decide.
> 
> The SCPSYS IP block of MediaTek SoCs group several functionality, one is the 
> power domain controller. Others are not yet implemented, but defining the scpsys 
> as a MFD will give us the possibility to do so in the future.

No, quite the opposite. Having simple-mfd prevents you from implementing
it correctly later as a driver, because you cannot remove it. It would
be ABI break.

It's fine to have one block being a simple MFD having several children,
but then it's not a power controller. Children could be such power
controller, but not simple-mfd. Rob explained this several times:
https://lore.kernel.org/all/YXhINE00HG6hbQI4@robh.at.kernel.org/
https://lore.kernel.org/all/20220701000959.GA3588170-robh@kernel.org/


Best regards,
Krzysztof

