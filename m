Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+dTTxQrKimai1uHWVW0F2nOp4BX1IchojgPfevilC8=; b=rhqQ4hihAxi4VY
	VYHYvCG6rdYaeLoNGs4wrTepm8Ifry1u/B5gN/sxfCT1+ke8xeDy2fnBNUl/CDIZvGEGNCieslf86
	Hme50z1uDRx9BtyDIf/X0Kchbk/eKPiZdQ9VEFDpIwYtteUNIB/Amew+7pPMh/R6RrVBWE8X7dWZc
	PU/f+Hcd1qqpX3Rux960EQxiiZFTDkGaXvdu6nxg4xuuB6iiZETkxyjy/usQR9SmsqXHPrqfiABh0
	sJ0FYWMCpRMbtwAzNdErS+wzSC5pI599LwGL/dTB5QxUOSD6cSosX+3E2Bh2Va4uT99ribvNmKU1O
	UUuqngrgYjdJRMIzwg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kC9-003rAn-Md; Mon, 13 Jun 2022 13:33:29 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kC7-003r5v-1E; Mon, 13 Jun 2022 13:33:28 +0000
Received: by mail-il1-f182.google.com with SMTP id d6so4243971ilm.4;
        Mon, 13 Jun 2022 06:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=n5jciRFgHV7TEd2xOcxd5PlRxTUMR+//Y01eSUV2T1g=;
        b=qY6UVQ29btAzCLpjVKHrxPkWC2c+rciiY11EBe6olqVOroUNAttfOOeSJC50GcdYq+
         akg4NHfNAlLQWJHXJLwBPNVIgV/CMcT4jj1YtR8pgaW2JG6u71+RM0D9yzktlHHZ9QW4
         iTJgi8WvfADzdwym62mSO+BKotR7OjIZDEvTMYNvyprnlmuY8lEW/RirfpZz1MU8Mb0y
         QUmeHH9/ZJaW+ALFsy7FW+H2R7M5qLG5AIB1fxpR/vdB30xFeOha0xPOkd/FlqIbN6wt
         +saDY2cNNjf1yDVfkLVPMSgQB1vkscdUA9BJ3LzYkbC1wSbQvull7uQY8FPd3XUAe/u0
         HACA==
X-Gm-Message-State: AOAM531L6JP3/vZq07c/Q3snBWr5Nn9TkYyrx2LeYP2zQBqpPomCNBGm
	dmNVJ9zXJ0md16BUxho5VA==
X-Google-Smtp-Source: ABdhPJwPF2UYqCLy0MjugVo/d0pZuzKLj39QY8kf66rRczmdaVGt+15ynEKyrpTTZPzJBoKuuGYMHw==
X-Received: by 2002:a05:6e02:1b04:b0:2d1:af55:eb92 with SMTP id i4-20020a056e021b0400b002d1af55eb92mr33611511ilv.227.1655127201997;
        Mon, 13 Jun 2022 06:33:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i2-20020a02ca02000000b0032e79d23f8fsm3510831jak.156.2022.06.13.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:33:21 -0700 (PDT)
Received: (nullmailer pid 3564135 invoked by uid 1000);
	Mon, 13 Jun 2022 13:33:17 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: daniel@ffwll.ch, chunkuang.hu@kernel.org, msp@baylibre.com, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com, airlied@linux.ie, wenst@chromium.org, jitao.shi@mediatek.com, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20220613064841.10481-2-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com> <20220613064841.10481-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Mon, 13 Jun 2022 07:33:17 -0600
Message-Id: <1655127197.559996.3564134.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063327_090354_03419CAB 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, 13 Jun 2022 14:48:30 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb: dpi@1401d000: clocks: [[4294967295, 40], [4294967295, 41], [4294967295, 8]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb: dpi@1401d000: clock-names: ['pixel', 'engine', 'pll'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

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
