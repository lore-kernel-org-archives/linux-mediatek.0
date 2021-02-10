Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3F5C433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:19:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D3E64E2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D3E64E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U+iuSY7rgRoVG58PkwidBcBgvjTQ6ejHSY9eH9dpOTY=; b=md/XJcYLFzFo5eyXzc4oRYAmt
	6CT/5lpBqXkYNziwX9/x/YcEJAh+Y9iJ74OzEYdhLHVHfsSMGoUtwSlEeyfym8Lt5DKoIfzq31SLQ
	C5SqJQy8VoTVdUg+Wx6MN0J9GrPyq1Cru9VCVKnjV2AMq7wrmhG8TXfE+xmHSHirB2mQ3Tax/3gL9
	xUEk/+N3Ok0MqLsczhEq02JCF9dwRjKGdTJbjVfsMlVYSsihbvoTjg4tyxal2yfNPgtBTi3D/VSMx
	rf42WXngLLcFDE90XT8nDlsM0jjmWsAvhzxH7Wd32hCP/dS/DNWJfxqVCUjwcNriStU36XMHjxHOW
	A+cfymceQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9oSr-0005pb-D8; Wed, 10 Feb 2021 12:19:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9oSo-0005oz-2f; Wed, 10 Feb 2021 12:19:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g6so2214107wrs.11;
 Wed, 10 Feb 2021 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ssW9O/eIVkXR6kVLbH1uKgyKlATY5TEX9NDvAFBdzbU=;
 b=IDkESL79YgL6x6coqRDxvQiawlwVxIIJSkN/pWkDyFQ6rCgvQBzz1rNjapBgEr8r/b
 qwwR2dYQtbSvZJdpWtLYMPKBAkCVuWeeoL8rEKP6XFyLLDPZPh7/T5Gv6WQubDLPO45N
 BaJKfEJqbVlPONqfx+TTAN4uhIlbcWy2zYMeylp6b4/nPhLV3vMwQ/vKe1VMDZycNBQN
 IofAdahVA++bpV9GrzBSO3R8iP5rmeuL4duwJ+38E4eJOt15ZXK5LEb2ACg7k6dLWbrL
 Qtz7zl4p9J/FDbIl39/aWJvYy0+zksaYAQMK173lDu6FL38ZXfLjwU+AB3sD31KUnH5l
 gGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ssW9O/eIVkXR6kVLbH1uKgyKlATY5TEX9NDvAFBdzbU=;
 b=F4m8GGXn9Yvx7BJ7IOkTAnPSdL5c9uGLNyRAnsoPxFov+lJBPrDecBNuTtTYuoq4xD
 XLsonFpTOrmzPGXYOqNKrc64vH1sSs7yrfVmGy83dUKRsoi+icoAYMH9MZv4Bc5MQaOg
 6JPORgdnmSW4UYSwOfRK3ZM3mHn1FcY9RZTQNErONJw+vUVhat9EYR1PsUIsNUvs14nH
 iGyie2+tYhcZehEBygAJk5P1TJy9Ni+POZ20W4SBjH05oBMIu8/QwjjV4gQhVI2E7rPJ
 5XmRAgzkzd1wfDKX9vFDZzPZHb1c92n/nl+4WMdPLC6oTz4HzBC9MvxuyhHZmsPGLnmv
 jYXQ==
X-Gm-Message-State: AOAM532K2+kKqSZV9HpB0Et3rBDiaMgByfBwQywL+FbeYKl6Dcs1Gwv7
 8pTiFCy2dyg5dUGBBccx7lU=
X-Google-Smtp-Source: ABdhPJzuBlWj2KkjFfITOd5oA3b+7UPXGC+dYSAbizJbvSvcTU7UhE5sy9dOB6iNL20qS/uuzHmUHQ==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr3376501wrc.80.1612959561029; 
 Wed, 10 Feb 2021 04:19:21 -0800 (PST)
Received: from ziggy.stardust (static-188-169-27-46.ipcom.comunitel.net.
 [46.27.169.188])
 by smtp.gmail.com with ESMTPSA id g15sm2831049wrx.1.2021.02.10.04.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 04:19:20 -0800 (PST)
Subject: Re: [PATCH v6 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
To: Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-2-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <010e346c-961b-88bb-aa48-398b23a7fb7a@gmail.com>
Date: Wed, 10 Feb 2021 13:19:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608642587-15634-2-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_071922_736404_AF996659 
X-CRM114-Status: GOOD (  19.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/12/2020 14:09, Weiyi Lu wrote:
> This patch adds the new binding documentation of imp i2c wrapper controller
> for Mediatek MT8192.

The wrapper controller has only clock parts, or are the clock register mapped
into the i2c wrapper block. In that case we might want to probe the clock driver
through the i2c wrapper driver.

Regards,
Matthias

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> new file mode 100644
> index 0000000..5d0cf37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek IMP I2C Wrapper Controller
> +
> +maintainers:
> +  - Weiyi Lu <weiyi.lu@mediatek.com>
> +
> +description:
> +  The Mediatek imp i2c wrapper controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-imp_iic_wrap_c
> +          - mediatek,mt8192-imp_iic_wrap_e
> +          - mediatek,mt8192-imp_iic_wrap_s
> +          - mediatek,mt8192-imp_iic_wrap_ws
> +          - mediatek,mt8192-imp_iic_wrap_w
> +          - mediatek,mt8192-imp_iic_wrap_n
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    imp_iic_wrap_c: syscon@11007000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
> +        reg = <0 0x11007000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_e: syscon@11cb1000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
> +        reg = <0 0x11cb1000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_s: syscon@11d03000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
> +        reg = <0 0x11d03000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_ws: syscon@11d23000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
> +        reg = <0 0x11d23000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_w: syscon@11e01000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
> +        reg = <0 0x11e01000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_n: syscon@11f02000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
> +        reg = <0 0x11f02000 0 0x1000>;
> +        #clock-cells = <1>;
> +    };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
