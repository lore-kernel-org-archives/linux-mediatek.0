Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A762C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4JxhaVexhQpy8daiRNDw+XTd4Z91THI1tcDfW2c6HE=; b=VpzcBrTd6JvrT4MOq97I/Ti//o
	cm8NMOVD8fZDcCsX5VxKEgXwTsiwvD8uwdh6vz2KjL4x3fiHB3JMYVg7woSKPzO+mRcSCDwlVGnCG
	KwtQ7C5L2K+hUW98YHF5luIzyZnhl8lWemiVbcvfnMMHmPt3NK/30JVeWp+chXru2Q3w3S//5p6Pg
	RRbX65GUn+D3Y62xL46RlP45BPlwXdKvS5W8MuM27uJ8ztfqxg9LyPTWA6TDkJ2GKVXZJDINPaCPw
	uB81fIjfiLimYzXKHOWxPZ4fnJ1QJbmJWHNrH6fPB5rUwJdw3A2Cp8tIDnUPXgX66trcMU8yMfIu+
	QxUIUMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11I4-005nsu-2X;
	Mon, 22 May 2023 08:53:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11Hz-005nqq-2q
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 08:53:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so56942145e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684745588; x=1687337588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4JxhaVexhQpy8daiRNDw+XTd4Z91THI1tcDfW2c6HE=;
        b=hGYIQsrsHnFEjQuK41XgS3jgFHGmSkmDmGtZqfqKbMqaw1+roK7luzJGgf6MkEI2zf
         LqSzON1Zmed3SV4ToTWAPBXTyvtUhV9/8BCRoPKLguRVN5e4YBErEdR6/iXkgr3w9zE5
         W4aKjz3F4KTe2c3j6kFwE4TdtneueV0LY7ZEt0yjmGJmTeBgneLZHGLd9Y5ags2ZDhae
         Q0TT+80cDnDkrcVtC6mKi1S3g1p/XIxKWym0HyRrbbgeMEikjwyJ03sHhQcufI7aiV4Q
         NEDGLQcwWgPgAjXuMgjJUDQE1/rby2Z3aJWEmCe4axLQbKwyT3jCR2BgkZU+gClV7wO/
         ACMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684745588; x=1687337588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4JxhaVexhQpy8daiRNDw+XTd4Z91THI1tcDfW2c6HE=;
        b=kAwvExHCKYKUvo06w3KXbeRsIRUONTsoqqvXzMbJpGs+EFraabjf2AzrFrpwD3xbyt
         Cge9fyAXRWhIaRY57woIZBoBJ7twHIMlX2adFM5ny7XkRLLYl6l+np4IStnQ2FDsfDIk
         vEqK96vR2CRD9cnATwQ1TdRDJ8ijTZOswj7L33MSsG7PbYsnkrsNMQRVyjgEjXCBtkqo
         WrEfqn/xNqSA/f57cNiDPQQscpyDXTdAAbvxxPkKgxveW3K4yxNOdbq/naUPJj27ulu0
         8nAya+hsvzkE3/UJNsHmRa5Bx+qm23JATyWNkXoJTpKES91lMq5UUK8jjQybdFkDF2BF
         tUfw==
X-Gm-Message-State: AC+VfDzuOouUQUE1yu96ahtTvMDThmCSei382VKabpV1dQolgAg6aRK5
	2Wx4tiAy18+UE8S3c1lk6Uo3vg==
X-Google-Smtp-Source: ACHHUZ6UBR3+LBI+m8V1SPTaOnzgCK0atCcXfHxkCN2098SLTc/lFSwqy+8q2uw7iLTos5PH9rKVCw==
X-Received: by 2002:a7b:c414:0:b0:3f4:2610:5cc7 with SMTP id k20-20020a7bc414000000b003f426105cc7mr6538472wmi.9.1684745588453;
        Mon, 22 May 2023 01:53:08 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b003f1738d0d13sm24745899wmq.1.2023.05.22.01.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 01:53:08 -0700 (PDT)
Message-ID: <116712ae-f18b-3288-ac6d-80073aebd458@baylibre.com>
Date: Mon, 22 May 2023 10:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
Content-Language: en-US
From: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_015311_918853_015741B4 
X-CRM114-Status: GOOD (  14.50  )
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



On 5/17/23 17:04, AngeloGioacchino Del Regno wrote:
> Il 17/05/23 16:52, Alexandre Bailon ha scritto:
>> This adds the device tree bindings for the APU DRM driver.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
> 
> mediatek,mt(model)-apu.yaml
> 
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml 
>> b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> new file mode 100644
>> index 000000000000..6f432d3ea478
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AI Processor Unit DRM
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,apu-drm
> 
> const: mediatek,mt8195-apu (or whatever else).
> 
> ...besides, I don't think that this patch even belongs to this series? :-)
> Spoiler alert! :-)
Actually, it does!
I forgot to send the patch that adds the platform driver ^^'

Thanks,
Alexandre
> 
> Cheers,
> Angelo
> 
> 

