Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 08:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6m8IpCP+VU3/Vs8C1320OIlxTfCUl2Ps9GP5t3KXbc=; b=bZTXP0+RhQvj5d
	9ZRfgcRIq7lgep+maVrqsOL57/muarXQelY12v1y/izHZZvx1HrjbQkpVKmdweDGk7vE7n8pJ17bT
	pGEe7wz6OHtA+9oBXEEtjhadgbFPsxxMYQ5T67tuOByrRGN1VlOXxJ4QnwK5JLgAVswZKKCJYCLsb
	8V8CS7MRv09ik1FYyqSePWI5P25UuBovg4oApx7n6ZOy3UeDjmVJHw4NqaP3B4Fc1/OCmlbRJACMJ
	a9U1M/dCZkYJf/kA2aadCyCUHeoeUSgBQEU1mOs1L6IBPLqInMM6bZaJohw5A3yKgH87Igc5XnjRW
	uJK52hsiNXJrYEUhzswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjog-00Fo8C-Ca; Fri, 08 Apr 2022 08:18:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjoE-00FntB-4E
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 08:17:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b15so9193980edn.4
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yuQFl788i69gkuHZnfVhALt8fZsIexOSaYwO7DsFL54=;
 b=gx8vkxt3S763Ala7vzwT1kODYsT4g6h9F/zXUPb23Kp7SxBqah2MLv/qepESsLFEk6
 I0ssg1XGAfLpTdDwbWD4XOyGCf1OaXP7MTUwFge2EkjWfCqDuI9cbnBKQghpKTSNb+FZ
 qQiXqB5C+6GD7/kuW52bYq8t0iaiLUOwEH2Gy5BwrGYXzXXkp7NTwGQcZ2MpnvUUOoRE
 8UllVY1p3GkIjUo9lvPFKOrk+3+oTIFWk3jYgmGy2leoAdfs+MGwaRimWw+KYJ0Gamjn
 j+cp3u90dmMQdHjdkVO7f2J+JL8VKRUppRdrEM545wEFGS7/HXzUyxt2c1TjJNQuTQQ1
 yHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yuQFl788i69gkuHZnfVhALt8fZsIexOSaYwO7DsFL54=;
 b=XnvD74WVB6HfPCkWLWDlaQLKDMHmimloILDVsEHMpXxlOzLIbziRsg+jdnvZ02UMEP
 qu7TWreq1c5yCq5uqk7d1AGi7N2JxCS5pJwDM2Ve2I/U3eT9UNNCzNuqNJSP4eqsKFWW
 /pSbJ3Ghz3YnUn1dk4kerCYc0RSb+qJqIuy86hsB2gRfyLPV6kNePt9xbEx3LbCvMmBE
 h6VtKwLRo1R/OSSL0eeE8HuPpuFFJJYdN1ANasaWCmdCidRvNUK7udLMVJPtHzfOtUnu
 dRCf2AgIcmhubwfo+0GPbX6Su5YArIqFPMGcSpofHu/9aCPL9Oo5o7b00LSWjcKm9zu/
 KDUg==
X-Gm-Message-State: AOAM532rFfmVfthCvV4Qu+z6sddzReOWrw6aNqpNOfVlS1QAmcbv7Kpp
 jJcysKp2YBcjg9UrQMZexy/N5w==
X-Google-Smtp-Source: ABdhPJx+VdDdTFo570Fvyfw4GeKW7zvLGZVHe5kAq6tSIeQZxQjNGhr1a2UD5tZKmhXqwhMA9rkmDA==
X-Received: by 2002:aa7:d287:0:b0:41d:79:73ca with SMTP id
 w7-20020aa7d287000000b0041d007973camr8932500edq.142.1649405848011; 
 Fri, 08 Apr 2022 01:17:28 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm6167691eja.38.2022.04.08.01.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 01:17:27 -0700 (PDT)
Message-ID: <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
Date: Fri, 8 Apr 2022 10:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci
 devfreq dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-2-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408052150.22536-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_011734_259386_D6D31F77 
X-CRM114-Status: GOOD (  18.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/04/2022 07:21, Johnson Wang wrote:
> Add devicetree binding of mtk cci devfreq on MediaTek SoC.
> 

Thank you for your patch. There is something to discuss/improve.

> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  .../devicetree/bindings/devfreq/mtk-cci.yaml  | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml

Filename with vendor prefix, so something like:

mediatek,cci.yaml

Also please put it in the "interconnect" directory.

> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> new file mode 100644
> index 000000000000..ef4ea951025c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/mtk-cci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> +
> +description: |
> +  MediaTek Cache Coherent Interconnect (CCI) uses the software devfreq module

Do not reference software implementation (devfreq).

> +  to scale the clock frequency and adjust the voltage. MediaTek CCI shares
> +  the same power supplies with CPU, so the scheduling involves with CPUfreq.

The same - cpufreq.

Instead, focus on the hardware, what do you describe here?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-cci
> +      - mediatek,mt8186-cci
> +
> +  clocks:
> +    items:
> +      - description:
> +          The multiplexer for clock input of CPU cluster.
> +      - description:
> +          A parent of "cpu" clock which is used as an intermediate clock source
> +          when the original CPU is under transition and not stable yet.
> +
> +  clock-names:
> +    items:
> +      - const: cci
> +      - const: intermediate
> +
> +  operating-points-v2:
> +    description:
> +      For details, please refer to
> +      Documentation/devicetree/bindings/opp/opp-v2.yaml

No need for description. Just "operating-points-v2: true".

"opp-table:true" could stay. My previous comment about its removal was a
wrong advice, because opp-table is used for a table being a children of
this device node.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
