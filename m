Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC6CCD193
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=; b=cBKDkZ+pzEx0ZIAwxkvVXKlPmZ
	f/TONG+RFTzwNzd56ZvhSSIC8rHIoHDx6Rdh6a2+zRkRIiryvltvovA9EGMZ3hmH9eq9En/QuXyxW
	g+5MZrjrabz0KcCv/Y2FLBNzMInvFtAncxxEDd6C28DBkxWPTQFuozKlK85OJ6pfigTVjo5kEjEGG
	4/0rfr6hSYgq1ntcSBzN9raH/w+EYeYcCwPSqypdbN8swx8LbjDo3iZ4VJzxRmDHjD7tjbaJ9m3M8
	oHnsUFrqsc1qUoS7IOI3TtG7psvxTSvNyy61n/CFgbILm7uku7LitQEkAar8t8yE8OlA9Y/e1UmD3
	b0QdEgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngS-0000000CzNc-1EnI;
	Mon, 20 Oct 2025 11:04:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngO-0000000CzLZ-37ZP
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Oct 2025 11:04:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47157119d8bso3987435e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Oct 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958247; x=1761563047; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=;
        b=ZcfNGx+TYhEvTtKbT91QNg+KEE5wnlmrZ0cYDFujRFbOsTodZxX0J7TtWoqG8sAaxx
         tZzpiFCB5dGWR+8L9zSUuFM1QSdv3XqEJvqJBqZo7kIIQsCVw3Yd91dLJ17u1neYQdg/
         pqdbs6EiQqlu9JS5ppXvULBDh7j4XqveO5vbgKj5mEgGC61LJVdVQWXbhxGWGpYo+GSB
         FFGEOmYKAD/GAa22GwCFOKHKOKbBn0qzaQASsJKKVQHoiNr2jTDtuR/tKY56cmBPwtMh
         t+/DQTLn2jsgv/FfyzGMwMJCesJ1FGEA70HcVgfJFVPXZc0VOmUnmmE5JMxpJB0zahqB
         KFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958247; x=1761563047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=;
        b=PqerB8H74XUdX3rOfWcbKR+Zr0/9peaSEyUQy/TfVjf6Tp+B+yhcj3ppfykDWkvMQ1
         gM8xpROrzpI5jzeiUcwmzdhp2AwyUoPt1P+IMSjLz0mSkcnLpaxogRrv5lvp2zxC4KsP
         GEmtT7TvFoXsNewYj04r8a64I1TKwRXPQIoqZ+4NwFPQ8g4055eN0FCExE6V3VsLb7qx
         e/cBvCfmD1tNX5VbUPjyRj1q41oGvUQrRqNnEgwuOIqRW+8JhpqP3GaIv07G430lKdih
         9u2o34heX+HLYSn9TNHqfTVs1D22q5TPQy54todfOgXbWf7cSYFl5GjhA4XXZLV09HkF
         NjSw==
X-Forwarded-Encrypted: i=1; AJvYcCUSEelqPPiPMp6C+JI8kttsYVyrAHBbIm4vsSimspiLLhxTYc+LmBoeYtFwjZP/+oiA3Oa1F7CmAKFOu0gekQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPlfJEDdY4ty13kLthMqB2vVXoNcHpIcBBswYtGXRB0usFRnip
	4AvsXve5TwN+7Aml8kroQKn5x+KVRKONefO8PFWVISpp8nT8nkT/RI2Z
X-Gm-Gg: ASbGncu4D6fF3aesAeyB/x7abYLppy5+MJxN9yHXS/RKub9Qb98Ef4OpMn5zkCkLea8
	WvqSxRFqXjNRbEV+PUNZOnUAX1sQkK4FzoL0xCQOXAqlXJY3IJnfqgq5rn6ey+gNcVGDxSRnFhO
	84LIx9UXmqUYwQnKPnezg6dQErJT320jecaR2fDdo8nnXXVOkobQK6QxHPbtECHf55WT4qhJcze
	IqoztmBR8b9Hp7bJrLYWAjbIK0i0cS5bp56g07nfuD9aRl6XjEmr8JHEfd8J4MuEKO0TSnIdXf0
	amHB4AaWr3Z5iaMO4JiRKr5PIdborG9JsexHg87R4IfobAExHEMbx7bijyDaMDbEQrnCEHmAG7L
	wD1hKFB1U7z2qn/rZS5w2Gqj5Zsfz033z3uHw+XRDBxUM5PTPYxChuhDOXMHKvn7+tuVybn4e8/
	711k7pZgPEdzUaTPNV/p8dbnxzq23xfHG3UM64tvdFJA==
X-Google-Smtp-Source: AGHT+IGgJEIPMXEXNKI395DmJYirOVPGUv9eBwNI0mKNkT1iDHPejiG58osCYccM9drAAu3VR8kn5A==
X-Received: by 2002:a05:600c:34d5:b0:46f:b42e:e394 with SMTP id 5b1f17b1804b1-4711793473fmr92013195e9.41.1760958246642;
        Mon, 20 Oct 2025 04:04:06 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm137840795e9.15.2025.10.20.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:04:05 -0700 (PDT)
Message-ID: <68f61725.050a0220.343129.f1f0@mx.google.com>
X-Google-Original-Message-ID: <aPYXHZQYtY_jcRhd@Ansuel-XPS.>
Date: Mon, 20 Oct 2025 13:03:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v5 5/5] PCI: mediatek: add support for Airoha AN7583 SoC
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-6-ansuelsmth@gmail.com>
 <hjyhso2sqgyq4ymzqg6pmjfrfncla24zwsev2mfinolmclm3ih@sol2yoapbykq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hjyhso2sqgyq4ymzqg6pmjfrfncla24zwsev2mfinolmclm3ih@sol2yoapbykq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040408_807781_228299B0 
X-CRM114-Status: GOOD (  33.66  )
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

On Sun, Oct 19, 2025 at 01:01:44PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Oct 12, 2025 at 10:56:59PM +0200, Christian Marangi wrote:
> > Add support for the second PCIe Root Complex present on Airoha AN7583
> > SoC.
> > 
> > This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> > also require workaround for the reset signals.
> > 
> > Introduce a new flag to skip having to reset signals and also introduce
> > some additional logic to configure the PBUS registers required for
> > Airoha SoC.
> > 
> > While at it, also add additional info on the PERST# Signal delay
> > comments and use dedicated macro.
> > 
> 
> This belongs to a separate patch which should come before this one.
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 92 ++++++++++++++++++++------
> >  1 file changed, 70 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 1678461e56d3..3340c005da4b 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -148,6 +148,7 @@ enum mtk_pcie_flags {
> >  	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
> >  			  * external block
> >  			  */
> > +	SKIP_PCIE_RSTB	= BIT(3), /* Skip calling RSTB bits on PCIe probe */
> >  };
> >  
> >  /**
> > @@ -684,28 +685,32 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> >  	}
> >  
> > -	/* Assert all reset signals */
> > -	writel(0, port->base + PCIE_RST_CTRL);
> > -
> > -	/*
> > -	 * Enable PCIe link down reset, if link status changed from link up to
> > -	 * link down, this will reset MAC control registers and configuration
> > -	 * space.
> > -	 */
> > -	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> > -
> > -	/*
> > -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> > -	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> > -	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> > -	 */
> > -	msleep(100);
> > -
> > -	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> > -	val = readl(port->base + PCIE_RST_CTRL);
> > -	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> > -	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> > -	writel(val, port->base + PCIE_RST_CTRL);
> > +	if (!(soc->flags & SKIP_PCIE_RSTB)) {
> > +		/* Assert all reset signals */
> > +		writel(0, port->base + PCIE_RST_CTRL);
> > +
> > +		/*
> > +		 * Enable PCIe link down reset, if link status changed from
> > +		 * link up to link down, this will reset MAC control registers
> > +		 * and configuration space.
> > +		 */
> > +		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> > +
> > +		/*
> > +		 * Described in PCIe CEM specification revision 3.0 sections
> > +		 * 2.2 (PERST# Signal) and 2.2.1 (Initial Power-Up (G3 to S0)).
> > +		 *
> > +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > +		 * for the power and clock to become stable.
> 
> You can drop the comments since PCIE_T_PVPERL_MS definition has them.
> 
> > +		 */
> > +		msleep(PCIE_T_PVPERL_MS);
> > +
> > +		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> > +		val = readl(port->base + PCIE_RST_CTRL);
> > +		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> > +		       PCIE_MAC_SRSTB | PCIE_CRSTB;
> > +		writel(val, port->base + PCIE_RST_CTRL);
> 
> If PCIE_LINKDOWN_RST_EN corresponds to PERST# signal, then it should be
> deasserted only after the power and REFCLK are stable. But I'm not sure what the
> above PCIE_RST_CTRL setting is doing. If it somehow affects either power or
> REFCLK, then it should come before PCIE_LINKDOWN_RST_EN.
>

Hi I checked MT7622 programming guide for this.

The order of operation for reset is exactly what you have described.

Indded, first everything is reset (assert all signals) then we set
PCIE_LINKDOWN_RST_EN that in unrelated. We wait for clock stabilization
with the msleep and only AFTER we deassert the PCIE_PERSTB.

So no, PCIE_LINKDOWN_RST_EN is not PERST# signal sw but it's actually
PCIE_PERSTB.

> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
	Ansuel

