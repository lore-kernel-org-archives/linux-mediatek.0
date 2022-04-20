Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNe8J02LeQGL1Q8T5O2hPjK9VLWv94nmoEXFLzBJvKs=; b=iPnK6S1PeKU0m+
	+Ss8hl3IJdZ9gnakCm08iGHwLxkItUMzQWwl2Ebayc5vudayZA6qADc0+ojr4oBvhiQAWPAHeSvP5
	7XK7ezGlhDtDO+np7JXwHDzLWuTpeTWvlqzq5u+zPJXGO1kjc2WIplB1Vd7GLc/SGiOdGGRy5c8K0
	NuQJBWFBcm416xgLKERpuDYGU+iPtqOp6w1s6wr1cl6TlKzEbiXzauP4wutJsWBlOiCtB16lcF9zc
	frbFRB/x/mUmeqmVFR6J1ejf2aU/0X6ZhS+asuWrzIbSGKJWJgU5QA9W91JNR3/cyPDWJw8aLAdWb
	pT3JQ9quSRKK/k4h21PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhAPu-009Eja-Qx; Wed, 20 Apr 2022 13:30:46 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhAPB-009ENa-SQ; Wed, 20 Apr 2022 13:30:04 +0000
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e5e433d66dso1930944fac.5; 
 Wed, 20 Apr 2022 06:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sTuVq0s9OtPDutsc1Wu98n4D94RYOqx86fIxGxCByOw=;
 b=57sIOYIfJ2cI4vceswPSvBH4t9i5kM9TF7mOyLJ55R1DrDy8UHe8atHZchlLQibMN3
 hfMHNOxUnFL47N/vLfn6tsCQTBmU1iP1EMnaU0bsKn6gpCd5ld9qG4YEK93UUwPgsRxr
 UFEg4fOhSFpVK+gwYUSFsJ1/QuSMPYRodVohLD2qILij6fWfEBb08C6EYl7GFJFSRjFF
 EjKhgqB/EFTmDr/T9kZU8RX6kvSybVIwEHkc/cKThSqR/SRu+5MqfsRbRBg3NSVwnmjw
 XSo4tcbEAEzM6GoOmB11nv99MPbk4N26gyaqlr0PsosTmlarRN/4SpUDPiWNhQUKZuGe
 CA/w==
X-Gm-Message-State: AOAM5327FKLa7tqYvsFGTmDVXG/Dke6Fx6+UCKBRN7qlOd8RuiglsBBP
 dBPqz9jLbMhO0hRqu3ORrA==
X-Google-Smtp-Source: ABdhPJypu6fAb/Ix1HcbjShAF/0D/wrocyPLP/X4IvjoEm4gGT2fBwDtznF7vSwT1Q3Y0gSuwcgGDA==
X-Received: by 2002:a05:6870:b68e:b0:e5:c836:882b with SMTP id
 cy14-20020a056870b68e00b000e5c836882bmr1541641oab.177.1650461397291; 
 Wed, 20 Apr 2022 06:29:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m65-20020acabc44000000b002ed13d0fe6fsm6197382oif.23.2022.04.20.06.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:29:56 -0700 (PDT)
Received: (nullmailer pid 1168371 invoked by uid 1000);
 Wed, 20 Apr 2022 13:29:53 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, allen-kh.cheng@mediatek.com,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Longfei Wang <longfei.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, srv_heupstream@mediatek.com,
 Maoguang Meng <maoguang.meng@mediatek.com>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220420073440.31649-1-irui.wang@mediatek.com>
References: <20220420073440.31649-1-irui.wang@mediatek.com>
Subject: Re: [PATCH] dt-bindings: media: mtk-vcodec: Adds encoder power domain
 property
Date: Wed, 20 Apr 2022 08:29:53 -0500
Message-Id: <1650461393.995094.1168370.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_063002_008877_BEAB3E82 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, 20 Apr 2022 15:34:39 +0800, Irui Wang wrote:
> Adds encoder power domain property
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


vcodec@18002000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

vcodec@18002000: 'power-domains' is a required property
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

vcodec@19002000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

vcodec@19002000: 'power-domains' is a required property
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
