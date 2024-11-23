Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5F5E6ADEB
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=; b=N5Cpxz/NZx3XGFErFOCLCdGQU+
	RpX/3ESStScnfoDH6TOqSaAEqQQ7T1siq3yRE5H+ou8h74wBEw0HWPwrNKd7fgR6d6XQ00/sk/FLu
	HWX2TKsMtaAu3h0Ci5g18r8OSA2w3Gfhv7owx/Y4ntu/STKGfNiH6vcq4TevmcCRJhuss39+omPpE
	ukZNKD571FGWUXpG9IvJfGqpkTXSMM83M5gM2wDIQlek4r1aTlV+h9glvcLmgvkE7n9bKzNrgps5n
	1i18mvgOzEcDMa0v5pfp/U8AWyb1HXmYKTuijgCCFvT3oJYDcNkYeXOwnAjpWEcJ1jWRExPtXwIox
	WiweDMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmAv-000000040pH-1fPm;
	Sat, 23 Nov 2024 09:11:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm9y-000000040hl-0mov
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 09:10:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7248c1849bdso3011458b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Nov 2024 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732353033; x=1732957833; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=Rcgn4tfpHwYkko7o8dhYD+T1WNFX3qkVNhBivLqTTakgeDrYMnsPvh07WRrcpqnxir
         I049wseSpOCBWsB/jKO+drnR+dyf2YMjofoHknldpu97srPpBoevRMRGjn3RU76boXZ1
         BXN14fKy66tFrUd882Y/aiGCG8cK8c1fRMRXR74qGAiXZzNpD24yZYzwt1BGD2R7dkhy
         yNcCO0YV++kyrLapruB3DzuokygVG6l6fLsmOrm2JzoHXgsy5HXcvqgoWAjia711fUyj
         I7iDDulp8zbihp+mCUR4PidtGzFQAHfdajxKE6n2yf5bibsro8fcG3I3fTZ+2YP/wH+w
         9cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353033; x=1732957833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=Rnj3txtKSvKr83FVFW4NYMpxdErPKWpHmz+jf6xzvSj4qUNinqFeB+KsQbN40AOVOi
         +J7rm/xaIZXRtmh9xKxP9qBOq1IhDH+oT27UZi2C4p9GMiE+IIObvdE2riVE9GT4i7E5
         s9N9yxb6eM4IE7HkNcsAOr2zNOyG7TFCsirHmtHOafLV4sQicS8btQePerwRFfWeBgW8
         PXYekUfIXFRZ8E+GCONbHJ702KpVujcItU4RufzF54SczyiTZFE0EbP8PTAdmtkWKEqA
         x0/tXEFAw48LFNGRRMmuGpl1bXgi/4NHN9BAsgKsSSSgOdHOk8WHW7v64IRHxP98n6CJ
         sqtg==
X-Forwarded-Encrypted: i=1; AJvYcCVbcgymiw7IUrIIbIpOT+0CTTC9nrEPa1K+gtBM1z+iiwZWb9da2J+AH7AoaRYSNn9swo1PxyOfdVHxMjBoeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YygOwVnttRbWay1nFaU/4aSq4f3gFqc+jYtJhbx2zLRwz8kyDMY
	K79wxoT0693XnhFfbA0iLoyts0eSgax0o1kV0UgSCTok/hhURVi7Y7byGJRdGQ==
X-Gm-Gg: ASbGnctO3k8vdp82wG/wVkCExWbbbWvUKqZPmBe+yZCgrK50wHUuSHhXmBlaefzssDx
	2BMyobRHRDPgD9uBFc7MnvveF5aHF2RKprbTl1s31MBuakqEgoDd1H6nayx3l0RV8ebDztHcrDB
	bGWp3c3FGwpZVoFzotPkAgN4iymG1QcxZGQ4yVLRR2H4TCE0w8ql0dzDn3Y/esdq2aYu5zIeTfA
	v7Osul/eK2ybFnbWol5XH+n53h6phJLNVuhRPjEfLXE85mtl6OkaZNcbMmyYfWwIw==
X-Google-Smtp-Source: AGHT+IHj2ihR3OTEsdM875zHnE9nbqW0UuK2wW3/aojdIeu60uxcPJQ+XX/fzZd0wj3T8K2tm2vwLg==
X-Received: by 2002:a17:90a:d40b:b0:2ea:5dcf:6f5d with SMTP id 98e67ed59e1d1-2eb0e528054mr7801274a91.16.1732353033351;
        Sat, 23 Nov 2024 01:10:33 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cd35e98sm2942936a91.0.2024.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:10:32 -0800 (PST)
Date: Sat, 23 Nov 2024 14:40:26 +0530
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
Subject: Re: [PATCH v4 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
Message-ID: <20241123091026.qxoeb2qye7kcwikj@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_011034_241113_1090E033 
X-CRM114-Status: GOOD (  22.64  )
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

On Mon, Nov 18, 2024 at 09:04:57AM +0100, Lorenzo Bianconi wrote:
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).
> 

and this reduced timeout has no impact on the behavior? If so, it'd be good to
state it explicitly. But this information can be added while applying the patch,
so no need to resend just for this.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/clk-en7523.c                    | 1 -
>  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	       REG_PCI_CONTROL_PERSTOUT;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
> -	msleep(250);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index e4f890a73cb8ada7423301fa7a9acc3e177d0cad..f47c0f2995d94ea99bf41146657bd90b87781a7c 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -980,6 +980,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  		goto err_clk_prepare_enable;
>  	}
>  
> +	/*
> +	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
> +	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> +	 * complete the PCIe reset.
> +	 */
> +	msleep(PCIE_T_PVPERL_MS);
> +
>  	return 0;
>  
>  err_clk_prepare_enable:
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

