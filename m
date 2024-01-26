Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F3FC47258
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 03:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5siXOtsfwdYwAOzuCsxKwFKDW18vd3042PUAc+Q6aBs=; b=zEJsQcIDown43iBpdGSc7JrbNm
	LLv5LEYORlGIWa5+nS563v94uWfUjKwMSepcXRWuLE7qwmDJWtyCHQwsu+0bN348HSH7qRh4m8DKc
	LETFvfTELwjQXGXpFSrlOZKNpfUfUaiQXQuO2xYi/gr25Q67qwvjiQa7uEYyYBh01Dcdw4ZFbSURa
	yadFCjox5D6R0oc+6jlqzh5aem/yr1nruL54IjzgIjOdzA4rLlchukHVSJQnIYsUb3j+XcPydhwB5
	RiqZSgagWPJ6fZnU0iVucgjeb05V/yyjCYQwOxY2PgCR6L2ZiiUmlHI9aMWPPNC6qnXb0SdKIYcwV
	Lihm4auA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTCUY-00000002vnT-1DTY;
	Fri, 26 Jan 2024 03:02:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTCUV-00000002vj3-16hz;
	Fri, 26 Jan 2024 03:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A34CCE35FF;
	Fri, 26 Jan 2024 03:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18393C433F1;
	Fri, 26 Jan 2024 03:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706238135;
	bh=GJ7CkH9DB4f6yRUN3yKrBTO9cZaC2If9JB2hPEvgamI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nZzlezDaaMQOd65G0n3/0b1XsyY/gxUNwjTF53/nLwWnRaTLL9X01V8bs/FmW8T8s
	 3iO915tzSuO8FAkhWUfLHfrb13vEX+ILVW7LpvZLAk6HTLe7W5O50H+sBqvjwuUpBH
	 8EbKqO/Tw3/5/MCZuW1SoxmamgCfCspm5vmkJxusAhMELsQt2UlQ3hZBj6IP1E1Qq0
	 Wtbxg/d0CxGdzy4ypCiPWHf/pPESyjms6/5kkWaYoWy3lLOx7dOwgv2RFmCsK7G6we
	 W9A4LMOdXRGwDF4uayDaSl7pW0SvVbpfc7CylnoaxOHGLLtFZYGNhdNdZy+y5tepEm
	 NGvgSUQqXgJLg==
Date: Thu, 25 Jan 2024 21:02:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Marcel Holtmann <marcel@holtmann.org>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-bluetooth@vger.kernel.org
In-Reply-To: <20240125095240.2308340-2-wenst@chromium.org>
References: <20240125095240.2308340-1-wenst@chromium.org>
 <20240125095240.2308340-2-wenst@chromium.org>
Message-Id: <170623813065.6681.12186645553031730572.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_190251_663160_0292959F 
X-CRM114-Status: GOOD (  16.31  )
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


On Thu, 25 Jan 2024 17:52:37 +0800, Chen-Yu Tsai wrote:
> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> SDIO. While the Bluetooth function is fully discoverable, the chip
> has a pin that can reset just the Bluetooth side, as opposed to the
> full chip. This needs to be described in the device tree.
> 
> Add a device tree binding for MT7921S Bluetooth over SDIO specifically
> ot document the reset line.
> 
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.example.dts:25.39-40 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240125095240.2308340-2-wenst@chromium.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


