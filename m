Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA7EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doP8CZZyrslCenSYjdf6T/PIt+tCk5F92Ar2E5adtJ0=; b=o/mbI14tefuC4PUz9icc3y8HCD
	w+aun01b2FhmPevgMnEs0K2xJG3Sd2MTJRc4IXT3uaj6k+e/XOvHiqtXt628tUX2fSpk9cS8rx9yn
	iqyo7SjsLF2hQivjAoGy0unsWZqWhDIrpJyg+i7SivYxsX2l0qQRcs+Mbi0+1wTR+rgM9ZaP1HIVw
	w27lBw1buEn0I/uKbpNBzXL8oy13EOkldDAirhjCd955z+8fqrpAefiVEka2DTX7c6YX9rz1KLHMk
	gmJ97BPCfpd9ztO2+0pv/iZridZ6PP7qzhAoZhXIZad19Jkp8bzybMC+PzoxAJY0Q3/fFQ/y94uD1
	f3Kkl21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFubs-007gQG-2f;
	Sun, 02 Jul 2023 10:47:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFubp-007gNJ-2h
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 10:47:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so3876291a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688294832; x=1690886832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doP8CZZyrslCenSYjdf6T/PIt+tCk5F92Ar2E5adtJ0=;
        b=ctacEYA1JK6veFXxDJZFud4r7LN4mBV0X0v7BsVcyc/h8oYdZJGgjQKfYbSclowoaF
         CKs9o5FIk4V/q8HdhxLVMS+Sr42LMHv+2sZCF8mC1KhKgvnJZh+69V4xD+YDMSYvsewV
         WNWMQiagaIhorzQIhS7+M2H2kyDkr2sPp+GZv66P5t8ubtR95qYQhfzLtRQeKW8MHomL
         kxGBUQyE83nuOB1+LLo9XvcMNl6hbj18QP9Xo/33e2Bs36JK0zpsHisRQmtKmyQue+sl
         1pvQidSX7rfr4UOtgA2F6PKiRNJXHbHYojIpxZC8qxgeo+7dS0ixvkqrlbOm2SrYriy4
         k1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688294832; x=1690886832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doP8CZZyrslCenSYjdf6T/PIt+tCk5F92Ar2E5adtJ0=;
        b=ftXYmS0sgM5JNzwYRnLmNbovZ1e1sFcS2HghJDYMV7XOY5ocFNHVXraj3seG59M4Ta
         /wcDyt1tKyZiKK1PRzkGSZXoeeRQi9RSHF21SmbsYKmesRvYX6F4uR7HA3C2hRqxWJ3I
         RxHtwPisZRIPfdmQjk5r+zjY1L089qkAae7WIGpNV4CYt9q05SWdU10SM3weWO9gG7u0
         G35mzK9L81QhozTVRd4dvvHumufLt/oi0fsihR8EYJ33ukr0FTleCK0skJvdtRh3vdrp
         Noy0QmqqThpk3xYAzdJV7F3EXpJgmCcS7jbmjqlG7U92SSkEE9QJS6BRORDoxCYA1SEE
         dxmw==
X-Gm-Message-State: ABy/qLZq/LcRvjQXUJqZtrzPep9bvBuKuR/IE03zLvtlDlw5fiVURHlx
	szzqIU15rALmKhqETN1Owo/2Vw==
X-Google-Smtp-Source: APBJJlEUDjmuQNgaEKhIauAAnEoZ97aP9Ydyy4Asa0tJshbXlejAZ3SysQ8kzJrnLsVizDYxGEaxCQ==
X-Received: by 2002:aa7:ca57:0:b0:51d:96de:af6f with SMTP id j23-20020aa7ca57000000b0051d96deaf6fmr5497089edt.0.1688294831756;
        Sun, 02 Jul 2023 03:47:11 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id q14-20020a056402040e00b0051d890b2407sm8550077edv.81.2023.07.02.03.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 03:47:11 -0700 (PDT)
Message-ID: <889bbee2-db9c-c1dd-dc8a-cdc436f1dfd8@linaro.org>
Date: Sun, 2 Jul 2023 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>,
 daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
References: <20230628145412.1610260-1-jstephan@baylibre.com>
 <20230628145412.1610260-4-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628145412.1610260-4-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_034713_921141_8DE0EEB7 
X-CRM114-Status: GOOD (  13.91  )
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

On 28/06/2023 16:52, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365

Thank you for your patch. There is something to discuss/improve.


> +
> +description:
> +  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
> +  receivers. The number of CAMSVs depend on the SoC model.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-camsv
> +
> +  reg:
> +    maxItems: 3

Describe the items (items with description) instead.

> +

...

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camsv1: camsv@15050000 {
> +            compatible = "mediatek,mt8365-camsv";
> +            reg = <0 0x15050000 0 0x0040>,
> +            <0 0x15050208 0 0x0020>,
> +            <0 0x15050400 0 0x0100>;

Fix the alignment.

> +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&camsys CLK_CAM>,
> +            <&camsys CLK_CAMTG>,
> +            <&camsys CLK_CAMSV0>;

Everywhere...


Best regards,
Krzysztof


