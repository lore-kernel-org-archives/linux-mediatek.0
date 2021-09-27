Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1775CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 12:23:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40A361058
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 12:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D40A361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90GKCA+mkUARAtoflllfa1HkNtwVAZUxj9gZsvpM4lY=; b=TOz4oPZttAuo1Z
	r1/PVybtV7ENigszebjAwKzHEuSkKID5pI6dCS24Z8q0/dUf+vsskW5fOtv3Z0cl7qL+rXQggnx1a
	iV50KswJd6Irb3A38UbNYvTTHDCER1iLAOgIzflm0NopcPpBryptwORUfnGFAN09NEd7o9wxsiEe6
	sNdGb2JMTEYz+mwe9Y1msLnKd6j2vALMtzlalTJ1yU5msduARq2LN2FcqfE0bp2M3JvZqMwF/wVih
	kg39td2oXGzmtVUwTgmsV4RZA8ILtjoD649cG8MVyy2ASgaDuBm+YzqxJ+/McfyfORKT2S6xbZ/Et
	R2bRd7XqR0jvQKtDOMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUpfV-002bS7-9r; Mon, 27 Sep 2021 12:23:37 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUpfI-002bOE-74; Mon, 27 Sep 2021 12:23:25 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so17249563otv.4; 
 Mon, 27 Sep 2021 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=M1JxjeIOmKat6HvCouZk2WyJoVDL3ELYlgAx1y+djF4=;
 b=NDNep+Jrkql3nHxlzGyFoyZSw64hiBNkHrCZrYljfxWCUKpaem34+fub/jEqW35sqa
 GVUXl6dKS/Cc11jLlSdxhAY+KlA5fUP0lL3nujMfl3XFmlrBsSnU5+bkTnuXW2aNh0oT
 iHDAo4QRvAkiXk3IDgp7GJl9nSYWiw4PUZN9S3uw0UKrt06r9SzJVfcfem2u4PmhTmLh
 9teRLG9JRLFpewNz60VxTnyIYL9jXJEtTEcFwTmXVJAcWDjMmcLNGKE2MSMp1qHgGCvj
 O8BQ3sDWsGTH00iXRE0HxLjZ41qmke5LRQqAdof/Yhhw9DlhLeuiV3doqrszC8mrV1dy
 2jlg==
X-Gm-Message-State: AOAM5328oGtCeNpooZPEOkJPk1CQAkH6qn6VkKUoNI3ETVccSx9EUadU
 /bIAcNyH6mIx45TRHtuTHA==
X-Google-Smtp-Source: ABdhPJxPboMBJ7atlf4V2758iIymolXl+RlULWf5ZVJnB5v+aaNUyKh+KewyhDhEFZ50jt9f77a3wA==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr17216398otb.283.1632745401264; 
 Mon, 27 Sep 2021 05:23:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o126sm3844592oig.21.2021.09.27.05.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:23:20 -0700 (PDT)
Received: (nullmailer pid 3097152 invoked by uid 1000);
 Mon, 27 Sep 2021 12:23:19 -0000
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: herbert@gondor.apana.org.au, linux-serial@vger.kernel.org,
 linux-clk@vger.kernel.org, linux@roeck-us.net, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hsinyi@chromium.org, mpm@selenic.com, seiya.wang@mediatek.com,
 enric.balletbo@collabora.com, fparent@baylibre.com, john@phrozen.org,
 sboyd@kernel.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
 gregkh@linuxfoundation.org, mturquette@baylibre.com,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, wim@linux-watchdog.org, robh+dt@kernel.org,
 linus.walleij@linaro.org, sean.wang@kernel.org, Ryder.Lee@mediatek.com
In-Reply-To: <20210927023419.17994-1-sam.shih@mediatek.com>
References: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org>
 <20210927023419.17994-1-sam.shih@mediatek.com>
Subject: Re: [v5,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date: Mon, 27 Sep 2021 07:23:19 -0500
Message-Id: <1632745399.256353.3097151.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_052324_279481_2D3FAB6C 
X-CRM114-Status: GOOD (  13.88  )
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

On Mon, 27 Sep 2021 10:34:19 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v5 : fixed yamllint warnings/errors
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:25.13-32.43: Warning (reg_format): /example-0/soc/pinctrl@1001f000:reg: property has invalid length (128 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:23.33-58.13: Warning (avoid_default_addr_size): /example-0/soc/pinctrl@1001f000: Relying on default #address-cells value
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:23.33-58.13: Warning (avoid_default_addr_size): /example-0/soc/pinctrl@1001f000: Relying on default #size-cells value
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml: pinctrl@1001f000: 'gpio-ranges' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533169

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
