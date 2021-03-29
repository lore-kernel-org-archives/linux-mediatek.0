Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AB5C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81206191B
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81206191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y4FhSyOjTVgZTGFHTwDHziUW8tWxIGaJ35E0zsOAM7c=; b=WmmltNfx1SzfVpIyu5SUePBmj
	hxb8ND3Qwgd1kSNZIKbhEnE3QFCfHFeHrsmpKVLqqgpUDRsSaQDZjBlmnRTXJwGJzFfBJ0jdShD8h
	jF2YEqJi0COp7jbkyZj5Ol7lD9ytZnH56oiZvvwyY8/jmuxaFIsMXhd8TPR6igdEQLa17w7daKmlk
	naiKsFgS4+qHv4Bf5x8ZLB3AKhG3VEmTX72FO0sos9mHtCQRxtjGiz1uTdgbqYICSVW1Fct2QNms0
	2ndMjkANj2eT55xEngwoueOFUuzFJVkBo/AVmjPjVkuaQnCNLjsqlSm6fgp7RODNiVb1JhKSGAEo3
	Emzi+cDoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx6p-0019YO-Tq; Mon, 29 Mar 2021 18:59:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQptA-000c4I-7z; Mon, 29 Mar 2021 11:16:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id k128so6405158wmk.4;
 Mon, 29 Mar 2021 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZD7O7xv0sSMIqPZrXXyTfz7eN6fc6s3WRzXvCjxPyE=;
 b=uiCB4H6VmK9ryuN7AOWXE9kJq0jXWFraCJliWmzp8R2o51OVvTJ9Hd9CFLrURFQ+Oe
 CgNAldNeNvBRWloZgxyab4US69T46fK6qnSdgCgejbh96fEQHbEx7Lye6iwLqUjtoRVF
 cLpqU14xaxEhCoOJQDf2jADS5mFtVj1QP4UJ2dZeyKDy3xNNj4uEDfs+fBhb5OsYowJW
 2wJTeMVlByRWgd/BD6RnXA5c22mCBNDJ0QT+2ancYwU9pAu05Hx0SV1+JFjLsfoE/Zg9
 jXKvJec3WMZrOUBHliFggTuuAcJogXAcUeciuWGNnX1xfZNvSTrEfLHqzY/WNArJBoUx
 7KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZD7O7xv0sSMIqPZrXXyTfz7eN6fc6s3WRzXvCjxPyE=;
 b=TS1ohXvtkiiOSmM+8QW/1T6FYZKvsO6kLGLBxXNFxphoM8hvSo7bdfzWG3ZJSO2ogw
 9nveDDD/D+sAMw9+SofY7BsaYd/j5Lq53CWw7eqZDF0C3hWKv0IRDUGzGjFT4MtX2djW
 l5LpmibjSJ4dQb95PgYZrV8T8/6BFjVJO6HTHhBszTRJZWnZBEOqubo0QKTGXadRsMoO
 9s4c5BbgDTGhLV0HBce+sMJ8vyibZLgylLhlqBcZjwIgJk77oxEgLbsuIVvmohkhzWDZ
 MhSZMIM8jz7o1f0wVx3+0SKRKefUpZD09UDnjHoKZqY+0rYtWg0kuROGYHdCYoGx+usG
 v4oA==
X-Gm-Message-State: AOAM530nWTPSFeX0336N3rKD8lxjC9nD2pbHdhNkAwfgE76KVZSO6o4y
 8ECWYDfrUoU2URwhb78q+bk=
X-Google-Smtp-Source: ABdhPJyugFUfw8eJCOe9rGROZJLludLNJEIo1ORZ4ENfFFWuBE1UrfXXhItnm7h1TslagNU+I9GQ9A==
X-Received: by 2002:a05:600c:4f89:: with SMTP id
 n9mr24764032wmq.133.1617016615644; 
 Mon, 29 Mar 2021 04:16:55 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id o5sm22852011wrx.60.2021.03.29.04.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:16:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
To: Nina Wu <nina-cm.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8417423c-0462-f3af-b3a0-2af638850d51@gmail.com>
Date: Mon, 29 Mar 2021 13:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_121656_441201_A157B6DA 
X-CRM114-Status: GOOD (  19.16  )
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



On 26/03/2021 08:31, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> To support newer hardware architecture of devapc,
> update device tree bindings.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 31e4d3c..489f6a9 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -20,9 +20,27 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
> +      - mediatek,mt8192-devapc
> +
> +  version:
> +    description: The version of the hardware architecture
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]
> +    maxItems: 1
> +
> +  slave_type_num:
> +    description: The number of the devapc set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 4]
> +    maxItems: 1
>  
>    reg:
>      description: The base address of devapc register bank
> +    maxItems: 4
> +
> +  vio_idx_num:
> +    description: The number of the devices controlled by devapc
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

This can all per compatible DT data objects in the driver. Don't add new
properties here.

Regards,
Matthias

>      maxItems: 1
>  
>    interrupts:
> @@ -39,7 +57,10 @@ properties:
>  
>  required:
>    - compatible
> +  - version
> +  - slave_type_num
>    - reg
> +  - vio_idx_num
>    - interrupts
>    - clocks
>    - clock-names
> @@ -53,8 +74,28 @@ examples:
>  
>      devapc: devapc@10207000 {
>        compatible = "mediatek,mt6779-devapc";
> +      version = <1>;
> +      slave_type_num = <1>;
>        reg = <0x10207000 0x1000>;
> +      vio_idx_num = <511>;
>        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
>        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
>        clock-names = "devapc-infra-clock";
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    devapc: devapc@10207000 {
> +        compatible = "mediatek,mt8192-devapc";
> +        version = <2>;
> +        slave_type_num = <4>;
> +        reg = <0 0x10207000 0 0x1000>,
> +            <0 0x10274000 0 0x1000>,
> +            <0 0x10275000 0 0x1000>,
> +            <0 0x11020000 0 0x1000>;
> +        vio_idx_num = <367 292 242 58>;
> +        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> +        clock-names = "devapc-infra-clock";
> +    };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
