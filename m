Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E42C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:
	Message-Id:References:In-Reply-To:To:From:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KXcL97M2PMfWlzmjkDxdbFO/ZAhFUdOxEbJqoSct5Tk=; b=GQuRtJSPn/5Fr7D4znE6pJSpC1
	raelDzy6SVky/JP8wbF6EE3TFZO6P04j87oVycTj7SMpcHsW/KWMBb4M/+8dAn4uaShg3rNPuxteX
	klCU4xFC/SO/3S+MuYTK/lj5BwTPCVjfDLPwH6K/Xsp8i3zC82Vvzxqgzkj0lbnJJcfTtS/Ja9gmA
	oOX52wth3l+WShEHBpLnIMKLnwwAGQsvpt71tZCCDIIR/gveF3e/jOlanFZyJyKc0xjbuoDZp7a/1
	GqLekhuhk4BycJ9n02EnD6WItCrAke3cSTq5AioUEcJVLkc4aOXowyGTFUtddeL16VeMrQNiVnpQz
	EqO7K3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2gGf-00EsC1-0v;
	Mon, 13 Nov 2023 23:22:57 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2gGc-00EsBc-1Y;
	Mon, 13 Nov 2023 23:22:55 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b2ec9a79bdso3416941b6e.3;
        Mon, 13 Nov 2023 15:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699917772; x=1700522572;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KXcL97M2PMfWlzmjkDxdbFO/ZAhFUdOxEbJqoSct5Tk=;
        b=KrJOiyFN92y4fmrOrUCdjbPdtqlnh7Lls7/UGqGOxd/5ibYS6vN9Gm8cd/GN4gtKCz
         84nIH9US7LSljOgIzAXz9oNGYMDl7yu4US7pIU1JlGba4YRcTsYNXYAoCh58BEfs44D5
         LQRmgMDsfbLIkj6MhSwG7WPPv1hwcpdLqda3eaCSc4D3Z4MssfEujLyHamtgRWlrXH73
         FK8nk7xkPNe+KIJrskR7z8Hih1X5hYUySzkxV5pGj5PETHt0PbAtsMihluN/zzeL5jq8
         6pzMsJgHu++xd3gdBhc1E0kHsWinMC3KhedwvwPit8a782MGWJRb0E4eoIXQTaVckWpS
         pOug==
X-Gm-Message-State: AOJu0YxFrEgEMtu4F9xGXLQMkUGNZLc16MPpjzzpMxbGGhiJBi6fjJAE
	fQYb6WASor3/DoYEq8/yzw==
X-Google-Smtp-Source: AGHT+IGlXkQYdT9XhConqZT2NSxmZgbwzACO24pvQVBVdxJsyVzbVIViminAyZ2DMyM4K/MElI1rvg==
X-Received: by 2002:a05:6808:ece:b0:3b5:6432:e0eb with SMTP id q14-20020a0568080ece00b003b56432e0ebmr11884418oiv.38.1699917772257;
        Mon, 13 Nov 2023 15:22:52 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w19-20020a056808091300b003a747ea96a8sm956613oih.43.2023.11.13.15.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 15:22:51 -0800 (PST)
Received: (nullmailer pid 14741 invoked by uid 1000);
	Mon, 13 Nov 2023 23:22:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
References: <cde7269e5975907ed2b7799328ea814e529ecf51.1699909748.git.daniel@makrotopia.org>
 <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
Message-Id: <169991777049.14724.13556943216352614509.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Date: Mon, 13 Nov 2023 17:22:50 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_152254_535245_985263D5 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Sabrina Dubroca <sd@queasysnail.net>, Johnson Wang <johnson.wang@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jianhui Zhao <zhaojh329@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 13 Nov 2023 21:12:19 +0000, Daniel Golle wrote:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any previous
> MediaTek SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/arm/mediatek/mediatek,ethsys.txt |  1 +
>  .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
>  .../arm/mediatek/mediatek,mt7988-ethwarp.yaml | 60 +++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-mcusys.yaml  | 46 ++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-xfi-pll.yaml | 49 +++++++++++++++
>  .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
>  .../bindings/clock/mediatek,topckgen.yaml     |  1 +
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  2 +
>  8 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-mcusys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-xfi-pll.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.example.dtb: /example-0/soc/clock-controller@15031000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


