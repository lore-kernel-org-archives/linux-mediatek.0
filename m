Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B8ACDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8Ejd5Pa0+899H+ST1facS1EVWLpMPKF/gO5qmwkR4w=; b=2mazq1yttLDXzZYM7saFMsrVaD
	GhYHBSyprcBO1T2Dh2EtyeXK6Mg5XoH47cNSaCyI3ZmmKAlLyHJD32sF3uIj9+pJz0OSpwfXkWn+0
	sm3235M3GLfCUrOsc84NIqeNz4c1r5xaom+8A7jiVuc/ShJgMlBz4PlHmyHPkjmYQW0z2ZvWrI2ad
	Dn8OXOCq3DuT/mYWTL37zK1hDX4AML0ahTHOWOtC110ze4bkqpy7Q43buYJl0LRdsd+dcGkychsMB
	D8hxd79vZFIGDMrCYzklpi+t4MtsdI7UnpQefIaG+rDBHzK3cxoCdNbXkXte7D5Uca7bnbY++VmVj
	r4WvzlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsU6P-00AUMU-06;
	Mon, 16 Oct 2023 20:22:13 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsU6K-00AUKj-2R;
	Mon, 16 Oct 2023 20:22:10 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57b68556d6dso2771947eaf.1;
        Mon, 16 Oct 2023 13:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487722; x=1698092522;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n8Ejd5Pa0+899H+ST1facS1EVWLpMPKF/gO5qmwkR4w=;
        b=qqJmTprWhRbgXViEIx4CePprC66M2BNq0oIsS3Ztuvo1a25LVqDiNZ31PqtyQllITM
         zlXhRhzL9IO/WrXwt+2oEVSy7b/awUm3tIUvjOmcydn72j/PuHBMbamSl8Td0hzoqv8s
         4Gq+41Ci9Lun5wIVusfWzLCk7qO1j7WCu+4n0XO81ujJhvwZcqs+SJgP+GPuWGKMg+jE
         NdOoj7NkaJF7qWhAFIFQNmzuK2BImgYioilskbVTUYJcUSoApKFio6z5kU/NDOanRIP2
         nvOW/41qjqTTMgTb3lG6q84GxKtvk4jM3LW91qz1J3Bbl8D4xZPAkryeGxOGq57CGpnV
         k9jA==
X-Gm-Message-State: AOJu0YyqWvoXp48LD+BiuZtMxBRXgyrez5Dgre+6H47LMiyhdOXdvlMx
	xmMr+fB9Gk3NeBIxxyO9gA==
X-Google-Smtp-Source: AGHT+IGEYagCHsUBCuyxmcGOPHRUwWB7THaDN4+NC/pbptGn33Manj5wy9VEGgn9ovwHhqVg4gR47g==
X-Received: by 2002:a4a:4245:0:b0:57b:469d:8af6 with SMTP id i5-20020a4a4245000000b0057b469d8af6mr112518ooj.4.1697487722620;
        Mon, 16 Oct 2023 13:22:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o10-20020a9d718a000000b006c4e71a022bsm1199otj.52.2023.10.16.13.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:22:01 -0700 (PDT)
Received: (nullmailer pid 3615546 invoked by uid 1000);
	Mon, 16 Oct 2023 20:22:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, conor+dt@kernel.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, kernel@collabora.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20231016151553.5336-1-eugen.hristev@collabora.com>
References: <20231016151553.5336-1-eugen.hristev@collabora.com>
Message-Id: <169748772099.3615502.6790888257320558610.robh@kernel.org>
Subject: Re: [PATCH v6] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Date: Mon, 16 Oct 2023 15:22:01 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_132208_796395_28B4DD2C 
X-CRM114-Status: GOOD (  16.87  )
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


On Mon, 16 Oct 2023 18:15:53 +0300, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v6:
> - renamed mt2701-audio.yaml to mediatek,mt2701-audio.yaml
> - add Rb Rob Herring
> 
> Changes in v5:
> - removed example for mt2701-audio
> - renamed mt2701-afe-pcm to mt2701-audio
> - added clock cells as required, removed reg from required, in audsys binding
> - removed reference comment in mt2701-audio
> - removed assigned clocks from mt2701-audio
> 
> Changes in v4:
> - fix error reported by Rob's bot :
> ./Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml:11:4: [error] missing starting space in comment (comments)
> 
> Changes in v3:
> - not added Rb Conor Dooley since the patch was changed in a big essence
> - As per review by Krzysztof, also convert the mt2701-afe-pcm and reference
> the correct schema in the audsys binding.
> 
> Changes in v2:
> - remove comment reference to inexistent binding
> 
> 
> 
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  39 -----
>  .../arm/mediatek/mediatek,audsys.yaml         | 153 ++++++++++++++++++
>  .../bindings/sound/mediatek,mt2701-audio.yaml | 117 ++++++++++++++
>  .../bindings/sound/mt2701-afe-pcm.txt         | 146 -----------------
>  4 files changed, 270 insertions(+), 185 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/mt2701-audio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/sound/mt2701-audio.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231016151553.5336-1-eugen.hristev@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


