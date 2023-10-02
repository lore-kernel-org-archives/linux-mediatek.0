Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8507E784A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 07:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOArDjaFWFJOyICXPvUIUf44Pahfsl6ARg2tKcgPSDA=; b=lt5za7dcp4x6qy/EOvMi2TJQRz
	xf5GMMvscyfH98zD3LVJcoDKSLsyXSjGbTwwWcQBl4bj/tlLJFTWgZMHE7NhbGsp2K4DYCpszp2LN
	e9Ft/z5I4Byo2GFmo9iXYHMQOTslS9l7mmygOvsETVOVtN1Tx/+kqo4DpyDugDG0nULSRbxQ99Ai+
	t5o2OFX1JGwEwk3bGDkWe+C11U7tdb+PyJyeZs+nzpeKPvVClm88l8Ck/Qd9VeP1tTEbuz4uJF4uc
	XIrPAk3HcPHki3/PA/Ee39+LxFNtq/ZoNXQZBChRwFf3toTB/MAoxvJ3M+hifcjHTUpMHPU9Ws4jf
	KagrHdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCuO-00C3Fl-1n;
	Mon, 02 Oct 2023 07:00:01 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCuL-00C3EV-2a;
	Mon, 02 Oct 2023 06:59:59 +0000
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ECDA51A2626;
	Mon,  2 Oct 2023 08:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1696229994;
	bh=AIFVwF7V2yCwhyWe75DvT7fYSBhwm/fBmqB8nOMomrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpnLCwzk2x1keRMkLPeYurvT7r9OO8YOJ6/7Vx/qRYBDxYBtaFczM0bl0X3CwM+Z8
	 JjZ2S2KL1yCjIcyOYKVBFX3TnYJH3DgXndhq33RdOr06+/f4P6g8ed5YusHJpPxKBf
	 /cC8uVfAa/rk6Wr3PPtDNHTnxEpzpMy8C+fcOb8G29mwxCh4jTTbUwvHTKVDKKREHN
	 XKS42S0qW6PWzXZYxLGalC73IDOoglQpj2vweIfb/B9jDLMPy04LKeueQ7Vtaof2m0
	 /U/pjbpVoAN9ULRqOfwjMT62szxrFLqy3anLaW4GIZc388p9f5N34fWI0GM1KG2Gfs
	 vlKBpUHgqfWmA==
Date: Mon, 2 Oct 2023 08:59:52 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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
Subject: Re: [PATCH v13 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Message-ID: <ZRpqaJEQLRDp5b1L@8bytes.org>
References: <20230928-dma_iommu-v13-0-9e5fc4dacc36@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928-dma_iommu-v13-0-9e5fc4dacc36@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_235958_085259_A24AB009 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 28, 2023 at 04:31:34PM +0200, Niklas Schnelle wrote:
> Niklas Schnelle (6):
>       iommu: Allow .iotlb_sync_map to fail and handle s390's -ENOMEM return
>       s390/pci: prepare is_passed_through() for dma-iommu
>       s390/pci: Use dma-iommu layer
>       iommu/s390: Disable deferred flush for ISM devices
>       iommu/dma: Allow a single FQ in addition to per-CPU FQs
>       iommu/dma: Use a large flush queue and timeout for shadow_on_flush

Applied, thanks Niklas.

