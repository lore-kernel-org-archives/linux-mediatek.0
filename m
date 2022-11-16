Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C703C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFur9ztajNJgyC/h1WU/MLh+XU5LTzLRomeO0X20AEM=; b=qTjSWg0WEhF2ej+KA3a0nXzbas
	BKA769IwbBgIHCBJ6V2PE+IunRNBv0b68ZEMICoDEeMsoaOfIdN3YHO4Abt9UTpzQLCP9gbjZhjNj
	4FzX8e27vioYsuTbUewmhX5yp0CX6vRm/7yyJGf+KI4LG4cgl+7+LX72FCnPILMKq6WrpY83peUHF
	TRRd2SimD2UDvGyPR92p2OC3987yuHYdo40NYhGqboxWm0POZ/i11blNBIRfMqMXXXzuitJX6kQsS
	Uz4lUHFMlWdbHuGkwtabUb5Xd6oFYqsVF9lyAGLWH5IqxgjXmqK5J2VFmMjDNNk1s7q4t/LH95rXi
	M7PrePDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKsj-005fqS-BD; Wed, 16 Nov 2022 16:03:21 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKsh-005foX-1N; Wed, 16 Nov 2022 16:03:20 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13ae8117023so20562046fac.9;
        Wed, 16 Nov 2022 08:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GFur9ztajNJgyC/h1WU/MLh+XU5LTzLRomeO0X20AEM=;
        b=f6Z7inT/COSuh2hRKCH7SbEG3moQ/SE5S6VrfL1Q+mKhyOPvBevf/iZ4NusT0g0283
         7qXBPWQNBlt3MSMH94LJb0+1bLfgZ1ifXgJZkXRie2pM9cpt8ngEyX2jGwbOMrST93s8
         UNZA97g7qk68uxmos49PqZQxHEfIZUmGy7i+wYCp55pXBjz3awyCTfM231xfqDmPCsAI
         Mj4UwDoKVpgE6W747fmnDDFS2IhSx1KSbwkkhQPMlyB8dKm11ryOKBNdxOiotxG0lWYT
         TRW42uu8hJzJJwYMwcsY81Ly0GdPUucAc1c3CJKvjQn5RmhEJkdgdqqWlFhpKn1zUr07
         BMhA==
X-Gm-Message-State: ANoB5plPQTzJgKjqfygz/U5QtyRX6bSTBehULWPe2WTBvydtIL9L0uzL
	KXF3/KCLE3MuzJuD71L0ww==
X-Google-Smtp-Source: AA0mqf5XdhzHlaYo1ZV4BEyVQHRU/bRF0T8tEBEf7/gwzL9OR8nfhFXlbYyBvHSwysBdzNF8BwK8yQ==
X-Received: by 2002:a05:6870:f10f:b0:137:5344:7776 with SMTP id k15-20020a056870f10f00b0013753447776mr2013082oac.208.1668614596948;
        Wed, 16 Nov 2022 08:03:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n19-20020a9d7413000000b0066cb9069e0bsm6863694otk.42.2022.11.16.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:03:16 -0800 (PST)
Received: (nullmailer pid 158015 invoked by uid 1000);
	Wed, 16 Nov 2022 16:03:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-input@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Fabien Parent <fabien.parent@linaro.org>, linux-leds@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>
In-Reply-To: <20221005-mt6357-support-v5-5-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-5-8210d955dd3d@baylibre.com>
Message-Id: <166861435469.151514.16192567175686360100.robh@kernel.org>
Subject:  Re: [PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
Date: Wed, 16 Nov 2022 10:03:18 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_080319_096687_137C38AF 
X-CRM114-Status: GOOD (  15.98  )
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


On Wed, 16 Nov 2022 13:32:59 +0100, Alexandre Mergnat wrote:
> Currently, almost all MT63XX PMIC are documented mfd/mt6397.txt.
> Unfortunately, the PMICs haven't always similar HW sub-features.
> To have a better human readable schema, I chose to make one PMIC schema
> to match the exact HW capabilities instead of convert mt6397.txt to
> mediatek,mt63xx.yaml and put a bunch of properties behind
> "if contain ... then ..."
> 
> - add interrupt property
> - change property refs to match with new yaml documentation
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml references a file that doesn't exist: Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml: Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


