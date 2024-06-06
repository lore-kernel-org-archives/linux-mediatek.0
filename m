Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9ACC27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcbWossHxFAPWhaCt0jaKVByCwga+fTczv+uXxjTlu0=; b=yom839SrWprRxsG8R0ZiI1rtuN
	5OCUZQANaJwZRfiNRXLV26FO53rJIEWwyVoKYxmlijrRBYbdCRll5G/BZWUF5kX8H59TJhrsanQUt
	VQx5xrzfqFzTLKitqPtZ5pQWO1UzaNV6m10bZgH3B3dnIjUQyNiK3BY+1jWm7AINpJkP/yyl7KENe
	c5cTe3mY6li+ysotJF6EJ8x9lYmIXQz/W7LPCHOu1vU4M2a6NO3bOknTg3qaBE0B6/9iaCotHd9cr
	AAz10SZJpoAbLWAnapCGyLCvVaZ131UQkTTaZL5up5x11NNRu79PmYtOcG8s1n8TC7Jvvtd1N8ier
	As/sPMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDxg-0000000A25V-2NJt;
	Thu, 06 Jun 2024 14:19:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDxa-0000000A1z7-2eho
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 14:19:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70109d34a16so920636b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jun 2024 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717683558; x=1718288358; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcbWossHxFAPWhaCt0jaKVByCwga+fTczv+uXxjTlu0=;
        b=mUBsnLVieauBKLAV5AB2NoALpWv/SwWBctpcGmljsunmxDKhCEJ0qkMjgd0feQkRdf
         JWwd4lRxGqC2x8sRmEky8GQZqlOBvOR8f66/ndYMhLDuvY7GHoVg5St0RZM4Dil2n9TP
         CMTwJz+hYkpbrqik+w0QSoA3/4KeTOCdj7kmDXgL6dSzCPDMEV4I7E7XyN7mukvcYIj/
         QcgJYhZSZTsynWX7CJgKqF5aUAZBhBXLdwQZfkRtck+gA1AJGjmqbfaZf8RJsl1tdyqI
         EjvSm5Xo5xOXyx2FsOomp8Id47xaWlmZdLGNHrO5R1aH48kRebMmKDrTtMxjvP1QLY6B
         qRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683558; x=1718288358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcbWossHxFAPWhaCt0jaKVByCwga+fTczv+uXxjTlu0=;
        b=YcKPHZK6qO2zj3gkDMcPAtRw/jtbS8SBsnALoeo0+zlBM/N0BAaIUc6I9q33QRzH8/
         VhYsv4OKqoPZAF6Ad4mRwonjaUo92JUe6LeXZegkicXb3/Z/fyTKzIn/hvSKp3oMGgyd
         G9vOAmiugpmB1QIdeLPFGV4eP0tTkyQXW9MAi56nRm0LZDBdjrqvIN24G7dHXRCheBwX
         EudouFhKTvkDhxRFWnFqBwuWFAF2FzileM6vhT5LrPpjCBSjz1saI1lP7HGfvtmSdZX8
         rZRyL0erKUCC7hZf2QCxRGLOQgN/DEGnQrEzzroPD7UgsVwd+K9l619KtMR6pAn5qCRE
         wfOw==
X-Forwarded-Encrypted: i=1; AJvYcCVWiPCjUwapRmmaQIAHuFPmxTjn/uswPOJ2D59yirOLpHyjmuavBZzNoOg2hYHVCuYD/TT7i9E7Fq96q1glD2ZTaqfNJUUJ8gNpu4X3fZQxv3K9
X-Gm-Message-State: AOJu0YzKLiL3CClZ46wpYIsDBbiwqk8uTnT/yvIlOiQPA+A+7aP6vU0t
	AiVEwqMIl1qpEdlMnsrXOuo2bJFId7aSZcDF7peou5EbQNIcOTDZ
X-Google-Smtp-Source: AGHT+IGW51mR4NTliKKpbb6mL8Di0ngne/w1f8Ev53XXXVhQjFI9ZzWUelNFBR3sa/34xvYKydHeSA==
X-Received: by 2002:a05:6a20:3c8d:b0:1af:9edd:9cb3 with SMTP id adf61e73a8af0-1b2b7414232mr7369811637.17.1717683557519;
        Thu, 06 Jun 2024 07:19:17 -0700 (PDT)
Received: from [10.7.27.90] ([103.170.1.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd495062sm1146384b3a.119.2024.06.06.07.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:19:17 -0700 (PDT)
Message-ID: <c32b902e-0338-436b-85e1-827c48e0ee2b@gmail.com>
Date: Thu, 6 Jun 2024 19:49:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
Content-Language: en-US, ar-LB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
 <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
From: Kartik Agarwala <agarwala.kartik@gmail.com>
In-Reply-To: <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_071923_026097_A8408ABD 
X-CRM114-Status: GOOD (  16.27  )
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

On 5/20/24 12:39 PM, Krzysztof Kozlowski wrote:
> On 18/05/2024 10:16, Kartik Agarwala wrote:
>> Convert Mediatek MT6358 Audio Codec bindings from text to dtschema.
>>
>> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
>> ---
>>  .../bindings/sound/mediatek,mt6358.yaml       | 47 +++++++++++++++++++
>>  .../devicetree/bindings/sound/mt6358.txt      | 26 ----------
>>  2 files changed, 47 insertions(+), 26 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>> new file mode 100644
>> index 000000000..f57ef2aa5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT6358 Audio Codec
>> +
>> +maintainers:
>> +  - Kartik Agarwala <agarwala.kartik@gmail.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
>> +  For more detail, please visit Mediatek PMIC wrapper documentation.
>> +  Must be a child node of PMIC wrapper.
> 
> Did you update the PMIC wrapper binding with ref to this?
> 

Hi Krzysztof, 

I apologize incase this is something obvious but I am still not sure
if I understand what you expect here. Could you please explain this
a bit more? I thought that you wanted me to convert the Mediatek PMIC 
wrapper but it already seems to be in DT-Schema format.[1]

[1]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/soc/mediatek/mediatek%2Cpwrap.yaml

Thanks and Regards,
Kartik Agarwala

