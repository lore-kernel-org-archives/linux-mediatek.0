Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9575AC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 21:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vQDOyuL4ygu5OBRBw9x0Lns1GFB34OJmrSDqZyDSWY=; b=gWO6+mfftBN2U1J8+XCIyJ3VPN
	jd7rFZotMKtLAP+it/WlNLQs+tM9mA+OE4JG5vnGZphUXiFddhkmIuXG0HW+ruHo8AgCNt3YhyWWB
	S5DLY5T3Vm5Bmbre1JVtMqh4NOX0DHNF1ZwtvP6IN70Kk5epY61wi3V+IFQw0CgOnNLuZvgY6adIt
	SQLx+OicekIfXRm/fX04gr91rCHxWwuVirtKdcp/rq+RSr1epLeGN+hojHSOnThAOm/I6e9IBgzdp
	nCP9q+DQA77HAFIWXpcqOdV8IsKD2AsUASiCmkeU0quXJfpuWTHiCEE9yQDTxkMYF8YBQ/Btki57b
	OMYGtc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiIw-004Rzw-1l;
	Wed, 12 Apr 2023 21:47:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiIv-004Rz6-37;
	Wed, 12 Apr 2023 21:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6vQDOyuL4ygu5OBRBw9x0Lns1GFB34OJmrSDqZyDSWY=; b=JEk2LKJ0WB6qFe/kpiyNG0bsEn
	AyWRPVgr9Svw952aCcT79U/EmmhgkbdAw70yNJR4eG5owNmFzjMwP0itRdEgPHoI1MntrvWfIt0o0
	LIvJgC2e9gSeqIFfkeBTVruUzf8uzY1EEbxvc20bVPL3HFXLulqFFZSiouGnEgk8ORWxGqCXWdNi9
	tPtMQieVNbiJDJoHzxibYO1zHtFg4ijaoeMmhX5jiJcpUxk7HYrvaLqUms+0Wnioe3Pg5aJ8Qzb1n
	fU03R3T/JYmjL8oqVVcLRNpljZhL6A5wSqRr8OquS1+1AYaSgzjFdlWHZ1BXn5v4Zydlg85JMAsIe
	UUdWPQKw==;
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhdD-00E2MQ-14;
	Wed, 12 Apr 2023 21:04:21 +0000
Received: by mail-oo1-f52.google.com with SMTP id q9-20020a4aa889000000b0053b59893660so1965336oom.0;
        Wed, 12 Apr 2023 14:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333433; x=1683925433;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6vQDOyuL4ygu5OBRBw9x0Lns1GFB34OJmrSDqZyDSWY=;
        b=OS9puM9sPYkXAhzu8/xSkvmbLyg7bZ50HdY97OLrMW7pvopusjzZWG9fRmeWwUVJ1Z
         7FhKlLL2MK+CMQLc+uw+gWpkCYfIWv5kJJciWcVzEn3iZnkPahvqPCcwenILiscYJwiH
         VCtUaydSBs203Oo6flnz+5ALomLvAel6U9IA8E5iPItVMN/nox4+8k5M+Qq/pH7Lufn3
         7QSkx0jJR/9GkMZklupk1bdq8c3kVWOPVthe5FvU2OihD5eSvllHzAt8/VJVJyj99LBl
         hw7xKw3SSP/LjDuFb9oulvueZsXbtWr4is9ZEbgBah88RzwsyZj0XN2alHxd8ttJy0+Y
         hUzw==
X-Gm-Message-State: AAQBX9eCKTbSDY92QwH1HnhO79o39wfvPCf5jdMVqVrH2iaw+gSHhZDh
	l6DrMc4bJfK/iQFlU/pRCw==
X-Google-Smtp-Source: AKy350aBfPKBwNkQTAKX6pidG5KWNDP9kOhzMY+0ltkEGSly040cf+gAtSbh55AqCxwHEjPwevEIEQ==
X-Received: by 2002:a4a:454b:0:b0:53e:5698:c0d2 with SMTP id y72-20020a4a454b000000b0053e5698c0d2mr1614999ooa.7.1681333433174;
        Wed, 12 Apr 2023 14:03:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a01c2000000b0051aa196ac82sm7508974oor.14.2023.04.12.14.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:03:52 -0700 (PDT)
Received: (nullmailer pid 3200529 invoked by uid 1000);
	Wed, 12 Apr 2023 21:03:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, vkoul@kernel.org, daniel@ffwll.ch, linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, jassisinghbrar@gmail.com, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-kernel@vger.kernel.org, kishon@kernel.org, chunkuang.hu@kernel.org, chunfeng.yun@mediatek.com, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, xinlei.lee@mediatek.com, airlied@gmail.com, krzysztof.kozlowski+dt@linaro.org, kernel@collabora.com, jitao.shi@mediatek.com, u.kleine-koenig@pengutronix.de, houlong.wei@mediatek.com, matthias.bgg@gmail.com
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Message-Id: <168133319106.3190682.10651793127592676554.robh@kernel.org>
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 16:03:44 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_220408_519207_86B7B88E 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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


On Wed, 12 Apr 2023 13:27:15 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-4-angelogioacchino.delregno@collabora.com


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: 'port' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@1401d000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dp-intf@1c015000: clock-names:0: 'pixel' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c015000: clock-names:1: 'engine' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: clock-names:0: 'pixel' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb

dp-intf@1c113000: clock-names:1: 'engine' was expected
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb
	arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb
	arch/arm64/boot/dts/mediatek/mt8195-demo.dtb
	arch/arm64/boot/dts/mediatek/mt8195-evb.dtb


