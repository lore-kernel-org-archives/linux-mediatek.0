Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19122C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=; b=lvXmyB3+hiRP+ziFS49iD2aZMF
	VSOuWY+LF4DlxbWcyDyJvZaox/RVPwaHhiAtSofmV15J+5t2YHICn87NEvqFGOG2I5sMNOaoSdt/E
	/KiZjUreeYTMcMNcBGNzGPmbE31nqhJ/1GZrnRwtA6yCpx1abc5Z2WL/437EElcKUCy5Zw5WXjcoi
	GhDMo4ObPUicVtrywT5o741foF/5DQ4TH72ym4n+2Rvsq2qWj3CbIzyJ1xqoJ6sGzP1rF/GXeYtta
	qfGr59bx0y0ponek1iEhMR8no6qd4U4iQCa/HsIOT77Qb06jqcfiJJeB3X3pFBQ8naBkIwKjPit6G
	A2o7ZJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPZ3-000000099fc-2CwQ;
	Mon, 15 Apr 2024 16:52:17 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPYu-000000099c3-2uqz
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 16:52:11 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso2224778276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713199926; x=1713804726; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=QnF2mDXNy3cruS+mVEB1FdfDwBaFokAO6+OlLV5FgJT3sK6q8Em3xhR4YI9mo6oMCV
         RmtxRRQD2qwIuHYf1J2r+73VWh9rrhpHmroVM1DRD5kqh731t1NEauK608oMI5YlmHLM
         HS5CqMtx4vaccjsRzJKTAtVL4UQBp7As/m1IJhsy59PuHEYaAhiFLzNGspNrUAgLip+n
         TZLvlN8oj+igwHU+PJ8N/aLWvkmnPqtliFeiZbFYIVg1kpFWomIOt0PUWqKJmZAqTiBf
         jilpiigYREI6dagy8fwMZx7h27elwalXGTu+mbWPlPfdbA8H2A1aS2hrXu8+6e0HgOxg
         4YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713199926; x=1713804726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5nj7t3vt2EbEPLlkWSc/ywApSrSPp8k4DfqheemWX4=;
        b=W9xDMPEBTjHPAmsYx7hmuio2rVo0dJgJvUXEhFIJ5jCNoNiG6DMmWu7dj4Dvt1xDQC
         xS7pW0GS40yn0MWd6UJhXLojljSOzRCv7wPEpLH83thOoTjj6DF4bjSpb2K5YRwrmYJ6
         dokf7dh/qHnuz+C4kMV7DD/rtV5+AjxIi1WaOqufa7W+6nJd6EK9IKNMSw7aRDCgaP78
         E3JKuuFVPpCLIhe3WmMTRTJeVP4bcRUEEDhf6dAwFRkjAXaHO9XWc6B777QSTPRyb97s
         ZVMRybAjanHpCe//CJkcCVfENS5cdCwK5cbTHMPghTaCFsQ9TqVRiDKF7bZlk5xOiNdn
         YydA==
X-Forwarded-Encrypted: i=1; AJvYcCWEj39lH3DatqL3b1tUw/Lc/OGLTFWDj1nTfD0TuyP9K5h3YVL6npLlCFlGsrYrRFI0YYHniZfAGKvFZSy40Bfg2tAyPWLsy9229nhkoF0/ztS+
X-Gm-Message-State: AOJu0YzQnFw6lBfJOXddic/rg59kY3/0sF0q4OwKe3PeJ1EajFBaHz0S
	sITAIFXNHIm/+wkrTmSVff7G/abr/CDHO16BY5sR9IR9yZC2Hxdq6LSx2AQF5NZtxskorJ2TCtA
	wMp7g4acvLp3j9bD0///eQH8/WVXGjfKTxZNUaA==
X-Google-Smtp-Source: AGHT+IFUQH4ONlkcS0+01CEMOIrS9D3xuTmTIKe0INOXof2d+fsMqiJVzA1ER/VV0S5Vp3kzkSBLhneirq6dUQh4r9c=
X-Received: by 2002:a25:9e0b:0:b0:de0:df15:b372 with SMTP id
 m11-20020a259e0b000000b00de0df15b372mr9733585ybq.63.1713199925395; Mon, 15
 Apr 2024 09:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 19:51:54 +0300
Message-ID: <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095208_873073_7664F3AC 
X-CRM114-Status: UNSURE (   9.91  )
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

On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> [..]
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>
> Acked-by: Bjorn Andersson <andersson@kernel.org>

Note, we'd need to override PMU compatibles in sdm636.dtsi and
sdm660.dtsi. Ideally it should come as the same patch.

>
> Regards,
> Bjorn
>


-- 
With best wishes
Dmitry

