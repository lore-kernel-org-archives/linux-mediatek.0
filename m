Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ABBC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/m/5Zx6YWRoOYnl3pmXu3jEFfouFNyEhIVMOFA1n6c=; b=hIb47tS81E32kSA5rE1CZBnDYm
	MsBqfYy/xGeX88bUE+Afd9BRD3p8qowQhZiqbBx3BgdAbDPi4M7D0LYE0imRaLJ77f9tSGD2wZdGn
	XZ19D+VUAwbtgcQ5DH1lJsUV5jv9s7EP0ct1m5R2A1ptbjPHQdHatl5y7KDuZVr4jfRLsFNeDZkg1
	i91G9tAVkCg9F9sBAil2J/lYCMgpAxEjtOd3sC0CJxepQ19P4U7JKSiSKOL9M1a7H1VvaBhNBcgbu
	mHEeqdR6KIdQefuDxU//9bVqG10jzlht+jEjOEv2YzrpoiDooBmpmHHiOMpKUDdq9T93yIDQ9EwOr
	rx69ggdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlY3S-001WxU-UY; Mon, 02 May 2022 15:33:42 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlY3N-001WtJ-Dl; Mon, 02 May 2022 15:33:41 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-e5e433d66dso14594884fac.5; 
 Mon, 02 May 2022 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dD2Y3vOMl2tr/XEHZTE9aVU35/4IL1e3I9wJvGZpl2M=;
 b=e1c0TynzFl+8x88YVMrnQxhZBL/OVYExDlotfIUa/Wn/bRz4lsM6E+S9T1jWfQ+gvc
 lS/4V2YLc3cwytH/dCaK9Pc7czRMlFpggmIFN5fXR4mgsIjeFIl8zajuNSPhaX55WBDW
 yslIC9NtGnY70dRC4sDH3PQm28zLGA4M5xA+dB9g/ymB9QyRK2WKfouXIIFLrhqmZkoo
 PxoQw0EQjaKuxbz1XTTlPFyEY+mjS80JaacMSbGWUfST5uE7FL5RQfTBEWXwJ3cFGM3T
 vNNjaBKMCN54AdY+Gzo9ezlfyaxbX3CDDrPghLhfBarXWpp1p51kfupafdmzPeoYXR/S
 4pUg==
X-Gm-Message-State: AOAM530hA+JGiHV91QJOPPR/4zBC1y7TK/Riz9/oH3bZ+Rc9u8dMBhrz
 FxbGEDZvLSZChB72rgEu3A==
X-Google-Smtp-Source: ABdhPJwlvrfdTgjaRkOgo9CjTot/4UQsJOPWIqMwz3jzRpOIldIk7cbmsTcBnhJhaUqFMsfxE8sRng==
X-Received: by 2002:a05:6870:e9a0:b0:e6:9d2:ff42 with SMTP id
 r32-20020a056870e9a000b000e609d2ff42mr5126607oao.7.1651505614677; 
 Mon, 02 May 2022 08:33:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r4-20020a056830120400b0060603221240sm2950294otp.16.2022.05.02.08.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:33:34 -0700 (PDT)
Received: (nullmailer pid 1161773 invoked by uid 1000);
 Mon, 02 May 2022 15:33:29 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
In-Reply-To: <20220429211111.2214119-2-nfraprado@collabora.com>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk, scp
Date: Mon, 02 May 2022 10:33:29 -0500
Message-Id: <1651505609.475123.1161772.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_083337_505397_F7A3AEC2 
X-CRM114-Status: GOOD (  13.50  )
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
Content-Type: multipart/mixed; boundary="===============0732312766861451600=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0732312766861451600==
Content-Type: text/plain

On Fri, 29 Apr 2022 17:11:09 -0400, Nícolas F. R. A. Prado wrote:
> The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
> required, the other two are optional. Fix the dt-binding so that the
> optional regions can be omitted and passed in any order.
> 
> Also add the missing minItems to the reg property and update the
> description.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


scp@10500000: interrupts: [[0, 174, 4]] is not of type 'object'
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

scp@10500000: memory-region: [[25]] is not of type 'object'
	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb

scp@10500000: memory-region: [[27]] is not of type 'object'
	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb

scp@10500000: memory-region: [[28]] is not of type 'object'
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



--===============0732312766861451600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0732312766861451600==--
