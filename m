Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2D9C77B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZLBQ5GMO3S5FZKU93RAqvRqbEiTSgWH++nyXw8Nmek=; b=N6mRddiIjTO7MJeeYPIFXF3hG8
	kxuNLSpphJ3yqWuniWwvSXWnxc8/FTu3iVHHfoiJbQlKHwqeinXvSXm/s3q9vBt7txIVC57omRdCZ
	fUfzem112XgVMVH7MB2qf9JnromLul2KPxvzRT1fiCzP95UUt/L4mjoKdxJEtMK3Eve2+YRvNWShv
	rRh7PlFKAPOWXj/KJ0eQLGiXz5OoSmEIqbgr55D5j8qm5KtorRB2Qlb31F7TSy+k1D13/Ghvae8Pj
	e62piODMJ15R22UpeDAkK5p9OraKUgcldctU+6a9qtAkmELhA8MsosCZe8DjL+EIFIW4nRJ3Ket9s
	j3dsLq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuyQ-00000004awb-3gNL;
	Tue, 24 Jun 2025 04:09:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuyN-00000004avs-36Ld
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jun 2025 04:09:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747c2cc3419so6103b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750738166; x=1751342966; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZLBQ5GMO3S5FZKU93RAqvRqbEiTSgWH++nyXw8Nmek=;
        b=X8MlNozrhph/KL3uoKomVWkojbyemlzS1R7IExBQ26GUHCRFgJyHRxktp6BuTMOOzb
         vypnHa6IiiAYdeSWhC9Xk5y2yKp65urFCluSOGidbZklO7hOx+V7GvNkp2vPEvbj/hkw
         NEHO3/boRN0rgeLFMjpapeDZMiTth7obKOh5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750738166; x=1751342966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZLBQ5GMO3S5FZKU93RAqvRqbEiTSgWH++nyXw8Nmek=;
        b=Y+pc/pM2tge5++axVJ2C2YMSqJ6wFOW3jN0oHgtwPJIJMlKrelVnx7Jkq43Nk90Qau
         Fizzk/pvJDMHMnn1ccjTi5+xN/n6DE0xtHWnHFazgUaWTZ8vMuR3zSFcP9MT27RCEeb5
         c6AdPi4CmlnMN7G3Q17ZgqdoOXC/EGVvG8lYKkax37Ix3+TxRW6+5vaqdSyVuQWaYF0/
         S+VrKlcp1964AE/bXoWeg6+yl3qRAdrg6wRs1yrYjU7ni144lyi5Ky7q7We7UXd9Elld
         ETj5hGmLVJJDt555RmErxLx4ElAsaDZ4wk2R7pC3JeWwQ6hrUk8jsKxFmuwFGvep0ZWA
         Zerw==
X-Gm-Message-State: AOJu0YwWycsPbdN5RQw0LJiZCmU4b1loZl0YJ/9+B8gR5MVchJO1qXsh
	UuUPniM27M/u0Idi8oNXh7+1O6qylSj/4QjZcDJ6d3XCOP9QY779Eq5XNPLBfrNeMw==
X-Gm-Gg: ASbGncujzZtBC05doQKZapD3mqKSHTHdJsaZKEOVxSJcR5PK2GoDHE9Jn/M65WzyhTw
	XCcfzaRQfekBt0a9BoRS2fTijdsqMgZXq06xfq3XZ2JBHU6CVdwjP8ooeFRWWH9Hz9262Wm5s1Y
	1Prx+EqMHg62kwOOkCeMHrvyBeJsnrQYmtW2pX0NATdbEx3FKsYBuBYbR+9ZknQDIdCWRDqb8MO
	IWn0XVTIyQIGDiEsMTlolytlp+jsomScbAPIAIksYxM2aNOG48cfkcv8ZdLVm6Oz4n+5dlDxoG1
	UG4+kFyNXBh59go4d2fHyI8gxQJofpn2j16kRcorXaiw6o3elGZJu7U=
X-Google-Smtp-Source: AGHT+IE7k5HWqp6yZ4coLK9zxOOKVUatWn7F2bJv6NZWHFFs+9T9PielkjniSbuXSSxVbFmuLwM0yQ==
X-Received: by 2002:a05:6a00:b8f:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7490d7a170cmr19157532b3a.7.1750738166415;
        Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:9e4d:2f37:d5ea:8954])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e4069csm679035b3a.65.2025.06.23.21.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 21:09:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:09:22 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
Message-ID: <20250624040922.GA1077353@google.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
 <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
 <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_210928_076446_9AC26852 
X-CRM114-Status: GOOD (  27.25  )
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

On Wed, Apr 02, 2025 at 12:07:16PM +0200, AngeloGioacchino Del Regno wrote:
> Il 02/04/25 11:34, Chen-Yu Tsai ha scritto:
> > On Wed, Apr 2, 2025 at 5:10 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The PCIe MAC needs the sram to be powered on for internal IP
> > > access and it has always worked before because the bootloader
> > > on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
> > > before booting the kernel.
> > > Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
> > > P0 and P1 to correctly describe the hardware and to avoid any
> > > issue with bootloaders behaving differently.
> > > 
> > > Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > index b33726da900b..0cb96cba727a 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
> > > 
> > >                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
> > >                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
> > > +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> > > +                                       clock-names = "ss-pextp0-mem";
> > 
> > Doesn't the PCIe host controller already reference this clock?
> > 
> > >                                          mediatek,infracfg = <&infracfg_ao>;
> > >                                          #power-domain-cells = <0>;
> > >                                  };
> > > 
> > >                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
> > >                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
> > > +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
> > > +                                       clock-names = "ss-pextp1-mem";
> > 
> > Not this one though, since:
> > 
> >           /* Designer has connect pcie1 with peri_mem_p0 clock */
> >           <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> > 
> 
> I'm not sure what this comment refers to - as in, whether this is referring
> to the board designer or to the SoC//IP designer...

When MediaTek says "designer" they are referring to the hardware designer,
in this case I believe it would be the SoC-level hardware designer /
integrator.

> ...but if MediaTek can clarify, I'd be happy :-)
> 
> Cheers,
> Angelo
> 
> > 
> > ChenYu
> > 
> > >                                          mediatek,infracfg = <&infracfg_ao>;
> > >                                          #power-domain-cells = <0>;
> > >                                  };
> > > --
> > > 2.48.1
> > > 
> > > 
> 

