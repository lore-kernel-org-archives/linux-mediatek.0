Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2FFE6ADD5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZiVNGou0sUPR+VUZtEVpUsLh0jpbMmext51WC1uOek=; b=lMOFDdmS2eYF4GWFWILFBVLP3B
	/NUoE7R5h+k5KGfctnCUUsX/wV1rIIyJtYjkjUafBp7CzlDr07QhnTLfFpQJQ63GxN8Mj85EAKJuL
	b8XJgtk9chUMjUL4LVj2zRpL+0GA7PzDNy1YbI4WLHn8ujG57kcDIEzYHZiR8/J+aB9iSZRBtBPnl
	OaE11QLeTmIpzaYjjj/30ipHPG13Da09ma5vhoH8y/aHgrub7ws1TyUcNVWfzuMVchPLLlsrkxdVF
	yFVsid1U/FYHKdQaJmdbSZJ1OBWBaJWoR4GNr5rN79+4YaFY12wXT2AFsxOR/hpkwEF9xIWu5GlE7
	RueHcqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm5a-00000003zu0-1RTd;
	Sat, 23 Nov 2024 09:06:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm5X-00000003zsT-3m0Q
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 09:06:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-724f74d6457so173239b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Nov 2024 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732352759; x=1732957559; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZiVNGou0sUPR+VUZtEVpUsLh0jpbMmext51WC1uOek=;
        b=GdiUXVrDK8aGY53Rfw2AgomWvZutleNHfJ/P28MfA4TNjmBnVdAxURU150rm4GrraM
         dpKkDMkXGmfjvMkDYr2a+/R0N/md3hO8fC/HzwU+MplvOWLJaaphe53ppuusUoTA1fRu
         bwIokPPzLJI3jT/xz6k1Ifkin+jFoQnLnVbyoJzVjnVyQiR83MslJ13XgUQE4lwQ+6dg
         tfbFSLXfUpraH7BjWj5dyHAF7ogwnbi3wUfTr+13nLexnvuSWykvW4axFFl7cKC0EJIL
         mb5KoltQ1r0zh2T8yqXl80MwoKLDERyG8hBUk+MFRpbyQdeF+cJ3LF162lR5LGGKzKTI
         zsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732352759; x=1732957559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZiVNGou0sUPR+VUZtEVpUsLh0jpbMmext51WC1uOek=;
        b=QyJCvxBs7pV4/1OaFXDwQ6gSZWHnKqo7CFlwoTK7USCz0zMl+eDoDTzTZ0hmNscSOS
         7M6KKxzIv9mBTbk68UXA2KAtBM94RP20EsgUT3EbHoGZpm5gH3bjba78VFjsqmYaPnZ1
         CK8prPLqF7E1+v8ANnXhdmxhzq4/2c1gIKsKfidYdA5fTTI1rjUoy83LX3fRptjMIFsE
         hrUsoh5Qr8IGHhKp595kx0JCmcwvKACy1Kn3WAHZb0O3ta/DaXZdRexIyfJOXpv65Iww
         gP5d59PyIivtCF1HSC0IoWm8fIEhnrUrPHXDT88HeJelG1lW2eG5vs55GDjfJ04bfdC8
         CR/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrc5Yfg0PO98mBefzMCXDyHoncqNavXSAe298l9ERFtHDJ+3jeZGWlc/SLVYTtVkZhdW3oyarCoc6GYJUslw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQkDxLIaZvUL+zsn4tNO8uwqghiJiRB3WDidAR+MsKY43dmmAN
	eF7fjkElcol3/8fOsPAWfAb5nHaq2QTPmR7K+ENzYyFMkuG/tYG7pbUPsmob5A==
X-Gm-Gg: ASbGncu/4meaKHvAr/eaJl+00xYPVA9paumMnEykT8IN6MTYvsHN6MLJV+0GsQK5H5r
	3fJTR1n6h3uf1JZRQc8ZA7GabJvc5iDquDpv1jHlncQT3OuoGhxLlf9SyTIzs/x23YEdVtv1Hw+
	0L+pfgaxi+Oq64mxzTgmetYFMF3CmorTJEJrd/If/eoJ8eu5ss4P3CIDeCEMevegYEdXIQAWcCN
	+ZiWn9KKyHTUAYHbzocntGeqszPNMOFcdbapf5MPyXdgb4tdh7kEFsJRjt84ygC8Q==
X-Google-Smtp-Source: AGHT+IGmEszMNhZtwje0Xvl4SgF09bMp9/3Vg2UfRxuTgmP2VK0VjGMW/4vV+mCtT1R8tU+WzR0uag==
X-Received: by 2002:a05:6a00:244e:b0:724:591e:ea20 with SMTP id d2e1a72fcca58-724df66d881mr7872246b3a.14.1732352758798;
        Sat, 23 Nov 2024 01:05:58 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de532db3sm2877085b3a.93.2024.11.23.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:05:58 -0800 (PST)
Date: Sat, 23 Nov 2024 14:35:49 +0530
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
Subject: Re: [PATCH v4 2/6] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
Message-ID: <20241123090549.epzrv5o2i5q2mgz7@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-2-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-2-24bb61703ad7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_010559_949875_5D48495D 
X-CRM114-Status: GOOD (  16.63  )
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

On Mon, Nov 18, 2024 at 09:04:54AM +0100, Lorenzo Bianconi wrote:
> Replace clk_bulk_prepare() and clk_bulk_enable() with
> clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 4d1c797a32c236faf79428eb8a83708e9c4f21d8..3cfcb45d31508142d28d338ff213f70de9b4e608 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -948,12 +948,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
> @@ -966,17 +960,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
>  	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
>  
> -	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>  	if (err) {
>  		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_enable;
> +		goto err_clk_prepare_enable;
>  	}
>  
>  	return 0;
>  
> -err_clk_enable:
> -	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> -err_clk_prepare:
> +err_clk_prepare_enable:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  	reset_control_assert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

