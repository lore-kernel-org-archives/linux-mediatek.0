Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35FDC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmmhQHX6eSTlhqCtlPHKBuBEC8puN0pts5RYsQVOETA=; b=crRMrB1jwIVkvPxqCjOIc5XBRz
	rO7VHOawfjcFQpi7UXMX8uB+4oWYQDHZUZoF5cUNUM9TtnHUyIP0/ydL1oart+zMrIXHXPtzheUxp
	o0SqR7jwytcz62uAwLUnhp8bfjNrmpDQtQ/2q3theW3dPCtzncixH1b8H6xBQEo4mmWvTlnZoqInm
	Wc3a9r0o73UR2/iHqcEyh3h+5l7c4P94AseehQeobRl0SZRf+hlM6MvMnjFQgFUOd+TptQIcEeom6
	HV5e2iF4okjML2+ZkD/RoG+59Tw6awubZKArzSL2w9JyhNlKRB8YGw3NYPePRmW1vAwcq0VfFnAHq
	YWokgkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocn8s-004nfp-9P; Mon, 26 Sep 2022 12:23:22 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocn8g-004nd3-PR; Mon, 26 Sep 2022 12:23:12 +0000
Received: from 8bytes.org (p549ad5ad.dip0.t-ipconnect.de [84.154.213.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D942A40735;
	Mon, 26 Sep 2022 14:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1664194987;
	bh=DwscMU+GZ+AeXouVGc8h0vEjh2jlqGirwv9sMdq7tsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=8STw8MnSA0vAVtkrtSmDF4+3u6QSLslcq6Xos5c6BmVi2sGIcexptmY1qBKF+PFU6
	 bwYuW4DOVStwI+tWdsF+XG2x4884iYGuP9q38l2CX1WX0M1+PVV+Rva59Cc0/A4l1F
	 WgDtM0LRo0FxDvtTvzrrG1djmPU5AzJ6SjwDfyP9vDSN7L04lUGovAjNEMnlEE1Hi4
	 lYfrTK7DMdVUzzJNas/Z4FvIiET7Cy0awBlNiQtpUlugi0haBDLBrU4hwevC2j6mDt
	 iI3i+WFV531V6RNsmJHgS2+MjucxbD8bTDHvjhL1ewAS0KBhGs0F4s9d9ID+AD4o8a
	 C1RtC8FyC38tw==
Date: Mon, 26 Sep 2022 14:23:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com,
	kevin.tian@intel.com, quic_jjohnson@quicinc.com,
	suravee.suthikulpanit@amd.com, robdclark@gmail.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, shameerali.kolothum.thodi@huawei.com,
	tglx@linutronix.de, christophe.jaillet@wanadoo.fr,
	thunder.leizhen@huawei.com, yangyingliang@huawei.com,
	quic_saipraka@quicinc.com, jon@solid-run.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v6 0/5] Define EINVAL as device/domain incompatibility
Message-ID: <YzGZqXCuw6yoXBla@8bytes.org>
References: <cover.1663899032.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1663899032.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_052311_080138_DF72A021 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Nicolin,

On Fri, Sep 23, 2022 at 12:16:29AM -0700, Nicolin Chen wrote:
> This series is to replace the previous EMEDIUMTYPE patch in a VFIO series:
> https://lore.kernel.org/kvm/Yxnt9uQTmbqul5lf@8bytes.org/

\o/

> Nicolin Chen (5):
>   iommu/amd: Drop unnecessary checks in amd_iommu_attach_device()
>   iommu: Add return value rules to attach_dev op and APIs
>   iommu: Regulate EINVAL in ->attach_dev callback functions
>   iommu: Use EINVAL for incompatible device/domain in ->attach_dev
>   iommu: Propagate return value in ->attach_dev callback functions

This looks good to me, but I'd like to have the SMMU people have a look
at patch 4. And I think it is too late for this to make it into 6.1, so
please re-send after 6.1-rc1 is out.

Thanks,

	Joerg

