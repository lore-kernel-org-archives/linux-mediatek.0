Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8403E6ADEA
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hth4LIFfFqiX8BxvmFXuMrsAdL3uE4QFJCpdQRVIJ/k=; b=ug+ilOwSTzzOwol+4esnn3Vm7V
	ZjIzpEpwjmqETqfVk00aB77//t9WguWzZjqtvKpeuuWr9xYKcDnvsPLR6yC+NzqyGwXZmfGD9FXtZ
	cX2VF4T28W01S/SjIq1L+k4NXL8EKKVh0OTrPJc7NW2BiZtv2ctO8mGrzLjMyWHRYI3T305VAG5LG
	bTSU+OP7Rl8DJIKe9Yt7jJE+C7E305IS8QPZuCwtmcA1JzlV3zW8qlBRVIwzK/Wzv9IfPmN60wLc9
	WXRk6WClRNXtslrBHl2Vv5vVrPVfB/X5dWmrWC40xC3eMXWWBM3wVbgtffc07izHKPg83KSVYB+dr
	B9lQr6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmBq-000000040wm-40ZF;
	Sat, 23 Nov 2024 09:12:30 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmAc-000000040mN-15xg
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 09:11:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so2031916a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Nov 2024 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732353073; x=1732957873; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hth4LIFfFqiX8BxvmFXuMrsAdL3uE4QFJCpdQRVIJ/k=;
        b=MGns4JoBnHdkzy6pswfWTDa0pAfLqX6J8I/Z0cN3zTeDKo9c4MoRyBCJy+j2I5Xk/o
         kPNb6WPeMYwLoHxcEa+q0Hj5TY95eEqc4qaJAD1q4N3wBGYAm8nLOifGOJ9opTm+p3CY
         dRkApmxqmy215zfkazhF1lYcuVDcrW3tVlP8fzReDDWZhA+GgwY1CAJJk9lpOIZh5/FM
         KdnNqkLssKZY7BYsCPrWLP7DzDQXrMf0yvrTpknUSe+1r8ysaaDu0ZJbvd1Hnf29TF6T
         bwqheXf+2IMCznZLNozHcOGc6VY+S2xntxh8NbhZqktkQDNSB06YPgNOzYPMLjQJiEwM
         +IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353073; x=1732957873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hth4LIFfFqiX8BxvmFXuMrsAdL3uE4QFJCpdQRVIJ/k=;
        b=iJIh63eM6Lzc+N2tJWuwEXUkpiQJ6bK29YPJlMWN1IQgoBaaIcYYSqd4+wnGXyijz9
         UgK2PXFwDBEFOAxp/1LmFB/uNuRHN9JtDfLty85GbstvoXaADKyWR0EetxXhGMxveMaN
         4g9CfMUuH6e08DvF7eWA7sQcSHdjBiuKVzesEVP2hAZDgTi1KkKXNNhBR1mrj/WkQdbg
         NV5K+uq9RwMUS5heC0RbayY03XctHPGP1dP2VArImIYD364XBC/ytUJR6GZHqju35pYC
         evbFxnpXVOwZJmHXGzWrhB9pFWGKuutE6aqhLQdagw8Mi+hXHqWFaKfr+6Krsh2mNBHe
         Dk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpGs9LJJrqDvpaUwC8fJV4zECYq2BaPyY5rLiWtaoPfl2wLSYcBqmgldTqwrAJki97mRrliumZqkVID8+zbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1PGxbV3kKgnaCTN0pGznkkxtDO56ku7WluroR7z27U9cuZwTE
	s/eVBDhnE3JSwj72LKfwWUJC8EMeUxVOgfY2BMDBDCctMYpnrBvCRz/oAegfLQ==
X-Gm-Gg: ASbGncu90mYOklxkTg3pP1LaslrqpSFA+cz32Jd3qKlDQLTRjDi5NYtyrozwY47e6jN
	nwbSR6AYffQDWgCot0itk17BpfqrHMzPxvRzaZdZDKMeiySnfI2qA86vZ9EaOWnd9aI8sS9JIZL
	zIWmAIOFbDZ2eKOTuw40EtTGDL6qzu+slKmmLoz6175qKf0w25MNtzLT/qxSZezsXiXYPkFLmNM
	SJU6r103LPvcpWxiWaqJv2KC4kJsdhuIQQM6SSdfCCmz79v6F45uzlgOWKI7sC/+w==
X-Google-Smtp-Source: AGHT+IHSwQx5I6ydm2NN+J7aExyMX6mGiatTpiQcH3JLyc+Ei93oibZfVSEA6ImzJbB21LtSvMRsqw==
X-Received: by 2002:a05:6a20:a112:b0:1dc:32a:d409 with SMTP id adf61e73a8af0-1e09e5cba7dmr7832706637.39.1732353073302;
        Sat, 23 Nov 2024 01:11:13 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbdb796esm2566484a12.0.2024.11.23.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:11:12 -0800 (PST)
Date: Sat, 23 Nov 2024 14:41:06 +0530
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
Subject: Re: [PATCH v4 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
Message-ID: <20241123091106.bpkzqjafvxa5yief@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-6-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-6-24bb61703ad7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_011114_299379_04F54274 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, Nov 18, 2024 at 09:04:58AM +0100, Lorenzo Bianconi wrote:
> Since mtk_pcie_en7581_power_up() runs in non-atomic context, rely on
> msleep() routine instead of mdelay().
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f47c0f2995d94ea99bf41146657bd90b87781a7c..69f3143783686e9ebcc7ce3dff1883fa6c80d0f4 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -926,7 +926,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
>  	 */
> -	mdelay(PCIE_EN7581_RESET_TIME_MS);
> +	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
>  	/*
>  	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
> @@ -954,7 +954,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 * Wait for the time needed to complete the bulk de-assert above.
>  	 * This time is specific for EN7581 SoC.
>  	 */
> -	mdelay(PCIE_EN7581_RESET_TIME_MS);
> +	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
>  	/* MAC power on and enable transaction layer clocks */
>  	reset_control_deassert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

