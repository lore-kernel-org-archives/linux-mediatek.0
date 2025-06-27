Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DFEC7EE33
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbVP47tJ8GF5wvYWyGyUSOsCj++lpC/NkK7dtJ3Jy5U=; b=nBYM7F59S2Kdx2+syeQaCVQucB
	LvNVozofK2OYlTgtbl7cSyIDPHFO9Jv0FpWc5sDA8hH509IO8S7Q/6R78qInzOwB6a4zoujtL40Od
	Uss2eGyt1q8Bjo/+HGTDhtzv9lBxxYxJcMOaZRcv/4aSRgbpslmQP29vpPmtH5urjIyaUVyFoZx9F
	r2gXKOdZgWQcRUlgctlxILKMGu7yA/JAb1BftBtJbGGB+13i+OdXO7dOxeOirXWQBgUZM5z98zVLK
	Ho61+wBFfR+0bC8Av5p4bkhblPZx+9yDOjCzlPyJEGhomLKZ49UdIh5rJuXgW8tAA/HJgapzgWRUS
	KJGmSe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4S0-0000000DxgO-2Cu7;
	Fri, 27 Jun 2025 08:28:48 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4Rj-0000000Dxdx-2Uwi;
	Fri, 27 Jun 2025 08:28:33 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AFEEC4CD24;
	Fri, 27 Jun 2025 10:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751012910;
	bh=spP82C2j5HjhFI0G1+bra4EcZ2gIWe3Xap3JvO6Y+tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruBmO6pEKxHw+iozycJ13LII2JRcnlvNJbdkcSPtOvF+7GcYHHzQ8rIwQsDyGYdm4
	 WJoGBf2xPamc7hgsjAF1E+f1v20tTwnCyok8JG8vLlQJJLSj4ROIDyejWb6Q5Gu157
	 blQjCKlEmYkU5eFyu3Zr/8IYwouNWYpdl74bpyomnipeY0J6lDTGjOrT9p1pBhlPec
	 eKZkDo2TECJdKfSKqfRMI8vxpVjNmEzyMlfWU2TLjQ/XuPehgEnYJHJNJtMEbqyKdH
	 tQmL3gD1g1KD8+Sfs25b06SXqogj0/2g+e263Fp0JteVfDPr+VYn/CLyNUsnc+j+we
	 MqcTPrBaNcFRg==
Date: Fri, 27 Jun 2025 10:28:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 7/7] iommu: Remove ops->pgsize_bitmap
Message-ID: <r55jzziwjtb37qufil4zgj22zqbmu7gpjs7gciib66ix564baz@juuhk6bqoj2j>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_012831_796476_CC386C9D 
X-CRM114-Status: UNSURE (   8.89  )
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

Hi Jason,

On Mon, Jun 09, 2025 at 05:41:31PM -0300, Jason Gunthorpe wrote:
> No driver uses it now, remove the core code.

That is actually not true, the MSM driver still uses it, and this patch breaks
my arm32 compile tests. Please send a fix for this driver so that I can put it
on-top.

Regards,

	Joerg

