Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7484CF11D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICu3VsZKvL2eXNq4nP6eMLyiBCYNXniiqJTCYSiqQoM=; b=f4Wt7XWoJhKGphfWvRMYrk7iLd
	NbflLd3+IzX2jEH5HTsI7t8KC68mNlZECZRvzXfLnO4hIqgD/+sr74j6Mz/8MHb3gCqMm+UaRKZKB
	NPvJ81J6xM9fLQsudfpdwb3rQSAsisD7PtBVTSNZ8HbJzCQPlOSpuvBGe7WoH75YdF1u2N/pxJ/Uo
	bIbG+D6L/ImV94y9dMBBLUfKrzIcOQ8PuiT5igTeSLtvBIOBDdiX93sJWT02i57UoO7Yi5WevpwF/
	C9q4rgiOnxxcbMwfXVNo9JCYLjqtZ01yYfV1ZN3TyRN1NKpTZnrxeWifJt4keU6TQF1FeHU+tJ6qb
	fS6vcQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syrr6-0000000CdMi-1lCL;
	Thu, 10 Oct 2024 12:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqcE-0000000CR1V-1Nun;
	Thu, 10 Oct 2024 10:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ICu3VsZKvL2eXNq4nP6eMLyiBCYNXniiqJTCYSiqQoM=; b=jowdPhRxJRQh+i+yQRHN7qNiAi
	p3gP8n57sPBeFidBiqV66qFzx1vdohwLlxI+f8OO6k/wj+oDJEPR0nQpQChrzywoicpcp8a8Le7AL
	aKbNHwuiMCxpAbHlaPPTJNjcNuk3/DzcRwrRo9qfQd4OiCjEdgI06iaLLAGxQzF+eR3S5HOmCbabl
	NPpNxcEWlfq8q6Ro2D4fK4uHYrnAKI/buBFjhDs6o73ZdfkhnhhDYbtQKRXd6Rfley6O0ADClDdqb
	3aphk2beYFNYdcm1G9m5jfIqD4JP0rzopOHPP643eIUUtUzRcFI0c737t375Jq5t6Ml9chOVc+4to
	eMRbr1Zw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqcB-00000005LZu-1F4h;
	Thu, 10 Oct 2024 10:41:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d51055097so94244f8f.3;
        Thu, 10 Oct 2024 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728556908; x=1729161708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ICu3VsZKvL2eXNq4nP6eMLyiBCYNXniiqJTCYSiqQoM=;
        b=PjpEUUY1oSvk6XnXy8+5LD10nlTEKRWMhQPJ4JxKR1EpnI7QbII4wIuRmHAzsnRBGi
         WDYi1DJPSCiwnQEAq0LVVUsi4Nvd8dZ2UuqN2JUpxUHR1oyiRA7+3TBsdfVmM+1ywXOD
         CDhnB+pVgnH9Yh1P5Uw1OUadZKCDe7KpeIMHvFc6Pirx+PIuMRa6yhEJP+KAoRA+Bjip
         IdGWDHCpG0sVqa/e+Vd4WUNpuFXfl3Dnqk0/SH4nFOVZSg5k0MjPStG15MXGOx6t0kRF
         zOly6bCdLLyOKSYNBS8vM+DxeOEDVDgVKn2yoq5MYMAlTylKeFrEV+2cKUhVEbkdYVw4
         PSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728556908; x=1729161708;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICu3VsZKvL2eXNq4nP6eMLyiBCYNXniiqJTCYSiqQoM=;
        b=E1ebG9ZZeauPSAZEkr7INcKMuC4IdFuKknUUYm1VDSrB+Jhxb/NqgLak8F4jjsaUFS
         u3JArXuUSpujHsBtdgaVPOic2EiFVdEHRHNvCowatyyZWD1xmV1r5D+cKOawwVAAho0e
         JJUxa99diZZF0ziHeB7GFs4HHh4KDuCLhGYaN4iRfYZ8qcnPg8cqw/5HDkHsO6ZC9T72
         sig/thKY1yfcjb2UAdGhObRpF8pZ9VBnnUOUMVG5ttsnN+MZqya0xLHOlo1SgF2ZqsRu
         tI7yDqNigQ/LS83nl408S/1rDOdz/roPMkS7Yh4j5vuDyfNIbbckNpUlQGAXxJd3lX9N
         E3TA==
X-Forwarded-Encrypted: i=1; AJvYcCU75wHGDvz3lv0P2KtAhCRQ2rg49k+cQUxY50y5RR2D6dB8AFVdN7y5gFm6Me9MWxVKhWnUfcLgF8RpNMwEEQJk@lists.infradead.org, AJvYcCUIygli9VoGi2o5r4fA2UyXA9M4Lk1mjULlW/+UVrc/HRkMvUY1rN3nnzqluQ3BgV/F1zb1AsCMzOFejGvIrlw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyDToydipgANtjdXF/nS4Tp5HHnfeI1hHYx4r3DgHxT/p1Vmco
	aVrSdV6Yb7mwgZ3jcE2wqe83qLdcv5yvoz8iWoaAGCcZd2HKGdCR
X-Google-Smtp-Source: AGHT+IEcIdI8ebXVd8j3aFJ8Y9FMkMiCv44M+O5iKAgT+bUxjjTjVdQBz77Q5o/nX3gB7U6b/V4r4g==
X-Received: by 2002:a5d:4bd0:0:b0:364:6c08:b9b2 with SMTP id ffacd0b85a97d-37d3ab004aemr3042815f8f.45.1728556907439;
        Thu, 10 Oct 2024 03:41:47 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79f679sm1181969f8f.73.2024.10.10.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:41:47 -0700 (PDT)
Message-ID: <6707af6b.df0a0220.cf486.2f75@mx.google.com>
X-Google-Original-Message-ID: <ZwevaOHK9FAtyzyg@Ansuel-XPS.>
Date: Thu, 10 Oct 2024 12:41:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
 <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk>
 <20241009104821.GF276481@google.com>
 <20241009105550.GG276481@google.com>
 <6707a8ec.df0a0220.376450.293e@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6707a8ec.df0a0220.376450.293e@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_114151_570064_656982D4 
X-CRM114-Status: GOOD (  32.35  )
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

On Thu, Oct 10, 2024 at 12:14:01PM +0200, Christian Marangi wrote:
> On Wed, Oct 09, 2024 at 11:55:50AM +0100, Lee Jones wrote:
> > On Wed, 09 Oct 2024, Lee Jones wrote:
> > 
> > > On Wed, 09 Oct 2024, Lorenzo Bianconi wrote:
> > > 
> > > > On Oct 02, Lee Jones wrote:
> > > > > On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> > > > > 
> > > > > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > > > > 
> > > > > > Support for Airoha EN7581 Multi Function Device that
> > > > > > expose PINCTRL functionality and PWM functionality.
> > > > > 
> > > > > The device is a jumble of pinctrl registers, some of which can oscillate.
> > > > > 
> > > > > This is *still* not an MFD.
> > > > > 
> > > > > If you wish to spread this functionality over 2 drivers, use syscon to
> > > > > obtain the registers and simple-mfd to automatically probe the drivers.
> > > > 
> > > > Hi Lee,
> > > > 
> > > > IIUC you are suggesting two possible approaches here:
> > > > 
> > > > 1- have a single driver implementing both pinctrl and pwm functionalities.
> > > >    This approach will not let us reuse the code for future devices that
> > > >    have just one of them in common, like pwm (but we can live with that).
> > > 
> > > If you can have one without the other, then they are separate devices.
> > > 
> > > > 2- use a device node like the one below (something similar to [0])
> > > > 
> > > > system-controller@1fbf0200 {
> > > > 	compatible = "syscon", "simple-mfd";
> > > > 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > > > 
> > > > 	interrupt-parent = <&gic>;
> > > > 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > > 
> > > > 	gpio-controller;
> > > > 	#gpio-cells = <2>;
> > > > 
> > > > 	interrupt-controller;
> > > > 	#interrupt-cells = <2>;
> > > > 
> > > > 	pio: pinctrl {
> > > > 		compatible = "airoha,en7581-pinctrl";
> > > > 
> > > > 		[ some pinctrl properties here ]
> > > > 	};
> > > > 
> > > > 	#pwm-cells = <3>;
> > > > 
> > > > 	pwm {
> > > > 		compatible = "airoha,en7581-pwm";
> > > > 	};
> > > > };
> > > > 
> > > > Please correct me if I am wrong, but using syscon/simple-mfd as compatible
> > > > string for the 'parent' device, will require to introduce the compatible strings
> > > > even for the child devices in order to probe them, correct? 
> > > > If so, as pointed out by Christian, this is something nacked by Rob/Krzysztof/Conor
> > > > (this is the main reason why we introduced a full mfd driver here).
> > > > 
> > > > @Rob, Krzysztof, Conor: am I right?
> > > 
> > > I don't see why separate functionality shouldn't have separate
> > > compatible strings, even if the registers are together.  Register layout
> > > and functionality separation are not related.
> > 
> > We've been happy to support both pinctrl and pwm devices before:
> > 
> >   git grep "\-pinctrl\|\-pwm" -- drivers/mfd
> >   git grep "\-pinctrl\|\-pwm" -- arch/*/boot/dts
> > 
> >   git grep "\-pinctrl" -- arch/*/boot/dts | wc -l
> >   602
> >   git grep "\-pwm" -- arch/*/boot/dts | wc -l
> >   856
> > 
> > What makes this particular device different to all of the others?
> >
> 
> Hi Lee,
> 
> this would be the final DTS following the "simple-mfd" pattern.
> 
> Can you confirm it's correct?
> 
> mfd: system-controller@1fbf0200 {
> 	compatible = "syscon", "simple-mfd";
> 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
>  
> 	interrupt-parent = <&gic>;
> 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>  
> 	gpio-controller;
> 	#gpio-cells = <2>;
>  
> 	interrupt-controller;
> 	#interrupt-cells = <2>;
> 
> 	gpio-ranges = <&mfd 0 13 47>;
> 
> 	#pwm-cells = <3>;
>  
> 	pio: pinctrl {
> 		compatible = "airoha,en7581-pinctrl";
>  
> 		mdio_pins: mdio-pins {
> 			mux {
> 				function = "mdio";
> 				groups = "mdio";
> 			};
>  
> 			conf {
> 				pins = "gpio2";
> 				output-high;
> 			};
> 		};
>  
> 		pcie0_rst_pins: pcie0-rst-pins {
> 			conf {
> 				pins = "pcie_reset0";
> 				drive-open-drain = <1>;
> 			};
> 		};
>  
> 		pcie1_rst_pins: pcie1-rst-pins {
> 			conf {
> 				pins = "pcie_reset1";
> 				drive-open-drain = <1>;
> 			};
> 		};
> 	};
>  
> 	pwm {
> 		compatible = "airoha,en7581-pwm";
> 	};
> };
>

Also asking to Rob, Krzysztof and Conor.

Is this DTS OK for you?

-- 
	Ansuel

