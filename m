Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E40CC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygHaLsykW/JknWclh9KeXRlEeFhGEqXBXYa/Vg1+fhQ=; b=bkv84Zhudz9D1t
	iG3Df77HsEAH9bzTd4s2qifgTpXOmOGvnXno79z6/fNWyuMBguPGIH8CQ6jV/D6vxszfi4/qY0td5
	9gJ8fdLXjnF0OVJutS+uSZr2/vFkFlp3huWx31lmhZreuR2RGA37SWmVS23LXFE5ww380SWDA9xMp
	4jcmr3W+Q6A7oBoVRaj2EK3JKuC5sD7hlxEui5V+Mom70RO3wJl3kX1LNbyZEj3Rq4tucQRL7cy04
	j4DyBhF40ngfd/gnVTjSK7iovv0U9Jz/fYm6bs65sjsRzM0ceM8FaEGD92EC9amKBJQYhwaLSCZSq
	164G9R5JZDxT7eg5fscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRXD-009QPV-LV; Mon, 21 Mar 2022 23:33:59 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRX0-009QLw-Dq; Mon, 21 Mar 2022 23:33:48 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso11523892otp.4; 
 Mon, 21 Mar 2022 16:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iqlGJqAp9J3mBYn2W544lt1cPtvAWKBsX1sKB8vjaFQ=;
 b=QrbqD524LDIO7lfQi+qPSPWu5d+Mt+9KcRqiLuFfvlUBtMlnv/f73mhqjyavZbcIjO
 ObN1K0rkamH9HuMxlpJGE9LZdROcL1Tz961zucNsi/Et6rbJbVstXCebglhtoELKR81F
 sa7tdEcFLaUv69IXex/Upbrr/07H4Zo5iyObOL7e2G4HQr5cxB2m5VL9LXNiT2jd3kuO
 8HIRrm2oXeZY2o/SuRHt6idFjBW6Fg7CY0Ix4PW/JY0b9LEV1m6hK/qCcu7SUmmV+wcN
 zfFG37pPlXxhfD0gtskZoe5XGxSuaCu/p6OIa6nz5OEoOFzfsUCxJicLfzCFBgaDDL8c
 lAdA==
X-Gm-Message-State: AOAM531TDOTsADIScYdcb0V36M9t5DLbE+nHC0qLSD+74fGnbOc5PXXm
 WtwR6ruRwxB0gIyaBVWUvQ==
X-Google-Smtp-Source: ABdhPJzxxO+k7l8znxP0vjnY2lEafBroFgaKOlvFVHd8JKFt8pjObiL7SWOFKakst91i39pW6Q1Hgw==
X-Received: by 2002:a9d:5f16:0:b0:5cb:51de:6761 with SMTP id
 f22-20020a9d5f16000000b005cb51de6761mr6071903oti.139.1647905625156; 
 Mon, 21 Mar 2022 16:33:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm8228647otk.65.2022.03.21.16.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:33:44 -0700 (PDT)
Received: (nullmailer pid 751258 invoked by uid 1000);
 Mon, 21 Mar 2022 23:33:43 -0000
Date: Mon, 21 Mar 2022 18:33:43 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YjkLVwvxvOKr30qL@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_163346_490955_68A08CF3 
X-CRM114-Status: GOOD (  15.74  )
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

On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 2. Adds new property "mediatek,headset-codec" for getting headset codecs.
> 3. Adds new property "mediatek,speaker-codec" for getting speaker codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index a781e7aaaa38..aa0476eedd38 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - mediatek,mt8192_mt6359_rt1015_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
> +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
>    mediatek,platform:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
> @@ -27,6 +28,25 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of HDMI codec.
>  
> +patternProperties:
> +  "^mediatek,headset-codec$":

Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
prefix too.

> +    description: Holds subnode which indicates headset dai.
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Standard property, don't need a type or description. Just how many and 
what each one is if more than 1.

> +        description: List of phandles to the headset codec nodes.

More than 1?

> +    additionalProperties: false
> +
> +  "^mediatek,speaker-codec$":
> +    description: Holds subnode which indicates speaker dai.
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: List of phandles to the speaker codec nodes.

Same here.

> +    additionalProperties: false
> +
>  additionalProperties: false
>  
>  required:
> @@ -44,6 +64,15 @@ examples:
>                          "aud_clk_mosi_on";
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
> +
> +        mediatek,headset-codec {
> +            sound-dai = <&rt5682>;
> +        };
> +
> +        mediatek,speaker-codec {
> +            sound-dai = <&rt1015_l>,
> +                        <&rt1015_r>;
> +        };
>      };
>  
>  ...
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
