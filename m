Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF706C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2Vn5G0yTW/j5XgAj9JCoNxrCyRR5X+mY8QlkyyA2rU=; b=sRnbsUYBh93jyLPK31dPQYAFRg
	Pgr9cq5J3jmr86Ehvyglk1XVbrrjscxqiHkJjWstNdBxMBpXwJEPpCUEyxP/t8coTDo0r76reW8gf
	E1xkDRaBdL7nUgOkV+68DlPs7Xv3glvjWXquco9U/QbhuAsO/5LP2tzzJT6Ii28gYd8EIUVpGGZKE
	Z6guv+1IDCdgGRtbEG6NnJQUPj6yHO6MbUOXh6D5CeNUQk+wOBPSAMlR8Bd0zUn2YYcW6IKqJzFxY
	zXU4dVI6f7HhBCuy+/qCddhTrKGbsO2GuArS5DxRcTFOWo8Qo11MJ2bAu5UqAWt0xSP/ex9ggxSTi
	5BwxEu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat5k-009FYS-Gi; Wed, 21 Sep 2022 06:20:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat5f-009FVx-Q2
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 06:20:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id a2so7528838lfb.6
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 23:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=K2Vn5G0yTW/j5XgAj9JCoNxrCyRR5X+mY8QlkyyA2rU=;
        b=Ub0c82oCNX+DnfSTSMugjJOPXrTYCcLmbHxmkNTs8LEwnXNK6neBTaFjmCMw8YbAxO
         H6VV7KQPSNM2HrnYnCM6wWLEN9moUG6+nzr3/hHoIEC7tzhOyhuVVnKtqNQlOYt6XkL2
         F3TlT5GDUIsehcBlq5tvpHTf2pIfT/Uqf+FQEO9g7YGL4THNQ4naUPApcY/7NzIu8uVz
         SxVT6SIhNyCnBXF/tvHfefliTILIuiRXHNA1340la8yJZKEUafl0RUp8BKD7NsRiVOYF
         C1CVYyyS0O2TnII2TsmEOnehR3DpjZJs6S89U/+pwTbSMQjGR7FPHgetC4mcBQBjv5G/
         e/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K2Vn5G0yTW/j5XgAj9JCoNxrCyRR5X+mY8QlkyyA2rU=;
        b=lAGi5YCaj/7fIMwAgiNRWddlgP2gM1O+rXHCg91Jo3ZsXSN4ICVi04vonkSGSn6ASX
         NuugNFQIFxKA9wXtBijSoi57VaIqBFv1wuvy7ea569HUneQMjZFVNtu8HgcPy0S9A3k8
         Ysg0mytQDhG6xQbFFOcRtijVQTZ8PWt8sLVwBJUyaaonBbcb0cDW5qZGc5+ZIl24/zG7
         H7E3Xchfa4GltVeP9wffoQvmAUuApxGQVKiD2CAN+Ns1VQrdMNN5N4/jjoyAQVUINaiL
         eI1i+2BUcQtY8F4iHDA6XMmoLR2nd+k7DUj33jmEmPfrOakVRqXTcTpHZmKJ8h21+lIL
         dvLA==
X-Gm-Message-State: ACrzQf1QPFG871v1lu24U0Frv7l1gGKXhfExFCVNp3ykDFjO7NWh0yFz
	zwiBAJkT3xd+tzrRRMVlE9YFwg==
X-Google-Smtp-Source: AMsMyM4oGG69OdP5ujI+L+C6vfHXUbM1QVUuGbwI9wfkrrtvbDD+w6xG9LRKbzeWdihzJLflRV/7xA==
X-Received: by 2002:a05:6512:3f01:b0:49f:d13e:3cc7 with SMTP id y1-20020a0565123f0100b0049fd13e3cc7mr3036097lfa.368.1663741207897;
        Tue, 20 Sep 2022 23:20:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o16-20020a05651205d000b00492aefd73a5sm295514lfo.132.2022.09.20.23.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:20:07 -0700 (PDT)
Message-ID: <c439ce1d-4e71-0630-3982-a4db95a1926a@linaro.org>
Date: Wed, 21 Sep 2022 08:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-3-bchihi@baylibre.com>
 <716d6471-f0e2-489e-5f9e-9e38e9e7953a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <716d6471-f0e2-489e-5f9e-9e38e9e7953a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_232011_880373_3B86DD5E 
X-CRM114-Status: GOOD (  13.00  )
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

On 14/09/2022 14:19, AngeloGioacchino Del Regno wrote:
> 
>> +
>> +  nvmem-cell-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description: Calibration efuse cell names for LVTS
> 
> Actually, maxItems is not really two, but it depends on how many
> eFuse arrays / nvmem cells we have for each SoC, so I was thinking...
> 
> ...what about doing something like
> 
>    nvmem-cell-names:
>      minItems: 1
>      items:
>        pattern: 'lvts-calib-data[0-9]+$'
> 
> and then,
>    if:
>      properties:
>        compatible:
>          contains:
>            enum:
>              - mediatek,blahblah-something
>    then:
>      properties:
>        nvmem-cell-names:
>          maxItems: 2 (or 3, 4, 5...)
> 
> P.S.: I haven't tried any binding check on the proposed lines.
> 

Should work, but does not enforce the order, so I would rather propose
something longer:

properties:
  nvmem-cell-names:
    items:
      - lvts-calib-data0
      - lvts-calib-data1
    minItems: 1


and then in allOf:if:then set minItems:2 or maxItems:1




Best regards,
Krzysztof

