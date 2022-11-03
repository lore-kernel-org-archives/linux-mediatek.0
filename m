Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04784C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au7QSOq6gDrlTMEiTNNyoghLbS1dGLu2OUK9sA+no6Y=; b=tdpLCPN+xx+7PJZIWOb/DduJ3/
	2OjJEb9BReohr6IVFtiCHKFy7Hjn2GY4N+QDRxOxvmW7ehUQWwxfhTbFvRA9PmlGTxEEWKTTWPGxm
	riSJ8xy2l3nkLSNWLWuZL3AEuRStTJAiKOfojs4T+XG2RxgI6ICGrV+y5AlF8YI1ZoCWw068sPHsk
	fFtZ6+QHq3QTPELAGEs3OdkjzNTZ9aBfzWVYZuxZo4AKBw0wJlWsGCykqB/40IZb/CRbq90S45DW3
	nX6QS2cfo+9lgl/CDmEpPd7CDUomp/LDzYrVUGY2v3fN2mACV6qgd3rcblL7csnzwWeNQBHovvDWK
	w5dgjq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbb7-000APQ-TO; Thu, 03 Nov 2022 14:53:37 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbap-000AKO-3r; Thu, 03 Nov 2022 14:53:20 +0000
Received: from 8bytes.org (p5b00664c.dip0.t-ipconnect.de [91.0.102.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0E894260033;
	Thu,  3 Nov 2022 15:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1667487197;
	bh=W+503lTP2jRAK3Vj/frLD3iD/xxYLTMy9NfG9rA+raI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inVtOODTjwGgyJlA7Iw794Ad9BngxsaqLHg7pXU8cE21CYQBhPuH9VdUpIQOeaTSA
	 fJRx4FJ0TaD8loMduyufhX8+Le3tGOOTTSCzJkzEbwBKjIrdm/eN28sgxmf+v0n8Aq
	 3PFZrjec5c0TcKVsuoVv048G4EeBWwcabN+T7uc6MXQoi+GwA8IWO8eAfAM/qbbB+6
	 PqSTLVX+5sgCz7aSyOxDrkdrzQFN7TnyvR6B1E8PpBd97S+SidrA2xTFoaLtyIY69b
	 0jUBi9bVQBURoAIydeT86AZeQ/oLUb0hIbNNjzY2aYTLZEbhFbCGKSy7KiYEeAbsC5
	 lMxXjvVEer9cQ==
Date: Thu, 3 Nov 2022 15:53:15 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, kevin.tian@intel.com,
	quic_jjohnson@quicinc.com, suravee.suthikulpanit@amd.com,
	robdclark@gmail.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	yong.wu@mediatek.com, matthias.bgg@gmail.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, tglx@linutronix.de,
	shameerali.kolothum.thodi@huawei.com, christophe.jaillet@wanadoo.fr,
	yangyicong@hisilicon.com, yangyingliang@huawei.com,
	quic_saipraka@quicinc.com, jon@solid-run.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [GIT PULL iommu] Please pull iommu errno changes
Message-ID: <Y2PV26igcbY6Atu+@8bytes.org>
References: <Y2Jn7Jskqzz95XB4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Jn7Jskqzz95XB4@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_075319_407925_BAC4E419 
X-CRM114-Status: UNSURE (   5.75  )
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

On Wed, Nov 02, 2022 at 09:51:56AM -0300, Jason Gunthorpe wrote:
>   git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git tags/for-joerg

Pulled, thanks Jason and Nicolin.

