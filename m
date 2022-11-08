Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77FBC43219
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 22:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1WKX3mhauPH6bKxydCd7dq3bfOqHAw8fJeX48VwC0I=; b=zO4fZCLwicFZ333RdxlLjA8tbj
	KsCIymBJ/DMElKal2z9LkR5VcLhY4JUTjtzX+4FfiuqhfC4MEW9al6CNoSlHd5AI8fNJF/5RC4Nh3
	VbEWLefpoz5gBfhq0UGmRK4bIie7J5SP/7esLird9Xl99C9xZUuEwoThZBB89GJ858xAy9kco/9cD
	LuwQD2lMujki7pKDXSSqssTESkm3tY7gryR3lD3B+lQIhNjnMN80NOyRRvuEhnPCaKYjdyQ9iTUap
	Fg5NCyW8XwEwrX0gkACo0FukrkSn68PFFk8KTc/yBv6gsX3xsjwMFmLn53THKDxY4VXbgeHPick2N
	Emoma4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osX77-008kvF-67; Tue, 08 Nov 2022 22:30:37 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osX6i-008kpQ-8n; Tue, 08 Nov 2022 22:30:13 +0000
Received: by mail-ot1-f54.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso7873816ota.12;
        Tue, 08 Nov 2022 14:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1WKX3mhauPH6bKxydCd7dq3bfOqHAw8fJeX48VwC0I=;
        b=JWdwJ6Uyu5QvGfU1VhsxxSKC0peYcRXq87yr+VkNIXxUXn2CutxZtx1NRnPIZjumL/
         W7kNj/BEUgBrJNNFcEYU8Y+9RYgGSsFqpppf1fpphiwSTuBwtHM7OQOubJd8QNaDGNfW
         MnfuhxrgOSsW7tAQWB+ULFrW6jOnIeQiG+iANYcxCEcCmCHA/dIu/dc7vn6SKrQEDfW2
         PJG2IVjJVlp7LL1LeNsEN6XameFEmTI3DRqsYGn31C0LORTSsZVI+csmithmSSpO6EPR
         v2BiOYp26oPYMcuPTe+dT0KAlW/mkdACECRDuMHay5XOWPxMSY5gqd/jRq9/q8oHWZp3
         flVQ==
X-Gm-Message-State: ANoB5pkszH96LpbR7PYd6v2UKCf3p1cmtTW8RKMsocp1AiNXhSKY6Qiy
	DdawEPiZE91CCp4G28Jlmw==
X-Google-Smtp-Source: AA0mqf4zvuBgBQtWRjglf80mZSS/pe7Lb0MVGC15SN46DgXXn1AcWsYO5Yj90DM7DAAiaxP3BQJhUA==
X-Received: by 2002:a9d:4814:0:b0:66d:81b:f06 with SMTP id c20-20020a9d4814000000b0066d081b0f06mr223823otf.297.1667946611045;
        Tue, 08 Nov 2022 14:30:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ca1-20020a056830610100b0066ca61230casm4099653otb.8.2022.11.08.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:30:10 -0800 (PST)
Received: (nullmailer pid 4095488 invoked by uid 1000);
	Tue, 08 Nov 2022 22:30:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabien Parent <fabien.parent@linaro.org>, Sean Wang <sean.wang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-leds@vger.kernel.org, linux-input@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
In-Reply-To: <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
Message-Id: <166794645715.4092263.2351084357250073444.robh@kernel.org>
Subject:  Re: [PATCH v4 4/9] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
Date: Tue, 08 Nov 2022 16:30:08 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_143012_367698_1A3844AF 
X-CRM114-Status: GOOD (  16.37  )
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


On Tue, 08 Nov 2022 19:43:39 +0100, Alexandre Mergnat wrote:
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
>  .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml
Error: Documentation/devicetree/bindings/mfd/mediatek,mt6357.example.dts:26.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mfd/mediatek,mt6357.example.dtb] Error 1
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


