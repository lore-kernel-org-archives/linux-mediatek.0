Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F94C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:42:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EEB020767
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2B3s2Uv5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH56qud2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EEB020767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s6v1lzbINlKCk2igmc4it62giysGPNojpVDV8j8Y4Oc=; b=2B3s2Uv5S+/LxlNXKm80Eupnj
	dUlvn/YmCa/55kXVcITa0okcHtCFzPFTJhTKJXNwoEwtEya5TrxPg2DOEYwIVspfAUzPhVSMx/maG
	jma50vf9x1Ch0voRXcoHfevHmKG9Su1tSajeWwglo9a8bsVlXLCb0d+FjZnkIPCH9/WPmNTEEsL2J
	/AVGI9tdt5YvD1SUNp9frWqUzJ96eOQj0DCiWdoKILfNKdfCULUj/KAcF958BSfqnAtc1MjSiU+5A
	w4X19WLzV2Qrg35ob1p5Z1TmXXtCyUTM9snYjryBSNoS9/JrtlZDdFuubHca/vwx/vZW2WtI0wUfv
	H0tG9Lp/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtqTj-00019y-AW; Fri, 10 Jul 2020 10:42:03 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtqTh-00019N-60; Fri, 10 Jul 2020 10:42:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id l17so5661431wmj.0;
 Fri, 10 Jul 2020 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jJUd39bjlIspvI1o1u2naIJgRgatARb46UKsj3YoryU=;
 b=DH56qud2+QsVfrK8NLDzF6y3pDUvhI1TiiWC9GaXIDY+mjOyJsz5RrWGxvnr98N6em
 Nae2lMEO9/PQm+iyD0C4QFfenRe4mMqw0YWsEQ88YAy9XZZ2llLQnNiO9bwoXrHLj5hy
 f4IF0+t/glYSyA/C/vbq/600XYSZPlbprs8fEJruKudcF3XSp1LkDkVQFk6nCHj2JJSg
 pf+47vfnif9+zsGTdSNw7weQvui+2SSxAfu8u9NEaBEoM6Tzai0nnckyXWjqWLFT+dHh
 F/f3qhdwiK3je5hhCuS0bc8y1qDq5X5Pa86goGdiZCi42yRSpDohJRQNQEEHMcxBNYPk
 xfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJUd39bjlIspvI1o1u2naIJgRgatARb46UKsj3YoryU=;
 b=JZnfpWW/4mx5EWDkleaiE5geZAJieIOddIWRB8LNi+OLUMDjyg6YXZ/9/w++Z8NIrW
 GQkav7cNJBRgp1QzNdKVdllR66ruoM2Qk5Rq422V43Ks+PSr8URFokQHqxkjg7qWDpLt
 AQ68nZz3YcbNJWTR5gzKwotHcP+f27wsW/NFCLslYUa/Ev1bOJKanxpNO0HvOmWJ/PPq
 FeVoPU8yqNj0/2duB/qBML/KRHFl3Mt5J6oioRB1bAphBGchX1SYLWUeN87/ed8OBcHg
 pjLPHNkcfXnvRc7YVlrJmChf9xxL+iJUsMQzQDcXXNTYnkOEOZ7DkpOVhl2w6ajiVTiP
 ovvQ==
X-Gm-Message-State: AOAM530ja6oMYs5NmE/7OtEde4Xj4fBCe9+YJAe8fgB218M5Pfj8eXzZ
 gD3P0XeAz1qVS9/CPX8WGrQ=
X-Google-Smtp-Source: ABdhPJxcOlZwyO5x1hX0CUcQEPIZG+vWvNQwfyRKiWOJNQTc49ZTOFqDxgJLOxgU2UD9pmY0t6+Xgg==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr4429409wmi.148.1594377718256; 
 Fri, 10 Jul 2020 03:41:58 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id a4sm10470215wrg.80.2020.07.10.03.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 03:41:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: devapc: add bindings for mtk-devapc
To: Neal Liu <neal.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-2-git-send-email-neal.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a0a58181-525c-f7a3-4385-d778a113d60c@gmail.com>
Date: Fri, 10 Jul 2020 12:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594285927-1840-2-git-send-email-neal.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_064201_265008_4FB6F5AF 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/07/2020 11:12, Neal Liu wrote:
> Add bindings for mtk-devapc.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>   .../devicetree/bindings/soc/mediatek/devapc.yaml   |   82 ++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> new file mode 100644
> index 0000000..f08243e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# # Copyright 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/mediatek/devapc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Device Access Permission Control driver
> +
> +description: |
> +  MediaTek bus fabric provides TrustZone security support and data
> +  protection to prevent slaves from being accessed by unexpected masters.
> +  The security violation is logged and sent to the processor for further
> +  analysis and countermeasures.
> +
> +maintainers:
> +  - Neal Liu <neal.liu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6779-devapc
> +
> +  reg:
> +    description: The base address of devapc register bank
> +    maxItems: 1
> +
> +  interrupts:
> +    description: A single interrupt specifier
> +    maxItems: 1
> +
> +  clocks:
> +    description: Contains module clock source and clock names
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Names of the clocks list in clocks property
> +    maxItems: 1
> +
> +  mediatek-slv_type_num:
> +    description: Numbers of slave type in mediatek platform
> +    maxItems: 1

This should go in the DT data, have a look for example at:
https://elixir.bootlin.com/linux/latest/source/drivers/soc/mediatek/mtk-pmic-wrap.c#L1842
and
https://elixir.bootlin.com/linux/latest/source/drivers/soc/mediatek/mtk-pmic-wrap.c#L1777

> +
> +  mediatek-vio_dbgs:
> +    description: The mask bit and start bit of devapc violation debug registers
> +    maxItems: 5
> +

same here

> +  mediatek-pds_offset:
> +    description: The offset of devapc pds registers
> +    maxItems: 1

same here

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - mediatek-slv_type_num
> +  - mediatek-vio_dbgs
> +  - mediatek-pds_offset
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt6779-clk.h>
> +
> +    devapc: devapc@10207000 {
> +      compatible = "mediatek,mt6779-devapc";
> +      reg = <0x10207000 0x1000>;
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
> +      clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> +      clock-names = "devapc-infra-clock";
> +
> +      mediatek-slv_type_num = /bits/ 8 <1>;
> +      mediatek-vio_dbgs = <0x0000FFFF 0x0>,
> +                          <0x003F0000 0x10>,
> +                          <0x00400000 0x16>,
> +                          <0x00800000 0x17>,
> +                          <0x0F000000 0x18>;
> +      mediatek-pds_offset = <0x0 0x400 0x900 0x904
> +                             0xF00 0xF10 0xF14 0xF20>;
> +    };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
