Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=; b=Qb0sK1p7SMrdDRBuy1MgRi3N2n
	gRWVOCI/pby3sGk51OrtJF+TN3rtwKSiLmN6U1u+mpX/0gblRijdDeixPzulVjpL0ql0Yw0SD6PUZ
	t5wGK5wZo7/yBVbVD2tr59BsNam92IH5Yg0eziKBZGlriKrWoxSJ6hshSPkIhutTakjIPNcOnN23N
	LNEoOAICXYvd3BPUEqdEdL3ixS71Jndi6XLcU8KdySH9EPp4q/VCrcwluYKEiRJmP1xREEPq/5zcQ
	eaB7laOdh4snt4rx1p44rEEYWcy35DEI3PNRHq5UhU70Eg6YrFIQS4M39kE7l7OhLctaR919oALBk
	M8mdB3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3enn-008fx7-QN; Fri, 09 Dec 2022 14:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3eng-008fq1-Qq
	for linux-mediatek@bombadil.infradead.org; Fri, 09 Dec 2022 14:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=; b=PXVpSqIsl5vNEdVUhUw7EtA7Ix
	pJXsgxZ/yLhQ+8MK5Z2058dJjXexQuosVzwiT2LrVOFEkfOHg6sw9UT2oOsfMI+VR0GSjJal6YjBY
	/xaGCFLPcBzrsZB9vD7zH/HxrA4bbBxSF/iV4VNVedsZRmbQzsqn0uTBOR6hK5ykNWlV+Ab1KU3ck
	y44qLvYcOwn78GDaDDsDt9LHpGVDjTn2X37wLb1SNabtRCobCd/IsZc+g9HUdIs10BkGn7wwpqmkQ
	pV5x3xLzS1MEUJc+iMjHz7v6fuT2BINeIkDmn1P5pO8vPZnFZnUPsGscfBOjoykJ2Dt37qYL4lxsW
	h220j+Cg==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3end-008oTZ-0M
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 14:56:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id g7so7418502lfv.5
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=;
        b=oK6qJslOKT34uL/1v4g3iVT1myebBNEM4jqIgvwqM03/FD9DabncthU7iZSDV0Dw6V
         XsercsMR7iFL4hosx9kgIZ9YzmeCwbSXsSX4/PK42T64csirCJrUZDGR63AA3gzG1g41
         zlLghgCExlKP16+a3f94HqnFX/ZzAhWZHtnZtcyd5lQqtnZGVR+xrZz6v60MtrThIAwE
         XQEk16WFuKtIqjvbXFNEA7UN1gFNRMxtw2StjPUdNgiBZiUp23HOjBaOGribElE0U6rD
         481bOTOymtR3SVQCOPXoy+Dnb7PRwjW6PGEXoMZeDb2M9MiCGeBIBtnUuFWXLdoTE2dW
         +kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=;
        b=phftndsuE0p0ULHaERciReihQy5XpeVDSbyhB1N15dDlk2t4/uVsMJt6ealhVidiiB
         sFX2AmqVmhcy4E0U6r1XIsYBKB3XouOGBV6g6qQjpds5cEsQlPgRewGJQdZ3BkF5vLH5
         YOtVB3kmZ7gFMbzTfmNo5P6MmPnIo32rXiAdqrQvnxUos10gHlTREpXphbHNa33kURtj
         NGbFbcQYwzU+kx2nq+JHV2fivBUV3MFzQG70BmzMllsS7E70tER/DqWT4hDc/UDFT6Sq
         XiZBLhTpm/qWQjMUk5/V5+T6xMN9c+f7DDESTDuQjpodRKQeVZT/xj2fg3zpFcuU4ijl
         NRlw==
X-Gm-Message-State: ANoB5pmDy2D4siJ7tHLFiRAdksCcxvg2vCIh4jMoib5eDv+H+nuYCGyc
	HeFboRELlMlPGp7IKJcG6qSxcw==
X-Google-Smtp-Source: AA0mqf6+eQqJYIlJ4RBGy5DkLM0OPyqhKXbsUkA+Jn4oqxjdS9sXP0vfO1VIWussQDLHIAES8/dMgw==
X-Received: by 2002:a05:6512:13a2:b0:4a4:68b7:d61d with SMTP id p34-20020a05651213a200b004a468b7d61dmr2041235lfa.4.1670597785748;
        Fri, 09 Dec 2022 06:56:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h9-20020ac24d29000000b004b50b4f63b7sm287771lfk.170.2022.12.09.06.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 06:56:25 -0800 (PST)
Message-ID: <fb34e446-2904-a357-e54b-3e82a2b0745c@linaro.org>
Date: Fri, 9 Dec 2022 15:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-11-trevor.wu@mediatek.com>
 <d7d9f3c7-b3e3-1e13-a80f-c7bf7b38a5b1@linaro.org>
 <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_145629_221891_52C1AE94 
X-CRM114-Status: GOOD (  15.16  )
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

On 09/12/2022 11:56, Trevor Wu (吳文良) wrote:
>>> +
>>> +patternProperties:
>>> +  "^mediatek,etdm-in[1-2]-chn-disabled$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    minItems: 1
>>> +    maxItems: 16
>>> +    description:
>>> +      By default, all data received from ETDM pins will be
>>> outputed to
>>> +      memory. etdm in supports disable_out in direct mode(w/o
>>> interconn).
>>> +      User can specify the channel ID which they hope dropping and
>>> then
>>> +      the specified channel won't be seen on memory.
>>
>> So we know what are the IDs but it's a mystery what are the values.
>> Especially with unique values - how any of these should case that
>> channel "won't be seen in memory"?
>>
> For example,
> FE can support 14ch, but BE(etdm) can't support 14ch(it can support
> 16ch).
> In the case, we can configure 16ch to etdm and make use of the property
> to disable the last two channels.
> 
> mediatek,etdm-in1-chn-disabled = /bits/ 8 <0xE 0xF>;

Your description should explain that this is a list of channel IDs which
should be disabled.

> 
> 
>>> +    uniqueItems: true
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 15
>>> +
>>> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
>>> +    description: Specify etdm in mclk output rate for always on
>>> case.
>>
>> How is it different than assigned-clock-rates?
>>
> This includes clock enabling at init stage.

assigned-clock-rates are also at init stage. I asked what is different.

> 
>>> +
>>> +  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
>>> +    description: Specify etdm out mclk output rate for always on
>>> case.
>>> +
>>> +  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
>>> +    type: boolean
>>> +    description: if present, the etdm data mode is I2S.
>>> +
>>> +  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
>>> +    type: boolean
>>> +    description: if present, the etdm data mode is I2S.
>>> +
>>> +  "^mediatek,etdm-in[1-2]-cowork-source$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      etdm modules can share the same external clock pin. Specify
>>> +      which etdm clock source is required by this etdm in moudule.
>>
>> typo: module
>>

Best regards,
Krzysztof


