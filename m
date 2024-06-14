Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B37C27C75
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 10:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=; b=tLNvnoSsdWtgz4YW1aZ8lmCaBr
	my4vv+ABO84Zo+V2riVMpSo17epNDdwFhvwLfiOWYTAq/HseO+EOIe4Zt6KysCMDnXVHxOwwI4RVH
	KhtpBXgcGJY2zi0rHJooP9UNngLVv/ZhMeS4Gl7u8czv1ytPdss5uaDIkSgW26/SuaqSD1kUspu6i
	ZBtC7pOCUBwsZ+bzMOYwxJDOllC6L/kM+CGJPetgxtYbtLT3gMqeVA26dHRa5QVAvn7kA18fTxDyF
	rmg4hWfz2V+jhAfHWDZzI4Mv60mEAKC5iOAqo+KZWCwdQEGMlgth1Yin1StpKDwsFJcHY2Ng2fOMq
	q07nvhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4Hk-00000002TCu-3qqf;
	Fri, 14 Jun 2024 10:35:56 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4Hh-00000002TA9-2VRf
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 10:35:55 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ec1620a956so6830771fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361352; x=1718966152; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=Xbk0px2Zyp3JZ0cyIxyMu74RsaYgEDhNkgq1txpPLotWWumuLKycH1PWSPKNtRY9AE
         4hb6ylXO543CbeR5YUoSqRnOQR4rVw2B0ODlBi/UUzZOJdFtvbqaW+4fAew2hxTTmahe
         AupHysQIhippjKiJlhEpT7CMzY3+w6XGOqOOEutE9O6CRPwo8AJtR1WAlKjkKRiwTsxo
         TE9281O+YNaDw+QYWR6mGQjt8oTRfo/rlXBmcfstxEyHuke3Ng5LeyhM7+vhyYNJijZT
         QGFaRx5wcW4b3K+EhE5i0D/rRPczNekVMyJww1vRMqgzidQL3ZaFpWwEYho9N/KJ97OI
         o/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361352; x=1718966152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=K1RBRvH84XHtVV3FsIiFs4Hx78YoqRU5zcrHNmXNkrpeSV8t/8xkIC85mQF5k+ubjs
         7uBTR1YDQcVTKiTPq5S0x+F6RmEx6KaFNTRfDkYdQWNIeXoJQD/Bw41qJWew/ffiP6Lr
         VlhmJbwyHgwkEgGW1qqQ2yqrYRd1Cb5aXUbTlUpArz089PbLZm/VDSDxclQWCEKF/KxB
         Ab3RbjTW8JbyTXJvR2cx3T723QYqIvKxgNvP2697CMsJPFDLih+SHLdBteq3F6UJOOWD
         7GY5jQJAdZ9p24mDmFWX8AgxyCr+TXATnh4MpLepSEqs3IPsCJu4e+BCqGJZa376jkXg
         1gJA==
X-Forwarded-Encrypted: i=1; AJvYcCVXuqT//cRIIGZwitI0OGbIuYX/l3qGrOA65fVfcYeMLpW6ODgTEt2vNK1yj9CoRLRS8Bp+leEo9jD8dfMyspg6BTXh8ZmVmC9+IFFdcCJLrFjd
X-Gm-Message-State: AOJu0YxXwI8ks7PPl8KiRS7tD4nAqEE1L4YNJTrL6f21tgSmIH2E0rmT
	MMKc80CL5zaE8YUOLJ5Yfwh73XRcVtCskMAHtH2u24JDnf6/ZGhBqTGQuC7MBYU=
X-Google-Smtp-Source: AGHT+IEbw6LK2rPBbVuJQJBgxOhegr+TV/18ANijB4Rchh5JfiMQ1/qs7DuIZLwqd6QzWtrSJTx22Q==
X-Received: by 2002:a2e:8386:0:b0:2ea:e26d:c9ba with SMTP id 38308e7fff4ca-2ec0e5d0c09mr13495761fa.27.1718361351635;
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf438fsm4969921fa.24.2024.06.14.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
Message-ID: <eesj54re2itzlcr3ctntqjued5mqucbfxuoiy64344qkzt5be7@2643dlhd4kpl>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033553_709689_B90A4BE0 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, Jun 14, 2024 at 11:46:10AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

