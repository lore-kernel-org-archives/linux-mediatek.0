Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB4CE7AD42
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Dec 2025 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHOlNr3v9BiOzT34bmSgwncIxbpt67Zq7y9gx9VnnAw=; b=YAhQJsGbXE9jdi
	PZKHGY+Jslx7iliE/ks5yW6uPmt3G4/TI5jSa+4taLIFNjFqccmIWc87XgSHQ1cchy7TYNj5TeLtr
	d6AtiQJg3nXvnnncIaLUN++rbc7FvvYu+eV+FERKZL7yG9Nz2NJ1AjHkLe4YsN9q86aaO1YgbOpvV
	t9Z9Dze3D6FISLCqZ0aKXd9Syu2pPsKNv1YkMbEimeKalDtKT8NC0mrsHb9dFIgRKKIYV1IDnRpgo
	vsMhbEcOLMzhd8W1CpoghRbgNJSz2l2hIXbcv79CNJ+FT+Qn/ThSN/8uPqMVpEHmsU6sTI49Q5HnM
	haj9kCMa678TkSK8c7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhK8-00000000GCP-0EKt;
	Thu, 25 Dec 2025 09:07:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhK5-00000000GBi-3dqN
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Dec 2025 09:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D0A2444C2
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Dec 2025 09:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9FC116C6
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Dec 2025 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653673;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=caBCnPSrtJ32X2296HO3meZX1otJPRMu2wMIRegIwALIMzO0rNIdKPF9/ll5/fGfg
	 tdXLDY+eqDWvJEz4PEMpSgGR/LTyGW4Bg5vpmT4YiHvXXbnCyvH1qNtxtcKqGz++a9
	 7GuohHuJFJjudgAvRuYY2Bn9x+b8Lhv++VAjYpRDCUle403KSZ78am4pZGBOqIjBHg
	 ZP9xYPwyZC2O7hqDmuqmXGC3FRtQTxvHiCfEyKERyxJKu9BKhFFk+tKVuXk8thcXYs
	 Emsb6rG/ENWpdN1jfpFWFZ8sqf8XIyUwjb5HgUQ3OH1IBjFyuzsTjWyriCG+U/yvnc
	 dLt/Ge4Mx12yA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so6632817e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Dec 2025 01:07:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeUKXf0GlcSeZEZKYndM/dWUd9Xv7VXcb4LxB7InSKtQjYXqfHt7oFPHH3+TMF1p7t6K16B3WLn0GgmrOEVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIRM5J+6UXSTzo83IgZYGfqiwXb6csm03O8YdBvG1plVw+8rjC
	N0SmM7aafUF4l4VvcJ8qfo6g+6ZrQDxXIZ/1+uBcWgvVZhSzTizzgGAzazUF64YHOKaFeiNvAN9
	60EOpkQsyiHFGVokQifHudhl21Cvb8Ok=
X-Google-Smtp-Source: AGHT+IHfPWz1heWtm82AOh8ny5sgT9kzx+lyzDjyJcBgqVf6WZJpwpmEyZeQVabkjvt5oV4xlzU03UcKE5H1xk8UgF0=
X-Received: by 2002:a05:651c:1470:b0:378:e0f3:53c1 with SMTP id
 38308e7fff4ca-38113275820mr72648701fa.18.1766653671109; Thu, 25 Dec 2025
 01:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
X-Gm-Features: AQt7F2qwpZzDsTD1g9DqdU3xoJFe0KlIMNtkshCEa1nlt61s05fF43c85tHciK8
Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_010753_997391_844A00D4 
X-CRM114-Status: GOOD (  10.36  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 13, 2025 at 7:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/oxsemi,ox810se.h    |  19 --
>  include/dt-bindings/clock/oxsemi,ox820.h      |  29 --
>  include/dt-bindings/clock/qcom,mss-sc7180.h   |  12 -
>  include/dt-bindings/clock/xlnx-versal-clk.h   | 123 ---------
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h   | 133 ---------
>  include/dt-bindings/dma/jz4775-dma.h          |  44 ---
>  include/dt-bindings/dma/x2000-dma.h           |  54 ----
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ---------------
>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --
>  include/dt-bindings/memory/mt6779-larb-port.h | 206 --------------
>  include/dt-bindings/mux/ti-serdes.h           | 190 -------------
>  include/dt-bindings/pinctrl/mt6397-pinfunc.h  | 257 ------------------
>  .../power/allwinner,sun20i-d1-ppu.h           |  10 -

For this one, a node is present in the DT, but there are currently no
references to it, and thus no users of the header.

Also this chip hasn't seen a lot of interest after it was initially
brought up. None of the peripherals that have a separate power
domain have been enabled.


ChenYu

