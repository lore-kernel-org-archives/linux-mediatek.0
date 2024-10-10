Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13865CF11C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEBHPmIBUM6VSOI3jWXFPmWe5D+zUJl1ezE/xec47aQ=; b=kKwqs1m5iaXhlwiAyv2HkY7za3
	j0eUrBxWq3CxQS+Xd3qmxb7RlkkgcOdgMKdU56SaNi9Z4EvVkE8CKz5BF9yNHiUngVDbQ4Lbma/pH
	n96zlzNe6wr6TgF+ZiCNYCZ+M/0jL5FA0fcpHiI3n5kNmZJhuLnmVvrhPVYhoIUhB33x+KMAF9EyS
	zTJ/NHKWDQN788DDF2qM+3brFM9dfTSz765KCjs2rEiWokQ3V+MsPOjTVmjFnI2rE8aFQK8NaNXeV
	fjjAc6KvuPVVJL+mhTFS6oU/i3g9+ziIMvec1yViQGTkpo2YgPtZ+XKMWaADY0xQ/NRt6Y7o4M9rd
	QFwH1SSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqBO-0000000CMTW-0Q1W;
	Thu, 10 Oct 2024 10:14:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqBL-0000000CMSl-2PdM;
	Thu, 10 Oct 2024 10:14:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so5493435e9.0;
        Thu, 10 Oct 2024 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728555245; x=1729160045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NEBHPmIBUM6VSOI3jWXFPmWe5D+zUJl1ezE/xec47aQ=;
        b=grHyPF7w3A45Q7TzWRIWoJfy2VHZgGO1e4hEdgVS7o54aL7dLZHrSaavzSnuumbAOm
         F9HHwmf+f7EfQv42ogosfGDKQiZ0nRhdeubo9yBOfSrL2ptczy2mi2kJKkESDqAvcc9d
         QCbtyjbwTktGIiCVYVYIJf43zQGrqz4K7644dFUCuKkznRU6gAon5MrR8qsXJwBS1CRc
         Tk88pP3Yv6ev8a7QY5s+ufYv48/4Rnio5WiqoJMqQ66l2g7BmfjvkLOMfp2Hw7z0ELwq
         eSVPh0R5L/12nSXq2tlvXl56BstTT9FjO7fRp5qkgiVFl5phTgz0tKFTs7Z9w/Stjg4g
         xPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728555245; x=1729160045;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEBHPmIBUM6VSOI3jWXFPmWe5D+zUJl1ezE/xec47aQ=;
        b=CyqtZFaSdvk2MWwoRfaU8d0CSHBnNs9ZJaUm75FJcfPRrVHZibwpgrH9GX4qwxLBrF
         Ys8HIfUNAbumYsTPU6ECBYHhUXbt6uXLV4S8tR8FhoV4XmgMvbETX0Mp+HnwO3GJiABN
         48c+A+BskQ/TWtjamhC0WglQKgNgBwfTy9FHnU6UvIm6HnwtH1OkegJQFjyL3ncz372X
         pBWX38WwKf/ai/Rg2TlIKjC+4typKTHu4Tajsf3yhWKUrL6hy5WxFS+6GWsL4nRkZMY1
         VFt8LJeUAIRuq9MaxUmv6zYu/NBrtQTdrfquYjlXchaSQKdEyNV6C7EM+jy3+HONT2DO
         fLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnylMcCRsSHA0iAXZzYzaPOERrxFBVHu1f2USrl068RdD6ih+fkFF21PYnw5X9vjOSsD+hj2Ff5VzrtxRc59c=@lists.infradead.org, AJvYcCX8Ryrj9rTcx+Lwduc0cakkm45T4qolHWHgakS0NNueheBAcgTS0b0Jwb7IK+WPZX9yheeZy0W5M8uB311+RxqK@lists.infradead.org
X-Gm-Message-State: AOJu0YxoI6TBgNkxWzeoWPFgdYT0IDXwfNqhQ9EDvAVSyYqUFaQkdXFJ
	XJH2/vABS23jqkZVCQgREs2K9xeWstBR5JtaIMn9Rx0giFfqYZIQ
X-Google-Smtp-Source: AGHT+IGDPGThMhthTE4710yoRanga/BmvaFtKZR6ry5ge58zkraATJT3E+r426UaY8y7XNd+9NOQAQ==
X-Received: by 2002:a05:600c:47d7:b0:431:12d0:746b with SMTP id 5b1f17b1804b1-43112d0755emr31012825e9.35.1728555244842;
        Thu, 10 Oct 2024 03:14:04 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm1117058f8f.6.2024.10.10.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:14:04 -0700 (PDT)
Message-ID: <6707a8ec.df0a0220.376450.293e@mx.google.com>
X-Google-Original-Message-ID: <Zweo6cusuf9_tnnt@Ansuel-XPS.>
Date: Thu, 10 Oct 2024 12:14:01 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009105550.GG276481@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_031407_643122_FCDC1FC7 
X-CRM114-Status: GOOD (  29.56  )
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

On Wed, Oct 09, 2024 at 11:55:50AM +0100, Lee Jones wrote:
> On Wed, 09 Oct 2024, Lee Jones wrote:
> 
> > On Wed, 09 Oct 2024, Lorenzo Bianconi wrote:
> > 
> > > On Oct 02, Lee Jones wrote:
> > > > On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> > > > 
> > > > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > > > 
> > > > > Support for Airoha EN7581 Multi Function Device that
> > > > > expose PINCTRL functionality and PWM functionality.
> > > > 
> > > > The device is a jumble of pinctrl registers, some of which can oscillate.
> > > > 
> > > > This is *still* not an MFD.
> > > > 
> > > > If you wish to spread this functionality over 2 drivers, use syscon to
> > > > obtain the registers and simple-mfd to automatically probe the drivers.
> > > 
> > > Hi Lee,
> > > 
> > > IIUC you are suggesting two possible approaches here:
> > > 
> > > 1- have a single driver implementing both pinctrl and pwm functionalities.
> > >    This approach will not let us reuse the code for future devices that
> > >    have just one of them in common, like pwm (but we can live with that).
> > 
> > If you can have one without the other, then they are separate devices.
> > 
> > > 2- use a device node like the one below (something similar to [0])
> > > 
> > > system-controller@1fbf0200 {
> > > 	compatible = "syscon", "simple-mfd";
> > > 	reg = <0x0 0x1fbf0200 0x0 0xc0>;
> > > 
> > > 	interrupt-parent = <&gic>;
> > > 	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > 
> > > 	gpio-controller;
> > > 	#gpio-cells = <2>;
> > > 
> > > 	interrupt-controller;
> > > 	#interrupt-cells = <2>;
> > > 
> > > 	pio: pinctrl {
> > > 		compatible = "airoha,en7581-pinctrl";
> > > 
> > > 		[ some pinctrl properties here ]
> > > 	};
> > > 
> > > 	#pwm-cells = <3>;
> > > 
> > > 	pwm {
> > > 		compatible = "airoha,en7581-pwm";
> > > 	};
> > > };
> > > 
> > > Please correct me if I am wrong, but using syscon/simple-mfd as compatible
> > > string for the 'parent' device, will require to introduce the compatible strings
> > > even for the child devices in order to probe them, correct? 
> > > If so, as pointed out by Christian, this is something nacked by Rob/Krzysztof/Conor
> > > (this is the main reason why we introduced a full mfd driver here).
> > > 
> > > @Rob, Krzysztof, Conor: am I right?
> > 
> > I don't see why separate functionality shouldn't have separate
> > compatible strings, even if the registers are together.  Register layout
> > and functionality separation are not related.
> 
> We've been happy to support both pinctrl and pwm devices before:
> 
>   git grep "\-pinctrl\|\-pwm" -- drivers/mfd
>   git grep "\-pinctrl\|\-pwm" -- arch/*/boot/dts
> 
>   git grep "\-pinctrl" -- arch/*/boot/dts | wc -l
>   602
>   git grep "\-pwm" -- arch/*/boot/dts | wc -l
>   856
> 
> What makes this particular device different to all of the others?
>

Hi Lee,

this would be the final DTS following the "simple-mfd" pattern.

Can you confirm it's correct?

mfd: system-controller@1fbf0200 {
	compatible = "syscon", "simple-mfd";
	reg = <0x0 0x1fbf0200 0x0 0xc0>;
 
	interrupt-parent = <&gic>;
	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 
	gpio-controller;
	#gpio-cells = <2>;
 
	interrupt-controller;
	#interrupt-cells = <2>;

	gpio-ranges = <&mfd 0 13 47>;

	#pwm-cells = <3>;
 
	pio: pinctrl {
		compatible = "airoha,en7581-pinctrl";
 
		mdio_pins: mdio-pins {
			mux {
				function = "mdio";
				groups = "mdio";
			};
 
			conf {
				pins = "gpio2";
				output-high;
			};
		};
 
		pcie0_rst_pins: pcie0-rst-pins {
			conf {
				pins = "pcie_reset0";
				drive-open-drain = <1>;
			};
		};
 
		pcie1_rst_pins: pcie1-rst-pins {
			conf {
				pins = "pcie_reset1";
				drive-open-drain = <1>;
			};
		};
	};
 
	pwm {
		compatible = "airoha,en7581-pwm";
	};
};

-- 
	Ansuel

