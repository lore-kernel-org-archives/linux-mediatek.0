Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14772D6DDEA
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=; b=enWHlbd+3IYNuwY204LLxk0/hA
	QIzmEHadvFv77AU/LWELbEH346ml46xv7MinsI2r/REwoEJFxyhiXZYGsooBCt3XMweNL7zGrCgvX
	ZhkXMFdXv66haUFy0VGiYApOFCecxuNn9Gfo/M6CYE2+E2jkDyuT0oNmPHnfM39SGGag2dnWmU22T
	WTjnHGEWBFT2Dy4XKBJFDaXmbeU5noOLmluzFAJg/rOAaXMilL2QHc/C5sAnvdxFy4udgy5qfXB2K
	Ed9S0IuJ/HT+hXAQFbYsMjj8oHxgOCOqTy7dHSojDF7AfMSs1lhNpRfV84oWMoHgGGEkru6JTAELH
	dyuyEttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsCM-000000027Oz-4716;
	Fri, 15 Nov 2024 09:01:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsBR-000000027CT-2wMh
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Nov 2024 09:00:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-72467c35ddeso1295197b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Nov 2024 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731661205; x=1732266005; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=;
        b=CvdskNCn3it2elC2hjfgM/onx5zNWchHdapqfxllGuaPDnp4xCm1Ygd4WPll0li8yA
         MhsEb+DSudikV5QxiprhIMC6hgXXxxTazvDZ8G6oIHjgMZcVYLXx8QStzWUG1HZamsQ4
         8JJcsCXRP2c6CTcIkn8dIrhxn2XJU3dgA3zvS2x/504pjILWjAKl5dZ7Tejw2XFtKCer
         S50MrCtYj86mY+ewpS4SmpLEVqqJ68gh6IfPRse4JkWGXbK6cn9VdMUEnOP3ZijKR3lc
         ertNxntcOFl+3mOeP3Xkv3Ab/ztjBU8JUNOUNAfB7ODoAcbfQOelAOwqYLsRLcIMKWUi
         9SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661205; x=1732266005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=;
        b=bs6cOVbJHR7Yd6CN/2p1bGs9E9QU8dPy9DROGXeDFhxOBcteN0n2j+75csCB9WCstQ
         j3SMW6blci8rGIVyNgMLnOGuE97y4rxvX5AF231okM+Nin8vkDIuuy2OXwKEA3Bctm8Z
         rIH6GcfCDh5COLZltbWnDDQDvWDdVrpGov8Y6ivVMCjUa4EmRHNm0TVuR9LMV2RbPgu7
         KdpxP6ujxeJ1M9GHP6L5cjMXE/gu0Oaj8ZzYAf4ftV197O4QEZ2T3s21g2h7IQ2dV3Ip
         45CJDIJT2nNDLsYrALNy/Kw4v/8fGJTvyrsLng/bM5c36o1PvESiCQYUnO4Dr9Q/KyQ3
         FM4A==
X-Forwarded-Encrypted: i=1; AJvYcCX/HdFpar8/FIunqzjeAUqrH86JYLRAGMVmxx9jyEOhf5iMz7zAYfSAYKWfFh8DS9hVjg4zpF+L7bc02XhFkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWeqwpSuEbHl29esGdYY3L+z2k6rr8Sm958qrQ3JcvoA02DDZ3
	HdRF+q/LTsxaW1Un2lTFFfIf8vRk8oQJQBg3IbxfXyYNEa1R15zvw4WqROJk0A==
X-Google-Smtp-Source: AGHT+IGXzc2k85nHigsVQvGCV/dEUXykSPtZP9SAjYxa8cXADj5jMo8+rVoyKMXLZcK2JnJ73FDM+Q==
X-Received: by 2002:a05:6a00:21ca:b0:71e:44f6:690f with SMTP id d2e1a72fcca58-724760cafa2mr4071933b3a.8.1731661204509;
        Fri, 15 Nov 2024 01:00:04 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771fc665sm883611b3a.173.2024.11.15.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:00:04 -0800 (PST)
Date: Fri, 15 Nov 2024 14:29:55 +0530
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
Subject: Re: [PATCH v2 2/4] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
Message-ID: <20241115085955.dbhi2v7qfuq3tmr4@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-2-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-2-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010005_731268_1DB63506 
X-CRM114-Status: GOOD (  17.65  )
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

On Sat, Nov 09, 2024 at 10:28:38AM +0100, Lorenzo Bianconi wrote:
> Squash clk_bulk_prepare() and clk_bulk_enable() in
> clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine
> 

Perhaps use something like,

"Replace clk_bulk_prepare() and clk_bulk_enable() with clk_bulk_prepare_enable()
in mtk_pcie_en7581_power_up()."

'Squash' doesn't sound right since you are not squashing any code.

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 0fac0b9fd785e463d26d29d695b923db41eef9cc..8c8c733a145634cdbfefd339f4a692f25a6e24de 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -903,12 +903,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> -	if (err) {
> -		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_prepare;
> -	}
> -
>  	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> @@ -921,17 +915,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
>  	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
>  
> -	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>  	if (err) {
>  		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_enable;
> +		goto err_clk_init;

err_clk_prepare_enable?

But I usually prefer err labels to be named after their purpose. Like here,
'err_runtime_put_reset' so it gives the reader a sense of what the label is
supposed to do.

However, to keep the existing sematics, you can just name it
err_clk_prepare_enable.

- Mani

>  	}
>  
>  	return 0;
>  
> -err_clk_enable:
> -	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> -err_clk_prepare:
> +err_clk_init:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  	reset_control_assert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

