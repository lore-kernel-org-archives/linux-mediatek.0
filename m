Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4DC83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=; b=P2t5tU4ExesibVEwwQui0dXd1L
	9zN9PfYmTXpGrZlSoor7yu8vrsc1pcJXIv/GI0nsNmNxUwDEg2vc4PfVYWSz7DdTfjyXm6x0Nb+eU
	n/3hjhxwl7zVjLwwzhq1WLTla9TlcYtK9wCyubvCnBKB/+EGN74AZwjz7v+BaaMhLUG5JDoOONJpR
	ZDqDt/uJrehiIYnYcPrNg8CPMLxHE3kVA7TnHToYbHE0jgCXdx66WiQSTeqNmkRY76b7gqAjbYM2n
	sBuHH+wx+8WbabnS0DL2hQ1VYkKcav2cBUu6Bp5Z72BwTOSgDGR+EVOPjcSaVLk1MYDIxhA4eiaxe
	/++om+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiph-00AEiv-2i;
	Mon, 28 Aug 2023 20:27:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaipf-00AEhS-1V
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 20:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
	b=BSL7MeidQvLgjmnXbgs3GQgzV2ClCCa0RnY+VmcbciUFUxnaPFGPgEoU7VxhlnnjiSsba/
	l+kE4QURtP9MTNNO7i6CpcRFgjedhJfms6Qvh67Vgxau06b0IM1+ye9Au0TZ0t3y/BMeym
	zy2juSBOhW+JzdeVZMN72nuubui/B2U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-eoOXCgoFNw2BYESTYuiYYw-1; Mon, 28 Aug 2023 16:27:28 -0400
X-MC-Unique: eoOXCgoFNw2BYESTYuiYYw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-649fac91500so41015886d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254448; x=1693859248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
        b=iWBM1f4AZJrvq1+29deVFctmRSEQ8K5BIVECuNnQ95yEthqOu/RAlqFEtNKJczSwMp
         7yhMHeewv/kMZBKHshPtPl8SDmNliK5xVuOaDCB06/+iTUgK00Yvp60yZXSsQwn2EVEn
         xntOQ9Fc+ebZGz5+bieFUYMXCU1gXXmegRrQ2fT2HmVOrOZGJWHR86DapkGK0DlJmUav
         Cc/Qc/ouB3mJPx1M1gdJUdST1ht2hlPdzv2e8rWT182UdjqcUVzdWxRmfmvJ7QVpJJVI
         Pn1GchxMDhI4IMXhYzA7ax/wHUZd/IcMMyueVGqAhGyv/W3uufevwBNE7gNEWXZHDnL9
         FLKg==
X-Gm-Message-State: AOJu0YzryLFv0wPqqRudbiYgdn+TicQST3l5Ls0rnYeoN3lzIR8IGwld
	ZAl/WvZ/LVKUN1mtML/tin0zHyaDYicZqrZ4JOXLaw/+p1JaMKIeYk13PpiWs+pRNAUdiFGndSH
	YFwloKL2JaV5ZfPIecO3pu6QnIm2dh/9n
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021328qvk.21.1693254448516;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFPUIE0VD3pPuJr6SEA/sCAWUcKffhBaA+0iqWdlm0BRzVqkbCdfoX5jw79sJViEhNnh3nw==
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021306qvk.21.1693254448284;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x10-20020a0ce24a000000b006263a9e7c63sm2767781qvl.104.2023.08.28.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:27:27 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:27:26 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 12/24] iommu/tegra-smmu: Support DMA domains in tegra
Message-ID: <pqocyap65uirlogtdy6fw6gb5qc24zrk6r235krllqj3qrcv3f@4xcew7khwydt>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_132731_574375_10BE54CB 
X-CRM114-Status: GOOD (  14.87  )
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

On Wed, Aug 23, 2023 at 01:47:26PM -0300, Jason Gunthorpe wrote:
> All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
> dma-iommu.c.
> 
> tegra is blocking dma-iommu usage, and also default_domain's, because it
> wants an identity translation. This is needed for some device quirk. The
> correct way to do this is to support IDENTITY domains and use
> ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
> devices.
> 
> Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
> everything so no behavior changes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


