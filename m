Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319A9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2rUBM3uigd0IYhg9S421AlGdWRTSjf8To3ZZq+NWCQ=; b=zgNWYjpwNAhEyM/TtjZ+ihFFp4
	W1orT84hF2U9Wsp8VPrbpBLLEA4cnPc4WWck/asLWejYK5xBbcDZPso/l3MbTcZbAgC2y+lZavKC2
	P0kW/JoPsdhjRVnM+DDyb6/3XJfcTLedHSYotUGZl6vChiLKjIO/uxxE+xHt436wkhHpBW2+acwNa
	8itCP17V9jWRPSGtbav2aI4jBddvgWUpHi9rhqAvH+n86NsDDjJq4on1xqU/lvbFLc2CWTALomTAA
	X7XtakH+HG8JPRdQliWchXB0D8QBVNLy3+uYGUvXzCSX2KIY0wyqE7oK/mB0Wf7K84yw47MhOxOwp
	i6OyDmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofys0-00CoSk-0Z; Wed, 05 Oct 2022 07:31:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyrx-00CoQP-EK
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 07:31:06 +0000
Received: by mail-lf1-x134.google.com with SMTP id d6so10225929lfs.10
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=c2rUBM3uigd0IYhg9S421AlGdWRTSjf8To3ZZq+NWCQ=;
        b=m3wGZF+gX3zyncGuUd3Pzez9su5RuKirLdKGDSC83FXdLWGxFhbTebNDgZoTiHRozC
         nCtm1enhOOfA/sgRd19TGym256+uyw1Mu8JdCBudQqisiSAPAUMsB4QfrQRPV0eitYKi
         C3TosYmyw8e7VrktJT7HnkzWtHl5jV66DP/iFvzyFkv5H0dkuqxzjEnzzDN4aU2m5Mej
         jq4wPWkojK0xTR4mNhZewc6A1zdO/LUVGfRE3/6SyWD9kmFuabF73b5+IyescPFUmkOU
         oqZes+b03aDaNgkHpkvlWAwpG2UBF7HGNtrM1a+ln/HFdETiW2CUIZi0DxIpg+VIWE+q
         fimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c2rUBM3uigd0IYhg9S421AlGdWRTSjf8To3ZZq+NWCQ=;
        b=y5VV/BIFD29YFpkL87fPbl28+nMP9GLEKniRYCC1uu2DXCqxhRV+cax7xwq0TE9N1G
         2Mi9vxl6iK6+zliid22zllnuRB0Z/Fo36asJgrY5Oj4F09y18eLZB3ormqgPi0Dor9aQ
         hlZ9NtpYnNSMxqetm5pgVH5cETx+upjR6I3Fhxuv2xv4SK7StZuQe4M/xN8pmTCzYuhv
         b3ohJUhdiGywLAGw3+NEBXeMbPiFPkQ7PaeeypdD48wGk5LmxO0sqo86Z7HeyZeKS0Dp
         PEDLbovdKUt0kcQVoEpvTzUH+8LcoPnt9nTGczGyQkaBet2jjAWKnPMNcNMjpXXtpX3k
         R8KQ==
X-Gm-Message-State: ACrzQf2wjJeWU88Kc7n0GsNe1T7kKlJ5+4j1OuPOZ67DNHwApverXYAl
	hQ8dkq22s9fFLwjOrZdp+PASUQ==
X-Google-Smtp-Source: AMsMyM5Pmg6Fb8hOCsGQtG3jJCzxwd++fUOnGu6nWEq6j5dTlkBa6OKcP6fl0JquPIxjtwCho6o8/g==
X-Received: by 2002:a05:6512:66:b0:4a2:3c36:8c3d with SMTP id i6-20020a056512006600b004a23c368c3dmr4470782lfo.687.1664955060082;
        Wed, 05 Oct 2022 00:31:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t21-20020a2e8e75000000b0026dfdcbccd4sm68034ljk.17.2022.10.05.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 00:30:59 -0700 (PDT)
Message-ID: <24361bea-ecfe-b6e1-e755-5151220767f2@linaro.org>
Date: Wed, 5 Oct 2022 09:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>, "robh@kernel.org" <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
 <20220930220011.GA1107972-robh@kernel.org>
 <ffc56eb60a3ef74c815c8d3c170a0df51958e20d.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ffc56eb60a3ef74c815c8d3c170a0df51958e20d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_003105_502956_4A9A5CE6 
X-CRM114-Status: GOOD (  18.24  )
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

On 05/10/2022 09:21, Allen-KH Cheng (程冠勳) wrote:
> Hi Rob,
> 
> On Fri, 2022-09-30 at 17:00 -0500, Rob Herring wrote:
>> On Fri, Sep 30, 2022 at 07:22:36PM +0800, Allen-KH Cheng wrote:
>>> In order to make the names of the child nodes more generic, we
>>> rename
>>> "vcodec" to "video-codec" for decoder in patternProperties and
>>> example.
>>
>> They are either generic or they aren't. Until something generic is 
>> defined, I don't think it's worth the churn to change.
>>
>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> ---
>>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8
>>> ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> index c4f20acdc1f8..67fde48f991c 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> @@ -91,7 +91,7 @@ properties:
>>>  
>>>  # Required child node:
>>>  patternProperties:
>>> -  '^vcodec-lat@[0-9a-f]+$':
>>> +  '^video-codec-lat@[0-9a-f]+$':
>>
>> Just 'video-codec' doesn't work?
>>
> 
> Thanks for your reply.
> 
> hmm, I think 'vidoe-codec' does wrok.
> 
> There are two seperate hardwares for the MTK video codec.
> codec-lat and codec-core.
> 
> Is it ok to keep two child node names for various hardwares?
> 

Aren't they still codecs?

Best regards,
Krzysztof


