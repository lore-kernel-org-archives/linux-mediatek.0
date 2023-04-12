Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E9C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+uWMvL1JjVQ02tgsbvMPzDV91ZJCdH7YAirSLH3VxE=; b=Q7oRhNxPQmAC5Wp5hwV3xNrbzl
	YR8EzxalguRwlZ7+B64QU97b3mXBsnT1JlBdiuYKJYW0W+NqKZ32K7Mb4fcKg2AUumnXI8NolZArr
	TgjNu0rcEvCvk3VILTcM5npt8gyejggYpLeXjEx95Dv0bLPellVzSFXAVvSltcxZvt3yMtky+t1qX
	gRrlN8pM5vyRaOzSI3Qpo56PcCQFGEwkAzpovN5tqfU3y+Wf5ztOvKl7c8rs7Jrqdenq9nG2V7sun
	5fRWBNYYGGTl5VCrLf5KFVMlBpinDckV3Hs3WbdZv/h7Y6lyt9QbTLWpMxcdDFI/07vHlfyqJsE4F
	VkmiZq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDp-004YrO-1t;
	Wed, 12 Apr 2023 22:45:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDm-004YmI-1L;
	Wed, 12 Apr 2023 22:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v+uWMvL1JjVQ02tgsbvMPzDV91ZJCdH7YAirSLH3VxE=; b=F9Xya8tfiMi57mPSH40zC4CQrc
	gFKNhC5vE36nMku6A7QdIqce5Hh7ndH+En6ptkuOwNf9QTPH74N/5o5faHjSRa7xJq4GLU9oneEgR
	OsA76cmt0UXH0kFR3cDerMMGEo5kQQwOhlZvio91ISSYHR0lnI+PKhG4rul6wSCFP1Br1JuqGfY3I
	EJGCwU3xWqMlUOorOWZS5vlwW+lAZeblOiyO2fGFzWnvqCwPVJ0rLvT2+G1oSGmreIcqYakIWiBIr
	yxQTQqUYgbM1vXaJo91tMMJgIEQzKPid9NA96cDvwFaCav6uvBx+slcuAITO1pmB6O4vBpbR98yVm
	HxRp415w==;
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdA-00E2ML-16;
	Wed, 12 Apr 2023 21:04:18 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1842cddca49so15515416fac.1;
        Wed, 12 Apr 2023 14:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333428; x=1683925428;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+uWMvL1JjVQ02tgsbvMPzDV91ZJCdH7YAirSLH3VxE=;
        b=SslR/lcAml5Sgt+n8xKwp6pXm9GkSrZx+d2/F74tJ9Hb+jtZL4FtIeUFGUSkaoQqLV
         /6/wjswYnrt28dootuZDAczvK6G1RvjosCCR9C9i3BwjvOeetAVGz49myDFACyiQEZ8t
         O1IjBRtbgKwEc3eVIoBeWdhOcobJ/0wm8ni2UXA8o/C8/2I9AvGgHgd/kSgdt+8QlLv7
         2JOKeEZmzkZHQ0GCBwbAOusBfHL4v7Q6gX6mKMnuH+ATw2wkjoI27ptKTDZbtm78g+p8
         urX1ttdKtnwjENfXOpQ4uDJBcKPcnSGZ/v2vqCGdFw54HKBrbo7Z/FCwdv1KIkmICGDg
         tK1A==
X-Gm-Message-State: AAQBX9fRRWb7vwaTyqDGgwTIdLtG517QWX3w5w569qwPwViVTOlXN7Gf
	dRiK30JQaUjDH+tebp+A1Q==
X-Google-Smtp-Source: AKy350ZGedVWO+UH7Kb/1/nuC17CI2iBehcLz3EF/x0xZ+eL9nRB9pTxfFGFz39F3+ADZj4wEBMRIg==
X-Received: by 2002:a05:6871:592:b0:177:c62f:b059 with SMTP id u18-20020a056871059200b00177c62fb059mr104163oan.49.1681333428270;
        Wed, 12 Apr 2023 14:03:48 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ef42-20020a0568701aaa00b0018449ae08cesm65854oab.13.2023.04.12.14.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:47 -0700 (PDT)
Received: (nullmailer pid 3200531 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, chunkuang.hu@kernel.org, linux-phy@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, thierry.reding@gmail.com, ck.hu@mediatek.com, kishon@kernel.org, chunfeng.yun@mediatek.com, matthias.bgg@gmail.com, phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vkoul@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org, airlied@gmail.com, p.zabel@pengutronix.de, jassisinghbrar@gmail.com, xinlei.lee@mediatek.com, robh+dt@kernel.org, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, kernel@collabora.com, u.kleine-koenig@pengutronix.de
In-Reply-To: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319295.3190915.16401727674710547355.robh@kernel.org>
Subject: Re: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220407_404421_3A2944AB 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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


On Wed, 12 Apr 2023 13:27:17 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795, using the same
> DSI block as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-6-angelogioacchino.delregno@collabora.com


dsi@1400c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dsi@14014000: 'port' is a required property
	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb

dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb

dsi@1401b000: 'port' is a required property
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb

dsi@1401b000: Unevaluated properties are not allowed ('ports' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb


