Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5674C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 03:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suU702EJ7P3xgFXLu7/QckMDOUJlwr+KNG3sF4uSZL0=; b=MPAfJR4zeon94O
	YAFdnf3MTdm6YSFWF/RW5n7wK8xlgAtmiLdINfeSW4MXwT3dZHceQRK7fdczzJugr3gFjWWE4/ekX
	BbfG+Rs5iz7Qou2iwkYVRq9gDdgX7p68yHqMXo6pyJGyZANAo4/VBmLRYJ0V+flECZkyKZ6VsEEGH
	sFX9ud6D4/S79Z9n9zRS2635+V3f6ZcjH/IO/ik7u3KuU011CuKMgy6d6ExJpl8tocs4OugBq2n5g
	Iwk8GJyFMSmiv1VjPa5UvFGad2pfuXS7JfHzH15f69g4jDR6I4CGKUxdMDp2qK3Q8ixg6+X3BBu0a
	a6RyiGsF2fWVj9nM8Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPos-004OxP-Nw; Tue, 07 Jun 2022 03:23:50 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPoi-004On5-72; Tue, 07 Jun 2022 03:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654572220; x=1686108220;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vzgEhhW4kNaICa/n+qlgLmF5Vog9iKUmfkdT1yy8unU=;
  b=AvvUfJNC59mEf0LR+dJI9kYlHRwUaTlynJ2FGx7omMpxLaf2wpbWGFnz
   i2uv2N8Iy/MnNUFAtGKOK+FwsaWHlfVg4yKhGZ7pldj1I/kP1CSc5waEr
   VDYg46XvRnSksS8mh3xEDiYSeI2UsUbElc1Z8pDNzD/Q25hs+LaftEQbg
   EWekYbI4vzLfTByRnjhC7w14E4/JMQzkOSLwU8gTF+gsI1L003gpdkdZC
   ZWP3UBG5HSd5hSIRUSamaybxVUqI+I6hlV+KTGr8JL1L5wRNCePCFDPHU
   iiY/SaPU6rx7nTCd6jVt+YzRS5XTxwBWzpqewtkNw1rGZgPJV77014HRa
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259303205"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="259303205"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 20:23:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="583980445"
Received: from zwang64-mobl1.ccr.corp.intel.com (HELO [10.249.174.202]) ([10.249.174.202])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 20:23:29 -0700
Message-ID: <f81b8b8f-b811-3be2-5dda-139dc1bd7bdd@linux.intel.com>
Date: Tue, 7 Jun 2022 11:23:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, alim.akhtar@samsung.com, dwmw2@infradead.org,
 yong.wu@mediatek.com, mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH 1/5] iommu: Return -EMEDIUMTYPE for incompatible domain
 and device/group
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, m.szyprowski@samsung.com,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, heiko@sntech.de,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <20220606061927.26049-2-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220606061927.26049-2-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_202340_347564_BF5DCB39 
X-CRM114-Status: UNSURE (   9.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022/6/6 14:19, Nicolin Chen wrote:
> +/**
> + * iommu_attach_group - Attach an IOMMU group to an IOMMU domain
> + * @domain: IOMMU domain to attach
> + * @dev: IOMMU group that will be attached

Nit: @group: ...

> + *
> + * Returns 0 on success and error code on failure
> + *
> + * Specifically, -EMEDIUMTYPE is returned if the domain and the group are
> + * incompatible in some way. This indicates that a caller should try another
> + * existing IOMMU domain or allocate a new one.
> + */
>   int iommu_attach_group(struct iommu_domain *domain, struct iommu_group *group)
>   {
>   	int ret;

Best regards,
baolu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
