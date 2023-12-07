Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDB0C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlGlC1SkIL9mmE58AXO5RRQ634yhMDTeXthN1KRiRhM=; b=QdTpXgc47fOROUWrGXF7lvRN9b
	h5nSYLS9NqbwvOzrT9ZRcl85esBUrTpzSckVZ5ucLz1qI+9peWXWAPCuEB18yONQEuIcYK5N8vGQ9
	S3TmsWNsMHJ7Q3DhOlMsb1o1c62Ouq2BRMmtM2z9yONLJaCgh/iZ1rga5pDxDWEqVHpIRqAx+PYEW
	otLGhBc1xWl/ekkb1TP2K0yFhzWDQNHr5tlfy0VhHN/NOpv//IT52JbUOaCMv1lZ2AlVJL4lBVKAj
	3ESmsEM5yqcYz8P7yYdgl5JB6M7dUnGrcceaUd4OmdzIoEkFM5PssQ4W1F/j1FGyTcuTTi+LWJubp
	6vabOb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIdn-00DaOp-2m;
	Thu, 07 Dec 2023 17:58:27 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIdk-00DaNj-2U;
	Thu, 07 Dec 2023 17:58:26 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1efb9571b13so783290fac.2;
        Thu, 07 Dec 2023 09:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971902; x=1702576702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlGlC1SkIL9mmE58AXO5RRQ634yhMDTeXthN1KRiRhM=;
        b=jLMY+E0s/SC0EWYiSVQO7PUM6iMllgl2S/3fS/TeYbzk2SyzJwaWX753C4jyiMMrAI
         cOayXAM1AotbLuOfhR1/On35m5nONlr2aAk0AXix/SMkNwIAI09t6Q+/3RZm9kHkK7J5
         DFkFj0C4s+4w/R7vqugnQsDt2MqdCuQZbH8BXeWAqF/mwnWHTFnovmN89F4oPvpDCExX
         jAC0PJu304yJpp8nNcdpUvMJF+01Q6QW4UgffeaurxuJk4nx+Us5Jm58MN+mz1trLTvx
         4uQjoU9mN2zP9escYEcL/QDPUky5AUxV19ZYvVHCASGBxEHS00xPdq3hR15RNt4scRsa
         2Glw==
X-Gm-Message-State: AOJu0YworvhEI3UziHwrI2cqxsYNPScnR6YFsAOHAspe1jBKeQoEUy22
	WnA9WiZWWj57o6+EwSUZTA==
X-Google-Smtp-Source: AGHT+IHxq2Dw8sFsLLI+z4S9TgWxaf6l0cocAGF+yc2TisyC49euiJvcC1n+Yr/0HeIX18RO0y1CyA==
X-Received: by 2002:a05:6870:390c:b0:1fa:fee1:6f1e with SMTP id b12-20020a056870390c00b001fafee16f1emr3075427oap.10.1701971902619;
        Thu, 07 Dec 2023 09:58:22 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k29-20020a05687022dd00b001fb0edac63csm58231oaf.6.2023.12.07.09.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 09:58:22 -0800 (PST)
Received: (nullmailer pid 2977746 invoked by uid 1000);
	Thu, 07 Dec 2023 17:58:20 -0000
Date: Thu, 7 Dec 2023 11:58:20 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>, linux-rockchip@lists.infradead.org, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	Bjorn Andersson <andersson@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	workflows@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Message-ID: <170197172648.2974247.13097453111547800548.robh@kernel.org>
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_095824_816798_7285FFB0 
X-CRM114-Status: GOOD (  17.34  )
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


On Sun, 03 Dec 2023 18:46:22 +0100, Krzysztof Kozlowski wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.
> 
> Cc: Andrew Davis <afd@ti.com>
> cc: Andrew Lunn <andrew@lunn.ch>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rafał Miłecki <zajec5@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Konrad Dybcio <konradybcio@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Merging idea: Rob/DT bindings
> 
> Changes in v4
> =============
> 1. Drop label at the top (Jon)
> 2. Grammar fixes (Laurent, Dragan)
> 3. "Unless a bus defines differently, unit addresses shall ..." (Rob)
> 4. Use hex in example of dma-controller (Andrew)
> 5. Example: soc@ -> soc@0
> 6. Reverse points 2 and 3 in "Indentation" (Andrew)
> 7. Use full path to coding style doc (Conor)
> 
> Changes in v3
> =============
> 1. should->shall (Angelo)
> 2. Comments // -> /* (Angelo, Michal)
> 3. Use imaginary example in "Order of Properties in Device Node"
>    (Angelo)
> 4. Added paragraphs for three sections with justifications of chosen
>    style.
> 5. Allow two style of ordering overrides in board DTS: alphabetically or
>    by order of DTSI (Rob).
> 6. I did not incorporate feedback about, due to lack of consensus and my
>    disagreement:
>    a. SoM being DTS without DTSI in "Organizing DTSI and DTS"
> 
> Changes in v2
> =============
> 1. Hopefully incorporate entire feedback from comments:
> a. Fix \ { => / { (Rob)
> b. Name: dts-coding-style (Rob)
> c. Exceptions for ordering nodes by name for Renesas and pinctrl (Geert,
>    Konrad)
> d. Ordering properties by common/vendor (Rob)
> e. Array entries in <> (Rob)
> 
> 2. New chapter: Organizing DTSI and DTS
> 
> 3. Several grammar fixes (missing articles)
> 
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  .../devicetree/bindings/dts-coding-style.rst  | 196 ++++++++++++++++++
>  Documentation/devicetree/bindings/index.rst   |   1 +
>  2 files changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dts-coding-style.rst
> 

I added the quotes as discussed and applied, thanks!

Rob

