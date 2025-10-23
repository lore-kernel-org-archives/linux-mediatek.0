Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E6CCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwgZDVKDRmfhAYHTqlXcWWPXhFwAOPJQl1VPP3sMcrM=; b=Y+lQu4TK6lHe1GS6rAQsziaKlx
	LxoIfGi5akggu+1DxCCNvpGvLZ5XowHfoK8aRnqbufDm77AkAW4/OVf6Kf4lyGpvPKSPcxkKn9aVS
	PaIXIMSnC/k1AjlnEJMRvki66TitUKb6rhCzCGKVGxs/mX3w8z+yAb1WcvRyDpA5d9DN3LytEnJcl
	ZZcsjSxIkm9RhNgIFR58D83MGbSE2bwD1am4mQUhHgrKScFHLZ6NerZTfUQsJoehUIIt3xShB/Eo+
	jxxYm+M1fBkBf3BKVZ+z/F+HioUz8FNZsDQn9bwLKTbpN8hBgxRRWwzkWryBhNncTllKmVDemLHxQ
	gXD7/eOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnL8-000000054mF-0IYQ;
	Thu, 23 Oct 2025 04:54:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnL5-000000054lU-1R1s;
	Thu, 23 Oct 2025 04:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195255; x=1792731255;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o/X8ig17zbEWg83ccAFqusXE4QA15fbF7lAl6rfU1tQ=;
  b=Iv6ooUWU+iKmpePi+UBaWciHEcPAYHTdUwyeWtkZYKFWcNxHWcO4ieu9
   ZGCbdP7sZBXeAJGhE8ewm5mGeNwE9s98y67gLEPbySIJ5W1qbZSLs99pR
   v2cYTtQH1747h7v+ElBBIhlLcBr17PqB+SyGU1oGg4WOA5lDlP0DOfy7O
   yJc8b73vGqAPszHPO3J733ZQiOHBuvKgrzdwJwYI5PZALa+l/n/F7iu8q
   6OVObIW0bmnjbkDUKA7gSKvNcEj+8j2c6hyDj0u64XJTh+lTOufG4ITRu
   iWCGxB/yGhIF6rYKs11xb30IW1a1c9lR1LyBMYbAAZ+scTWyifJr3oJjq
   w==;
X-CSE-ConnectionGUID: LRLJtLPQSruXxL27u2mgHw==
X-CSE-MsgGUID: BfziioROQ/yqOpic6RVtcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88820545"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="88820545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:54:15 -0700
X-CSE-ConnectionGUID: HMCARIInQHW636C3OauOVA==
X-CSE-MsgGUID: LmNg6KDHRqKFY/2EChkiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214985320"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:54:06 -0700
Message-ID: <47b5dfbe-dda7-419d-9032-d61bda44eb9f@linux.intel.com>
Date: Thu, 23 Oct 2025 12:50:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] iommu: Do not revert set_domain for the last gdev
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
 kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
 sven@kernel.org, j@jannau.net, robin.clark@oss.qualcomm.com,
 m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
 yong.wu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 schnelle@linux.ibm.com, mjrosato@linux.ibm.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jean-philippe@linaro.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 patches@lists.linux.dev
References: <cover.1761017765.git.nicolinc@nvidia.com>
 <276875013de662fe50f3fdd9e9a5bfbc0f12602e.1761017765.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <276875013de662fe50f3fdd9e9a5bfbc0f12602e.1761017765.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_215415_404918_F9DABB0D 
X-CRM114-Status: GOOD (  12.84  )
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

On 10/23/25 10:21, Nicolin Chen wrote:
> The last gdev is the device that failed the __iommu_device_set_domain().
> So, it doesn't need to be reverted, given it's attached to group->domain
> already.
> 
> This is not a problem currently, since it's a simply re-attach. However,
> the core will need to pass in the old domain to __iommu_device_set_domain
> so the old domain pointers would be inconsistent between a failed device
> and all its prior succeeded devices, as all the prior devices need to be
> reverted.
> 
> Avoid the re-attach for the last gdev, by breaking before the revert.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

