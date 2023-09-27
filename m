Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98694E82CA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9oIEXPNWkoSP0yICfThZznT48YRRSxNiQbO+UpaNXk=; b=WcrUOUfaQHr/BhKxa65dgNvvqB
	o2MaK1TDfw7mL23KmeCodkGq2KiBX6vY3eQ61nwb05sey4kfstcLjwhJgUbCQ+emlYVBVBJubD4k0
	8KqZ/XI23b/Nc/QXDX4s+rwT/LJjqCDnJ0yWRK77KVkVvLWuwsVAIeY/xGYVSw/tUwX5AZRzEU3xp
	mpQQ4k6A4hqDwY5+scY1CGfIIXAujQ6xog1FFAK/AMcCb0ceMN0eIrvV5NVdFNSdSjReyEDeCT3NI
	FZq2eAWE0vrTfyIjqqAVBAnFUEvDbJli25qUfHinQZmj2yjK1+VNZXGt59rssNpX33EJ/YNCY/qe0
	J1TU4FWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWg0-001MDp-0A;
	Wed, 27 Sep 2023 15:42:12 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWe5-001KIn-0b
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 15:40:17 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-65b0383f618so42529826d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695829211; x=1696434011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9oIEXPNWkoSP0yICfThZznT48YRRSxNiQbO+UpaNXk=;
        b=oV/adJQBzM2z8Uqm3LJZl0IyLv/N1nrmf3u8IL/8UG57ci7QkoOd40qB9TlHpEV0zR
         5PXIpscWZ/J7C07d/KT8vJnBd83NJG+5CDYB9wsvcIG3qgGhOTRo9lV3ZYnmOXCRcV5B
         4+/1Avv5S77jpcas8I54YJ2IEbPVE9hwO2Vrby0wV16R9wKRHAAzMoZzavDAJ2p0cvqg
         Nkkoe81kzH841OaQff8F1nJot1iyaW0gaLzC9Rn+yf1xt7HoX/u8K7EUrJS9X+h3jnmm
         rQjvQWPukpbS0YSpKU7jWwaRFe3LJlTTf1X+5lEAxN8s4MA3Ovl2H8JVblgtHVkysyV8
         krqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829211; x=1696434011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9oIEXPNWkoSP0yICfThZznT48YRRSxNiQbO+UpaNXk=;
        b=A2sojciv9K1zQLPSl+/3G2/ee0o9dvxldxDYnvvaALX5SSgLtsfdMGFDx8vIziwIj3
         a2IFly23JMMASnLbAslH9bGx/kj0mK0sgRvLIjt+1ksPlBC0J/pt1f2p6DVWfpVw6h5O
         rMpsJRFjqGJazK+q45uegmEosDpvRZ91lhIOqHFJE42YclRefNpMkfxVkew6E7VCy/ne
         o1/qWhx+rRaYMsHx1Nzu6eE/+c9fa6CiPd/4BXZHWZdwNo3snY9DjLUmHXgXVlEcNX+o
         BLLszFXJZK3K3PbB8XWql1wXfYJ+kzUIsIeSusitYsjl0zfjqCMienKARjGTempnPjN+
         Ew2g==
X-Gm-Message-State: AOJu0Yz3tbcbIqn4ydwGL55Ap0orqdEvusqYHnvoxaBrS3hq3YrS9iFC
	7ZSHm6zsKTY0x0B2WfEoViy7Mg==
X-Google-Smtp-Source: AGHT+IEBIEK8bL4oC9/JbUXAJTo9b7yotL8eHtI4zGCh9Ar0J6VaF2Vk0l+zBuzNRh2jU30sxMvEWQ==
X-Received: by 2002:a0c:de03:0:b0:64f:8d4c:1c0b with SMTP id t3-20020a0cde03000000b0064f8d4c1c0bmr2581322qvk.43.1695829210841;
        Wed, 27 Sep 2023 08:40:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id i11-20020a0cab4b000000b00655e4f57732sm3474144qvb.35.2023.09.27.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:40:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qlWe1-001Qtr-JG;
	Wed, 27 Sep 2023 12:40:09 -0300
Date: Wed, 27 Sep 2023 12:40:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Message-ID: <20230927154009.GN13795@ziepe.ca>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
 <ZRLy_AaJiXxZ2AfK@8bytes.org>
 <20230926160832.GM13795@ziepe.ca>
 <cfc9e9128ed5571d2e36421e347301057662a09e.camel@linux.ibm.com>
 <ZRP8CiBui7suB5D6@8bytes.org>
 <b06a14de270a63050b0d027c24b333dba25001a4.camel@linux.ibm.com>
 <e1efbbd827e34800bd7fb0ea687645cc6c65e1ab.camel@linux.ibm.com>
 <6dab29f58ac1ccd58caaee031f98f4d0d382cbcd.camel@linux.ibm.com>
 <a672b6b122c7a5f708614346885c190a6960aaea.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a672b6b122c7a5f708614346885c190a6960aaea.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_084013_595971_BA6724E3 
X-CRM114-Status: GOOD (  14.58  )
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

On Wed, Sep 27, 2023 at 05:24:20PM +0200, Niklas Schnelle wrote:

> Ok, another update. On trying it out again this problem actually also
> occurs when applying this v12 on top of v6.6-rc3 too. Also I guess
> unlike my prior thinking it probably doesn't occur with
> iommu.forcedac=1 since that still allows IOVAs below 4 GiB and we might
> be the only ones who don't support those. From my point of view this
> sounds like a mlx5_core issue they really should call
> dma_set_mask_and_coherent() before their first call to
> dma_alloc_coherent() not after. So I guess I'll send a v13 of this
> series rebased on iommu/core and with an additional mlx5 patch and then
> let's hope we can get that merged in a way that doesn't leave us with
> broken ConnectX VFs for too long.

Yes, OK. It definitely sounds wrong that mlx5 is doing dma allocations before
setting it's dma_set_mask_and_coherent(). Please link to this thread
and we can get Leon or Saeed to ack it for Joerg.

(though wondering why s390 is the only case that ever hit this?)

Jason

