Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE89C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBNw7xXQioxzgqOQKpFDuGhIR7glkYA10EWg8sjqgd4=; b=tSpbgp2gQysEUD+s6UEbtNA3oX
	RbBNnvDb4DfyKCu8Wfb5HuAc2MfcpxRKYEueYiqAdaFMefTjzSipl+4LrJvV9Is5cWVW8XTDhMJu4
	SUTKlrrrX1+Zb8+cQA74WTiGiMBLealWZ/lQalOGm0bas6El16YLnRMCu/Sl3vGHQe5aFY/spmYk/
	mVu6twql+47fb8s8YP+4iUe7znhp7YYnffwh9xlqYlKZyp6z3yFg+ZXqTfzlMaPmMtWdNEFvXpZwB
	8i3nCM0huXM1+pd3GczzgFtY4xPn1dBMC019eyUGoe6DyvsI7T7+4vpVZBOfI/eWW/iQq8RPY2SsG
	YNE4014Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uAC-002VEH-JD; Mon, 27 Jun 2022 19:12:48 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uA9-002VCJ-RP; Mon, 27 Jun 2022 19:12:47 +0000
Received: by mail-io1-f53.google.com with SMTP id y18so10583770iof.2;
        Mon, 27 Jun 2022 12:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rBNw7xXQioxzgqOQKpFDuGhIR7glkYA10EWg8sjqgd4=;
        b=osONvEM3/lGv5zkPAyHiNLQzsfDo5ftCkvGH75F9zAuQWKc32hsv4+i/UOe1/KfBVh
         j2XxKU5Cxlq5T1wjEe8G5YHteKtpd9wmT/7wp8yBJNo7QOs/4CGqN0a56ac7Wqnrkiuk
         nrjxgiQGMHPEBasW5VpfzmQzT57k4bi7meWaH0HLVHumwdRQ/2fdoJgnhtzGsIDIW2Zi
         uktcZlOyyaWJ37OY3NbU0gQI0fltdYzsayp1R2ci8XZLdNvKqFzx4sm9XRYl39yrEGAX
         OPlOJmNmV6GVsDC661PgA8yABHtFOQS6EIaFDUNzfX3R9Dy6Qu2zFs4rCWcF8k4bn0UE
         cApA==
X-Gm-Message-State: AJIora8GnWtmqd7OcUxQaofiptZRHQyLMctU9gV8qNHG6imQFA3DIdYy
	QAET13T8JB76Asyiz6oxcA==
X-Google-Smtp-Source: AGRyM1u2B6Wf8qeEwHG7bcsztdsHikAwGp9sb2uWhc4F9Mv0d1Tnjqyg8TLRYOrF2g2p1n5I0n92IA==
X-Received: by 2002:a05:6638:1686:b0:331:c1ed:9f55 with SMTP id f6-20020a056638168600b00331c1ed9f55mr9142195jat.201.1656357157501;
        Mon, 27 Jun 2022 12:12:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i6-20020a056e020d8600b002d90ac862b6sm4876207ilj.55.2022.06.27.12.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:12:36 -0700 (PDT)
Received: (nullmailer pid 2785808 invoked by uid 1000);
	Mon, 27 Jun 2022 19:12:35 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623193702.817996-3-nfraprado@collabora.com>
References: <20220623193702.817996-1-nfraprado@collabora.com> <20220623193702.817996-3-nfraprado@collabora.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks required
Date: Mon, 27 Jun 2022 13:12:35 -0600
Message-Id: <1656357155.295131.2785807.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_121245_930589_72FF7916 
X-CRM114-Status: GOOD (  17.46  )
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

On Thu, 23 Jun 2022 15:37:00 -0400, Nícolas F. R. A. Prado wrote:
> All of the clocks listed in the binding are always wired to the XHCI
> controller hardware blocks on all SoCs. The reason some clocks were made
> optional in the binding was to account for the fact that depending on
> the SoC, some of the clocks might be fixed (ie not controlled by
> software).
> 
> Given that the devicetree should represent the hardware, make all clocks
> required in the binding. Subsequent patches will make the DTS changes to
> specify fixed-clocks for the clocks that aren't controllable.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Undid clock list changes that allowed middle clocks to be missing from
>   v1 and made all clocks required instead
> - Rewrote commit message and title
> 
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11271000: usb@11270000:clocks: [[4294967295, 94], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11271000: usb@11270000:clock-names: ['sys_ck', 'ref_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11270000: clocks: [[4294967295, 94], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11270000: clock-names: ['sys_ck', 'ref_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@112c1000: usb@11270000:clocks: [[4294967295, 94], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@112c1000: usb@11270000:clock-names: ['sys_ck', 'ref_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11270000: clocks: [[4294967295, 94], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11270000: clock-names: ['sys_ck', 'ref_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11201000: usb@11200000:clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11201000: usb@11200000:clock-names: ['sys_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11200000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.example.dtb: usb@11200000: clock-names: ['sys_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.example.dtb: usb@11270000: clocks: [[4294967295, 94], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.example.dtb: usb@11270000: clock-names: ['sys_ck', 'ref_ck'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


