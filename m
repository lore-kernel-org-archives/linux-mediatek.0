Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5027C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcniQLxiusdPWrJTwSI658IIBrfznx/owaoC9HoWu8Q=; b=RQp+UdzAlLK6Xh
	ww3xkjht2dN9BS/EczosKGDELe8eGFXexcUz+IuUgxPPe2KJKqHisp21uvWf0xsgni4X5gFNUHisI
	gCx/S6UIagYFmhQKmTrqAb4Q4g+IotDK8A6glm1fIny60TvJWdwjC02oyXUMzZpmqh38fRQTT9eTH
	MxmHj0JlNouYPDjSDRMAfd17i4GP3aZqljsYX8+VrAnEnVqsSaDkUToKTMl/QNWad1EvlbdwjVlgq
	UzWg0Lnt5T5VKHSwxKIFX6pdTcEq+lrkco8THnonJQFlAiT33HZ3bKTF+xvhY7dhp4NdqdeU86U+B
	8CP2b3E1NPxKwv9gaCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCFA-001En7-1H; Mon, 06 Jun 2022 12:54:04 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCF7-001EkV-LO; Mon, 06 Jun 2022 12:54:03 +0000
Received: by mail-io1-f51.google.com with SMTP id q76so6856564iod.8;
        Mon, 06 Jun 2022 05:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=5oeNRqJHXQOxmP96SxoUW0sboEGHvZBA+hQSWA/WSEQ=;
        b=qS55NGZwBxwkAuidaDg/dgiMolfBCUcX48URIgokXfgj1aT9cEVttovTx/G0BxfNhK
         +TjKwEYHqUBYtPtXl50qDPJC0d+a/CmqM1nluXSOdHMZv6ZAXrZt88wMlI7Q5JWBin6R
         cybYrqKhGyGfqnwxZ90skwpsZ6I6XGEtGEEHBtNvKpuZ7V/H/K0AUX3P43nNZEOOULUo
         hAWEL8vBzNwa7JBqCcyuvdIRQkzvLi/QYDw/C1Wtf9sxRwYeBg0ZDWNrr+7B60ItIGIA
         +7ybymDYZ+G1HhuzTzYfLNwPRwh5MoLAZse+6VWw1z2ybk+Hfl+9nlZFlNcksuCmIlkA
         aTFw==
X-Gm-Message-State: AOAM533BzfAtngNGKCF1ffMpewZs2lErWuERz5+N+PC95wEuquNwyvlo
	IJCRbSItVP/bjMALlSbj7A==
X-Google-Smtp-Source: ABdhPJxl4I6L73YL+CEdCXFSlZqbhylQ9woaXl6Dvpd8oQXNa8pk/9ibMdKb7n3+JHc51K6Q4Iy7KQ==
X-Received: by 2002:a05:6638:389f:b0:331:b463:fbee with SMTP id b31-20020a056638389f00b00331b463fbeemr2681428jav.145.1654520038133;
        Mon, 06 Jun 2022 05:53:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f2-20020a02b782000000b003315c00e885sm5429712jam.0.2022.06.06.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:53:57 -0700 (PDT)
Received: (nullmailer pid 534475 invoked by uid 1000);
	Mon, 06 Jun 2022 12:53:53 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org, pavel@ucw.cz, Project_Global_Chrome_Upstream_Group@mediatek.com, krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com
In-Reply-To: <20220606051131.14182-4-rex-bc.chen@mediatek.com>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com> <20220606051131.14182-4-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v4 3/3] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.535645.534474.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_055401_726626_627B1D22 
X-CRM114-Status: GOOD (  10.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jun 2022 13:11:31 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: properties:compatible: [{'const': 'mediatek,mt8195-disp-ethdr'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb:0:0: /example-0/soc/hdr-engine@1c114000: failed to match any schema with compatible: ['mediatek,mt8195-disp-ethdr']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
