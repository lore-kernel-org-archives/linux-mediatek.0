Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B34C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92QKbH/mPXhxHIYJf1fLlrKB6WxLUvpdcDo1o4OtEnM=; b=FYnQidsc/BvXjOveZq12rCbKEz
	NnHlBAhS++X+iRGH51408HSP4klu25tJVc7uTc+cNxakR0hfN3yQ6xokQuaIKiB/YWuoLhwv9qtpi
	L+csZ522uMUrIVNH01P+QVAuBRp3rtllt7iGphK25ElD++0JhgfloNVg2WlyImx3KVHuAeJfB38RK
	nhiB1YRZW+11wJhhPjko4dJKM8Ut+cArHJx1rfEsFn00p+HLEYJPjhMUxRdfhtGKj5lEzUa6qwjVB
	Sxf5oppWx7ioKFJhTesHmHSuHSrchxDTKLpcsUyzC/yNvUR3TPlCWipW+5STbEbA3NZoaGBD9U9yQ
	yHxkbAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4n56-003ESX-Ei; Fri, 24 Jun 2022 17:26:56 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4n4r-003EOb-Q8; Fri, 24 Jun 2022 17:26:43 +0000
Received: by mail-io1-f52.google.com with SMTP id y18so3400769iof.2;
        Fri, 24 Jun 2022 10:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=92QKbH/mPXhxHIYJf1fLlrKB6WxLUvpdcDo1o4OtEnM=;
        b=O3HI9XpQPlKKT4ewjJg2T0SzSdNbBCaTH/1ltM6MIiKHntm1Id3+95uG8PQwwo4e/i
         yXok449J1JrQ+4tw8iT40RqH7ElGVrFcXPCJ6lhs9y9acrNXqxch5K5lIetIMQ5UD6XH
         kve0Sf9BXDBuBluFmBvutrSyZylUbjxm/BICQnBhLwB1ByoB0wVnwKaH9N3ByiR2GXCL
         xgyEVZTntqWVd1q9lcaY3n95+iucNF5HuPsl3O68vq04Ms0la3nYJz+i5+6mPzdRi23A
         +cXYRT+GVrOcJGFScGN15hh4C6iqlN+mZUD96DcdD4POF8dEWDbYLbppuaVElP5okZIf
         RthA==
X-Gm-Message-State: AJIora8RguLMl3LwtYJ6BsuTw1MCfL1KZCw9iwq4+peUFllr9DYNp9jg
	RgctlHuvQ+44P8+JgMTZjw==
X-Google-Smtp-Source: AGRyM1s8SzrwSpGacP/r2ARwl+tUdS8WymnOz9QJv44qHprtsvHiQ9e/7OSdNfiAyfKqtnqiAMvqmw==
X-Received: by 2002:a02:90ce:0:b0:32e:e2ce:b17c with SMTP id c14-20020a0290ce000000b0032ee2ceb17cmr153954jag.268.1656091599142;
        Fri, 24 Jun 2022 10:26:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u10-20020a92da8a000000b002d925059ba6sm1354817iln.87.2022.06.24.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:26:38 -0700 (PDT)
Received: (nullmailer pid 146342 invoked by uid 1000);
	Fri, 24 Jun 2022 17:26:34 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org, wenst@chromium.org, p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, matthias.bgg@gmail.com, sboyd@kernel.org, konrad.dybcio@somainline.org, linux-clk@vger.kernel.org, fparent@baylibre.com, phone-devel@vger.kernel.org, robh+dt@kernel.org, y.oudjana@protonmail.com, rex-bc.chen@mediatek.com, martin.botka@somainline.org, marijn.suijten@somainline.org, sam.shih@mediatek.com, kernel@collabora.com, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, ikjn@chromium.org, krzysztof.kozlowski+dt@linaro.org, weiyi.lu@mediatek.com, miles.chen@mediatek.com, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, jason-jh.lin@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht, bgolaszewski@baylibre.com, paul.bouchara@somainline.org, devicetree@vger.kernel.org
In-Reply-To: <20220624093525.243077-5-angelogioacchino.delregno@collabora.com>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com> <20220624093525.243077-5-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
Date: Fri, 24 Jun 2022 11:26:34 -0600
Message-Id: <1656091594.386709.146341.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_102641_896472_1A7CF365 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, 24 Jun 2022 11:35:22 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 74 +++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.example.dtb: power-controller@10001000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/power-domain.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.example.dtb: power-controller@10003000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/power-domain.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


