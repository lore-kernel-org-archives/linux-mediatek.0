Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59A0C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO9BCtAdjl5PI944Vegw3TyVJtWAoaowtQm2TG38rZo=; b=IsY6Hal58gsOKywe5DHLbzH+ZZ
	/wCRnF1cS52fWh7qWYuXfldNcyCmHxF2uTW1eAHx2fZ00VCILLw/oXngXrSeJbE1fDoVFqeutMcqZ
	svY6vtSgo4Vu90i6P842z91ypZorA7i4XXnxKNEuWkQAYgSNEcWWy+h/DuvhxF0lKsONvaBhhPLpF
	g9NgdOj95Zji84EIGZl3p5iT49YOjQdON9Il2NjgtPL0dZI5Mxk/bT+xg+8P5EK15c4y3PQlJ0iDR
	E50YYYZiBDh91wxwHI3QYGgpfBYTuVfOOlLVm8ueoRKFaY8cZvDJ+YScwhEO+zRoBd7uhgKxpLfsj
	tgbgFXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWF76-002QzV-8h; Thu, 08 Sep 2022 10:50:28 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWF6K-002Qfi-KA
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 10:49:43 +0000
Received: by mail-lj1-x233.google.com with SMTP id x10so19408608ljq.4
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FO9BCtAdjl5PI944Vegw3TyVJtWAoaowtQm2TG38rZo=;
        b=kVhIpvQcg33Vr8Tvlxq4JzJdu83HxShDz+VCPW+/zVSedQfV32YodjnRDz5Q0bEtF5
         neQnsoY6HrEu7ovhqpmFBcWjyBOSh3eA9ga3BaGL6YCsiOM5noaZysSDaMmyJ5GVk9S2
         3rt401hf15pvJVJLra4u8GQmIj4jDO66Ku51LZOiijwad16dJ8Mv0L0nNclGHIOpTfAT
         NOHRfeqEGhDcb3vhWKM+oHnne/hIbesCLTmJYH4rLqsHkiBDymzob7NbKP00PDqBIN3z
         D6HBruLXKqpOyA/6RV6DEV9fbJIDayrZc7aN3MQWxynlQATz8ooxPD8Uqj51JxLgPR8M
         8WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FO9BCtAdjl5PI944Vegw3TyVJtWAoaowtQm2TG38rZo=;
        b=gMD6VWNdBQ+96iE4gnamTlGbRYUFV/rZjihN+3mVEHUw4Ottp0jyJ1qj6URvLjiYLX
         E2iKt1lqYGJkaND9669EZHbj2Znk8fiEIc/D/fXN4lmp6c3I/U1nVOsNpFZ2j7nSJW/X
         oGx70WO478s5EJVD8A5VxVQX5PlzYBKkWRES7im9J5TMLeagMrEEEBn9ESNz0beH5ISy
         NXwT99Zvwt4/QeuDMbi4ak8XpSg44TD0kNmWpfyXJxwjThT+4DqhljDyIW8RiLJHaxp/
         EWYYmEvz42Sl635RL4/yWIUqa8DdxpJYADiGOgG3gRozj2p2OELZhDnawOMzo9qa3RYB
         VJew==
X-Gm-Message-State: ACgBeo0joX6ATvpxJYuUb1lK+TAbPoEloXCBywY7mE+wGrsQYOHE1OY6
	odYUdGGAqkIWxNXx6lN5vyIcjA==
X-Google-Smtp-Source: AA6agR5enzuiL7nHDIxq2vO3krABgPwQHKwYJura+/kGgktQ0R6FajdwvACAYu1/LM8XDhJ33YwGsQ==
X-Received: by 2002:a2e:be9b:0:b0:25f:e027:4999 with SMTP id a27-20020a2ebe9b000000b0025fe0274999mr2353474ljr.395.1662634176744;
        Thu, 08 Sep 2022 03:49:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q6-20020a056512210600b0048b0696d0b1sm2983866lfr.90.2022.09.08.03.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 03:49:36 -0700 (PDT)
Message-ID: <2e575ed1-b82c-c7bd-3ddf-ccb6022b2461@linaro.org>
Date: Thu, 8 Sep 2022 12:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
 <20220831125502.7818-2-chengci.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831125502.7818-2-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_034940_679697_C7D9BD10 
X-CRM114-Status: GOOD (  12.79  )
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

On 31/08/2022 14:55, Chengci.Xu wrote:
> This patch adds descriptions for mt8188 IOMMU which also use ARM
> Short-Descriptor translation table format.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

>  
>      then:
>        required:
> diff --git a/include/dt-bindings/memory/mediatek,mt8188-memory-port.h b/include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> new file mode 100644
> index 000000000000..9363e132c43a
> --- /dev/null
> +++ b/include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> @@ -0,0 +1,482 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */

Why do you license it under BSD-3 clause?

Best regards,
Krzysztof

