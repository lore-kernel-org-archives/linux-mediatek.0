Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA31E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJNHpK0quJ/GfeLqRZq/bWUVLiRagAyT1ROgGXqNauc=; b=1pawPsBcWpmj68+lve/EchfKVK
	QQH0Jm03tH+IdIBntEXKAMg2oI9MoYvVM8B6VOSIKKC4WUI5FHVrerEVS/KNJq1qck5Y4bBaf6cop
	lFK98SNKkCSqRieVt4Tv+2LjE6KmKScUiF4VIF468tRV/u5OJ5ydYitX87cSU8YXF/ZqrMldqoSfN
	KiDfrkmhewUrM5PiCccMlxNiwf6CuxM8L/wyWSNbigViF3ZSRvxOld1XfyRpo+t+rjL0bdm8bjArh
	aW0Frwx9rjbx79cs1daaAAqbKQEPx3z01FuC+Izrk94QUtWZvThVkxfIu2vhepnXhQ8vHYvni5t/P
	uBL8pSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFVp-0000000FYCK-07wN;
	Fri, 10 Jan 2025 13:57:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFSt-0000000FXTP-1MZo;
	Fri, 10 Jan 2025 13:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15E8EA41BA6;
	Fri, 10 Jan 2025 13:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A59C4CED6;
	Fri, 10 Jan 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517258;
	bh=LPyn4zGg07EcDbmN8qbWXQu2T7iAh+g4Zanw4aY6Nh8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H1i7iDdofr9qkOBohfvLG/GVjtxC9Z00nO04TIA58X6C+keS8dUXICi6bBaeuj2Dt
	 Pko98ZdIdgOUMCofPtQTgxwmYZ4PP0hvo9WK3mPj0/7ZauGM1Ad5oD0iBtoZWe0IDX
	 y2L2PvkOLyFXzC2q2C6TaNSeaEzT3XXnmfCGR+3Vy1eiN0UuxU0ftygmGgz699MRId
	 3jxq4Jpt78UNbLt0mhHc0gPZqS2v6IhEXsEwHweBQ0ZYYdLaZI8jmM0Sjgdy9I1Osr
	 umyM4/UBnwruuY8eBJ+Hlv2zVHLS9NOGSm35xNbSseytgAIT0635GCHA5xEBPJf60E
	 CcSS/oesWAREg==
Date: Fri, 10 Jan 2025 07:54:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
Message-Id: <173651725269.2671643.2891127782637834272.robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055419_492179_E74A527C 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: chunkuang.hu@kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, devicetree@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 10 Jan 2025 20:33:59 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> #include <dt-bindings/power/mt8196-power.h>
> are not upstreamed yet.
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,exdma.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-5-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


