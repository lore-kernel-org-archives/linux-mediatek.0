Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90DEE49A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9GaVO4jGruWR+C5Izp9D7v0Lmi9Kx5kTKgCOaeAvTc=; b=lE2irpvaDwyNJSKOYm3cagpRSd
	MZ4CkYif8b4SYnX0+kigruLugGGptXXuLN7TpKRbNZGg5dBoQySnHs50N0adZ9mjlL8jixV/3TCOq
	6n6gYjRAk4SsZMKn/lgIXu+FizDX1pXhdsKpOg1SbzA2jXpPG7CEQJF7MY1PAB/zGieaJzbRyrYkQ
	eYB3lzH4wNbQJNyG/5PnSFTyOtbhTSoeZBHob66MrNiFvYX+xgdHsYlceCeUVt6Fd+KGpx4k/euJz
	Q71SHiYY31Y4gIXz+6tRMbyiOivw27oaU6qxmNWsz1w7rD5Oh9U7F0huSR0SUosdtght0r/xBB+x2
	xlNHFlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZdMb-005zaC-12;
	Fri, 25 Aug 2023 20:25:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZdMY-005zZb-2K
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Aug 2023 20:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692995097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T9GaVO4jGruWR+C5Izp9D7v0Lmi9Kx5kTKgCOaeAvTc=;
	b=Pr8F7setueuKlY5wEq9ltutDKC5dRFDvVAIVzRGCO6EtQYTKFgscW/U+7ovWF5ARmFa+/T
	scZxh5ellLUgCxNFpt2N9/KZvUiWW5iln1CtUq5IqG5e+J/x/Fsth+mGMWJPNLHi65eX6s
	crz8gTtI10VFQVM3sSpwvA3QP8SoMUY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-wjpaqipJM0WyrpKhiwRKaw-1; Fri, 25 Aug 2023 16:24:28 -0400
X-MC-Unique: wjpaqipJM0WyrpKhiwRKaw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76de9c1d13cso136374385a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Aug 2023 13:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995068; x=1693599868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9GaVO4jGruWR+C5Izp9D7v0Lmi9Kx5kTKgCOaeAvTc=;
        b=gv3vRBchbDfv/D+IQgXZjss4ew7i1t+ydvhF89m5deZb0dJ53BfIpVQE4QGeC4n4Ld
         OReu0fGx1ogTJXMVkx4D3DaFTJQwsxIp+7ZxWfVIiKou1P2VEInyAKtwXHBjKncV5vqC
         59dWQXD6DTMqzJivkk7I7JPiELtPkFHd53QQfMh/AxV06xpyvXSuy6HkXWr/f2O7qyaf
         HJwhaLwPjcqmrDcU3sE1uauqd+l2fynjget42zX547YOy1tqs63JG3TSb1JtuaygBRs8
         P0i/LqYv2hgEzsJzrmI2kFvFv/DSFcsZlv6i/RDbihVE6tqUQWT2sTcmIOyfRljcC6BA
         EaeQ==
X-Gm-Message-State: AOJu0YyT0Lc+TKqEqumc8fkwrOTg9g/6F9eK5Y57bfu9Qi7oUBVe2kae
	3u/nRo0brhJkc9IYToAMlEIici3ojFFzX5DVqfBbHrkwSg4TLCEkOQEOcHJ4dGAvnHgoQN6ITCK
	eJtIhFVf4seBRm2IvlgEWCG+LHUV9M216
X-Received: by 2002:a05:620a:4009:b0:76e:eeaa:a079 with SMTP id h9-20020a05620a400900b0076eeeaaa079mr7880732qko.10.1692995067951;
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLBKI1XGw7s6CbX7jhIzTvhmgnGyxca1Jm6YHCiJ3dxbM+m70gQmthLg44868T29Hr/JESWg==
X-Received: by 2002:a05:620a:4009:b0:76e:eeaa:a079 with SMTP id h9-20020a05620a400900b0076eeeaaa079mr7880679qko.10.1692995067632;
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id g7-20020a37e207000000b0075cd80fde9esm741104qki.89.2023.08.25.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
Date: Fri, 25 Aug 2023 13:24:25 -0700
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
Subject: Re: [PATCH v7 03/24] powerpc/iommu: Setup a default domain and
 remove set_platform_dma_ops
Message-ID: <zbmf64fbpp5zsolyqd74px3hpgvvorc3xal6pvaxdw3uoccb6c@epcqhetd6n6l>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <3-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <3-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_132458_833702_2D22AB50 
X-CRM114-Status: GOOD (  14.57  )
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

On Wed, Aug 23, 2023 at 01:47:17PM -0300, Jason Gunthorpe wrote:
> POWER is using the set_platform_dma_ops() callback to hook up its private
> dma_ops, but this is buired under some indirection and is weirdly
> happening for a BLOCKED domain as well.
> 
> For better documentation create a PLATFORM domain to manage the dma_ops,
> since that is what it is for, and make the BLOCKED domain an alias for
> it. BLOCKED is required for VFIO.
> 
> Also removes the leaky allocation of the BLOCKED domain by using a global
> static.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


