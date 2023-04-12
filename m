Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F842C77B77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djvELGPiz2X7+nxWdiXWHHU3TDK+TW+pNOfsGeO7c30=; b=hYl7SHff3Xx67nS0/FdTEqsjKg
	7YgY4z1x7X8+xVYCosbW0gmEEKl6k6B1/vpDb2KmpUO8k1dPNlpK00Lgyv6Z0DXS5YSOF7O02kjwq
	85fYwPlCxJtm9K5yh8ZMtNBchBSVDAVcAwyWUUebSlq70p7XJ1YkuQ1oQ4sco/Aij7k4WoqGUg0rd
	7XjoS3m4AVFjRW4A6UaGN3d+A7ntt7k5bl+OPWC1mzQFxSZbZ4RSd5xVkm8dj4kwuKmPdzQRyfbxd
	Ou7yFa8nBMpq3q77F6ZCUBUmO38pQVUHv3mBtCL3biTCiKJxq+8+6lfXkzFsZ0GFQTl53tcGXhTZd
	4Dcaw45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdK-004LQH-0h;
	Wed, 12 Apr 2023 21:04:02 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdG-004LPM-2p;
	Wed, 12 Apr 2023 21:04:00 +0000
Received: by mail-ot1-f48.google.com with SMTP id bu14-20020a0568300d0e00b0069fab3f4cafso6179854otb.9;
        Wed, 12 Apr 2023 14:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333436; x=1683925436;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djvELGPiz2X7+nxWdiXWHHU3TDK+TW+pNOfsGeO7c30=;
        b=Ea99Tpxu3hmlbechHElRrjx2IjOArOP556N/tKqn8sJhSdNg+GR4AimgM+AxiNckA0
         Igx6IEXZ4FPWpGyOcpec0qjDO6s3CKudzAHEA5RixohqagsaterH4JQdv0QDuFb86aaE
         FZzms6dO3Xebi8ACq2H+NEO7JsOEPdSAeBX430lpdX3NBINNR1XIcNaBL0dKH5KK6Y6p
         UqIv3/3Mo6fjFIqpbZyA4BeDjtDVFPv6ovRF9iXBSSEKH9JOZHGIJAz9xQrOK347SCdO
         eUrFttc+5jVzifFSXBWvf/tcUVUE6nxWUsuk14cDndToRTIs9eJz1LWux7WkwDb3kmnO
         ZYNw==
X-Gm-Message-State: AAQBX9c9YDrIRpoXDqmOyMKtBQlTFvGAisar8d3KJzsnM5BFVz7CPz+5
	z6DaXCUuXqqe/PowNRXQNg==
X-Google-Smtp-Source: AKy350ZPaxQqCIVs+haHZm96AVYtUTY7Qo26AYMJnx+qKKJp/dAi3OmoVXf+cund9KGn0KbJXB+BWw==
X-Received: by 2002:a9d:7d0e:0:b0:6a1:42ee:1f5e with SMTP id v14-20020a9d7d0e000000b006a142ee1f5emr6568051otn.0.1681333436323;
        Wed, 12 Apr 2023 14:03:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a056830019600b0069d602841e7sm20803ota.72.2023.04.12.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:56 -0700 (PDT)
Received: (nullmailer pid 3200539 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel@ffwll.ch, xinlei.lee@mediatek.com, dri-devel@lists.freedesktop.org, jitao.shi@mediatek.com, thierry.reding@gmail.com, phone-devel@vger.kernel.org, matthias.bgg@gmail.com, kernel@collabora.com, jassisinghbrar@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, houlong.wei@mediatek.com, chunkuang.hu@kernel.org, chunfeng.yun@mediatek.com, ck.hu@mediatek.com, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@kernel.org, vkoul@kernel.org, ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319867.3191434.734350328370744826.robh@kernel.org>
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_140358_909993_F5D4875D 
X-CRM114-Status: GOOD (  10.30  )
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


On Wed, 12 Apr 2023 13:27:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-14-angelogioacchino.delregno@collabora.com


ufoe@1401a000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb


