Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7203AE6ADE8
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZTqoEwTktGmXK3Qx5NYMXzlUej11tS8qvukucVyF4s=; b=TL+9SlnoQj3ggGVRnSuHfFKM1z
	6+yaW1+2Yb5NSLcQoiH+tTylSCKTP4ML8qRMn08VX6bNn7taKTlhv/2fbbeMLWWiVhxxsHCYt1KY7
	RYbcSnuZaGD6CCXlSbJFUfXBq2tt8dc+Et0UhojD5TSQpjEHLBEmpQbfKdZWNG0p9G+u8fzsQKF+k
	soFBBwlqHFp+jdQmxaDk84XrsmDWx5ROLdSJ32Q9bh/+137SCdBj99WafOuhjeCSjtM/Hm/+KV7O6
	AQyIXd6nQ62mfiEwSo6yCXOnwxIoa/Mt/Y6xs/3wJKBY4W837KcevE9upBRRVj1kRfc4HP7s00iC3
	iLWSs/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm6Y-0000000409h-22WG;
	Sat, 23 Nov 2024 09:07:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm6W-0000000408J-36uu
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 09:07:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so3265629b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Nov 2024 01:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732352820; x=1732957620; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZTqoEwTktGmXK3Qx5NYMXzlUej11tS8qvukucVyF4s=;
        b=EPXqdUcwZJCe3KVLSBP/fL7p3mJhAPvyLcBF/zEubBdzpcZEW8r//Ost1Gy/AUuYrD
         5kYKz0Y1MOxONkvy8JMeOE5vfqO9I2tE+f+WxhwdF3dnlADbIbLjlypSb3beq58ZyhzF
         mVbAi0EI/vTv3MGexI0iZ1La+734h+Fyrr13DTVGFK5FHLmqdT6LbE6qbckh4DOeJcB2
         FEcR6L3GvLlZeXS3AXAYknoucBMh4bMXtN7AHEGNJDGQN7BtjKPmHFpGDwEDfntvQC8w
         nJaaJH2Kwp7XUmSITTGbiAjK42cyfUQFViVpzOEIF1mqDipsSWbRwVkHtuvT9DmlbE7X
         2n7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732352820; x=1732957620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZTqoEwTktGmXK3Qx5NYMXzlUej11tS8qvukucVyF4s=;
        b=NHzCjW++BnO4/VnBHjGmQKaY4pNwFv137SrMUPWkfK3DA311QsGSxuOVFV+jru2GDG
         CLn8bKDXLX2j5KIG6fAT3kPPdR1X0Ivm12JzMebkMbFCB/aOTXaOn7dzygAEmDCIxAkv
         DxDx8YNrPd7hT6n8b9m7JFT2B0g6UHUM5YJsmziw4kN7xAOE/jpGqWlfRxvlNsONDCZ4
         L6q21GwZXmJOvsid1ifWfjXs8APYM6rbEWCMmHzDQT1yO0sto+eEKHbqLCrRkvYnb6JT
         sqp457xg2kehDKt0dlEOW7LhrUungtHq5SFHHWobgurnFbWI1XJzXcXpwjmSxK0WcdSN
         /SOw==
X-Forwarded-Encrypted: i=1; AJvYcCWFVcetJcTQg9GH/yC1qvwyNFimfLk/Y1zCR+iCKJCZS0OuRmiKShPpKUOu2hXnn8KdXJPviz/KZW39KTeccg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGdMG48z+MQhkWsCgx6YtDeyyk/3yX+HaLw4KDU45Q3cKC9Co
	YDG5nvP4LMCoo7cN3bSw+y2XX6DV9ML7mYXEMBZgDBH9YNFRP4ita6mkd4MQKg==
X-Gm-Gg: ASbGncu62XQ1lai4xJywVh/GByzuZxqZSGMZHvWZT+iEhlJCqEt7NSJtHJJi1aIHltW
	XITmKE6WZhvxX9573WNtaOYeAYZbNVOrG3cMBKXAdzFLXnwgrNoEuh776wio1V4EqYpca+CGCyt
	1O6enE+cW2b3emM4gb7GgAF1Bd2yOOpXDxhiP0lu8c71OugPWopnU9rGCSdMyTcZImygsJ0JzpD
	NXr5QviWst4xZ6NfOqo3RyyFQfg/kdS7klX6AEN8fnJKdY/OFsfH/e/igs5y7KaHA==
X-Google-Smtp-Source: AGHT+IEpLHPVaJh+gwdLw83uetAfenPlalM1R5vdNmWHzoapvFpd0b11woYH7NFKGd9VPGuqxv2wQg==
X-Received: by 2002:a05:6a00:3ccc:b0:71e:64fe:965f with SMTP id d2e1a72fcca58-724df666260mr9268664b3a.20.1732352819705;
        Sat, 23 Nov 2024 01:06:59 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de55503bsm2966517b3a.142.2024.11.23.01.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:06:58 -0800 (PST)
Date: Sat, 23 Nov 2024 14:36:50 +0530
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/6] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241123090650.imccksnmovmt2pps@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_010700_850320_D23C5747 
X-CRM114-Status: GOOD (  23.02  )
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

On Mon, Nov 18, 2024 at 09:04:55AM +0100, Lorenzo Bianconi wrote:
> In order to make the code more readable, the reset_control_bulk_assert()
> for PHY reset lines is moved to make it pair with
> reset_control_bulk_deassert() in mtk_pcie_power_up() and
> mtk_pcie_en7581_power_up(). The same change is done for
> reset_control_assert() used to assert MAC reset line.
> 
> Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> complete PCIe reset on MediaTek controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d192db7f99307113eb8a 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -125,6 +125,8 @@
>  
>  #define MAX_NUM_PHY_RESETS		3
>  
> +#define PCIE_MTK_RESET_TIME_US		10
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
> @@ -986,6 +996,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
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
> @@ -1070,14 +1089,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
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

