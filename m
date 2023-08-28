Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BFC83F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=; b=LliViGWKgUvTDXZ/+n66qJ1EjG
	9ars4MlAx8tmTxt4/cEU/SB/Zsq6USFcovTEmCUIphrXH6BxmmYYejRg9tn+HzlitvJhC2Fhx1uRt
	xR31neJMjv0vTRW4aIUdvDe2LfVHtAnOu4oBHZlXSydfQwzLWh1DAvEjxB+scywOYVRI2ufhmc/8K
	t7+ZULuDVHX2H8kQzE2dua1smCttGEjNCND+b8qINkISwylxcdLpl+w6UXuYSHkpKMxPHcps1kLCn
	yVuBvacjGVxezH3kOC1YFGLm9P4tRT+Ts2bIdZZzIaAMOSwN2bcsbyMFCj4k95NXG/La0FKOrLrdi
	XTSJocHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qajNn-00AH89-0I;
	Mon, 28 Aug 2023 21:02:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qajNk-00AH7B-2m
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 21:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
	b=M8r6rZBU9LrEhYHADcGLbqegvB5OrT+yqsmTY6nOHKHxLQ1nrGK2/uEQXIXFEHg8Q3driv
	pyAtaFjvSwVxaudrN5ZnqTOU51V4wqVUi6EHEJrsVE8xYRAF+SB0PXX16b4vtbsseUfjlH
	Jwpws3KdZAnsQdz9VaC5nCMkUUToLs8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100--vQKIQ9HPcuwypmeHeYgIg-1; Mon, 28 Aug 2023 17:02:42 -0400
X-MC-Unique: -vQKIQ9HPcuwypmeHeYgIg-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-44d46b22e9eso1614802137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256562; x=1693861362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
        b=FUoPI8+pjJP3ZZvp9fww8qoWhoj4x8s35zNMSMxHo1z7QW9EwQJbE3qdpCVKxriZSu
         lGE/ZiKm4Hvz9KWoZ7F7qUlxMiLm8lxNNp9R7He1pDtzID0x/taAQqRPWinHXWdb39ib
         lSp567CUJs0TJESutYHKKjMD/KpyoirBa6ZRdhxxZhWMnbtb3lxxrvkXKMhz/ddhlw3i
         2Mm6BPtWdEMUlfHrreZjR3T95xGHbJbK9fGOmJtl8McKIPP/rgF0/lv984xHW7SlpjKy
         IbNO9UBOKBz+fX71ov7K0bHuyskmnIF2xF52PQ+ZKn7/fvE5RBWW79pMvUfCzCm1ChqG
         3dlQ==
X-Gm-Message-State: AOJu0YySabE8/7D+oTFKbc9dubejT1vneSLIPmPyq0LsyvRF74WPoMsB
	g6MlwHJrjaNg2ESCvR9bkbuw9g6qOw4R7dNr1kDa+YrveIilFVf4X++7c50QGWKiST0eROBK3wx
	/aaVcytTPsJz0a3ycxSVtCB55fcPX2rs8
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657408vsl.14.1693256562240;
        Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1O+ulqQs16fLrviLhIDcWj2NFGLF73P8fTFl1IfopkK1Ei1hjIoNJD//dyDhnkd8Fjfj6aA==
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657332vsl.14.1693256561816;
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cf50a000000b0064f732aa45csm2873129qvm.133.2023.08.28.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:02:40 -0700
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
Subject: Re: [PATCH v7 17/24] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ftxla3xdnxqknqg4k6qxwh6nquhdpzfmzyuvkzg7gwjxf42p6w@7ek73gnk5mue>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_140244_977633_B844F55D 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, Aug 23, 2023 at 01:47:31PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
> ipmmu_utlb_disable()")
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


