Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE47C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=majJ1avGrA5sKHgff1+tjzzyZx4Q8F2N6bTI30UoVN0=; b=gGaIhhycvp8Ioa97Nxf+gBh7QC
	3uP8MVQH6nVU/5NLmDoWT1bzheUzb5dmvfKyy669Jiz5XNFcl7JWyMn/auK7dtqtPGgdSvlJDAMQj
	U9jjvxe10BIgmI+JsjiLP/8m4sb88o3GX0K1m/s1pDKHDnABT+z3nj78JpNF5ZAWekJ10jydFUjoU
	o3Ictsg/pX9YjuRoH7uw9LMlryNhbR93Gq6yDbADxLUgRWbR8zKqVa54cmu+AYWQkWICDKyXmy5Iq
	rDSbnkT5YkEeau7p6ZNy7nsEFEPq11C5DJxWbkPqcCxjrFMycBegmmPU4J/p1scxml99rf3UtIVj7
	3NvlHU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2K2-00BMKS-PU; Mon, 21 Nov 2022 08:38:34 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2Ja-00BLm0-QA; Mon, 21 Nov 2022 08:38:08 +0000
Received: by mail-qk1-f181.google.com with SMTP id s20so7556779qkg.5;
        Mon, 21 Nov 2022 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=majJ1avGrA5sKHgff1+tjzzyZx4Q8F2N6bTI30UoVN0=;
        b=bFNJ+4ET1AEu9WWK9l+Mh2XDG5pcMUb9/9dGlmZR/KdGK8BEvQIxIK372V+d0+oDRe
         SrNpbu9OgkNH5ySGuRM3RqQ+cv8nEqO2BE5Pr4d129l0+Qsz1gHa0y9+zJmFA1N/kPOq
         LGV3k9p8Yl80Izg9sAUEqWEIB1kgu9Mfa0hEUQFle+IByp6IfpF/I9/q71K7MDYoAf4e
         g2j2wFZpMuGw7TnpP2rVFr8TCmqO/SZ7pL+BTnwSQ5dqMfbP7VHEgqiX6LutPWdJa984
         CwSBIpALevQQGNJhKUOfzQGimMAaT8At3/dW/zQKxKVBBIlkfGhRji9hKccW8aj4oV3t
         5veg==
X-Gm-Message-State: ANoB5pkzQgh+FnP1NCZviOHs34x9xMteyghUrVfT/YpjO0mCI1vT/02e
	e+I5Hf1WIwZ4fiN2Pr/J8bSo2w26/L+WKQ==
X-Google-Smtp-Source: AA0mqf5KdxCdUBFdFtlJ6XtQtrT2YT/rqOXLz4l6PVw0uJ/k7f90gKJi6BvkEjDfsl50xUT0eOrprQ==
X-Received: by 2002:a37:86c6:0:b0:6ee:96d8:962d with SMTP id i189-20020a3786c6000000b006ee96d8962dmr14994848qkd.209.1669019884424;
        Mon, 21 Nov 2022 00:38:04 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id c8-20020ac853c8000000b003972790deb9sm6375924qtq.84.2022.11.21.00.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:38:03 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id k84so12771884ybk.3;
        Mon, 21 Nov 2022 00:38:02 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr16184146ybp.202.1669019882500; Mon, 21
 Nov 2022 00:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2022 09:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXevKD5uq9k+gWygy0rZ_AVjxBW1vrE_Gzzu8=mJu1vjQ@mail.gmail.com>
Message-ID: <CAMuHMdXevKD5uq9k+gWygy0rZ_AVjxBW1vrE_Gzzu8=mJu1vjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex anchors
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_003806_903062_8F64E978 
X-CRM114-Status: GOOD (  18.89  )
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

On Fri, Nov 18, 2022 at 11:43 PM Rob Herring <robh@kernel.org> wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

