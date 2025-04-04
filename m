Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FF3C36010
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s85N6LbGyDvlbfm+7fjpbjUdhdaXcYheIAW+0EJPQoQ=; b=xnOQsanwDSFAGdI++Utea89Op7
	/JC7YWLJPQw5xAxoNWlPYZ808ZtNBVxe+xRbiPPQwOah/tALsv25MgDozojWa6+W2tpILjvh+o7fl
	jq7k01Wxrr9BhwL82uTIarNGmvWmXaEPVoij6zpF0XaKY1YTLnCqS/Buc0oUpIGHpq64MThB+iNxm
	Xjr+usa4+p3iXFq28bQeEtTYMf9uU+wM3y7//frkkS7EDNAB2YZSRD/xHSHLTfzHgt5vK74NTKMVX
	UEZ2weo21SbdEH3C/hVAGI55HZJhHqJ4uKxBzDJTD50l15M0ZMSi/JMMIK2ClwZUXabxkxE/e4EJR
	Qsd31evQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eQC-0000000BRga-3mCc;
	Fri, 04 Apr 2025 10:37:12 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eQA-0000000BRej-40X7
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Apr 2025 10:37:12 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6ff1e375a47so19390387b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Apr 2025 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743763030; x=1744367830; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s85N6LbGyDvlbfm+7fjpbjUdhdaXcYheIAW+0EJPQoQ=;
        b=u6ULu3r5c4dCrT6PKJZD6OD/9MFLTlYRCvdoMImBqicSYktmGGjJMr0ltQUZXm0vJx
         rfZXMMXkfI/mSsgjccviUM8DARthQWS2hdCHre/0xsF2718kReaR7lLflUInPl2LRbra
         88Sl1mQON1GBUOIN6Eucl3yROxanrMR3ja/phqzke+nKSgE9lzkEPoEyX1Wwhqpn3hfA
         GzyCWUxhVS06ZDziHSBqV2HzWtmQrycqL1pgA43JIRBMTltrxp3InB3ejnNvO5F7yLU0
         DFedxWALbk6nY4CTBM9FKMYhjdFsOC2YlYc5JcYTaWGSoMv08fBhf6k2Ulsl5Mm4LKJY
         J7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743763030; x=1744367830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s85N6LbGyDvlbfm+7fjpbjUdhdaXcYheIAW+0EJPQoQ=;
        b=Y3kXuq8DRT+9zEnW2N+MRa0hrMzLNTfiBUaSEHTTq864U/fXvwFu8s1xtJ85T22B6b
         d7pkyMK0ZgSKZ0X8NJNdLr3X3+2aTrL3tFcWdRUQJsQJHKNpiovhbfId5MUX9P0QI2oo
         lDHWcgJbC6eQcOMi8ajm3lsCBDl+d2Ja5pAFPIyEoGaXt3rF6xIJ/NDqqqpjAE68hIjO
         22G7v/qjPdsyIwUTJGo9FYWvarp6j7tanj02WUtDY3Ze1VQYpzIw8t5j9igq+QepnhQ3
         nIx40SB96scforHjJCrzl9zIG9lXjiHZgffiSAasOFkxoS3vgY0jI92w79RQREWygHE7
         1k6w==
X-Forwarded-Encrypted: i=1; AJvYcCWdiF02GOkfPk5Pt+tXZjDPVPUA5BnIWMrvASmtEitGrtNlwNVamvvzmeHdV6xDb5Gg1afyY+2GgrzpAogSnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH9ub9zvfl9O4Gne2qdx8C9WHCB6aX8xxBeXCVFrd6ioPJ1czg
	b5I1WvUEES0ELXUfXZ4nTVq1tKMd2dU+6kFWIkTpvU6k/MwaCXz5mR0E6JTVtPLXTmKJHHFTp1P
	4ff6/TTpFqlAY0/wJUeFQv2cmsrhPi1v/oAAQUg==
X-Gm-Gg: ASbGncs/oNhTyCReFh02wAqwkW5TfefjA2B9vaJDFlfbz8CgyKMScsgK0ScKrCZ8qFJ
	eBORGuEJNZEUAce9FxtcwhqSCP7YuHRJ71K4N+woIbJ0pnY+qj6r8pPAc+FDKo9I8jmfnqaq2mu
	2Vz16P965UaeGUJZux5hID7SFqlm0=
X-Google-Smtp-Source: AGHT+IGuuSb2kyra+w2zQGcM5KZ+95CLnIjAJJ+ZAGPbM9ApbFO7sbm4a8zwJjSrMRu7/2gU0ViAtYbSOKTRdRXJ4YY=
X-Received: by 2002:a05:690c:4c11:b0:702:5689:356e with SMTP id
 00721157ae682-703e1546003mr46207307b3.12.1743763029893; Fri, 04 Apr 2025
 03:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Apr 2025 12:36:33 +0200
X-Gm-Features: AQ5f1JqCiMQtdQdQn1tCIXwltI0szojsJGdKxwputYjFQK19pJwwJrC7p_ihypo
Message-ID: <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_033711_002883_CBDBDCBA 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The "power-domains" and "power-domains-names" properties are missing any
> constraints. Add the constraints and drop the generic descriptions.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 6f74ebfd38df..5bd5822db8af 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -313,19 +313,15 @@ properties:
>      maxItems: 1
>
>    power-domains:
> -    description:
> -      List of phandles and PM domain specifiers, as defined by bindings of the
> -      PM domain provider (see also ../power_domain.txt).
> +    maxItems: 1

There are more than one in some cases. The most is probably three, I think.

>
>    power-domain-names:
>      description:
> -      A list of power domain name strings sorted in the same order as the
> -      power-domains property.
> -
>        For PSCI based platforms, the name corresponding to the index of the PSCI
>        PM domain provider, must be "psci". For SCMI based platforms, the name
>        corresponding to the index of an SCMI performance domain provider, must be
>        "perf".
> +    enum: [ psci, perf, cpr ]
>
>    resets:
>      maxItems: 1
>
> --
> 2.47.2
>
>

Other than above, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

