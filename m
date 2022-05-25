Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F195C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKzu1Yj3xzxFvNaHIBLRkpr+DTfHPcghHVpbYFUdSbQ=; b=Vy7nFvjmlupJK3
	fPbe9Yx0mb5iZPpNwFeLupziO94eYXZgj6jq57zPw2csexkNEjxMnZ4tbwSViQi7dpB8ZzhW/j6hp
	t6sgIZMVQHTWRuNXHS1JJnIHeN50sVCVmtHkX0YnGoNZl0jXh3c2oLu55E/8O2R+FSJoObo72ZXbS
	94gWgrVbMP97xHJ4U/sVBBxYh1rir6xTJ9zKXSVNP10kg5zRNyyuqBwQNL2pd5NzuEJpJoDyRCwzM
	ZQw56YCVoTMJ+VVWtubPN4Onv7FQ6VMylVISZjRonkhtOYmtzDEwZDeOcQFLoxxfNWrNuXTjFRBCC
	MyrSyTlDCu062xxZszYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqMx-00B87j-Su; Wed, 25 May 2022 12:44:07 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqMv-00B872-Nk; Wed, 25 May 2022 12:44:07 +0000
Received: by mail-oi1-f169.google.com with SMTP id s188so21074857oie.4;
        Wed, 25 May 2022 05:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1xKn1TwFCEiFxTgut6Nt95ns9umTBM5bV8PgAamEzGI=;
        b=e6BqpaVk7RPZK55htne8YGvPmEkoI022cjQT4rJzOLK67VF96Xg6saqIcQjnKd10eZ
         oGFff9nqe4YNB53A64V0FZuwg4sRFHJHZwK4BmJJGUIFixsUbzVPCKSNX3oB93lbsd8+
         aVZXHk/AK7tw2+WAEtnlMW+XGdvo5wag9ziRitKCCH6zEWm1Gqn863tFBhyjXYco3fiE
         A1uOSjWCeYxjNfT3U5MCrISu0fiPjw3uAXJVvLvtjcMttDbrDg9CjTcJgWzOTwWitWPj
         bhLlHdKK6/GA8/v9dHEj/6KeAEIgMreGHRqm6e+0YOcGkoCLIaIIS6HCDbX3tIlfbGQZ
         tcaQ==
X-Gm-Message-State: AOAM532walBu9Sc7QmgzJBmZp879o5odjuO7Jpyf13j6jWntoICxRp98
	iHdUAFqfW9Rs7pzwpciMKA==
X-Google-Smtp-Source: ABdhPJyp4RR2/wWLrfrKz/ft7jvpqGKEU8/LjZ5HHq0aDMy4VC3N1ZKM5JQ8agR6C41wBqF0tK49xg==
X-Received: by 2002:a05:6808:1201:b0:325:75e1:25a8 with SMTP id a1-20020a056808120100b0032575e125a8mr5116618oil.18.1653482643566;
        Wed, 25 May 2022 05:44:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ec25-20020a0568708c1900b000edae17a8cesm5952127oab.3.2022.05.25.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 05:44:02 -0700 (PDT)
Received: (nullmailer pid 1760895 invoked by uid 1000);
	Wed, 25 May 2022 12:44:01 -0000
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: linux-pm@vger.kernel.org, khilman@baylibre.com, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, james.lo@mediatek.com, linux-arm-kernel@lists.infradead.org, rui.zhang@intel.com, rafael@kernel.org, matthias.bgg@gmail.com, amitk@kernel.org, robh+dt@kernel.org, fan.chen@mediatek.com, daniel.lezcano@linaro.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, rex-bc.chen@mediatek.com, louis.yu@mediatek.com, mka@chromium.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220524152552.246193-3-abailon@baylibre.com>
References: <20220524152552.246193-1-abailon@baylibre.com> <20220524152552.246193-3-abailon@baylibre.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: thermal: Add binding document for LVTS thermal controllers
Date: Wed, 25 May 2022 07:44:01 -0500
Message-Id: <1653482641.588144.1760894.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_054405_808518_46DBF64C 
X-CRM114-Status: GOOD (  12.56  )
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

On Tue, 24 May 2022 17:25:49 +0200, Alexandre Bailon wrote:
> This patch adds binding document for mt8192 and mt8195 thermal
> controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../thermal/mediatek,mt8192-lvts.yaml         | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml: allOf:1:$ref: '/nvmem/nvmem-consumer.yaml#' does not match '^(/schemas/|\\.\\./|#(/|$)|[a-zA-Z0-9]+)'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml: ignoring, error in schema: allOf: 1: $ref
Error: Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.example.dts:34.36-37 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
