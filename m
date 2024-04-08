Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB9CD1296
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KYmvUDf80m88YMXP3fMqo8ScPsGcmUezr7P8QyyQFU=; b=xn0g8K1j5d/8jWWIXFgxcN1tT+
	Cj2+uYHs4GqcEMX7eMoDqZEC8tBCF4GHbRcMyxfogLyrkQBo7EpGwawI2WyrLrTKD4yckpNTGoaEh
	JoVbHIIvHuK/7tVrknfPoGlHsrYgoOmoQ6EUjXC96XxcRJeoPFbjwWhDVi9kM0kpqOSgj0w7H2viq
	36IHZNrjKrMlX9X9nXc5R+oijkOx4Sgi+zv2aSDbwE2LYAuoeU4goU4CINrF03hZo4VAbzZR/jhTA
	+4fiZWxELWp+RalfSJRu+83SIxnL3CgeXrVcaP8XlGrotnlYAyAXRgmOSGMOvGxECqOHh4Uw7ebLE
	ILM9112A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiXE-0000000EWL6-1JUg;
	Mon, 08 Apr 2024 06:31:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiX0-0000000EWII-31a5
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 06:31:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a51d7213a42so48945866b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712557860; x=1713162660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0KYmvUDf80m88YMXP3fMqo8ScPsGcmUezr7P8QyyQFU=;
        b=Ddn5zVKUAx+0pJ6oenlasfL3ps1irQelpVwqErLJez5vFUfjeyqnLpg97fsU+1P7sC
         6OTW+NX+5FHEM8uTLyhiAUXXx6HM5d1yLWg56eKJl145ZhRiIi85fgwz3snhMZi2Xtej
         xngMV4Yl1IEPXVF6G/3BcyAd3kc98zsHxONUUrc4tNfSqmBVg+o9ML9clRhFlZbKkhlr
         nOQmACJ+0hnh0J9wPqRRkfFOUMIs5Wq/IKa6P6W+sg69dyT6lNs9mkjADUP7LNF7uZym
         ioRHSSPTlS0ZRfFaQgd/ig9ZqflgIy/Vaop5tqpf2n9QVyHle6RSXhVCG2Bm+4rt0pmB
         Ea9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557860; x=1713162660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KYmvUDf80m88YMXP3fMqo8ScPsGcmUezr7P8QyyQFU=;
        b=pdLL3vReEXV0MQMBTyyIuWZqQiWM6AJigALOUAO7UTk9YBRR/HZjmg10kqgiJwvZtL
         P6s0ythtwQ5xAXBDsyGOIsg6eS8bOY3nW2isaXWOipQqObeknaHzPPqJ1cCNVHBP3cBx
         K2q/eSltuRaFh/unCg9cTIe0xVXcpKB2e20kJkWuUzWOG4OuQDSM2TQPt2JoxdLKOKj+
         IES4c3TlTIRrIFFUCUqdZJiKeLGQtSNLHM8RJ8P2NnXJ4LtyCi1JBdz7ncrLb3xvLBBs
         3FmeUmCsY4Q3I0DYXUx40luxkL44W7dUUQfl7F82M7d1jtxbav2mFO6NvBkFlJJBuqBm
         oVdw==
X-Forwarded-Encrypted: i=1; AJvYcCXhQrGH6pt9fBSr8VWRCXHlv8r7wZ1gzypIAMSDeX7g67Pz+PZHNdtNeivgl51DrU0NnD7GA1yp7BF8eAu3I4dKVFIG5KYmvSg4oAbXRVv43T7X
X-Gm-Message-State: AOJu0Yysxz/3H4PChB5gP0B0rS8VTnoF39NJjRZ/jNF1LmW7ppcqnCF4
	KEqcGpJ6Mu3qBIxcINcpVqmy/2+nCYwr3fsMaq30Lp/kSWcjg3slLmNC8INHigc=
X-Google-Smtp-Source: AGHT+IHKpgS/7N+qNqT2rqk8qoAtIrascdVmfZ5A2k2DuidpJbl62vpUAnd5gY7MKQ+nqa8RxL9miw==
X-Received: by 2002:a17:906:a292:b0:a51:adf3:ac63 with SMTP id i18-20020a170906a29200b00a51adf3ac63mr4606050ejz.23.1712557859622;
        Sun, 07 Apr 2024 23:30:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id cw23-20020a170906c79700b00a51bf5932aesm2483896ejb.28.2024.04.07.23.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:30:59 -0700 (PDT)
Message-ID: <920d797f-0e1a-458a-9924-1f299a8752d3@linaro.org>
Date: Mon, 8 Apr 2024 08:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
 <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
 <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
 <ZhOJB8o9cRr7oQU8@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZhOJB8o9cRr7oQU8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_233112_100392_09434603 
X-CRM114-Status: GOOD (  20.56  )
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

On 08/04/2024 08:04, Abel Vesa wrote:
> On 24-04-07 19:07:03, Bjorn Andersson wrote:
>> On Sun, Apr 07, 2024 at 07:23:21PM +0300, Abel Vesa wrote:
>>> Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
>>> buses by declaring them as child nodes.
>>>
>>
>> But is this really a "dedicated schema for X1E80100"? Isn't it "the
>> schema for all multi-bus controllers"?
>>
>> I.e. isn't this a "dedicated schema for all platforms starting with
>> SM8450"?
> 
> Suggestion was from Krzysztof to add platform specific comaptible (and
> therefore schema). Since the first platform that will support in
> upstream proper multi bus is the x1e80100, the schema needs to bear the
> same name as the compatible. When support for multi bus will be added to
> the other platforms (including the SM8450), they will use the fallback
> compatible of the x1e80100 and will be documented in this newly added
> schema. We did the same thing with some PHYs drivers, IIRC.
> 
>>
>> Can you please use the commit message to document the actual reason why
>> you choose to create a dedicated schema for this? Is it simply to avoid
>> having to schema with either pmics or multiple buses as children?
> 
> I can re-send the patchset with such a phrase in commit message.
> 
> One of the early versions of this patchset was actually submitting a
> generic compatible for multi bus, but I remember that there was a
> request for following the platform dedicated approach.
> 
> Krzysztof, can you please provide here the argument for why that is
> preferred?

I could not find such suggestions from my side in the archives, except:
https://lore.kernel.org/all/dd86117e-0196-499b-b8b3-efe4013cbc07@linaro.org/

where I want SoC specific compatibles to be used, not versions.

Now about this binding, it is not a schema for all platforms starting
with sm8450, but only for x1e. I do not understand why this would be a
problem?

If you ask why this is not a schema for all platforms, then because:
1. maybe no one tested other SoCs?
2. maybe no one cares?
3. maybe other boards need some quirks, so this would be applicable but
not fully?

I don't know... since when do we add "generic schemas"?

However maybe the question is different: why other devices are not
described here, while they should? Then probably Abel can answer what he
wants and what he does not want to describe. There is no requirement to
model all possible hardware in a binding, but instead describe one
hardware, so x1e, fully.

Best regards,
Krzysztof


