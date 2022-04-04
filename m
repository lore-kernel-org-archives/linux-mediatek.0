Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7461EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAMJIQm1HNLg8WGzZzP2selXcsv6/Yv/kZ3YHPrND6s=; b=1G2aIfzW7JZ96Z
	ZaKxF2o9YsBiEsF/o5os6KJbrXHdRXVfeEXPTJmdq8eK2jAEiSLR+TDjJziUtkBMRss+Wft/HXrM4
	XFlOQX9+esV2yicMkjsUJ7expHboijjTlrjKr31VBp0w2fDFSlCs16pF53w2NwspaYuhd+tLeXoho
	Z/VL4wfpI1uYO+bImM/o3F2DlGYwpwEmX/9h5vOBsx6J7paM+AOvHi/irweozjZ2pmq6I9QWe3SlA
	nduLygYqd/hRrRdjjQdnwV0/smXwEZAyn+UUhNR5j0B47n9pn7n2STJ9VrBC9ZN4Z1jlX40AyYeBX
	8BN47pw+rDSow2db5qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbN93-00FDNz-OW; Mon, 04 Apr 2022 13:53:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbN82-00FCp3-RM
 for linux-mediatek@lists.infradead.org; Mon, 04 Apr 2022 13:52:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id h16so6010134wmd.0
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Apr 2022 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=orXe1JLKj3eWkUs/vG6CQ9PlkRdOEKGc+GDPsHVwVSQ=;
 b=WyC0hsymaV9UJHv9CIIXVy5p7WAbo4Q2u4e/nQE8HTIvyVX+5wdSM80i3/YtDNM3dA
 nFxLwmjCRR4j+YdelKwwidGUkes+I7rlhDtqLa3IKaZNsVPlTlDq/QO0BQ6qVP0je9OT
 1KQWXQYyhRucsEQVJGeqI/1oag6jR6qJ+cpdIBQP61sV6fJrMSJdJNDvAWu7ipDaovrk
 jaFOfrKqq+R7VrCp0uRUIN43Uty6xJJp+LO/trJziABkk5vpAwDRXNfUNDUkNiYdTG4w
 fMycIQYXPOwR68torwpWP58A1znnlOrwUM69KoiR6aDC7bxjiCIH4ZcT3MZx21MsXAXX
 uvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=orXe1JLKj3eWkUs/vG6CQ9PlkRdOEKGc+GDPsHVwVSQ=;
 b=N+Iy6m8JJ4KcoMJP+JRlfFjq8hX4ouxqd7L+2XCGGq77bjuadTmdPR2S+nGUXYBBae
 0uaB9P6nHeMgYBPAvcJsZg3zAmG+EGwFfMOuC019A183w/JAwNKfBFVDk23YEo2iFkN9
 UOGw0Yy5zte7S1qi/y8MvSf8WbNF9bgUY+Z4dcV3kMIqHnW/G8m9RL7Z536Cip/TcRJ3
 /d1R2NhJMnKkt6GumYrMvhuodlr4k0mkcvEniKoa6QXFEZvGZQJUrIHRP93XFGvMkwf9
 OnHt0G7ZzzeUY4qgh0imkw3gMpEunBpSxnhxtExSb/uwTRHjuhndSNZ1sIhdBdAfAypK
 o/AA==
X-Gm-Message-State: AOAM530LXJvhvDpGBoV0OFMlLj0H6x+FBb9Zl57LXT02Yvdz27ui+yjG
 g6gR4tPnkwPyiODEhBUFMHbCTQ==
X-Google-Smtp-Source: ABdhPJw89vFXoJ5SBTppIPxaGW7RRNdgP5jNO3Xa+1KintPNh7R1vx4e+9D+kd9JBLe3HI5yTVSsVQ==
X-Received: by 2002:a1c:e908:0:b0:38c:782c:2a62 with SMTP id
 q8-20020a1ce908000000b0038c782c2a62mr19502739wmc.135.1649080340874; 
 Mon, 04 Apr 2022 06:52:20 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm8269468wmp.5.2022.04.04.06.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 06:52:20 -0700 (PDT)
Message-ID: <14c921b5-4240-a026-252a-d5fb60836b34@linaro.org>
Date: Mon, 4 Apr 2022 15:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220404131818.1817794-5-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_065222_992417_2689F6FA 
X-CRM114-Status: GOOD (  19.15  )
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

On 04/04/2022 15:18, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> Changes since v1:
>   1. add a blank line between properties in dt binding doc
>   2. rename ecc-engine to nand-ecc-engine for the generic properties
> 
> Change since v2: none
> 
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> new file mode 100644
> index 000000000000..7d57570ad617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI-NAND flash controller for MediaTek ARM SoCs
> +
> +maintainers:
> +  - Chuanhong Guo <gch981213@gmail.com>
> +
> +description: |
> +  The Mediatek SPI-NAND flash controller is an extended version of
> +  the Mediatek NAND flash controller. It can perform standard SPI
> +  instructions with one continuous write and one read for up-to 0xa0
> +  bytes. It also supports typical SPI-NAND page cache operations
> +  in single, dual or quad IO mode with piplined ECC encoding/decoding
> +  using the accompanying ECC engine. There should be only one spi
> +  slave device following generic spi bindings.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7622-snand
> +      - mediatek,mt7629-snand
> +
> +  reg:
> +    items:
> +      - description: core registers
> +
> +  interrupts:
> +    items:
> +      - description: NFI interrupt
> +
> +  clocks:
> +    items:
> +      - description: clock used for the controller
> +      - description: clock used for the SPI bus
> +
> +  clock-names:
> +    items:
> +      - const: nfi_clk
> +      - const: pad_clk
> +
> +  nand-ecc-engine:
> +    description: device-tree node of the accompanying ECC engine.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ecc-engine

Slightly slow down resends (max 1 per day). You sent v3 without giving a
chance to review this.

Wrong name here.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
