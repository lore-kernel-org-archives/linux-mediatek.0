Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0554D6DDEC
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2024 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib8VZEqrv/1oaZ9/wInvIKIw+crJoKvU0ii4qjb2l6A=; b=O3zhxfAm/BydurGkil23t2VClo
	JTooHbuQy94Vd5/8V5eD+tNsKnlnxJG52KM6jBktkr902fWn7QrOtT93XuUwoAt+eWL9xH2L33OAA
	fSUcJlf7/Q5B9tWvT1QqR/+aN4O79Y6AblYJdaOB5MHwPQ4Ai/N6BdTuHNrMUiAjmlwAVZF1stxku
	yipCmyFM6XQj0K095ps5sek8LX6YOBX1NQpFDYM/0Si41DOq/dk7KbCCxZvwncPlDwN9Bmb7gqvaM
	MM/dEkd/2tku95eP+DQiFyYHFIuxWWqXAELqdsTNYPPJIlrbCy0m1+iniI7FRxqHBLJ+fq87pYeQ9
	3q2z4zAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs5e-000000026P1-3yNT;
	Fri, 15 Nov 2024 08:54:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs3v-0000000264A-25QN
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Nov 2024 08:52:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20caccadbeeso5045635ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Nov 2024 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731660738; x=1732265538; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ib8VZEqrv/1oaZ9/wInvIKIw+crJoKvU0ii4qjb2l6A=;
        b=WYHRJLDZFxAE+anyRnVSszKIUAuJhWaI3rvZydajNj5zGah5EC8u/eHQeaYkFsucjZ
         oEdK3zb18FdlRz67TW+c8C7UOTnKOKeJGLI5kFV9ihrqmXJsJ6/a1AUoq2wOD2VRu0px
         G1ssrOAw6VOPSItb7y4yUoa9wjmLXn25D2MomSqqcTf3IUZSB0CDXwtHwPAOUGcB7EM/
         j15g58wo8S0esoTBPdbpThFfn7JvdFucOXSccqCb1toAgNw4RLeKwtt2uCxqK9K8KtQy
         RafSngLrKXm/1x/KCZSgnR8drFtd+qB0TvDiFehvH6O4PrpSLcXT4YWdLifhl+XdlTKX
         bSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660738; x=1732265538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib8VZEqrv/1oaZ9/wInvIKIw+crJoKvU0ii4qjb2l6A=;
        b=K4bCL58zUZDAOpq4c3/G+IsWRtsmGa3N/kf+AWN5SKprIPJuzZ8BwvhS+XZBjZIb8N
         krQvKIhfmEtEz0e0tFWI7OeOP2YskY42DtYYG6bZDd/doGnQNjOEdz7QLCwBQCkO2ZLl
         kkEqsrsNXzbBToYwnlmdx8qAPgeVXrTSNIHIr/nEFCqxEdl2Zo5icxG0SNjklIbd8P7m
         K50q+AyHTiVO8fwwNsQgg1VIM8T5ZY3hfvjSgE9TY2Zh+89Vh/Pz5HltcaV2G5VXSvuO
         ZzF2klCxD7I8Hx3kOD7DTVIzVsCmuYQggKHnj6zgjNhOjH31qH15g9xim/1+4ur2OXMp
         uitA==
X-Forwarded-Encrypted: i=1; AJvYcCXIFU9mwGaBKiARC7pAZCLHzD0Gz2qHV6HKCxGqNKLs/Anb3oCCh2rAMw6HQ+yKPWwg2Lddq88gt/GrjOVzhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd1S5cb4jp+dGFjVafSuSHmhJh9vVmlNb6rCGyxHfSYsL1UBIQ
	DiesVYt+rUW3lIaIF1PsJ2+ung/q6jE46Q9oPUziY1ByjDp6txZlgjODCcqfIw==
X-Google-Smtp-Source: AGHT+IHdGj34kZwTu+86oRWdYE8Hh+iSzm8/CcDrLHSTWam/KJWm+8OMU1/DV2v8HzbHvL2Xyw2aBA==
X-Received: by 2002:a17:902:cf10:b0:20c:ea0a:9665 with SMTP id d9443c01a7336-211d0d83a21mr33312155ad.32.1731660738461;
        Fri, 15 Nov 2024 00:52:18 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc51a1sm8044215ad.57.2024.11.15.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:52:17 -0800 (PST)
Date: Fri, 15 Nov 2024 14:22:09 +0530
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
Subject: Re: [PATCH v2 1/4] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
Message-ID: <20241115085209.v3tyiybaaeoeu6t4@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-1-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-1-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_005219_533002_092496CD 
X-CRM114-Status: GOOD (  16.78  )
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

On Sat, Nov 09, 2024 at 10:28:37AM +0100, Lorenzo Bianconi wrote:
> Even if this is not a real issue since Airoha EN7581 SoC does not require
> the mac reset line, add missing reset_control_deassert() for mac reset
> line in mtk_pcie_en7581_power_up() callback.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 66ce4b5d309bb6d64618c70ac5e0a529e0910511..0fac0b9fd785e463d26d29d695b923db41eef9cc 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -897,6 +897,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 */
>  	mdelay(PCIE_EN7581_RESET_TIME_MS);
>  
> +	/* MAC power on and enable transaction layer clocks */
> +	reset_control_deassert(pcie->mac_reset);
> +
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> @@ -931,6 +934,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  err_clk_prepare:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
> +	reset_control_assert(pcie->mac_reset);
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  err_phy_deassert:
>  	phy_power_off(pcie->phy);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

