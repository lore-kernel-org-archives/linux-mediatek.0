Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AFEE77199
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=; b=SzweCm9nUHZvWfzxTd8VFZ+iDE
	H++FFRYc6sUjy/SymYmUEkFwtISKjrRpmPyymxksECcUnH4UgbrozSOFX0hLapLK2pX0ZpKJWSYQw
	RR9n7C7jxdbsK33ZiyoPhA4rMglnrHT6TvZZ4cxV7CCSpwEaTzfMkMxvanWoYw8cJ7IEAp40lwFMb
	sQkSydSu7eJKhWDTEd7NvpErEVQFXHnq/T6EJwYD8tFwhlw9uadiCMfpOx6Gu1tP9ShDp65Eo90Aw
	pKK0RA0Fy/0Y3wMP/sSvxPCpPUPxI37WrLwICrP3h1CCHmdjyAttyBECnI4HECMu92zGZPwuFSVMO
	Nj+fyr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqnY-000000026Eb-3ze3;
	Mon, 06 Jan 2025 17:21:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpg8-00000001u43-06LE
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jan 2025 16:10:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166022c5caso185216635ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2025 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736179807; x=1736784607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=;
        b=adtHq5ST5YKdrbeJpoHM0MC1xETJqTsbKng/4zJIphKzP/tHHQQVPHMxZwVh/UE9wh
         J5Jc0lhfq8aZ19IsAmkStF81oyv0VyABdNll8fh/Z9X4nn6789UBngIlWE8IRvrHMDcU
         MHPgdtI0clAUubxioiF4qVru7lbsKDe5/9Wg2sfwhdXtkG3Gq1NupvS7w+AMjsTVGgec
         WUlngXwoO/wB6vRQhoKYbJh5rPqeURWTQG7n25wDUcwlB4NhHnuJoyAISqKGuWMs1ZmE
         A2E9MV1YSe+mc1mOZjmmkuI+kufYci2vqqsTBgSykI9WDy3DpkSNKCIiEbtrE2lmU7SR
         ywHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179807; x=1736784607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbh70FNu5lHAZ2y3qFziORwGTSyKcYnNaY2OZrOn1ZY=;
        b=vUTLj+9VJn3B7J9Axg+P9A26F8298Dvr06md6tLQRuz7xCGLVpdagpoue3tBA2EBRE
         REQQ8vLH63MAwQ1p2aNduKGjrWzkQMrfE+Hg76dE2UD91eqdX+j84NbIIvduRRPLvGVM
         R6T61uojsSM4oVbRSZC0nV41st8KMRDhVYUMpaPwXAjSTtMa9dJp6mWgs1dVU2f/Lq6s
         4lD8ets7b64wO3VDD3aLOFdvxpfOA4WHm/+cEzyYShrutq6Rs/R6ynEatW1cob1OExuk
         BFklJJCYV67kfJIP5pW2k+MEg0/2JaUWsETP2fIZpZftAEriM1usw4QmTnzJAcjczxyK
         cfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVBu23DdXYq/EBdkkX5QW/DtOOrrI4kS7q5ZapkVvQKy7V2zuF5wd1w/dSGsDZtj9/TvBe8kDstXfwrn8V3xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRx9Ol2q7juRtw+p1v5xxK6Jsi8TVPx7KPUSj59nwat/1DCyvn
	p8i7TrWyW0D8XWmovsS2VVaGZ7rRd/wyfV0QVGqxE1Gfpx0/wHuim4t7+srgjw==
X-Gm-Gg: ASbGnctBZmpNxQfaKFPbr6IULrOSLCJ2cP1wsjsp/HHAPbi0PNbeDzVfIS3ZCht5CoJ
	SkxB6wdUrHacLLvjOcYJ3G7oMvdKlQTSSY09i3VAvHOijCK/DRK7mf1hkVgArjicOXSQV3aZiBT
	eF2vDPCKRkbiWWv9N1Fk9xSAZUFtHKQza3Dk7gc/E57P5KUhtPjKSIU3137ME7/HDJrAal3KN6/
	yHFFBx0KsDLbkMznc6CXi2vuWm18tVtCbNfA6mHWpKQ8YaDlTy4sBLxTjHPLSvqAvo=
X-Google-Smtp-Source: AGHT+IGWek+UwLvA7jIxaMXySnHt1P9khnFX7cna7RBNBSt0+o7sQhOK9pqBW8ZD3DQlUzuguSWTWA==
X-Received: by 2002:a05:6a21:2d04:b0:1e1:b224:74c0 with SMTP id adf61e73a8af0-1e5e0815ee4mr94198810637.38.1736179807211;
        Mon, 06 Jan 2025 08:10:07 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm32377915b3a.128.2025.01.06.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:10:06 -0800 (PST)
Date: Mon, 6 Jan 2025 21:39:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Message-ID: <20250106160950.uutcgs2vqnuve22k@thinkpad>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-4-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103060035.30688-4-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_081008_085853_D1E3044D 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, Jan 03, 2025 at 02:00:13PM +0800, Jianjun Wang wrote:
> Disable ASPM L0s support because it does not significantly save power
> but impacts performance.
> 

You should disable ASPM only if it is causing any functional issues to the SoC
itself. For other reasons, users will use the existing sysfs/cmdline params to
disable ASPM based on usecase if required.

- Mani

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index ed3c0614486c..4bd3b39eebe2 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -84,6 +84,9 @@
>  #define PCIE_MSI_SET_ENABLE_REG		0x190
>  #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
>  
> +#define PCIE_LOW_POWER_CTRL_REG		0x194
> +#define PCIE_FORCE_DIS_L0S		BIT(8)
> +
>  #define PCIE_PIPE4_PIE8_REG		0x338
>  #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>  #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -458,6 +461,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
>  
> +	/*
> +	 * Disable L0s support because it does not significantly save power
> +	 * but impacts performance.
> +	 */
> +	val = readl_relaxed(pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +	val |= PCIE_FORCE_DIS_L0S;
> +	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
> +
>  	/* Disable DVFSRC voltage request */
>  	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

