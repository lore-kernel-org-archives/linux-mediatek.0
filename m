Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5467C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B6860EE7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99B6860EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjXBMrhAqqtefj8nllHctRa/trGnTHJWlX/6ljQ6tcE=; b=eBW2xJQs395cLQ
	sFbLQfD/WUkoD2kag6h7HlTpYThKgUde87PKuUNtnrZIGMtluJKI/d6cWcINhUfCpT2rR42ae9rNZ
	4erXezETnTAvRD7tt0ZClIvVjJeJTHZZdAlrgfr5OpLz9xKLeKzZS2Vmgo+/x/ePr77fswLlhMpyv
	B0YetaqQp8S0dYqRs3/5Oy6r6pdz5R3hNM82L8KFqlTUC4zc1oFNidK3loWiHCrHG0RMASsQfBo0I
	IYdaD9qUs18D7QUS4yeQo4XrLa/n/KqKvAzPakT3YfGwKkHOgwtmBC0u4Skny1hp8rsqIoW0fS56/
	/TI4te84T95q91udkkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAmes-0017Xf-4f; Tue, 03 Aug 2021 05:08:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAmcX-0016Ga-KF
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 05:05:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso3121398pjo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t1x2eb6ArQwcke53LEN8sEzOMirAau5sq1TSi3sUCsY=;
 b=DAD9hD6clhuKpwr6lD/ftBB86FlJPFcaeGWcqGpbezF8x11hUauwJjYBYtgWpTkUE4
 ekMiL6uSzYSub/Fm2bcYDjHl2R96wJQ2EN4ZFJPtPf5Bb/DdW4nwnjfFRc7nn+kMpju0
 d/Q8MMNpte5V74V+nn5H0Oj4SHmd27ARSMfgTUnlaPiD8ajWiZUMGz0v6ffTqHd3CPns
 OjmeWF/RnGRxCUn813IkiM8u1HBMYfrHjm7ry0GLMPLUM56vKjYKFdi9z+XP/2Uwg7JQ
 Tt6ALJD5AZfATEbA86bZEbYTrn67HWfeUviDgNGBD/8Xd76PmQwVQIsG41ozOyQkx5Qf
 HuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t1x2eb6ArQwcke53LEN8sEzOMirAau5sq1TSi3sUCsY=;
 b=pyyIevMuUAzjI0vRf7BXUZUT55ceO6Vo2R7TzlxKvmj+HcJRnUCWh5d0yDz9o4/YEi
 Y/5ckAZ7mPct6a7EbQIv/WVeF9Qgxro+5+AReIy/qJAKJak1GJcukQEuirdSyR9UsWTv
 F8PPSTRlGwavnZKE0xBhLDjNwxGhqLchS1N7xXGlGPW1PKMlgf0byM4p5xGRJdAI2nwu
 Q+WARsF4PPE91muxcrbQjYN3XS2NejDgr+YO8WOdEz9b+pQOxRVjs/fvKLHzinTfRQaj
 bCetb2BRtfhu7CFrvzbrwOhPhjwPin0a0SnWDo22FMYbCWdQk8Z82wTshQUSb+WmLqwi
 ikHw==
X-Gm-Message-State: AOAM5300vnFT51fkUE1vIEzFfAsD03Z0S8NMNxP7CfqzRUaGJN7HNBy2
 MiiNfh9tDkw192THWgA+UcyHLg==
X-Google-Smtp-Source: ABdhPJwU4eUemoyxNXuECRUbX/OoxhUNMqe/MV3WYgB0tbaRQDpF/Pp0UeKo4qjqXyRbPmmiGibzQQ==
X-Received: by 2002:a62:606:0:b029:3b6:7e9a:fd2c with SMTP id
 6-20020a6206060000b02903b67e9afd2cmr13151849pfg.24.1627967140745; 
 Mon, 02 Aug 2021 22:05:40 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id s7sm9910588pjg.34.2021.08.02.22.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 22:05:40 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:35:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v13 1/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20210803050538.g6aj2zsep735ywqv@vireshk-i7>
References: <1627574891-26514-1-git-send-email-hector.yuan@mediatek.com>
 <1627574891-26514-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627574891-26514-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_220541_793544_85D184A5 
X-CRM114-Status: GOOD (  23.04  )
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

On 30-07-21, 00:08, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   70 ++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..6bb2c97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek's CPUFREQ Bindings
> +
> +maintainers:
> +  - Hector Yuan <hector.yuan@mediatek.com>
> +
> +description:
> +  CPUFREQ HW is a hardware engine used by MediaTek
> +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> +  for multiple clusters.
> +

Should this somewhere have a reference to
Documentation/devicetree/bindings/dvfs/performance-domain.yaml ?

> +properties:
> +  compatible:
> +    const: mediatek,cpufreq-hw
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Addresses and sizes for the memory of the
> +      HW bases in each frequency domain.
> +
> +  "#performance-domain-cells":
> +    description:
> +      Number of cells in a performance domain specifier. Typically 1 for nodes
> +      providing multiple performance domains (e.g. performance controllers),
> +      but can be any value as specified by device tree binding documentation
> +      of particular provider.

You say this can have any value, 1 or more, but then ...

> +    const: 1

You fix it to 1 ?

Perhaps you should add a reference to the performance-domain.yaml here
as well, and say const 1 here and describe how the parameter is going
to be used. You should only explain it in respect to your SoC.

But I am not that good with Yaml stuff, I will let Rob correct me here
:)

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
