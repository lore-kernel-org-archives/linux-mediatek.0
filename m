Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D72C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Apr 2022 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMUQiNedUmL15TkWXdVSWzjYORJ6rlXP+AgL9O9lrvE=; b=jDqs82c9TN7Mah
	Abn+QKkl7Ylv9P+AZ93XZ9hJk/p9TL5fW7+TBBrBzdvd4fC6Xpav2pF5uOsb9PMf5ISoOjBk3RXA7
	MVRcLo9GID6H1baJbD+43Dw/hStP3qGM9m3rCj2CWdainPkYKFnALiSriFw5IqyLEj0elLYUVmBNp
	1zrbtd3KU4v4PguZLLtEQOWMf6gvhJm+1hJksfIM5OUg5Fhb3v026Si3aFoYcb0aQnTMbJTEmgtxX
	4NggAQaEw6facaZ6Oi0oDTFk3+05opeExEWyE6oc1Urb7Px+by0Rz1MPSBhCeO5fOBnvHkULHS1lf
	xMjqACWupZtBmQM7Y3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2Ic-00BiRd-B2; Sun, 03 Apr 2022 15:37:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2IQ-00BiMw-Jo
 for linux-mediatek@lists.infradead.org; Sun, 03 Apr 2022 15:37:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id j12so3342785wrb.5
 for <linux-mediatek@lists.infradead.org>; Sun, 03 Apr 2022 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eDFMs7EElGjgVXSi1G28DbTYKExJESQOSQxzUR+xKqM=;
 b=lnbGEtlamweYbPt09LLUZZmY1OEhSHyThX/GrCcNl6El493Cx8SaCgtQqMkE17prcX
 J4LfZqyU7meN7ZKBqPiiaqhEz48OQnHqLhAsz6amdsKGeWKgN2kgs5yDi1GqwrBu1PqX
 Gbm4GlMU9jc9lgq2KPbfHuzHqtBonIWl+PqeIdB1b5Cpz4H5t624nAEKk4q2tOus8EbX
 ze51geAwftRiFo4VVmbrccFnbRQ7WwQvc/jJ302DDtrGiVE1dmAAG1WFhfGrfBVVPuXt
 MzsCJc8qaT8+5p98TbBnT842jG/MYim7LYqY2m7SIu/Lrq4rx6om8VKeS5BRzJaTTgMA
 j12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eDFMs7EElGjgVXSi1G28DbTYKExJESQOSQxzUR+xKqM=;
 b=lM9MQJ381Dg8tmzVtd5ZOW7+kVo06Mb0ILbZ1EfeDwWIjG4cL86VCk/zBGGggdFoxa
 3dl86coZs7OSsV+L8Ueozx2GUtMsQux5i+AugjW9qw2UuuXAVF/OkYJtwSnYEEoQWMqV
 /D46aKUe+m0qIKBnP7jRT9TQXLTPTB2FeA8hx0/VW9FMRSfvB3fB5kI5wrkQxmGmV+vd
 Zvn4YErdWD+plZX6bSOENdeGBW02ANsUQDriEFAk4UhXdrGSk2P+1yzi9oKbkLCH+ZMB
 zrRXFJ5GEUG7suZEq7mBeJ/FZk15mV7iEvFURQQwilVTLEbmpqSKkSY2p0c5OZs2UsOy
 Jsig==
X-Gm-Message-State: AOAM5319/vMHPoLGPnjFA7Obox5iOOFCVqGIr+Wv3vcl9YjZcnG06g8S
 AL4qQEt+noGJlgn5JoihIcqZaw==
X-Google-Smtp-Source: ABdhPJzno6MvWVjCp8ZyExCrnTXODZzrLF1ozU8hgn7hmy1XaDLiOBxe1FQc2Cu1D2oZQReX5TZNZw==
X-Received: by 2002:a5d:47c3:0:b0:204:5b8:225c with SMTP id
 o3-20020a5d47c3000000b0020405b8225cmr14059127wrc.474.1649000259960; 
 Sun, 03 Apr 2022 08:37:39 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 m63-20020a1c2642000000b0038e5fa06b50sm4607976wmm.31.2022.04.03.08.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:37:39 -0700 (PDT)
Message-ID: <817dda10-39db-adfc-376d-a3d5e037937e@linaro.org>
Date: Sun, 3 Apr 2022 17:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@lists.infradead.org
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
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220403131154.1267887-1-gch981213@gmail.com>
 <20220403131154.1267887-4-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220403131154.1267887-4-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_083742_684012_B8F0386F 
X-CRM114-Status: GOOD (  19.70  )
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

On 03/04/2022 15:11, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> new file mode 100644
> index 000000000000..166c6b50b9d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -0,0 +1,87 @@
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

One blank line, please.

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
> +  ecc-engine:

The nand-chip.yaml defines a nand-ecc-engine, so how about using that
one? I know mtk-nand.txt uses ecc-engine, but for new schema better to
use properties from existing YAML.

> +    description: device-tree node of the accompanying ECC engine.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +

Rest looks good, thank you!


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
