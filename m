Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0316D6DDEC
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2024 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=; b=e+Fo50lxZ4VOjmfDfTgJyeK8nO
	F+UFVw5DTXACG5GMKeSMSDKD0/0DgN2Onyr6cnv4xZQhUORisqUCXaFOjjSsEZambZzfzCa/grcdP
	9+rV1RkxGIy++4VF47ah7kUekHpb0KLwfpf9HMRPoES1GKAE4RHEPrAYBY+O1MTFOwVX7ULsHGmlv
	Ye63v+y78iVPQRBmnxCEJ/6sh7QjijcAAq/7VOWRFGR/i+SeiT97oz+RI+mcKQiLklisX73NCEt6+
	0RhDDnaJtx/01iWka6sW9Fv8O7EUHae74fjwEyge0M8y3zcDsdF+oBI5j2LJIgRHORa7kOvrehW72
	TzqANDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsEs-000000027rE-3yL7;
	Fri, 15 Nov 2024 09:03:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsDw-000000027ku-3slV
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Nov 2024 09:02:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ce5e3b116so15491835ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Nov 2024 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731661360; x=1732266160; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=;
        b=gaDvnwv5r6Od/G86V0AqMvEio+UKQDfpJYaMY/LcQSfjAY/M2HPKmIRHykKhLjZntY
         DCY9RtZ1luYqb3iunQV2WqRnJRSm1F0a3Lv4S9NTMHPZ29+NFMqb6lDstvmHQIhULTS0
         /5Sg4dRzuZ5Uo2gCd2a7MpuOvM/GmZpunTDevotUcB3Lve8U8lkBmhQ+6xrXUGqh+tRD
         nqcdXUgY60RxGuSMNeqRkyR7mzp9+QAK0nxkXF2NeLfrD4sP5lJoIzwgfMzIaYVy/Jjh
         DjdIpcIhkXs0c6msobzBUj04MaiW35uxsmLWe5hnNdeRLHPbxzIi1lNwXopkownMlyTz
         cSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661360; x=1732266160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=;
        b=hQpDuaC7KrVdHG4wmvhowHvWdFrQILj/q4g/HI62RuFpAjOzK/aJALaNyEGNHaNZiM
         AsE+QOdmW2kaNWcZPhCFC0OjAuBnI86ddcmbpc6ulHFdYAYrTsNLpUsYKvePPBTeaTEc
         Eb0ODQMhn8+Nff+lVvYTNR8HChPEIFNMwvs/CUVNsonqxfgDItQ5e0m8iU/Rif/qAXcS
         4T654DE3vl167rVFS0QFvstFEVZMK6B1MlMt4zQfqgvWMla1XeeXwKIIyP/iUBKsvHZP
         AvdEl0MxYd/DX0zRpwReJFN5s9wjRe6naxJqFlOAScErdcIlHPHISWh/7Q7Hptdn+wFW
         tiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaxHW0jpApq93iZ8Z6y+xMh5SDP8J6U3fzYfK3x480Y2BpVUvFPP2orn7wuovQLymKiHABFXrwlMKC8/j7zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2SBMAOwb1IQDP80dhWMSZ9lImvcdCdyo4nRCjaYWFp4ZVJ/k2
	o/h0Y2ae8lUCvsjjRdHaj3IW2U0aWr3MclP1A5P7NYiA0+y0qZ6VDVLNY5arnw==
X-Google-Smtp-Source: AGHT+IF6ewmiGHuNhETgOoZ9s9tHcZMJFEXL8UFTyjr3PsHYLNE6u0F19Zk/8GV3oZcloNjYIK264Q==
X-Received: by 2002:a17:902:c40a:b0:20c:aa41:9968 with SMTP id d9443c01a7336-211d0ed2e4dmr21401165ad.53.1731661360274;
        Fri, 15 Nov 2024 01:02:40 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47c04sm8089485ad.221.2024.11.15.01.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:02:39 -0800 (PST)
Date: Fri, 15 Nov 2024 14:32:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241115090231.nwmxl6acspxqflpc@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010240_968935_9CFC649C 
X-CRM114-Status: GOOD (  22.89  )
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

On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> In order to make the code more readable, move phy and mac reset lines
> assert/de-assert configuration in .power_up() callback
> (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> 

I don't understand how moving the code (duplicting it also) makes the code more
readable. Could you please explain?

> Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> complete PCIe reset on MediaTek controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16da96208b3cc0c3011 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -120,6 +120,9 @@
>  
>  #define MAX_NUM_PHY_RESETS		3
>  
> +/* Time in us needed to complete PCIe reset on MediaTek controller */

No need of this comment. Macro name itself is explanatory.

- Mani

> +#define PCIE_MTK_RESET_TIME_US		10
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +
>  	/*
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
> @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	int err;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> +
>  	/* PHY power on and enable pipe clock */
>  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  	if (err) {
> @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	 * counter since the bulk is shared.
>  	 */
>  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -	/*
> -	 * The controller may have been left out of reset by the bootloader
> -	 * so make sure that we get a clean start by asserting resets here.
> -	 */
> -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -
> -	reset_control_assert(pcie->mac_reset);
> -	usleep_range(10, 20);
>  
>  	/* Don't touch the hardware registers before power up */
>  	err = pcie->soc->power_up(pcie);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

