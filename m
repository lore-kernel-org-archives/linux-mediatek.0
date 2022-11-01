Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9300C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XX+1tQyagjhLYJ+rVwkc+QparYH+oKNVJedlnYRSRY=; b=Dd4ZfomWmNgeq3wB6He0gA9rbd
	1ljaZMlmF88Fgnfn4a8SpQVG6DNx24d0aAvtxmC/9zysejf1aQH2UaOLkYf0pGpnwfBg5uJdMdnpT
	0F+d33uEUFpkR7Q235lLV7jsm/l/59oOrQMGcTchdonBVMan6b760hCDIqp1IG+bLARhsqHCJBYdf
	BdwhO2fPIEbivP+sJleuloyiUJ7JsRfGG0SiDIrG86YRoVR9Ow3VXDEwqrAc0nxTiqip8RzPfD1bR
	zCyosFgnYkOvLIabQKzmu+U3rDwzUpCqyrzABo2M73MxmuTR2bJ/Bjb4R9CSDhfMXSncs68QN2A1B
	m2a69kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqzP-005Dmo-L9; Tue, 01 Nov 2022 13:07:35 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqzE-005Dje-EM; Tue, 01 Nov 2022 13:07:25 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ae8117023so16696482fac.9;
        Tue, 01 Nov 2022 06:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XX+1tQyagjhLYJ+rVwkc+QparYH+oKNVJedlnYRSRY=;
        b=E9W1pylaowGQ6acaou9HypKVx24HTARDC7DFirORbHsdj3mX6m6zTbbyMpL9uU1NcR
         dvhnl08lNfy5CZmR7Eg5X1p+KjWgv2eqHPf8k9YzIlgXE2eZv2oJelSOhAhf1BPrWnZL
         FfiQKsAmAZZtqXIdetr+56wcq58qtMTUtjI+uuPQSvujlmuy3m5s4GBgdSFd+AofPISb
         R5sg7ayKIohqjrueC/S8Cp4NYC1uSs2PhjTLbRY83TU9dANhLuWJATa9Q4n6FIYRAogr
         VFyBK8MPiN6Rt7D+LgT5Pgknd0TXQ3w5dW7Dq9n6EBBlkP4GUdXP1H5BZn+HDfL6KknD
         Dwfg==
X-Gm-Message-State: ACrzQf2xeM96p/cjV3sAy34gw+oub3N5YF+TEJagvUWaEYAVHzdKrHDL
	UsO7E5tAIdZr38I/j1v/cQMllgpuNQ==
X-Google-Smtp-Source: AMsMyM5PVguR3A71y3EsDEyzo/z7r2ozcy8ECLngqVTJ5asiI6SB11hF8kaDv6QHFIEGOshaVnNKlA==
X-Received: by 2002:a05:6870:1607:b0:131:dcec:98f6 with SMTP id b7-20020a056870160700b00131dcec98f6mr10612050oae.162.1667308039338;
        Tue, 01 Nov 2022 06:07:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a9d5e0b000000b00660e833baddsm3836746oti.29.2022.11.01.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 06:07:18 -0700 (PDT)
Received: (nullmailer pid 991499 invoked by uid 1000);
	Tue, 01 Nov 2022 13:07:20 -0000
Date: Tue, 1 Nov 2022 08:07:20 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: examples: add a list of templates and
 solutions
Message-ID: <20221101130720.GA963805-robh@kernel.org>
References: <20221028233701.572280-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028233701.572280-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_060724_505487_93C7ACED 
X-CRM114-Status: GOOD (  25.07  )
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

On Fri, Oct 28, 2022 at 07:37:01PM -0400, Krzysztof Kozlowski wrote:
> It is useful to start from existing bindings when writing new ones,
> especially when one does not know that much DT schema.  However we have
> several bindings which are not the best examples, so people tend to copy
> their issues into new bindings.
> 
> Beginners also might not know how to achieve some more complex solutions
> in DT schema, e.g. how one of two properties should be required by the
> bindings.  Some of such solutions are already in example-schema.yaml,
> but several other are missing.  Add reference with such re-usable
> design-patterns.

My main concern here is what's a good example today is not tomorrow... 


> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/examples.rst          | 63 +++++++++++++++++++
>  Documentation/devicetree/bindings/index.rst   |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/examples.rst
> 
> diff --git a/Documentation/devicetree/bindings/examples.rst b/Documentation/devicetree/bindings/examples.rst
> new file mode 100644
> index 000000000000..710eea81d8b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/examples.rst
> @@ -0,0 +1,63 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Examples of Devicetree Bindings to use a base
> +=============================================
> +
> +Following Devicetree Bindings in DT Schema are a known good starting point when
> +writing new bindings:
> +
> +1. Simple SPI device:
> +   Documentation/devicetree/bindings/iio/adc/maxim,max11205.yaml
> +
> +2. PMIC (MFD) with several sub-devices:
> +   Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> +
> +3. Battery charger (power supply):
> +   Documentation/devicetree/bindings/power/supply/bq256xx.yaml
> +   (but use vendor prefix in filename)
> +
> +4. Clock controller for several devices with different clock inputs:
> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> +
> +5. GPIO controller:
> +   Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
> +
> +
> +Re-usable design patterns when writing your own bindings
> +========================================================
> +
> +Following bindings show how to use common pattern of writing bindings:
> +
> +1. Property required and present only for one variant.  Property cannot appear
> +   on other variants:
> +   Documentation/devicetree/bindings/example-schema.yaml
> +   Line: 212
> +
> +2. Excluding properties, but none are required:
> +   Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> +   Line: 155
> +
> +3. Excluding required properties, but one is required:
> +   Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> +   Line: 91
> +
> +4. Array with numbers (items) from given range - min/max:
> +   Documentation/devicetree/bindings/arm/l2c2x0.yaml
> +   Line: 74
> +
> +5. Array with numbers (items) from given range - enum:
> +   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +   Line: 101
> +
> +6. Uint32 matrix, variable length of two-items:
> +   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +   Line: 278
> +
> +7. Phandle to syscon with offset:
> +   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +   Line: 42
> +
> +8. Variable length of array (e.g. clocks and clock-names) but narrowed to
> +   specific variant:
> +   Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> +   Lines: 33 and 71

It seems like some of these that are just a single property we could add 
to example-schema.yaml.


Also, perhaps a reference to this from writing-schema.rst.

Rob

