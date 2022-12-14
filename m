Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BAFC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouDI6cnOaIoztk2PRALWy4IKONuGF1DSjCqpxbYNJxk=; b=MHjqL29Pz9qLTDCdNIUMLCYRAL
	qgftaA3B1lYfTM2O7umdsHSorYftihJ4eg0rLHszBBwlQfwxU8c8ZT+hpFgr+06MBWSpMA2DlrkPw
	ib5lOdBMvd4F7dbW/bNuj92RWtXISyx58XOJAcfvgsolx5YATa4osdwdg2RxSZXFzAg0nbaZFzOYX
	KJQdsldsaCGfpTRV0LOYiyBOvbD0atlfTbEt/B/DgdCsZwLDEyHlXboA0VbdECUmaAy6AVOqyaL0s
	SoSfdhjdt+QR+tzJQMBOrNqNGUrwX8g707NDgbXDZ6p/lCtBAny3qlw2hV0hnO/7FwbVu34wnfBaE
	0M6uGljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5TbD-00082b-CQ; Wed, 14 Dec 2022 15:23:11 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5TbB-00080B-27; Wed, 14 Dec 2022 15:23:10 +0000
Received: by mail-oi1-f179.google.com with SMTP id e205so2836894oif.11;
        Wed, 14 Dec 2022 07:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouDI6cnOaIoztk2PRALWy4IKONuGF1DSjCqpxbYNJxk=;
        b=sI3nm4Ahyke1WKzWj5wYL7DlVvyYt47B5zUAnX/DIkUMoulbniNcFf9sOKEir3NiMo
         i9a6+/EBlskSBz0HUZTH1biHl4kc8OLYTDvesVEteWpcIoGRC7FiocmmTkJRwVJGa9NL
         z1jsOLbcCKYrFgVSldnlEyI3aOxxY6zAvn+NLoa1/x3kDz86PjL99qfO/6c/18esoces
         gxyY5gCYT8958rL5myYyoXbKmMuFMFz5U8MFVWjqkG/G2+q0momynNX6+phjoZsEoxRT
         0rsrg+XDZBdWSHwKuxkmvio/RwwPPnCOG91On5zWqNe0h1P+cbl5l0pCfv1Gpnz1h6WU
         gwjA==
X-Gm-Message-State: ANoB5pmUkXz3+N6L18CIyDxsXL5c/JL+n9zKM5WG7LRHEFLQ4qtshD3j
	CeHFslElDDifgcpCPTrzVw==
X-Google-Smtp-Source: AA0mqf4oHWFQDFbHrb0un5jDmskwu4sWe12M9AHaugqiwUAK2YPl2aiDgHY2kxekG6aUz82yumTWYw==
X-Received: by 2002:aca:e18b:0:b0:35a:5645:171a with SMTP id y133-20020acae18b000000b0035a5645171amr12256377oig.13.1671031386915;
        Wed, 14 Dec 2022 07:23:06 -0800 (PST)
Received: from robh_at_kernel.org (rrcs-98-6-157-194.sw.biz.rr.com. [98.6.157.194])
        by smtp.gmail.com with ESMTPSA id 13-20020aca0f0d000000b0035e461d9b1bsm5728492oip.50.2022.12.14.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 07:23:06 -0800 (PST)
Received: (nullmailer pid 1084187 invoked by uid 1000);
	Wed, 14 Dec 2022 15:23:05 -0000
Date: Wed, 14 Dec 2022 09:23:05 -0600
From: Rob Herring <robh@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, khilman@baylibre.com
Subject: Re: [PATCH v5 0/7] Add minimal MT8365 and MT8365-EVK support
Message-ID: <20221214152305.GA1080797-robh@kernel.org>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_072309_122434_C183E486 
X-CRM114-Status: GOOD (  14.99  )
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

On Wed, Dec 14, 2022 at 12:43:39AM +0100, Bernhard Rosenkränzer wrote:
> This adds minimal support for the MediaTek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
> 
> v5:
>   - Reorder top-level entries in mediatek,mt8365-pinctrl.yaml to match
>     example-schema
>   - Use consistent quotes
> 
> v4:
>   - Remove pins-are-numbered references that have been holding things up
>     now that the patches removing it from dt-bindings have landed in linux-next
> 
> v3:
>   - Remove a number of components that are not yet supported (they will
>     come back alongside the corresponding drivers)
>   - Address issues found by dt_binding_check (mostly fixing pinctrl
>     bindings)
>   - Address issues pointed out in comments
>   - Reorder patches
> 
> v2:
>   - Add missing dt-bindings documentation
>   - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski
> 
> Bernhard Rosenkränzer (4):
>   dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
>   dt-bindings: irq: mtk, sysirq: add support for mt8365
>   dt-bindings: mfd: syscon: Add mt8365-syscfg
>   dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
> 
> Fabien Parent (3):
>   dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
>   dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
>   arm64: dts: mediatek: Initial mt8365-evk support
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>  .../interrupt-controller/mediatek,sysirq.txt  |   1 +
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++
>  .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
>  .../bindings/usb/mediatek,mtu3.yaml           |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 163 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 343 ++++++++++++++++++
>  9 files changed, 712 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

You've missed the subsystem maintainers on this series. gregkh/linux-usb 
for USB for example. They can pick up the individual patches.

Rob

