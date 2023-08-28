Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59684C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=; b=vzByaKI9oR/oBe6FaA1eML56t9
	80RB6pWgNMh8UH5XId/sinIMNx35NoFMwVFu6pIyXPUoYVYCtgB2V5Hv3e89KjRZEpuEs0+wcmrEN
	ngKY1Jighs4gLKz8zpULXOODJ4GzL6lLtgZWL3TNsXwK1v39B6WPwDtg13O/FMhAz/pWsVJKyE4XZ
	ESvLBfVvXxzf4OE2nhJ5aT5WV0F67pSAGBcBrartvYNZi8G3ym6OYgGRZ3XH52NfLOyJJFWD1q1bN
	Sn1aiTKeElUgpWvD24DwW4B5hpRxkYV+D6FfHZ/hmO7fO8eGuPPeGSvxf8+6MOxZhh187RitGxqmM
	QE4ZRv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qajVv-00AHlT-2y;
	Mon, 28 Aug 2023 21:11:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qajVt-00AHk9-0E
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 21:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693257067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=;
	b=ie88gz2CuhiSKePrUcrp9baCJ7bmKnVkC/usWeX0348swswwAzf1VvaSwgH+f509Q8juVV
	4PMYVvQs7QS7eFK+rE/uC32MnzcMNVxRFB6xV2Nta5WaSzv/mJ3x/xTwqPy7mQ+dzx6x84
	DnnukLZu0jSdIyzooQq/WdwmNUypE48=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-l4IRKLWxO4ar1AUTNEs59w-1; Mon, 28 Aug 2023 17:11:06 -0400
X-MC-Unique: l4IRKLWxO4ar1AUTNEs59w-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-64c249e158cso43679156d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 14:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693257066; x=1693861866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=;
        b=V5QdsBDNm/w6n1z0RgdHKLmx6QMclwelMLRvXfsIlZWPgReBkDgkiIBlNvyFsrXlZ3
         OjQ/BgDFXrsUfDqVncZ5YATMSQmT+490nE1VUuQcT+w4mkSGFgoy8Fs5HNsnbxjAZwEN
         gaScegYZ0MBuJ1jgEnOjjKs5FISobnwot+ksSGi01moJp+MEP3MghCsc5KxRHFtlEScd
         sS2AVCVF3J1O8R1JJbdKZEsMD5LnzWDriSmXYqdpaxzat56/LgkGbIO/s2r/6E1p3tP1
         YLDJ7WWoisJAqmrIBwEcL0Rrizacclf0WnbFWgGqVpM0G7CGMh20VHail3o19wUppnwt
         IYOg==
X-Gm-Message-State: AOJu0YzKOWMehDd8f8DQ7LOYy4xjri8gg5eBZX+NLwXYiBhkmk/Rx7Vm
	CMPGGXaA3CwVpBKiEHlS6wKmp6/WqqnwhfHsodTpKtbT7DALdYUBHoCHsj0cFUKD4u02a3+MuiQ
	OCl3ZUI8mXBf/PeCk9qoMXwYJvuBVvJES
X-Received: by 2002:a0c:b415:0:b0:621:48be:baa8 with SMTP id u21-20020a0cb415000000b0062148bebaa8mr24439966qve.48.1693257066505;
        Mon, 28 Aug 2023 14:11:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP3ObHCetgbEOQmvjiokpWFivwzRctOVNKCOPRfRNFNHOYTdYfD3DjqX8LobUdneBowBMyfw==
X-Received: by 2002:a0c:b415:0:b0:621:48be:baa8 with SMTP id u21-20020a0cb415000000b0062148bebaa8mr24439881qve.48.1693257065270;
        Mon, 28 Aug 2023 14:11:05 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020a0cf00a000000b0064c107c9679sm2854215qvk.125.2023.08.28.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:11:04 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:11:03 -0700
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
Subject: Re: [PATCH v7 19/24] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ufjped2r4se2d6whnglrwwbrjma2ufmswtjzsa2pguseya7fqb@5rnxgcwzk5zz>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <19-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <19-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_141109_174857_A776CF04 
X-CRM114-Status: GOOD (  13.69  )
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

On Wed, Aug 23, 2023 at 01:47:33PM -0300, Jason Gunthorpe wrote:
> Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
> sun50i_iommu_detach_device() function was being called by
> ops->detach_dev().
> 
> This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
> sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
> back up the same was as the old ops->detach_dev().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


