Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA5C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJIseX7fbuePlCt3lfYMHgc5yPjn6sJZXZh9GvE7Yuk=; b=lYJUNa4/bjJ63CRezYcv806TIc
	1I1B0EV8TybW/DNtlMKUYbb0vX5iQxMHzjEuUBvPiDoSVvIKkLqdIzjgOQ8NXCkKqXwo0zSbpPGSu
	k3b4x9uf2DE9s6QoZIMwFxfJhmgxV7qSpejKY5NxHNaJwJNYauQi3raOGfH/SS059t6D3m/rpr338
	nyqtGRYsU7Wdouo5pgN+ULb3rYwMqlsLCddpZpRE1Kv9I3U3pCQTjIPl77SGHt6EejSdjumrcgoIg
	KbE+gtGjA30q3Es6fbB4hKJVnUBIRykKi1eqbcV8u29A9BYy19UBd+AkRxzJSPmK+OrA2A71ewFb1
	YtnXhStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Ii-001InT-Gp; Mon, 23 Jan 2023 20:20:20 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Id-001IlW-3F; Mon, 23 Jan 2023 20:20:16 +0000
Received: by mail-ot1-f54.google.com with SMTP id cm26-20020a056830651a00b00684e5c0108dso8021878otb.9;
        Mon, 23 Jan 2023 12:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJIseX7fbuePlCt3lfYMHgc5yPjn6sJZXZh9GvE7Yuk=;
        b=Hx3EeGppugw1rrB0P0AbC/ZXU+ipPkvwVssTW4EOo9hIAjj4dL96FT63PN571Yw0fu
         1jczsZcX5LL8iRM3Z5Aq6ksLUNEpLY8BYATs61gJFa9Wv/CM7Mp+zZbByBBFNkvjHDfF
         3dvqIXB4bQnv8bce1nA+6w0anPxg4bx14tMAc8gbnD3Oa8npAbllgDIsbswZuCgJUCX7
         fKPzy1l9zCoWnJWpY4cQr02zqDZ2iHdjXqfYJX4+6Mq+j6pyh3/dym+1fSffCYSbLqGu
         plna/pyepane3KK9FzZ6qdlDd4DODHLdJ+yfQhmBiVmlRdrHUOcbcYPkMI8mi/Kbk5y9
         ynsQ==
X-Gm-Message-State: AFqh2kpfsk4T1bv33OZWqDvK2far/Up20RVFG5vlSg8ysS1460cLVcsh
	8pBw7ELtBS9gri5A3REDuA==
X-Google-Smtp-Source: AMrXdXtXo7dsxEuvQDVOZCdjfJoyKEoO2vYkeou3j0fcHEiMdz4hYCE8ilnCls8sDDy5APHHbusT7w==
X-Received: by 2002:a9d:370:0:b0:66c:dd2b:e1ad with SMTP id 103-20020a9d0370000000b0066cdd2be1admr23494564otv.23.1674505212954;
        Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x17-20020a9d6291000000b00677714a440fsm52560otk.81.2023.01.23.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: (nullmailer pid 2457598 invoked by uid 1000);
	Mon, 23 Jan 2023 20:20:10 -0000
Date: Mon, 23 Jan 2023 14:20:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese <sr@denx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>, Peng Fan <peng.fan@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, - <chuanhua.lei@intel.com>, 
	Long Cheng <long.cheng@mediatek.com>, Rajesh Gumasta <rgumasta@nvidia.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Palmer Debbelt <palmer@sifive.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: dma: cleanup examples - indentation,
 lowercase hex
Message-ID: <20230123202010.GA2455859-robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
 <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_122015_155707_FEC6ED93 
X-CRM114-Status: GOOD (  16.60  )
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

On Wed, Jan 18, 2023 at 07:01:44PM +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - use lowercase hex.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
>  .../bindings/dma/stericsson,dma40.yaml        |  4 +--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 2bedab1f74e0..d34d0fa62ab5 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -113,21 +113,21 @@ additionalProperties: false
>  
>  examples:
>    - |
> -     #include <dt-bindings/interrupt-controller/arm-gic.h>
> -     #include <dt-bindings/interrupt-controller/irq.h>
> -     /* example with snps,dw-axi-dmac */
> -     dmac: dma-controller@80000 {
> -         compatible = "snps,axi-dma-1.01a";
> -         reg = <0x80000 0x400>;
> -         clocks = <&core_clk>, <&cfgr_clk>;
> -         clock-names = "core-clk", "cfgr-clk";
> -         interrupt-parent = <&intc>;
> -         interrupts = <27>;
> -         #dma-cells = <1>;
> -         dma-channels = <4>;
> -         snps,dma-masters = <2>;
> -         snps,data-width = <3>;
> -         snps,block-size = <4096 4096 4096 4096>;
> -         snps,priority = <0 1 2 3>;
> -         snps,axi-max-burst-len = <16>;
> -     };
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    /* example with snps,dw-axi-dmac */
> +    dmac: dma-controller@80000 {

Drop unused labels while you are here.

> +        compatible = "snps,axi-dma-1.01a";
> +        reg = <0x80000 0x400>;
> +        clocks = <&core_clk>, <&cfgr_clk>;
> +        clock-names = "core-clk", "cfgr-clk";
> +        interrupt-parent = <&intc>;
> +        interrupts = <27>;
> +        #dma-cells = <1>;
> +        dma-channels = <4>;
> +        snps,dma-masters = <2>;
> +        snps,data-width = <3>;
> +        snps,block-size = <4096 4096 4096 4096>;
> +        snps,priority = <0 1 2 3>;
> +        snps,axi-max-burst-len = <16>;
> +    };
> diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> index 664ee61a00d8..57395a810719 100644
> --- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> +++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> @@ -147,9 +147,9 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/mfd/dbx500-prcmu.h>
> -    dma-controller@801C0000 {
> +    dma-controller@801c0000 {
>        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
> -      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
> +      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
>        reg-names = "base", "lcpa";
>        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>        #dma-cells = <3>;

Indentation?

