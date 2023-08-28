Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE97C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=; b=F4/ACF+9oxdq80olSe1DhGPJb/
	uIRqhD2oYB9ZujFA2Fnj8T2zkeMFXGoXnp379b1VYV5KSW6j0w4VFijf3b10/EfLMaFMokrO3Vkp2
	EpZz/pIZy7oJPGtwr3HSIao9J62n7Gs6d4TebtVRxuEh4VhCHbZIwtv1q5+zaLG4FUwuwvlV1rCsN
	aAA7gAh/OJCJwpGja1245py9Q6YvT5pTmE9jfK4kVlkuuiOrNvGopQsTaQTejfGTD0GinZg1XgDO3
	PN1P4Bc5Uzks43SCR2RFDzjBHpaZeQlE7hjYYkMQDPN4tGyGVkWnToMhCDxOun/zsLVNoc+xkcN+G
	lliylIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qajq4-00AJTj-1u;
	Mon, 28 Aug 2023 21:32:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qajpz-00AJSO-05
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 21:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693258313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
	b=cnAcr7o5rP1q9MKsD+VtkwRBor2hYoTpsxruQbCd5Ka6XbwOZgKpxq4N1qZ1TDZogM/Zxo
	gpV9hFM4qrou8E5J6OT+HyxuC7dRrfJSWnT1IcJTcpq95hHfl7j15EjEVEWu2klL/cDMzg
	xv+eLRuPJaJ0u3TR2Lckpy65xwXXrd4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-Fe2D0OYJO4-ROEULlcgRVA-1; Mon, 28 Aug 2023 17:31:52 -0400
X-MC-Unique: Fe2D0OYJO4-ROEULlcgRVA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-76f1e2d6ea4so11321985a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693258312; x=1693863112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVb5tmc8EbITtSkSc6gJJy1RyzNckSiwLu+iLvVILak=;
        b=FcHT/H9WHTTlqumq2he6QdfbwtLVRR9aMjfgrQ9+HSXZM4dXRGrHR0FHbWkGJnaMd4
         nyIyX95eeph7jPySDdrzIwbB5ZmA+9u02JRMRgGv5lXZFL+/F7Xln7ZxKcXNuN+HROjI
         Qb78dtZWPjhDYF9LFzb0wu1M7h6xfDQeiml2aMnpFhm45kXNifLbGB2cyMbeJWD9pgg1
         zhlyKS7g4vt+paWrxfl5OJDtG4Z5lkP+8opKzBxj6zUi49o4ttXXD74POMHVth4WiXVG
         KjgzNO+bQbvkZMvyc0PHH1Wlu7fK4pVQ5B5EwW9d7zcCYebwswL8PMOJL/WBMvwR4RL2
         GpLA==
X-Gm-Message-State: AOJu0YyWYfWUm36knC6ACRW8oqNDUbxjROmcncUdRklmq61n1u2pUEFr
	xEhF1E8OaHnn5ADa/EuR2QNr+VP+aSW20uKbTAHuZkby0lStvvy5Xj+GN0IulvuSBni/NQOjOgt
	mQz0O8gXaUFxOHXWdf+kprsuaTRzXj5Yv
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616603qky.32.1693258312047;
        Mon, 28 Aug 2023 14:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuVcTMTBbnLPs86MnCDU8eGTgJIDkNhQ+SHq++g5N+BlxbjD8TqX467y2sj6EMGyNhF/9w9w==
X-Received: by 2002:a05:620a:9c7:b0:766:fe28:35a3 with SMTP id y7-20020a05620a09c700b00766fe2835a3mr28616567qky.32.1693258311828;
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a124c00b0076f16a00693sm697233qkl.47.2023.08.28.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:31:51 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:31:49 -0700
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
Subject: Re: [PATCH v7 21/24] iommu: Add __iommu_group_domain_alloc()
Message-ID: <dwrebxdzqjhnryum3czsh6zroapbhpjre7untly3cvl2tn3nij@hpckzx65oxx6>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_143155_159308_1A170A08 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, Aug 23, 2023 at 01:47:35PM -0300, Jason Gunthorpe wrote:
> Allocate a domain from a group. Automatically obtains the iommu_ops to use
> from the device list of the group. Convert the internal callers to use it.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


