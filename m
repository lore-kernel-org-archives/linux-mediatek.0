Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC99C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 22:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFAD20810
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 22:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcgXQCGP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fRVbYDgu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HyEydRMZ";
	dkim=neutral (0-bit key) header.d=redhat.com header.i=@redhat.com header.b="hN8O5m0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAFAD20810
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7TYrD09YNPiTUk4a4UOAl4CT/UcyVRuH8Bxs5dHN6eQ=; b=WcgXQCGP1EjiRD/2A/1q3iQui
	hRkm/OBMsA0lUOfa+v7m1CfSoc0M7D7hZjFjkdPHYuy0TiFfJnm5rSpmyYyMkFCA20YajTGAtPBTZ
	9GnRt9g5z6P+tKermsqt4vvereIT3hnL7oll/WLJSjt6hU34SSKWtGwb9WkOKlg4TSvmrA6y5pJZ2
	SL6uqMXO4xp78/JklrW9p58z0B6XntH7ZPfsyOZm1LrfROiaGKigSoZX5AKVKW0RIxcP1Ia4w+G3o
	e4joWQArOA+9hjrFo5EFMT8iJ29BS84IYxiH8DzjO5OPxg+Avnb8tJrXf698/M8Mhe4IBczhKY25F
	tjayXADyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jenIy-00033n-LF; Fri, 29 May 2020 22:16:44 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jenIx-00032z-QV
 for linux-mediatek@bombadil.infradead.org; Fri, 29 May 2020 22:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:In-Reply-To:MIME-Version:
 References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RyWRgA39MpCS4B1s1Q6dcjnQ39Nmyes8pkIQMz0S9CE=; b=fRVbYDgul//dtAywOCooXlTzBe
 HIhZmEWJQKxDyrAGunbAXbcR34kN9ZqjirGh+MKeshwPWpA7EkIoDYqGA3KsoyLgPx/+cem7ZJgPv
 pCvXDBmFrLUAYyw2646ospNL5lbJYbsIz7ZShK3ocDqXSSiwPWb0UVIBhnsIW5FrlUk6rApXFF0Er
 S0kstB8iMNfen7LYHLH9D8FEoCyOScMZlNA9RirABkP7VAlnNoinPHEhu+Tv1j2irEAV9eLSUV/Zo
 KNhxzMuNFX1zGwcM6UpXFVhcXl23jIiwoLt9dLewEa1GdvverAYBMSrEL8q//B3ttPqAOc/zuF0/0
 mvuPxfxw==;
Received: from us-smtp-1.mimecast.com ([205.139.110.61])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jenIw-000858-AB
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 22:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590790592;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RyWRgA39MpCS4B1s1Q6dcjnQ39Nmyes8pkIQMz0S9CE=;
 b=HyEydRMZTLGrdMZrhync1yjF80RTDrg5tllQ8JcDCwKF5HM1gHuL3kxdX10bl+DQhabkyB
 EDrpC3oDmktZI9oHoT+zfWbnRFMzHocyzPSUi8rG5h98NqPmqzMk5OClHcNQUB2gyoJsoz
 lvtDt5pyQRDGMJtCC3WFSCxzW0AhSkg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590790601;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RyWRgA39MpCS4B1s1Q6dcjnQ39Nmyes8pkIQMz0S9CE=;
 b=hN8O5m0hagcRMudMW3yEui7ZbZS09401cGMZ4Ioyn4+Pk+jfHQH1ZpKVUL3PxmarkoP4Wi
 stL9Bxgfil8uL7K0kYtR/VJjxEUhw2OdxsiDFaL/3MVakFYp7omp7riWtlLNZxRyhk4VcG
 CSZm8KtkTx7kp3TkXeGsFCv+wIKko4M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-JcwkrfR2OtWnnO2xcA177w-1; Fri, 29 May 2020 18:16:26 -0400
X-MC-Unique: JcwkrfR2OtWnnO2xcA177w-1
Received: by mail-qv1-f71.google.com with SMTP id w6so3532852qvj.4
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 15:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RyWRgA39MpCS4B1s1Q6dcjnQ39Nmyes8pkIQMz0S9CE=;
 b=cGJaHfq8VjB3lwFH5Lf9D38z89t37nrwNlGio1A3+dRwrsLZHehQZfuVQbcMNvS03H
 m4kWhasSAy3nx81bKY+wRtuyZdoXa+imicbvKNIyetTTyTy2qC13IoFvzqc9bt7/uvXh
 dLoot5dux24C/ldbJ9ax0D4quBClDQIYXQs6D3f0+beOEKJDdstSexJ6VrMU3XajoqA5
 eDq9wH2qX9kitS3yR1U4JbKSh6jQaY41u2ty5zYvk6ad288Hl3hTFmZtCBeCTbElSTKn
 Z7YIemys1DZH8TrdK7GkxX8NHx2jJ4P5RLWb1+SDao3kEDooYq/qBTjrBbhndtLD1ntw
 S3Yg==
X-Gm-Message-State: AOAM531jbeHXaGuK1VBOKDrLTyyvIWTGLrjoybdzQA+SHAWDahFfVUJ5
 qMwWXEt/pxVHffyKfOGTRRWG2n91/r79VP0gzlJk/xT3lx+mzyUEpWdhU2uAk2XfyGPZOEkSQpl
 LDbiUygOusgOG9gxcbf+mLkWZpr14Yo9r
X-Received: by 2002:a37:6188:: with SMTP id v130mr4562276qkb.138.1590790585938; 
 Fri, 29 May 2020 15:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw51w0cnvYWh4WhXmhdM31BK730VJAQnizGJEPYNr8qH289FZOtd/33h3DF8AwAKbkwmoOGzg==
X-Received: by 2002:a37:6188:: with SMTP id v130mr4562246qkb.138.1590790585671; 
 Fri, 29 May 2020 15:16:25 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id w13sm8244813qkb.91.2020.05.29.15.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 15:16:24 -0700 (PDT)
Date: Fri, 29 May 2020 15:16:23 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200529221623.qc6twmpzryh7nkvb@cantor>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue Apr 14 20, Joerg Roedel wrote:
>Hi,
>
>here is the second version of this patch-set. The first version with
>some more introductory text can be found here:
>
>	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
>
>Changes v1->v2:
>
>	* Rebased to v5.7-rc1
>
>	* Re-wrote the arm-smmu changes as suggested by Robin Murphy
>
>	* Re-worked the Exynos patches to hopefully not break the
>	  driver anymore
>
>	* Fixed a missing mutex_unlock() reported by Marek Szyprowski,
>	  thanks for that.
>
>There is also a git-branch available with these patches applied:
>
>	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
>
>Please review.
>
>Thanks,
>
>	Joerg
>
>Joerg Roedel (32):
>  iommu: Move default domain allocation to separate function
>  iommu/amd: Implement iommu_ops->def_domain_type call-back
>  iommu/vt-d: Wire up iommu_ops->def_domain_type
>  iommu/amd: Remove dma_mask check from check_device()
>  iommu/amd: Return -ENODEV in add_device when device is not handled by
>    IOMMU
>  iommu: Add probe_device() and remove_device() call-backs
>  iommu: Move default domain allocation to iommu_probe_device()
>  iommu: Keep a list of allocated groups in __iommu_probe_device()
>  iommu: Move new probe_device path to separate function
>  iommu: Split off default domain allocation from group assignment
>  iommu: Move iommu_group_create_direct_mappings() out of
>    iommu_group_add_device()
>  iommu: Export bus_iommu_probe() and make is safe for re-probing
>  iommu/amd: Remove dev_data->passthrough
>  iommu/amd: Convert to probe/release_device() call-backs
>  iommu/vt-d: Convert to probe/release_device() call-backs
>  iommu/arm-smmu: Convert to probe/release_device() call-backs
>  iommu/pamu: Convert to probe/release_device() call-backs
>  iommu/s390: Convert to probe/release_device() call-backs
>  iommu/virtio: Convert to probe/release_device() call-backs
>  iommu/msm: Convert to probe/release_device() call-backs
>  iommu/mediatek: Convert to probe/release_device() call-backs
>  iommu/mediatek-v1 Convert to probe/release_device() call-backs
>  iommu/qcom: Convert to probe/release_device() call-backs
>  iommu/rockchip: Convert to probe/release_device() call-backs
>  iommu/tegra: Convert to probe/release_device() call-backs
>  iommu/renesas: Convert to probe/release_device() call-backs
>  iommu/omap: Remove orphan_dev tracking
>  iommu/omap: Convert to probe/release_device() call-backs
>  iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
>  iommu/exynos: Convert to probe/release_device() call-backs
>  iommu: Remove add_device()/remove_device() code-paths
>  iommu: Unexport iommu_group_get_for_dev()
>
>Sai Praneeth Prakhya (1):
>  iommu: Add def_domain_type() callback in iommu_ops
>
> drivers/iommu/amd_iommu.c       |  97 ++++----
> drivers/iommu/amd_iommu_types.h |   1 -
> drivers/iommu/arm-smmu-v3.c     |  38 +--
> drivers/iommu/arm-smmu.c        |  39 ++--
> drivers/iommu/exynos-iommu.c    |  24 +-
> drivers/iommu/fsl_pamu_domain.c |  22 +-
> drivers/iommu/intel-iommu.c     |  68 +-----
> drivers/iommu/iommu.c           | 393 +++++++++++++++++++++++++-------
> drivers/iommu/ipmmu-vmsa.c      |  60 ++---
> drivers/iommu/msm_iommu.c       |  34 +--
> drivers/iommu/mtk_iommu.c       |  24 +-
> drivers/iommu/mtk_iommu_v1.c    |  50 ++--
> drivers/iommu/omap-iommu.c      |  99 ++------
> drivers/iommu/qcom_iommu.c      |  24 +-
> drivers/iommu/rockchip-iommu.c  |  26 +--
> drivers/iommu/s390-iommu.c      |  22 +-
> drivers/iommu/tegra-gart.c      |  24 +-
> drivers/iommu/tegra-smmu.c      |  31 +--
> drivers/iommu/virtio-iommu.c    |  41 +---
> include/linux/iommu.h           |  21 +-
> 20 files changed, 533 insertions(+), 605 deletions(-)
>
>-- 
>2.17.1
>
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>

Hi Joerg,

With this patchset, I have an epyc system where if I boot with
iommu=nopt and force a dump I will see some io page faults for a nic
on the system. The vmcore is harvested and the system reboots. I
haven't reproduced it on other systems yet, but without the patchset I
don't see the io page faults during the kdump.

Regards,
Jerry


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
