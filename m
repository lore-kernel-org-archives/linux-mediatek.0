Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6722FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 19:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE8+B3pWQ4l7QxfBqXUnPyiVc+aZlt+BtRcwXsFR3Kg=; b=2zEMJTVrzCfXzKZs/BMPm7epbw
	DwlhtPYzl3lFF2Csc4fNoiX2fRj9XeslFUiG5wzjKmixm7N0kzDLe0glQdTqYiP4NqRAjiCJ/2pUi
	euAkZ6XSbh6H946bFqAvHAxWhbAMKGURrMFkBFR1lgqym62jITGYEgqQMdahPd5uOzt47WZVrgmKf
	3wuE+DBcmudRKOfcyUdYmNZb4IW8nYaXIzM2mzQMrSxTrVPUHWSinEVcNoYyzBhPXuFMP6qnCB0ce
	jORzjETbpfNzDWB51h5jJi6HN/AT8V7ZBrtzQUkA8AORsVbQEboEMk9bLLJ1WSvLiz/eHYxhq4qRz
	DpAmH3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzN23-00AtVk-2D;
	Wed, 17 May 2023 19:41:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzN20-00AtUS-2o
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 19:41:54 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96b0235c10bso209931166b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684352507; x=1686944507;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AE8+B3pWQ4l7QxfBqXUnPyiVc+aZlt+BtRcwXsFR3Kg=;
        b=JeDzLUDQ2pq/eW+97XnNWJdM/lObXBgEGxcH7lBWg6seb0FFwdy+Skry85v27s6EvM
         QkKH/tarHJPDjjQLK1puuvgut2LSyAGVlXvtgQk85PVSFy2ZrpUXtZCoQdoEG4NYgMJq
         ecYIECc3PBpmL8RasuQeCZ8hXX7hhxfC2bTTNXwk7kQw9Yp3FrTvUxxIvUe9j2IPmmj8
         XYAnodyLH69Fi5r5Z0kVGXZz57/Xitgrslunok7K0u2BrSApjH7yzTPKUGDHH4SwwMj1
         bnIg4tChp1M9aS3koD+8rutqnoTrCa3Cc+09L8PFzVd5FnecZA/i+KSehJoymjAUhr21
         QwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684352507; x=1686944507;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AE8+B3pWQ4l7QxfBqXUnPyiVc+aZlt+BtRcwXsFR3Kg=;
        b=ASI82StH21F68K6GPXNbPCU6h8qcUn1iUnEAnsqEqqVs3wDMep2Pd2TPhvSQ2tNhXD
         20ZtxhEujYIt95fbg8Ou2Xnxo13CSNh5/hL7lWEau0R9uWtvQvAKvXEpin4HlZLRBL5r
         raOcMtpP/hkhD+6r7gqOZq2QCXHNNIejACgyZ4adO2fzGV9J74CjQtkBfuD/FoF7jHap
         gYQguwZxmq+1rsR344fzNCSQQDn6X3UAJ+QH8YykvlQCZRX5wsepSUhPRgwlNMp4jzzV
         7InUVASaRfpdiHBPQRnOvomJppncU2Fq/cL4aFpZYVTKmZdK+2VomGQ6xRj6Tn2Y9vjx
         f/MQ==
X-Gm-Message-State: AC+VfDzgM4xBkWA8gNxr/qf22UM7eozE7wIkqowQt9ING2cQt9QtVCPD
	41KD5hpD+7tr5zoGClegMQOfww==
X-Google-Smtp-Source: ACHHUZ4Qg3tRhWiRB2mnHGaX2Qu65CxTKUwvjCQnfKZkAA1h5PCV5S9tuiMPT1sXlI8/YMjQYOhZ5A==
X-Received: by 2002:a17:907:8a04:b0:95f:de3c:6c98 with SMTP id sc4-20020a1709078a0400b0095fde3c6c98mr39648716ejc.58.1684352507571;
        Wed, 17 May 2023 12:41:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id og16-20020a1709071dd000b0096637a19dcasm12671085ejc.4.2023.05.17.12.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:41:47 -0700 (PDT)
Message-ID: <ffd620e7-66ae-2921-85c0-c81070c09e01@linaro.org>
Date: Wed, 17 May 2023 21:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
In-Reply-To: <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_124152_911213_FD852E55 
X-CRM114-Status: GOOD (  20.33  )
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

On 17/05/2023 21:38, Krzysztof Kozlowski wrote:
> On 17/05/2023 16:52, Alexandre Bailon wrote:
>> This adds the device tree bindings for the APU DRM driver.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> 
> There are so many errors in this patch... that for sure it was not
> tested. Reduced review, except what was already said:
> 
>> ---
>>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
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
>> +  compatible:
>> +    const: mediatek,apu-drm
> 
> drm is not hardware. Drop everywhere or explain the acronym. If you
> explain it like Linux explains, then: drm is not hardware.
> 
>> +
>> +  remoteproc:
>> +    maxItems: 2
>> +    description:
>> +      Handle to remoteproc devices controlling the APU
> 
> Missing type/ref. Does not look like generic property, so missing vendor
> prefix.
> 
>> +
>> +  iova:
>> +    maxItems: 1
>> +    description:
>> +      Address and size of virtual memory that could used by the APU
> 
> So it is a reg?
> 
>> +
>> +required:
>> +  - compatible
>> +  - remoteproc
>> +  - iova
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apu@0 {
> 
> Where is reg? @0 says you have it...
> 
>> +      compatible = "mediatek,apu-drm";
>> +      remoteproc = <&vpu0>, <&vpu1>;
>> +      iova = <0 0x60000000 0 0x10000000>;
> 
> Why would you store virtual address, not real, in DT? Let's say you have
> some randomization like KASLR. How is it going to work? Drop, it is not
> hardware property.

Actually RANDOMIZE_BASE. KASLR randomizes the physical.

Best regards,
Krzysztof


