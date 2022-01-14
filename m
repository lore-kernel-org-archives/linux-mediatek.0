Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80396C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4m2H31dtFsIco1z3iQTd2YhebN+zWIBOSRZdvmdoTc=; b=XVj6frT3mr9v9L
	8bVL869q5NG7hh2edwD0SCYT2MhtE5WmRxeGXIpVjRTsvie+9z6PBY2qoJEwZsI8WLnnB9iLH/In9
	Nh1fB1EZFPXmDQxwWi6nKA2967pBYA0YLjpms63AkJdxqilpBtjRd5Z4aCYXu1eug1OkOQ4voV+lN
	L3N0prH4CBLB+LoNWQHiUzCTlL4B07K4/lTGYl3x/XxWDn/Vc23GVFqfcDfUTgUsGisW2pwnB1LH7
	FfqIWUyzidGsaYsy6vN+L2HlwBFg28VXwMIuxgQX0kTIC+YY6xOuHUOqXfPgZTlF5vLwNZBAf2qE/
	U/PabwQ6b9tvMon/Mneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Nys-009SFb-RO; Fri, 14 Jan 2022 14:55:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Nyq-009SFC-4v
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 14:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B77DA60D2C
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 14:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6FAC36AEA
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642172103;
 bh=fbzOrTcVWMHwe8NYnOOThh9M+LxWh8BhoTufPAeLL6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nlVXNMjUzBWNq4IxYeuN2mw8Wv4CrnNXoRY6u66IKapqxTIh5Emf+PsXXvDTGOKMf
 O4/QworesZCDhNpxLBG15pfRGYqqHCARFXXfIhnxM74/9fouF9oJ19CsaMRnKjwI1D
 oLdAc52+jfaf73als9uhk+U3EVsExqXbrhK9JjVHrTExcEsSi04blEEEEFvmhVtpbC
 wt5GP09lO8pbpEqOOq3p0NILqazeSnDIzJ1myjfmTKaQ2guNUMYTAA510UOoFTizeC
 avIfXk9DI7saisRdD7oJAZHGUkZS2rBbb2+tjIto8rWgAH/HqoGjRTjNLGBl6CQRQt
 DP0MYpbn+ayyQ==
Received: by mail-wm1-f52.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so6034092wme.0
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 06:55:03 -0800 (PST)
X-Gm-Message-State: AOAM533oWI7+r3A6I9Qi8BKr4YCi17ikon79c53ZGpHsEIgS6SW1VfHN
 hK2D2jek/FT2D7tG5iZ7J/uHKUL/BrfI3CIGCw==
X-Google-Smtp-Source: ABdhPJwzXGgS37nQ5WIH5CwwyXmiIQINFU1EYMnT4phUgv1K8CLRkJexdtqgS+VKPxqrb7/prMlfSArv7Vo8g3DOlFQ=
X-Received: by 2002:a50:a6d4:: with SMTP id f20mr9330026edc.303.1642172101511; 
 Fri, 14 Jan 2022 06:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-2-guochun.mao@mediatek.com>
In-Reply-To: <20220114062408.9077-2-guochun.mao@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 14 Jan 2022 08:54:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+Mx4juudKmdpaSPyqxgATQZs9Bf052WWoOJQgb_3oJA@mail.gmail.com>
Message-ID: <CAL_JsqK+Mx4juudKmdpaSPyqxgATQZs9Bf052WWoOJQgb_3oJA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: spi: add mt8186-nor compatible string
To: Guochun Mao <guochun.mao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
 Chuanhong Guo <gch981213@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_065504_294092_CE77A3FE 
X-CRM114-Status: GOOD (  17.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 14, 2022 at 12:24 AM <guochun.mao@mediatek.com> wrote:
>
> From: Guochun Mao <guochun.mao@mediatek.com>

Use get_maintainers.pl and send to the right lists.

> Add MT8186 spi-nor controller support.
> MT8186 needs a new clock name, axi_s, for spi nor axi slave bus clock.
>
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index 4e4694e3d539..1a678751bcca 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt7622-nor
>                - mediatek,mt7623-nor
>                - mediatek,mt7629-nor
> +              - mediatek,mt8186-nor
>                - mediatek,mt8192-nor
>                - mediatek,mt8195-nor
>            - enum:
> @@ -49,6 +50,8 @@ properties:
>        - description: clock used for controller
>        - description: clock used for nor dma bus. this depends on hardware
>                       design, so this is optional.
> +      - description: clock used for controller axi slave bus. this depens
> +                     on hardwre design, so this is optional.

typos.

>
>    clock-names:
>      minItems: 2
> @@ -56,6 +59,7 @@ properties:
>        - const: spi
>        - const: sf
>        - const: axi
> +      - const: axi_s
>
>  required:
>    - compatible
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
