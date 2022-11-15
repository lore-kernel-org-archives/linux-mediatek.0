Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC8C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vz7uYUJeJamm9PygKBSIU9xy9hxrNgiwqn+UopNSfxg=; b=GF8yTRA918H/FvXQraaDR0yjmC
	srZCF76YWb5CRyPezM4OGedXum11o94mJpvX0kcdk2sikRSdNvu3VunrrWnPDyj5muJsF/ldaMg/f
	tdZmbtcn119H0z2VKEY6QNE8jMx5ZOjX3OiBBl+erz/k84ZUjLDv5Jo6npt3XiePy4/3yM+jh2ZlG
	yvSIYdwUAgH01iC5DgA/yeY7SCZNibd6mDIxIhkip+3IH9dCHmrD7Jmtsii2IYutFPyIlh8/S7wgJ
	HPgnQb5rirYW+AjkUfWCPdXBA7HUeUP91PV9IJaMarOsIIZ4I+UMK/SPYXK9jH3FmftF7Q/mwFHVS
	064+3TCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwek-00Bmrm-D9; Tue, 15 Nov 2022 14:11:18 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouweh-00BmqB-MT; Tue, 15 Nov 2022 14:11:17 +0000
Received: by mail-oi1-f170.google.com with SMTP id m204so14950798oib.6;
        Tue, 15 Nov 2022 06:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vz7uYUJeJamm9PygKBSIU9xy9hxrNgiwqn+UopNSfxg=;
        b=TxHjvj/3tHt/5OD5lXZpRAjQFx9X+2fRIgCWJfkdQPGCa4jKPzM6m3L3nunL1cNGgu
         NykMCrd/qdAeaTgaIZdhhINOFy3IeKJbIC7nj0FwYuCtq4TOWtafImDv4nL7hkBjRz1v
         aT6MWiLhMhYy6Fgt6JuEumXxVCNoAZZzd1zfVK8dNdRViZy1FvMMuKiY2EV2RXJjYHsy
         cL5+kNwGbsMdZoJMYs1c7gUZh5PU0tKClZKTIXG3og0TmnrZFHfK91HR2Z+jlS+zOwUn
         fNilABisv7LE4mLhIS2gBUnyqUyPN9NYOXd18/7V3NpKuBSWOJBJx5U/4aTtQP8JSTxv
         4aXg==
X-Gm-Message-State: ANoB5pl3huWaU90u7QuX16J/Fuw8+sCPkt2Iz3p+Fzzdmy9SXgW+1HSQ
	47Jal7RPQUetBHhILUg85A==
X-Google-Smtp-Source: AA0mqf63x/dD+y9Qcgt5y0VP/sBf/XF/rZGM6hGioza2aUahrUk0uRvZcUGMWd8ljseCIlQn2gvXCA==
X-Received: by 2002:a05:6808:655:b0:354:2c52:51eb with SMTP id z21-20020a056808065500b003542c5251ebmr383158oih.89.1668521473150;
        Tue, 15 Nov 2022 06:11:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cg3-20020a056830630300b0066dae8cf9a0sm347740otb.50.2022.11.15.06.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:11:12 -0800 (PST)
Received: (nullmailer pid 908575 invoked by uid 1000);
	Tue, 15 Nov 2022 14:11:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Bernhard =?utf-8?q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221115025421.59847-12-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-12-bero@baylibre.com>
Message-Id: <166851961560.867545.11435946011050466616.robh@kernel.org>
Subject: Re: [PATCH v2 11/15] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Date: Tue, 15 Nov 2022 08:11:14 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_061115_757571_F0FA6601 
X-CRM114-Status: GOOD (  14.25  )
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


On Tue, 15 Nov 2022 03:54:17 +0100, Bernhard Rosenkränzer wrote:
> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Error: Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.example.dts:34.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


