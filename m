Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C96C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+bw9uWVkGzQiCESlzI/1AS8Gr6ronwYEU0kEQhW2Io=; b=kBKI1D2RMnIwCgYykaRo1bm7+O
	rYyQJbwWe1z60RT1h/PuP1ivxRbIoYEt7Ozzq3yTr0KzsLMfuORLA3eD3Z7PKPKrFE1ou/gY8dRqO
	e4jTBwNXQxVroH22ZqBpbpjVFzpnOIADFUIhedGXHcziLt7MsuDlyiZ3ejkMMsgut03cHpzYkXEFv
	tuGomEi2BeXF0bB3w2N4iNh9xuCBnYlSNHgTbXTFqffA+vmQa4NUjtvyQ77Eg6AP1Tcft5pkqnd1K
	3KwRDciG9medbpo9MoOKlD91doU+zSQatP1ycjPODKKKp9akrNIikgPqpw3ZBWxfBJmSkciqzDTaY
	xcv4Evbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebs7-00CUId-2a;
	Tue, 21 Mar 2023 13:17:51 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebs4-00CUHg-2o
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 13:17:50 +0000
Received: by mail-oo1-f49.google.com with SMTP id f5-20020a4ad805000000b005399cfd276bso1737633oov.6
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Mar 2023 06:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404666;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+bw9uWVkGzQiCESlzI/1AS8Gr6ronwYEU0kEQhW2Io=;
        b=GNAGIMFYox5b1x/mJ9dd1OgfnE6cvSQNuQxIDLRUxQINr5VR4gsSvWB2Z/HTvi7VEP
         i26wJwmdv3lIj2dE2la/1gom8ZYraMzBeblqCND8+zzYfHfGzkl5QAZkRo3DLt86JDOJ
         xWt3QDWP7Jm8oNhowG34N3rbmccg4S3gnVAx/l/lriNvbFHnxTxYOLwk6bue+XSU0Nal
         fKJD+MinIHqlda7xyjz7oC5bLE+8CcNoerAQEL/P2pKrt7zlsZYSAF7fjzRAfvRpXPvx
         SWIJKe/c/gVaPs+j1Oi2RfFH4yCgFh21d9s2izFWH3Q3jK/caiyGXy/a0ciVbpaHn8tX
         QxIw==
X-Gm-Message-State: AO0yUKUgD72xrvqXqVCAe/QzBNjeeDI2N9+cKDjw1ptgdat6yftE6USJ
	v7x1xEJciNa8YfchAJrUrQ==
X-Google-Smtp-Source: AK7set9zkfWwc7X0rtHtNOCeqnm7TEO0gLY54wqZimKCDFlf1NpV8xssLoeC1yHWNAQSg8fvxF91zQ==
X-Received: by 2002:a4a:410d:0:b0:53b:4b21:2345 with SMTP id x13-20020a4a410d000000b0053b4b212345mr957043ooa.2.1679404666427;
        Tue, 21 Mar 2023 06:17:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r8-20020a4a9648000000b0051134f333d3sm4910366ooi.16.2023.03.21.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:17:46 -0700 (PDT)
Received: (nullmailer pid 582074 invoked by uid 1000);
	Tue, 21 Mar 2023 13:17:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: daniel@makrotopia.org, netdev@vger.kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, sean.wang@mediatek.com, devicetree@vger.kernel.org, edumazet@google.com, davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org, lorenzo.bianconi@redhat.com, Mark-MC.Lee@mediatek.com, john@phrozen.org, nbd@nbd.name, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org
In-Reply-To: <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
 <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
Message-Id: <167940235606.530981.2024563505368619498.robh@kernel.org>
Subject: Re: [PATCH net-next 06/10] dt-bindings: soc: mediatek: move ilm in
 a dedicated dts node
Date: Tue, 21 Mar 2023 08:17:45 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_061748_916051_C15EF0C9 
X-CRM114-Status: GOOD (  12.73  )
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


On Mon, 20 Mar 2023 17:58:00 +0100, Lorenzo Bianconi wrote:
> Since the cpuboot memory region is not part of the RAM SoC, move ilm in
> a deidicated syscon node.
> This patch helps to keep backward-compatibility with older version of
> uboot codebase where we have a limit of 8 reserved-memory dts child
> nodes.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
>  .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.example.dts:63.59-60 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


