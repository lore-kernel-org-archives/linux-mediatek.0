Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=972S+snkfIEyptDGN/uXs5rf4BUjW/YZmuV568v603E=; b=ioaJpX0zmBIcbGTI3OUtbJOx8A
	XD+2CPAUJXcia5QJUqXVrv1qeSIxj/plw60XjF0eKnlhE8T0HMRcvKGyi2KxWnxYYsA7FZWP0MQK4
	CY93llgQ7p0z0FDQ6JuSYR2CmvaiaWcJQSnHEssfsq5uO9gKJ07Er0olQUKZq6YnzvgdY2oT3TJCO
	Nr/oaevqwL1lAiQjADfKQt26c7/0uhWTjmNTWuJ666L6yVfttJB7Sc1WXLQ3wb5szWqvkSLDvwDuF
	+aDMuw7HTVRkalYJmH/TKPHdlUBYYECMh0UoCYm/ojpIBL/BTK4YnOjm71uXbg2S1izc8NImwL+SW
	hV6tP59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOXJ-005a4Q-Mh; Tue, 08 Nov 2022 13:21:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOX6-005ZwR-I9; Tue, 08 Nov 2022 13:20:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BDC86148D;
	Tue,  8 Nov 2022 13:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7360C433D6;
	Tue,  8 Nov 2022 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667913651;
	bh=F1MrMjvh/L1F4zxWBX7r8xXYoMUO4ZXMTGWde/+UFd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZaBgX2VaqGZgOh/2C0l++qPRlM8ueDrM9SLeSVBvUQEQ0+CNdo356p2qirP1dEgJ
	 p/H4iy/1oAwn0ait0PvZKuBfPMAnQDFDkXJtKbJiot6gOdqiqVGf0/w7jk8vpPsbFI
	 n39iYmDpzjVLSA1MXWr/cDCfrGf3A/+OHru3RiE4kPX3W97ALdEM6/h3yPQ0zjGCJZ
	 q1ivEC4oeiOD9WI4AegBBhj03IgPbMrHzOGR+4pXQwzPuGiX7waZ0und1RxcXF1J+j
	 MXeA9iQvAXVNy8WS4w2xu8rFWvjxhzh0obhV1OFgD6jSVycIiG4hb8lh5dBxyqba2D
	 JHeBEQ2z21fvg==
Date: Tue, 8 Nov 2022 13:20:42 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, jgg@nvidia.com,
	kevin.tian@intel.com, quic_jjohnson@quicinc.com,
	suravee.suthikulpanit@amd.com, robdclark@gmail.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, orsonzhai@gmail.com,
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
Subject: Re: [PATCH v7 4/5] iommu: Use EINVAL for incompatible device/domain
 in ->attach_dev
Message-ID: <20221108132041.GB22816@willie-the-truck>
References: <cover.1666042872.git.nicolinc@nvidia.com>
 <f52a07f7320da94afe575c9631340d0019a203a7.1666042873.git.nicolinc@nvidia.com>
 <20221107152645.GD21002@willie-the-truck>
 <Y2mfaG1/6hd1qykW@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2mfaG1/6hd1qykW@Asurada-Nvidia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_052052_689464_7538E483 
X-CRM114-Status: GOOD (  26.03  )
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

On Mon, Nov 07, 2022 at 04:14:32PM -0800, Nicolin Chen wrote:
> On Mon, Nov 07, 2022 at 03:26:45PM +0000, Will Deacon wrote:
> 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index ba47c73f5b8c..01fd7df16cb9 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -2430,23 +2430,14 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> > >                       goto out_unlock;
> > >               }
> > >       } else if (smmu_domain->smmu != smmu) {
> > > -             dev_err(dev,
> > > -                     "cannot attach to SMMU %s (upstream of %s)\n",
> > > -                     dev_name(smmu_domain->smmu->dev),
> > > -                     dev_name(smmu->dev));
> > > -             ret = -ENXIO;
> > > +             ret = -EINVAL;
> > >               goto out_unlock;
> > >       } else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
> > >                  master->ssid_bits != smmu_domain->s1_cfg.s1cdmax) {
> > > -             dev_err(dev,
> > > -                     "cannot attach to incompatible domain (%u SSID bits != %u)\n",
> > > -                     smmu_domain->s1_cfg.s1cdmax, master->ssid_bits);
> > >               ret = -EINVAL;
> > >               goto out_unlock;
> > >       } else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
> > >                  smmu_domain->stall_enabled != master->stall_enabled) {
> > > -             dev_err(dev, "cannot attach to stall-%s domain\n",
> > > -                     smmu_domain->stall_enabled ? "enabled" : "disabled");
> > >               ret = -EINVAL;
> > >               goto out_unlock;
> > >       }
> 
> > I think it would be helpful to preserve these messages using
> > dev_err_ratelimited() so that attach failure can be diagnosed without
> > having to hack the messages back into the driver.
> 
> Thank you for the review.
> 
> The change is already picked up last week. Yet, I can add prints
> back with a followup patch, if no one has a problem with that.

Sorry, I fell behind with upstream so I got to this late. A patch on top
would be fantastic!

> Also, I am not quite sure what the use case would be to have an
> error print. Perhaps dev_dbg() would be more fitting if it is
> just for diagnosis?

Sure, that works for me. I think the messages are useful for folks
triggering this path e.g. via sysfs but if they're limited to debug I think
that's better than removing them altogether.

Cheers,

Will

