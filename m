Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anT15AoXNuI6X9TIRLoTQX5UaGKA7D9+zDrCudYseEM=; b=la62CQYdOL93s8
	gPsd8ApKUi+VaFA6e+QqMc79Uwl5sQE3GURi4vBBNSbQDeHZ2uROjYVKUxx8dDHbrh3D/9QLMQ73S
	hA7vzR5OfacX9ZPxeZDlbGosasqvoN2qTKSAWzmo0ODrQNEc+JDXmPuC8sb0kwHdmpofQxSzq04Oe
	XVrfEqp0DqmPgioKNMIhJTFelA5uPLOUihhbSS2BPOWPEVmagkGUZJI4qmlX3VLKqD35HNkPknpW7
	yNEo6JohnFuGptoPwdG9MbYBvqtvjXnpeesZa5hnOw/6nL1h17UaxM5HKtaaIe8Tzyi97+YzlcsCS
	tDYqNq3u6+QdbcNqFy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQ5x-00FmhR-2p; Tue, 26 Apr 2022 18:39:29 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njPy5-00Fjju-Nc; Tue, 26 Apr 2022 18:31:23 +0000
Received: by mail-oi1-f181.google.com with SMTP id a10so21627828oif.9;
 Tue, 26 Apr 2022 11:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qgmDW0PWpCTN6QAQccW/HQMdlWsW6QW4exSJtmSe5+o=;
 b=AnRnYj7qfNg0tfuMXxfPAlqmKvWuv/ZclQTo3O4OTeYuwkfCb9NZQvZZqn4aGdstAy
 vdbAbQPR/dDHZn4Ec/pJ8rHTWTXMnbv8wdp3sizHzLaGiqC6KR3Sz09qacMTUOuMNpeB
 ATLkIJtbUdPKrpFdQva8fJKDFm4Jl/mEAVMl/xhhdnv8J/PRB4hCCU2lm0oj6Jgf84Tu
 D7YAnOapTB4I5RR1UpvVQlEzWUFRJDnau3q7ve4soJq/k36POwV+Ejw1dn1yd4eDGaWO
 gBGMqZJRwLpfbI7AxMreeXwRIh0LbBDig4InISvSWtt9uky8MIR6+r6yOTjSBflJJq/w
 obaA==
X-Gm-Message-State: AOAM532PRWo/8wz0mW6zZl+Qqa2Olrq/BfQ47p9TAYfJzSia8BHbwRrB
 IhQUuWEGk7UDgsYS/GpwSw==
X-Google-Smtp-Source: ABdhPJzIL1Yhrx2OPNJPgILC3RYcFne6c582YL6nl/ypM4+HqTvmQMy38qg7I2jfWGPUHp/r+AUExA==
X-Received: by 2002:aca:c46:0:b0:323:1b2b:77de with SMTP id
 i6-20020aca0c46000000b003231b2b77demr12069221oiy.113.1650997880448; 
 Tue, 26 Apr 2022 11:31:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s2-20020a05687087c200b000e686d1386asm1079738oam.4.2022.04.26.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:31:20 -0700 (PDT)
Received: (nullmailer pid 2314030 invoked by uid 1000);
 Tue, 26 Apr 2022 18:31:18 -0000
Date: Tue, 26 Apr 2022 13:31:18 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: add power and gce
 properties
Message-ID: <Ymg6dn3PotTeWbqF@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419033237.23405-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_113121_828139_A8F59DE4 
X-CRM114-Status: GOOD (  22.30  )
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

On Tue, Apr 19, 2022 at 11:32:33AM +0800, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  power-domains:

How many and what are they.

> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.

Drop. Don't need generic descriptions of common properties.

> +
> +  mboxes:

How many?

> +    description:
> +      Using mailbox to communicate with GCE, it should have this

If using?

> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.

Drop

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type.

> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1

This needs to define exact sizes.

items:
  - items:
      - description: phandle to GCE
      - description: subsy id
      - description: register offset
      - description: register size

> +
>    "#clock-cells":
>      const: 1
>  
> @@ -56,9 +80,16 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>      mmsys: syscon@14000000 {
>          compatible = "mediatek,mt8173-mmsys", "syscon";
>          reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          #clock-cells = <1>;
>          #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>      };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
