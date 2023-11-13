Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B2FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIUOg6xcD1mveQt4yAqYkPtye9ZANiCj61RnWxJZ9RE=; b=c6yDS5DUernjjUSTCOvCg5KTPA
	yyjmtksMoKSltjJBL/r9wpaw6K0FLfcGhMS14JTK+4mHBA/DEqXaULdniDySrsIUsU+LeJbbcXJdT
	i9v79w8jnFerP4LsAWUCaf8O+tSRpULBolemQC0o5FISoblUn+WYtC7BDGInXiBph16pSaNWgejw8
	nxv0ze5UudWWh3vtRwmVJF+OWUbaXfK/cyGiMUyQsy7Ef/AvBO1gsHuZujZr//AdY4E/kRMeH8i2H
	KZDNkoiu/sAggdajN3AjCLPbSaV3w3Jg2OpRGS4qlVWiyoqenfTtmJKD4xxFD/foHl2gZWeAGI7OX
	BRqGQqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2djn-00Ego8-10;
	Mon, 13 Nov 2023 20:40:51 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2djj-00Egms-0C;
	Mon, 13 Nov 2023 20:40:48 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2f28caab9so3030335b6e.1;
        Mon, 13 Nov 2023 12:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699908044; x=1700512844;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIUOg6xcD1mveQt4yAqYkPtye9ZANiCj61RnWxJZ9RE=;
        b=H0GAMnIAiNcz36z/TQze8SrMioAgSX3Br/bPHjFDx3P5/bD2GVJMY3rM2xdtTr+SuF
         GfF86ke3SPkA0voeNc8vl50o7B+K29GwUGrLq0eiXDYUPkhBJE3mgyH6mtTJsFnkKF7e
         j8Rkdx0OXHI1SxMspvk30PJsiN4MKsgyDYQzZage0rCdP3gBlGXwHBPZw9XedL+s6xfj
         hTZUgJa8syUlyM2qs1w5HIkHxJwadvPXptuVjHrfrrjOoWlEiynIX8TEonwMn7gs30ok
         oGu09cGxMz89mVtlO/CM0+C4dOeN9ZlsMAT+f55ZE4MuPLz4+mm+jc2IMVmQul4Iiehr
         tzHg==
X-Gm-Message-State: AOJu0YzaABKj/iz+57nO/oYtoAYrX/hErcy4lJoDTN0sgZxRfYt/oBvm
	JgDvbSDWRA8LVORS4RFUCg==
X-Google-Smtp-Source: AGHT+IE+M7ODqvletmAN6kZJ6EBjwVhQYADFHXDZ0Hl1ZJYebTPk7Dxy4FLEWYDWixjDGGboIOMmUw==
X-Received: by 2002:a54:4586:0:b0:3ab:8431:8037 with SMTP id z6-20020a544586000000b003ab84318037mr9564352oib.32.1699908044232;
        Mon, 13 Nov 2023 12:40:44 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b7-20020aca1b07000000b003af732a2054sm902879oib.57.2023.11.13.12.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:40:43 -0800 (PST)
Received: (nullmailer pid 38662 invoked by uid 1000);
	Mon, 13 Nov 2023 20:40:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, Nicolas Dufresne <nicolas@ndufresne.ca>, Jeffrey Kardatzke <jkardatzke@google.com>, christian.koenig@amd.com, Brian Starkey <Brian.Starkey@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, ckoenig.leichtzumerken@gmail.com, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, dri-devel@lists.freedesktop.org, tjmercier@google.com, linaro-mm-sig@lists.linaro.org, Joakim Bech <joakim.bech@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Vijayanand Jitta <quic_vjitta@quicinc.com>, jianjiao.zeng@mediatek.com, linux-mediatek@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>, devicetree@vger.kernel.org
In-Reply-To: <20231111111559.8218-7-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
Message-Id: <169990800956.37900.2282148242749436119.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
Date: Mon, 13 Nov 2023 14:40:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_124047_102294_06A8AEE9 
X-CRM114-Status: GOOD (  17.20  )
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


On Sat, 11 Nov 2023 19:15:57 +0800, Yong Wu wrote:
> Add a binding for describing the secure CMA reserved memory range. The
> memory range also will be defined in the TEE firmware. It means the TEE
> will be configured with the same address/size that is being set in this
> DT node.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../reserved-memory/secure_cma_region.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts'
Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231111111559.8218-7-yong.wu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


