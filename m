Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE34C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfFMpWgQMG0IdQ2eBeXK2Tul1Mki7+boKfuvZh6DHJo=; b=AtMZwduxV741Ghd6j95swIBk5x
	QHIgNZyxIZ4HTDunamfduLwWEQy8dsisz2dhwX+IhEJ6PW00IcR2m+kLJ1e4R7spcnVREAA+cv7xM
	ajv8T2HrIOd526VpORDEZAzTA9K7dmvQpp4crqAtDAC6DM29S6boJpnegpcPjMg0kMU9Ybdh9G9MO
	7O8fptAyC7qq22QrjMGxIM3y4ypkw7+q9J5VUeAeh4YSkadpl5IbX/FqiUAO5VqgoJIh2hD5Sx2HZ
	eqo5O+aPbffasgasDbcCqRvtA2NI3/7EsUmnJsagEm3sJuDpR6/MRBgIc/oBdYvQoseZ0dXleiRzu
	9aRFffJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDg-004Yo6-1r;
	Wed, 12 Apr 2023 22:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjDf-004YmI-0C;
	Wed, 12 Apr 2023 22:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TfFMpWgQMG0IdQ2eBeXK2Tul1Mki7+boKfuvZh6DHJo=; b=WUIx9RtpgtBJPASsi0jN4zjir7
	YPbPGvCGqKE1JJEa4hFe/V3XDX7undcf+BYQqL8ZhmtJ+AJVMUZon9XzMsMMCFVwi/ZcICBdn/2dW
	RW877oEWi7wOdESDfAKtN+5ilxqFuVwEOXGaef+0WXMS/lQ7zqvEJKuMcPPPWcjNvS6OrK9S1pG16
	ebWMMkHyrefM+X+q5PaNbY6Vy4AB09UYwy2jQ8I4TyWaablkBu5Vbtt5D03KeycG3IfpXsADABzmc
	KNFhFqb+m7+PXDAJKs3QxUpAxTyREc/VcSBA/QiPnM7AVIeg3A1m1M/goPKysRddDdT5qZtrcU1Cm
	hkvovpMw==;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdA-00E2MK-17;
	Wed, 12 Apr 2023 21:04:16 +0000
Received: by mail-ot1-f46.google.com with SMTP id 39-20020a9d04aa000000b006a1370e214aso4443923otm.11;
        Wed, 12 Apr 2023 14:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333426; x=1683925426;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfFMpWgQMG0IdQ2eBeXK2Tul1Mki7+boKfuvZh6DHJo=;
        b=hErW8FNRoLyAbscI3k05lEiXg/dF4qG39o38zHRc3HfLX+BThnLKITGekht1Wjgz3E
         EdJDSJhHP+l0iIXy443GYyjZgKXVoGPBbkLrh0C/cnHDxj1xa8aT5ssZSgqch3Wt8GdM
         e48DVcRibdVLEbsgaRbI/WQFBwttIei3k5J50svaBr8ctl/Pu7X9LhzIbAxhdvMUP0WF
         juSTjopJER2oRHh05GlZyAhLqOhoSstVZ4mzViNH6VYq1BCBhKzh8lX8mcTeGMNRb6py
         w5ZnvrCqMEOVbvbXsuxQa8apKudTFddppCtD40YODYybCL2CHcnPPicRtqEkyDaJRa51
         JHwg==
X-Gm-Message-State: AAQBX9cP+/cnbgiXq7w596sh2ma0ro6pVoRGLLHFq64Mo3ESjLSdSQ7C
	PFDIxve/2MHUax0PjrqaQw==
X-Google-Smtp-Source: AKy350YLhEpo7rXHjTV6gXj47sYFzm89X6rddWa9+uaqMiDd86/UG5bnCUKz49WwfP/Noj0SnCMTXg==
X-Received: by 2002:a05:6830:1d78:b0:69f:a557:fa01 with SMTP id l24-20020a0568301d7800b0069fa557fa01mr7090154oti.9.1681333426607;
        Wed, 12 Apr 2023 14:03:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l10-20020a0568301d6a00b006a14579a8besm41057oti.43.2023.04.12.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:45 -0700 (PDT)
Received: (nullmailer pid 3200526 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, linux-pwm@vger.kernel.org, kernel@collabora.com, chunkuang.hu@kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, houlong.wei@mediatek.com, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, vkoul@kernel.org, chunfeng.yun@mediatek.com, daniel@ffwll.ch, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, xinlei.lee@mediatek.com, airlied@gmail.com, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, kishon@kernel.org, ~postmarketos/upstreaming@lists.sr.ht, thierry.reding@gmail.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, jassisinghbrar@gmail.com
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
Message-Id: <168133318912.3190428.16120880490622098945.robh@kernel.org>
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220401_574933_E4B89F27 
X-CRM114-Status: GOOD (  11.37  )
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


On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-2-angelogioacchino.delregno@collabora.com


pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
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
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb

pwm@1400a000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb


