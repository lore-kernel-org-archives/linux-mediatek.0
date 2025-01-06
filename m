Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D245E77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=; b=vy4HmYkpTm++crrY1bdRhqG11l
	Y5fFNKtmmjtquPSDKCflIVOvAVGB3vJIM6uTBU/0KtMxLvrnNdtjjKTvF9BtDgM+NQVOn95s6dFuL
	YZ4MGWTx4wvLwdQMh8+UcLe1X8jTzFFDP6kqbo329M4lc1KEd9uBszjeJK5F2zcsM5gutEWTpGZvK
	IixstTsRHXhp+zfZ4vJgNEwHm7+0/lJutNv/rEWWBjQjwB/FEHwLhd1GHK9dAUlqKYD/xEkTX6Ehr
	+rmgXFt3aIijJ5j5sIm4w3NBhN1Vz0duZEZf0rSQZNX1vB+6NqxlqMiY77myuoofAAwpBNTHwAlvE
	oaxpXybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpur-00000001x9P-1X0Y;
	Mon, 06 Jan 2025 16:25:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUptk-00000001wsg-3vcB
	for linux-mediatek@bombadil.infradead.org;
	Mon, 06 Jan 2025 16:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=; b=VkVPSPtClmuuJPwSROlr6RygUr
	VUslFYYR6NnQ8WP13NIuX9pZB2tU9biksUmMDproAt2HlJk/fPu1RRTtX3zxMww2VVgpB4N/VtcTQ
	WSAEV1eWNDBnaxkn4wPW9fCQYdKHhnyWzhomH9hiRE1aPjvFYsRk7hrNhEQOcLOAimk2VRTLxEGpA
	HUb2V43mqZptZPYdQZBP5hgjZWJLSKst2sDs/JyZo6Jc8/H5FE5V6uEnLfR8F30gDPtmNWx2xrIM9
	zbhB1cMaMznRljT4SSVgCwjKgTNiiz4SJeJu2hSxpDmDenYofuwH1qhiEwbZ2oBTU4j5tfCNGoQhd
	SF8VV2bg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpth-00000008yJc-2WHh
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jan 2025 16:24:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21a1e6fd923so11417295ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2025 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736180645; x=1736785445; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=;
        b=a8YqZcEBrSR5DNAWXAOaDNYxazV4j7vZYZSzwBaviqqkIwTtgx4nwwSqQTZfZ5vhPG
         n8Y0hqAkdRP3NCO85LG+tp4tSITwomPR5yrjEcbiTchQoWqsdKbPZ3vJ8heXEfvNyMbv
         DjTnQF7kWVNZG//3n2KVUe5lRlaifYoUhmda2agY1TrVhBalmVPKzqLsuOLKwHWkFHxy
         uGW8VqTIWQgQuy9/4xmS2db5DZI5+sFtrhJZwBtXIRui62H6094eqx2cSDKmJiE+rzTl
         6GPzeE/tZV9a6t4EFJTTTd9Wf0n9pDwNS8sxFXsLaOoUjpi4g/la3BJtJBtfdI5k+sYT
         cSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180645; x=1736785445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kJILhgpSDQv2eNsTh8ePWX95k+BIGrrFxfbsyCNVHQ=;
        b=lVmB4AS2HwzjEd5C31o9znj1Oq5J13tKVakqpH06hh2lK/D+qIg+znCxkN+jaT1hGe
         N7DjsDK0vCLieuPVGmjyejlr5P8gL0K/ogfDBD5s5wbA+IiwYsRQcxNijJqz7s1xbpvz
         luehEYTY3G9xVDcdSuqoWubowHxdVokbze51LPu3sYDqMI/LgtS34+iLlXOetfUSCNKZ
         jdOVENb8K6Q3qfJd55FvvWwIl3tjj5rrUEqHGqoTpEg5/XA7XjfhUZlftNZ/RwrDOQPk
         4e+96cFF5SqMDB3fxPqZN8zyGUMjloJaoIF4wHwwx48dqBQHJSrRZYYIYkR7q74rn+Rt
         zAgA==
X-Forwarded-Encrypted: i=1; AJvYcCXLWQnUudHwivampEsikGYbaDq1sScHbSdLN1dF1aBvWH66UEyZgHkYCpe1yvuPctWHtcmlao0q/S5RBzVQHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdqKBdEg2XLKeZr4rPMVrzT6fq8i50R/YQPq4mHE4TzA3eb8Jg
	JsAUOL9iXGmz98qCi1DVB8OmzTM67a+dNDX1rTe9ByB+qPPiWA/n73G1l19SNg==
X-Gm-Gg: ASbGncutsqeo70NH2+TYiyoDxD+Qd3RzWbs8k8RVnzQ/n3K0XI2XrwWvrreH+fMGShb
	s3dIcfbniI5ODazyfYPHy7BM7+E1H5jhi/3jRztGOCLNIPKb6fMkbU3tkpohOz71CquDrsyPlfp
	WBNL+dUDjdTsIkS6DAkG60Q+VaqakVsfmzbzdUj3G5bYtrK05e/Cwr4NRA3591O9z7XL0/xeIhc
	p+LX7FR2COwP6wUm6NOFGb4YUMpY/6prsLWN/T3rB5FFfEED5W8HAJpXUVjpv12nYQ=
X-Google-Smtp-Source: AGHT+IFdRHlYP1im5zetO+/SjNKJaY5KNYN5HfbqNmxIWZ26dMrClumWmmikkawZQrxTttP5oKteOA==
X-Received: by 2002:a05:6a00:1706:b0:726:f7c9:7b36 with SMTP id d2e1a72fcca58-72abdd7bacdmr98645349b3a.8.1736180645400;
        Mon, 06 Jan 2025 08:24:05 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm31660071b3a.116.2025.01.06.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:24:04 -0800 (PST)
Date: Mon, 6 Jan 2025 21:53:52 +0530
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
Subject: Re: [PATCH 5/5] PCI: mediatek-gen3: Keep PCIe power and clocks if
 suspend-to-idle
Message-ID: <20250106162352.neo5pkunbdakizar@thinkpad>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-6-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103060035.30688-6-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_162409_820091_F9484BC3 
X-CRM114-Status: GOOD (  21.91  )
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

On Fri, Jan 03, 2025 at 02:00:15PM +0800, Jianjun Wang wrote:
> If the target system sleep state is suspend-to-idle, the bridge is
> supposed to stay in D0, and the framework will not help to restore its
> configuration space, so keep its power and clocks during suspend.
> 
> It's recommended to enable L1ss support, so the link can be changed to
> L1.2 state during suspend.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 48f83c2d91f7..11da68910502 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1291,6 +1291,19 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * If the target system sleep state is suspend-to-idle, the bridge is supposed to stay in
> +	 * D0, and the framework will not help to restore its configuration space, so keep it's
> +	 * power and clocks during suspend.
> +	 *
> +	 * It's recommended to enable L1ss support, so the link can be changed to L1.2 state during
> +	 * suspend.
> +	 */
> +	if (pm_suspend_default_s2idle()) {

I think you need:

	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE) 

here and below.

> +		dev_info(dev, "System enter s2idle state, keep PCIe power and clocks\n");

There is absolutely no reason to print this message every time system suspend
happens. Even dev_dbg() seems unnecessary to me.

- Mani

> +		return 0;
> +	}
> +
>  	/* Trigger link to L2 state */
>  	err = mtk_pcie_turn_off_link(pcie);
>  	if (err) {
> @@ -1316,6 +1329,11 @@ static int mtk_pcie_resume_noirq(struct device *dev)
>  	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
>  	int err;
>  
> +	if (pm_suspend_default_s2idle()) {
> +		dev_info(dev, "System enter s2idle state, no need to reinitialization\n");
> +		return 0;
> +	}
> +
>  	err = pcie->soc->power_up(pcie);
>  	if (err)
>  		return err;
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

