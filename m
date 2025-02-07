Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BA4C02194
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=; b=GSf86L3lK3OiYg1wgl4OSfUXAb
	bginm0TZEnp83/2doWgBckud6WvdmVRzSaCQSkt1Tl76Lbgenlo5YxpPdgoMVkzz2uT7K1ZShm42G
	9Jxv7oakHomFUnY+jWePa02DcnQidy+LugihhZkYO+yf20ROAzK23Z+HmNo/++oHMXqIVpk6eI2TK
	mnRlXDa1wLPaNE4ZUEqQj8cA4U7IYMfErudc64a2Q9iW6jtLTp8QeM8hYHmxu8iHeDPtG9klzeiTN
	fuCyE4NR4zz8PKZprcNOkaxoi57aGUzI57Q738yZwhRGNTHCRh38lMaht2s4CYVaiYqYdoA7WwvFY
	C6vmUa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSQH-0000000AXqa-1vmt;
	Fri, 07 Feb 2025 17:45:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSIy-0000000AWS6-2y7W
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 17:38:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso4229704a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2025 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949896; x=1739554696; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=;
        b=EnCMseUUBIR15C2Ydob9yPm2vi6sxoCyuF5akBWhkIB47T5gBbLMSKKi0RAjtLT+kg
         3bjv1OvnMb+WsjO8lgEIVL+yVvciZHU4jw1fYhNNEItU2ewbqxR083ezqEdx0+HgBGva
         VvFv1SwWEy8XGX9+bkOvgGhkX+y1/rNVW2/bxybdteHnNIqba2kZOWzxFxTHXyqAiJvZ
         3YtEVyqeyBsCCXRbIcmVL8Qcl0wBatyuWDeKhd8XBnUwfzURP/RE6RtvikluMkaXWAnn
         LqUloWf0BkS/9x5pB3ryPGEMNpRVaKrSYe0HCpIJZsNH3M6bIeopCl+UxbAQMtw+YXlN
         MoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949896; x=1739554696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=;
        b=MOgUBRG2S+exEJeOIfNpshvsQRK+lwUoksRA129kbeLmWI1mb9YnmlLVrFvhONFiEB
         6RYPNopckvZpg8PmiyOP02H2i5n6pfxDYQzKk+uxOLVM/dP73WPYLqLkAgZl8XODSIXi
         KAT2olkvi3l/bX1vWf/3q788xQuwb6nVnVCS/mQUDr6rruvtOJbzYFeE4oWxuyL0QaML
         60gZ5vdNTpIDH07TymWJSxJBLt2MAQRDx3qDyjGRbUZuEj4sPTpwQqPt/XyqtojZwLuO
         TkhU0qSGxnqxFO7bVZ9BO3o8PKxHTQGZvj3el8eOq4JKS/gV98vHJoJmUDW6zAnJGIW3
         YI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCbTzOkhWqthfTiYeryYPhWKP1vUwQTEOVl7S8QdOrDnHrzV57DdBub7Wt1qEOdx3eItJ+3rnyQ3uIjVrczw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVIKhuzWeFzDaRZ6KyEPqsvbT5TM4I1GOP0DMHQRdzaMDpBJjs
	qPsKerhuDBG4B3z+/Rh1Igl2feiTENo0IL3cN1/rzGIDJkmoy6IOYjsNcC0l+8QNSu9xXwA4M3g
	=
X-Gm-Gg: ASbGncvzNzjEbw6+Y0a/Fk8sTJ7HRVa0du3UDxdnfX92+UHmhWtgzLW5un1Y47+Madm
	KAk7p/wd9VWoPCGsi3IAU/rObgkW0US4DaZDudSpM5iBna7NpxuixH7YhTmDO0KcUSB6/KWzoET
	3Y3/N+szZtvdUdz1STcXPaQQyzv5EiQWflyBKt8HM6XE9OzrzJUjXGJ4S2Yeda3ioWCH8GPUo6v
	fTHfZ+OF+fz9lVpPFCiAh/mBijJ7T8QDE+cSsrQC2xWKbMebelrdInORVv+5Usea5soNVWVN0u8
	8ZnbFCCEpW//Hll3M9FaZZbLZQ==
X-Google-Smtp-Source: AGHT+IFprNv/Fxes+yO0Is4d70/qLRRGy5XcxfptGmrec0u4U5JshNdQEzKB4xo6nsXGXHm3iHyxoQ==
X-Received: by 2002:a17:90b:3903:b0:2fa:229f:d03a with SMTP id 98e67ed59e1d1-2fa243e9e0fmr5424081a91.26.1738949896065;
        Fri, 07 Feb 2025 09:38:16 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0942d30esm3647036a91.0.2025.02.07.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:38:15 -0800 (PST)
Date: Fri, 7 Feb 2025 23:08:09 +0530
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
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Remove leftover mac_reset assert
 for Airoha EN7581 SoC.
Message-ID: <20250207173809.wykxrugz3neinpru@thinkpad>
References: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093816_753327_C6FAB322 
X-CRM114-Status: GOOD (  18.29  )
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

On Sat, Feb 01, 2025 at 12:00:18PM +0100, Lorenzo Bianconi wrote:
> Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up().
> This is not harmful since EN7581 does not requires mac_reset and
> mac_reset is not defined in EN7581 device tree.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - fix typo in commit log
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a453889ead7fbc75804faf7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 */
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
>  				  pcie->phy_resets);
> -	reset_control_assert(pcie->mac_reset);
>  
>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
> 
> ---
> base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
> change-id: 20250201-pcie-en7581-remove-mac_reset-16e7b6e3ef06
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

