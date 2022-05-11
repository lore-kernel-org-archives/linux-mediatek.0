Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC6CC43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5fP0Th/mDxF1F6Kf/QUEkFqsy4qJlAvigJrKimzj5s=; b=r8FgM9VtqjbSo1
	7pJHkIUzWlwbi3hq21Exh6rz2syQeJG1wZOKCFyxJsJnGiGNsrLd8VMwSnzW1Dh64Y8ddJG3aDUeq
	ZoK4kGscz7k2zxMB0Z6Ad+m71gtq0HWHGAjUTv4Sxhgw6+bIQC4u9ZZQM9un1yEWn3y1olPsC8rSU
	rnY6+xC2m9afbTrzB92VwyBLrPl6/qAftXAgOG9TEzwg7jU2IQMHDBU5ZMcDVjBtFNIURxIySUE/L
	BQCEz+qO7GXMSOMFNuKJhl1mC8X/XZ2Ei14gm2H88yOCFsX5tlG8GebFcI5hTaTTS+k83byp8lokW
	l0uoc+/LgSjiy8Ipa8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nooR6-007ch9-Li; Wed, 11 May 2022 15:39:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nooR3-007ceF-RB
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 15:39:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id g6so4905760ejw.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3EnLHFLc0Jk3HBkHlEdbkbS2KROw6hUVo/W0MBRYlKM=;
 b=OQ46Ckb1vHduf6E2pp3PST82k0EZHs7pmczBztqcLbrnum4AYkflTWi0XtsRpw1JLt
 tzQ2XXBKJKubuPLOecGFeXxzU1hhKRxcUdgK7sqo8XpXQ05NhrEImWpARHKXWfhBmqFh
 QKQZ+cWEF4mKU0Z7BUjQZq0c1uSM2UtPFKkCy2yULw73auxdm4SsB0O7M+Q+Hmwuwhdy
 GfCubg9h5HKOlAxdw7AAnVg6HXAyCP1nZAWmR7jq/cYDcgfdmkJvKAnuF9vT7ZRYCsqU
 4L9rOcARY+JpPQymTQ6nimmTO4Ole5TY/cBC1Qn3LnNPiBSrbiocj+bN/dbHPBd7i4Xa
 p3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3EnLHFLc0Jk3HBkHlEdbkbS2KROw6hUVo/W0MBRYlKM=;
 b=rDEOu4wcYOpRS1JTXKNOA9RWCEeLgQkuB0kt3shwkAFSsinW6cnbWeCdNIJL2kJnps
 XhWDphdof6qlOc8biseB3zsZhFkrLsg/grUTVegCWHqsoVBQkNBuQWHmrjTzUZ/7qQj5
 qQmNhEtgI/Z2rIOpndZBHrmECaeZaj3nrrJIYbsoX1UhnTq2PGaDsYfalBqCO6OkOH0M
 MBTPBSdAc4/3vAhuIRsf4Yw3mQzCmpXwR+bpTmuIcirePQMCoIzQwcZiFdiJp/30DKFn
 +DwTQ05gVibA+WgTNAtSfGIspUK4ufoCGttOXynjv4n6ZjUMCkS4yPUMX58GdBxLTRaU
 BTvA==
X-Gm-Message-State: AOAM530nnzbx6bfg4HKYOlb514MJ32tO5LS0G9bOwf7TE0VXQB3GNo2z
 AyRIkJj020Bj1vPPw5s7nsUyEQ==
X-Google-Smtp-Source: ABdhPJySKAHxPp8LLhFSHV8vPSGtrR1UdG60EACkRkBfD4ufVPwu4UJ/ureg6z2eSpBxrLmhqGwl3Q==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr24951544ejc.132.1652283572558; 
 Wed, 11 May 2022 08:39:32 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 tk8-20020a170907c28800b006f3ef214e67sm959236ejc.205.2022.05.11.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 08:39:32 -0700 (PDT)
Message-ID: <5847417d-921c-7fca-f5de-00e8a550dcb8@linaro.org>
Date: Wed, 11 May 2022 17:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <20220509014521.10248-1-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509014521.10248-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_083933_988809_9648A728 
X-CRM114-Status: GOOD (  14.49  )
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

On 09/05/2022 03:45, Chunfeng Yun wrote:
> Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4: fix duplicated unit-address in example;
>     drop reviewed-by Rob, due to changes;

That's a small change, you should keep his review tag.

> 
> v3: add reviewed-by Rob
> 
> v2:
>    1. remove description of subnodes which is covered by nvmem.yaml suggested by Rob
>    2. change the example which is commoner than mt8173's
> 
> ---
>  .../bindings/nvmem/mediatek,efuse.yaml        | 86 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ----------
>  2 files changed, 86 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> new file mode 100644
> index 000000000000..abb8b85655fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek efuse device tree bindings

s/device tree bindings//

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
