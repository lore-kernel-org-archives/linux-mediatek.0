Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB355C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkE9S8QjqEqo3Sc9i4pOKMTb2viNi31b33OE4RI5Amk=; b=nEGoLMSS/1bBzJQtCWpmr7GMbw
	89suQt+m9Qks6+5v/bvbP948lbAClfXXOjLYYpar6d0mcfpVyB1t84si44p6Jo9MgCCSgoYXgch05
	+9HmbQfS1tLGTtR/9TIgNBV9AUfJHX1D89ESl6teziA0JiBLJb7dSi5lfiKfdOxf1gTvHgThKfw4V
	GuiF7lDnUY38eXNEIL6kie9n9Q7yn+cifhEHCrOh3lGx1mnY83BgoFqa9MS2r8PnXS0JTNJ+QBdNB
	0xXewiF8EUqY7Zp4ZeAn0ZFH+DD22ar5olTkeFDeMO4glyrzKE3tBv+Y+qwh3Y+eyHc7cNANtmrQj
	7iPxxGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp5fi-00FbJ0-KA; Mon, 22 Nov 2021 09:31:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5Vj-00FXrm-0H
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 09:21:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 137so11072984wma.1
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Nov 2021 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1r1P3CAQVJMR7iqI1mfq36qxIjfrbAJB49dCsJeHrQc=;
 b=XFYR7Voix/vCKrhxk72LU+Pe1QjOfUmDJHanELv54kHxwnW0d+Zp9UKEgSMeGPY0Tw
 4dCdu3BE5U6uuF0wSPMdW4Siq6LPxPr380Mc7wfrekKhMxrfkCaa0ZIYN9FpNFWeHF+7
 cxrT8u813G/13dKOKd2BjqpFf8EbsY09uCiHpWznUyeUqvSFeJb1J6jZCU/yWpJV7gvg
 rCFBQmGuhPAlgnW7vjz8YxAqAw8+QZV/G8log8ZIpwiYtQIXlYys38HFezmnAmejA5UV
 hBPJBtcJXpbEyCtuXQtTEVN+nTja4bhY6NB3fHRfuNXw+hRc1m36kry7Z4VCoovrSKWX
 G4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1r1P3CAQVJMR7iqI1mfq36qxIjfrbAJB49dCsJeHrQc=;
 b=P5DamBaLMxEu1h0VpzYlSBvmj4VNbpRpgWqWzuyMpzbiaTFZdIBOcMhAka5722LVKw
 AxKG5zdFuFdhPvNkL2Mq4qJetolkO0TX5iqsdW+KA23+JVkW2PxYfNAFwTrY18Xh9Qmo
 JKXlZ2zZm16E94ltN01T4Coh3OiSinnFkXBrQjiC+pP6Wmax6GSTb4MOzywUgWpMHgVQ
 EmxDQYk2whq5iM8Y0gv7q92lRnuQKaiojNzJ+ddX7AlJzmH6B5Sz3BS1FlNX/tUzPHXF
 Y8672wsOzaqTxX/lEyzjmZUeu6YSOgXiXTKMTeUwct/uDkf5QQTdiXt1Zw905CTmk+Ev
 C3+A==
X-Gm-Message-State: AOAM531s++mRYEaSiqsp4UZOvoH1oTdL0TwzW6W3dwu7JDA5MYvIr2f0
 PiyW8+TIJ1zs8G0JUMK32UHjog==
X-Google-Smtp-Source: ABdhPJzAgAkGcitf6tL+qV9XGDPaOQenjEwCFISt3azUoTKx6X/370/Jy4Dtghj84pOdr6LWuSSa4g==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr27315815wmh.164.1637572872541; 
 Mon, 22 Nov 2021 01:21:12 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 8sm19977788wmg.24.2021.11.22.01.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 01:21:12 -0800 (PST)
Subject: Re: [PATCH 4/6] dt-bindings: phy: mediatek: tphy: support software
 efuse load
To: Chen-Yu Tsai <wenst@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-4-chunfeng.yun@mediatek.com>
 <71f83770-b12f-2452-d24b-ae1be9b5b075@linaro.org>
 <CAGXv+5GzP1SXi2ihhifK_Ui8Rt04UgeFyjivzHc532yvPFo3OA@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8aa7adbf-7367-1b3a-4d63-f9fe83e72117@linaro.org>
Date: Mon, 22 Nov 2021 09:21:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGXv+5GzP1SXi2ihhifK_Ui8Rt04UgeFyjivzHc532yvPFo3OA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_012115_227117_E237C03F 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/11/2021 04:05, Chen-Yu Tsai wrote:
> On Sat, Nov 20, 2021 at 1:19 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>> On 07/11/2021 07:56, Chunfeng Yun wrote:
>>> Add optional property nvmem-cells and nvmem-cell-names to support
>>> software efuse load, this helps to fix the efuse bit shift issue
>>> on mt8195 etc.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
>> Applied thanks,
> 
> This is a PHY DT binding change. Shouldn't it go in with patch 5, the
> phy driver patch, through the PHY tree instead?

That's true, this is dropped from nvmem tree now!

--srini
> 
> ChenYu
> 
>> --srini
>>
>>> ---
>>>    .../devicetree/bindings/phy/mediatek,tphy.yaml | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> index 9e6c0f43f1c6..05ee274b4b71 100644
>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>> @@ -160,6 +160,24 @@ patternProperties:
>>>                    - PHY_TYPE_PCIE
>>>                    - PHY_TYPE_SATA
>>>
>>> +      nvmem-cells:
>>> +        items:
>>> +          - description: internal R efuse for U2 PHY or U3/PCIe PHY
>>> +          - description: rx_imp_sel efuse for U3/PCIe PHY
>>> +          - description: tx_imp_sel efuse for U3/PCIe PHY
>>> +        description: |
>>> +          Phandles to nvmem cell that contains the efuse data;
>>> +          Available only for U2 PHY or U3/PCIe PHY of version 2/3, these
>>> +          three items should be provided at the same time for U3/PCIe PHY,
>>> +          when use software to load efuse;
>>> +          If unspecified, will use hardware auto-load efuse.
>>> +
>>> +      nvmem-cell-names:
>>> +        items:
>>> +          - const: intr
>>> +          - const: rx_imp
>>> +          - const: tx_imp
>>> +
>>>          # The following optional vendor properties are only for debug or HQA test
>>>          mediatek,eye-src:
>>>            description:
>>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
