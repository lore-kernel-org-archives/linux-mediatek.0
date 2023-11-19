Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6A9C072A2
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMU08ksxciypMg2cafusPvHmfZUM2THw/Wr0jFPWQkA=; b=k4y/9Xan/IKYFyOuKupkhrRk+b
	XYrHzisyv/hSzj/MVFlr26rAUy/02N9Y7WAtQH5AazE71tOfP7yrtbkMDYe3WYEeFxq1cpdfNnOhm
	M0jxmovN6staQpRYlq58BtBLDp6uvqbLgYkhl58Dvzb+1ugk5BobXqTwYr6Tpuk9vpsCtDpgF7t+I
	qiAy7eLk/Vtu4OPCDVOa3BWdUq/OSvvi4PRFawgdG8VyDmHA/ay+5eWt8ZtTazHl59OIrvJnp3fbv
	1QghZJbiK1/E11JsWIPFFro0dYZ/uigw7k2m7aUe2hw+1Wk+4dr9fSaOamjm+ng7ZNnqhBr1f9eBE
	F2dU0Zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jnR-00ALTv-2C;
	Sun, 19 Nov 2023 15:33:17 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jnO-00ALT4-34;
	Sun, 19 Nov 2023 15:33:16 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58786e23d38so2270400eaf.3;
        Sun, 19 Nov 2023 07:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700407986; x=1701012786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMU08ksxciypMg2cafusPvHmfZUM2THw/Wr0jFPWQkA=;
        b=Qj2OE++sXeA4Osj3Db5kJCQtMC0I90vhwyx+TnzObJoIHon6gD2DhyD0W1UOVjbqg6
         TtLXQC6L3TFK6MZJRkWMoqTXSTGpMHiWgD4a29bgA1V2NUS69eeaIDWiJiNFmgdMbDwr
         KYnKSB2tvEgAkAaVcS6YaCqPsBpUYlHt/nahCzfel3nOsSz3rl/+T0TQ+T/Zj+jPkpHz
         pdPMWkmby6tXWoFReYBX4UgR7EWwZMY26NEyREyGLiPyGY97l5xvlFOAFOsOrSPQJVq6
         IiJLO+SsOpDxK5TiaAhhaLy4h+ymE2f3CevhP1HUZuJgBLO+autwioQ0PGznHphJ3VLA
         26RA==
X-Gm-Message-State: AOJu0Ywy1AVECs/I9NgWP4jDSE8RfnD2xpNMBu2698ks/EQAwIuq9jeM
	OnaeF3wxK5DUGcAd9fADs7rRdbHa+g==
X-Google-Smtp-Source: AGHT+IExABufMmUJEvUlY0EWmwdDBQyAl3khdEyyRjfwJe6bame2wZuLIdHI94aTyaZhFmNMeo+0Cg==
X-Received: by 2002:a05:6820:1502:b0:58a:231d:750d with SMTP id ay2-20020a056820150200b0058a231d750dmr5737572oob.9.1700407986253;
        Sun, 19 Nov 2023 07:33:06 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id u3-20020a4aae83000000b0057327cecdd8sm1052307oon.10.2023.11.19.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:33:03 -0800 (PST)
Received: (nullmailer pid 234287 invoked by uid 1000);
	Sun, 19 Nov 2023 15:33:00 -0000
Date: Sun, 19 Nov 2023 09:33:00 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, "Rafael J . Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH V3] dt-bindings: thermal: convert Mediatek Thermal to the
 json-schema
Message-ID: <170040797960.234232.1151056488223755530.robh@kernel.org>
References: <20231117052214.24554-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117052214.24554-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_073314_992376_06430533 
X-CRM114-Status: GOOD (  14.09  )
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


On Fri, 17 Nov 2023 06:22:14 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Improved title
> 2. Simplified description (dropped "This describes the device tree...")
> 3. Dropped undocumented "reset-names" from example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Add "maintainers"
> V3: Introduce changes described in commit body
>     Fix schema syntax
>     Move unevaluatedProperties to the bottom
>     Rename file to match compatible more closely
> 
> I'm totally sorry for sending broken schema patch yesterday. Brainfart.
> There is no excuse for sth that doesn't even pass dt_binding_check.
>   DTEX    Documentation/devicetree/bindings/thermal/mediatek,thermal.example.dts
>   DTC_CHK Documentation/devicetree/bindings/thermal/mediatek,thermal.example.dtb
> 
>  .../bindings/thermal/mediatek,thermal.yaml    | 99 +++++++++++++++++++
>  .../bindings/thermal/mediatek-thermal.txt     | 52 ----------
>  2 files changed, 99 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


