Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5086FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 10:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 213BA20772
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 10:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tx8C+J5C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AF+xUpaY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQhH5MTO";
	dkim=neutral (0-bit key) header.d=redhat.com header.i=@redhat.com header.b="e64LGx4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 213BA20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WKFAzcYly57Q9ii4s7dBjbhaTg5+zGd9nYLi3CFYAtU=; b=Tx8C+J5C/J0A28R4NOmJdsNsh
	RcqHUHG2wRhw7hXzgyzlrfR0ClSSJAgbpdwgSnN0y5LA5Gprs/V5k9E4AfZto1khtPgOSMJwtghlk
	7sj6pJh5skahcMBQaGwAxd3HT8rYWbk/8V/GhEDSMLgMN474IpoN+8smTRXS+6r1ueq5rS9Cxc+Nu
	ad+uOhdfLi/Qgr1pXsTj7duPDinEcFiTS5B01b0UDgjcqkgBQr9oBq+7wrSM18Nnq54OcVT+M73Zf
	5lHWDeVekl9HeeN1rk+kz+Vv7sfbzkshHBtpvK7SNIXt2gMzHOQbZ4VFCz+EVYgbgoiAU8WQIx7ht
	NKJQ3CBVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfhuU-0005hR-0Q; Mon, 01 Jun 2020 10:43:14 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfhuS-0005hJ-Pn
 for linux-mediatek@bombadil.infradead.org; Mon, 01 Jun 2020 10:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:In-Reply-To:MIME-Version:
 References:Reply-To:Message-ID:Subject:To:From:Date:Sender:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AeMGc882OThjd+9FTKhf2SV28sW70mLexiTD0o0MA38=; b=AF+xUpaYWecr+VYmy/68x8y0tj
 cIHft2L7P3kQc7casIKX50tFhXCXhCAC241KGYtYutxenXjfwhCAPyWvkpKdMXTQlWS8Q1LZFt1hd
 uLxbCncLqwnNdCKyN5MhjT1UEl9nBE5OJhDj/tydONlMqZbyzq9MiFqnTU62tSmfh54BPp1P330qa
 quadCLYZhwpNop1KSGCbJwt1ORQTmjoCgHQ3Nn+LlgjtiXPNCVyLTu943M9T3UlRiXtU3TeGLi1p2
 TwAet+/3uoPOzs0W5QtaTxWYV7U3gSqq6nx75t8BTpVsRoNwW875fsPuASAks1OqlPU0EgepJiebo
 a9+3Q46A==;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfhuQ-0002vM-FZ
 for linux-mediatek@lists.infradead.org; Mon, 01 Jun 2020 10:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591008170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AeMGc882OThjd+9FTKhf2SV28sW70mLexiTD0o0MA38=;
 b=PQhH5MTOAXNTBxswoMPZGGbINY9xgsFQoFDXLrde2mjGAatD9A27siLc2WYuymkN/iTA14
 I6O5ZwifADA8xy7gxWPlhHLXDsNiIJW61JHlbkUFeTkmQXiBDfHzhpAjVvO/n9att3AB69
 WnBZA2nmzUfMDTqwyDeYsL7X+AHnPYc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591008189;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AeMGc882OThjd+9FTKhf2SV28sW70mLexiTD0o0MA38=;
 b=e64LGx4rc6/ZW+sdlL99vnG38Y63F5T1NOrdFRsIWud9NPhyr+vsNMziy4wm4u8YbWpKIy
 h2/zl5hK1gmExuICeuv3ldnmxQVwIEvOL1Wa6N3b4INwj12Uy7wWJemGGb5kSiqI7oyHkK
 3NFUPkhRA/5XvF7Fj2TN3azb5QUap3M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-RbQ-F_IBNouA3MoyK2AB-Q-1; Mon, 01 Jun 2020 06:42:43 -0400
X-MC-Unique: RbQ-F_IBNouA3MoyK2AB-Q-1
Received: by mail-qv1-f69.google.com with SMTP id dt19so8211123qvb.5
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 03:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AeMGc882OThjd+9FTKhf2SV28sW70mLexiTD0o0MA38=;
 b=Kq4bTpA7Vp/atnYhGbX66pr3c2yHrmRdNjpsCRZ4gtZFR9utWmtQYmw7w17Miy30i6
 XOpl6fXZnGtpJ/5+bOHXDusaVxmLDQv/UayXF2PiRPCpA5N8cInEslPCn/mauw5uQt12
 mxteZkosOc2qtv6Xjg9jZrikHsUhiyeIOGvu5MJ7jeCNsCr35a28aMyStVnM/FTy2tEd
 NnrIKNtoFpW6DZ3f5GMU2/pD+FzRvHpZnM0VyDGl9D9XkHwh6guCT9TGsxhdfErow9QS
 eIw2lKHvMYE0+DvPIcGAU/BQKu7CTDeGM+GlCpLRFlwlgLIij9mV9/bVpt5qAgwdzS9k
 cYZA==
X-Gm-Message-State: AOAM531tZBzX0l3A4PEZw1PanbF7nlv/Gc+A1uKpT9QeHfBeN30t5V/Z
 WEFym2Anh/RCaGNqVO5ObNPoHFaViOuozwwRp892wJF90rtezJK86N5Tx9sj0M2z5Nb5/8JfjIk
 rta+P4Vf1HuX2zGqVCnIUU1sDQbBVFtOI
X-Received: by 2002:a0c:e4d3:: with SMTP id g19mr19829691qvm.42.1591008163381; 
 Mon, 01 Jun 2020 03:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+BINnTJE9j45H+TvYk5eeeeQO8aLXNnH2+mU7xE+aZ2rhNvGdUvylAKc6cV/RkkqIBE9yOw==
X-Received: by 2002:a0c:e4d3:: with SMTP id g19mr19829653qvm.42.1591008163033; 
 Mon, 01 Jun 2020 03:42:43 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id m10sm15395899qtg.94.2020.06.01.03.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 03:42:42 -0700 (PDT)
Date: Mon, 1 Jun 2020 03:42:40 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
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
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200601104240.7f5xhz7gooqhaq4n@cantor>
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
 <20200529221623.qc6twmpzryh7nkvb@cantor>
MIME-Version: 1.0
In-Reply-To: <20200529221623.qc6twmpzryh7nkvb@cantor>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri May 29 20, Jerry Snitselaar wrote:
>On Tue Apr 14 20, Joerg Roedel wrote:
>>Hi,
>>
>>here is the second version of this patch-set. The first version with
>>some more introductory text can be found here:
>>
>>	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
>>
>>Changes v1->v2:
>>
>>	* Rebased to v5.7-rc1
>>
>>	* Re-wrote the arm-smmu changes as suggested by Robin Murphy
>>
>>	* Re-worked the Exynos patches to hopefully not break the
>>	  driver anymore
>>
>>	* Fixed a missing mutex_unlock() reported by Marek Szyprowski,
>>	  thanks for that.
>>
>>There is also a git-branch available with these patches applied:
>>
>>	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
>>
>>Please review.
>>
>>Thanks,
>>
>>	Joerg
>>
>>Joerg Roedel (32):
>> iommu: Move default domain allocation to separate function
>> iommu/amd: Implement iommu_ops->def_domain_type call-back
>> iommu/vt-d: Wire up iommu_ops->def_domain_type
>> iommu/amd: Remove dma_mask check from check_device()
>> iommu/amd: Return -ENODEV in add_device when device is not handled by
>>   IOMMU
>> iommu: Add probe_device() and remove_device() call-backs
>> iommu: Move default domain allocation to iommu_probe_device()
>> iommu: Keep a list of allocated groups in __iommu_probe_device()
>> iommu: Move new probe_device path to separate function
>> iommu: Split off default domain allocation from group assignment
>> iommu: Move iommu_group_create_direct_mappings() out of
>>   iommu_group_add_device()
>> iommu: Export bus_iommu_probe() and make is safe for re-probing
>> iommu/amd: Remove dev_data->passthrough
>> iommu/amd: Convert to probe/release_device() call-backs
>> iommu/vt-d: Convert to probe/release_device() call-backs
>> iommu/arm-smmu: Convert to probe/release_device() call-backs
>> iommu/pamu: Convert to probe/release_device() call-backs
>> iommu/s390: Convert to probe/release_device() call-backs
>> iommu/virtio: Convert to probe/release_device() call-backs
>> iommu/msm: Convert to probe/release_device() call-backs
>> iommu/mediatek: Convert to probe/release_device() call-backs
>> iommu/mediatek-v1 Convert to probe/release_device() call-backs
>> iommu/qcom: Convert to probe/release_device() call-backs
>> iommu/rockchip: Convert to probe/release_device() call-backs
>> iommu/tegra: Convert to probe/release_device() call-backs
>> iommu/renesas: Convert to probe/release_device() call-backs
>> iommu/omap: Remove orphan_dev tracking
>> iommu/omap: Convert to probe/release_device() call-backs
>> iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
>> iommu/exynos: Convert to probe/release_device() call-backs
>> iommu: Remove add_device()/remove_device() code-paths
>> iommu: Unexport iommu_group_get_for_dev()
>>
>>Sai Praneeth Prakhya (1):
>> iommu: Add def_domain_type() callback in iommu_ops
>>
>>drivers/iommu/amd_iommu.c       |  97 ++++----
>>drivers/iommu/amd_iommu_types.h |   1 -
>>drivers/iommu/arm-smmu-v3.c     |  38 +--
>>drivers/iommu/arm-smmu.c        |  39 ++--
>>drivers/iommu/exynos-iommu.c    |  24 +-
>>drivers/iommu/fsl_pamu_domain.c |  22 +-
>>drivers/iommu/intel-iommu.c     |  68 +-----
>>drivers/iommu/iommu.c           | 393 +++++++++++++++++++++++++-------
>>drivers/iommu/ipmmu-vmsa.c      |  60 ++---
>>drivers/iommu/msm_iommu.c       |  34 +--
>>drivers/iommu/mtk_iommu.c       |  24 +-
>>drivers/iommu/mtk_iommu_v1.c    |  50 ++--
>>drivers/iommu/omap-iommu.c      |  99 ++------
>>drivers/iommu/qcom_iommu.c      |  24 +-
>>drivers/iommu/rockchip-iommu.c  |  26 +--
>>drivers/iommu/s390-iommu.c      |  22 +-
>>drivers/iommu/tegra-gart.c      |  24 +-
>>drivers/iommu/tegra-smmu.c      |  31 +--
>>drivers/iommu/virtio-iommu.c    |  41 +---
>>include/linux/iommu.h           |  21 +-
>>20 files changed, 533 insertions(+), 605 deletions(-)
>>
>>-- 
>>2.17.1
>>
>>_______________________________________________
>>iommu mailing list
>>iommu@lists.linux-foundation.org
>>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>
>
>Hi Joerg,
>
>With this patchset, I have an epyc system where if I boot with
>iommu=nopt and force a dump I will see some io page faults for a nic
>on the system. The vmcore is harvested and the system reboots. I
>haven't reproduced it on other systems yet, but without the patchset I
>don't see the io page faults during the kdump.
>
>Regards,
>Jerry

I just hit an issue on a separate intel based system (kdump iommu=nopt),
where it panics in during intel_iommu_attach_device, in is_aux_domain,
due to device_domain_info being DEFER_DEVICE_DOMAIN_INFO. That doesn't
get set to a valid address until the domain_add_dev_info call.

Is it as simple as the following?

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 29d3940847d3..f1bbeed46a4c 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5053,8 +5053,8 @@ is_aux_domain(struct device *dev, struct iommu_domain *domain)
  {
         struct device_domain_info *info = dev->archdata.iommu;
  
-       return info && info->auxd_enabled &&
-                       domain->type == IOMMU_DOMAIN_UNMANAGED;
+       return info && info != DEFER_DEVICE_DOMAIN_INFO &&
+               info->auxd_enabled && domain->type == IOMMU_DOMAIN_UNMANAGED;
  }
  
  static void auxiliary_link_device(struct dmar_domain *domain,


Regards,
Jerry


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
