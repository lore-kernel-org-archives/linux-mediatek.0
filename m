Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3713C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 06:36:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7193206F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 06:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGbEzrB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7193206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWCLt+DzpJBaUq7a+0GxDUmHrtKvqh6vGBoCXQvcvAM=; b=PGbEzrB6nYuooCbu912O+lAzK
	vW4lyyM93UoYZo1XuCNBEt5ILKJUVzLVYK19rKOVZQShrK9AO90y04Fg9scwaZ53v+pTA2FjG/NTl
	UYn+qjMXo6AmJE6CczpvFjJJlLxLAGTMY86qxqxw29zx+NrOmFBUuxnVRCC1HFdlUyBktw7VCWtHY
	4mT5hP+TdieEEdTdo9SCXpV7DiHqZdFMQMoehP1AGklrtWHIkt78Yj2ln2PEemjXEVODfJXiAJCj9
	MWgI2rHvoGfcP06ow/LW+tDLIwMuuS9BuiEUFDu76GZ1Kfq7+2fOM3qShz7uM43y086LyejanIh4A
	Z1mJbJ4yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jObf0-0005Zo-CZ; Wed, 15 Apr 2020 06:36:34 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jObet-0005Qz-1N; Wed, 15 Apr 2020 06:36:28 +0000
IronPort-SDR: iBK7odfJyrHD2LPtrY5EXXIrmEA2sEy4Qp5d7I3g75WWDNIm0NtHOicqP5OV3Bs4knoZBLnVpg
 eG4E+3pXqcSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:36:26 -0700
IronPort-SDR: e6xHGQuPW0GE2LEJRgwBaaQuNwmEtvc/TZ2WPBNJCcxxDlhT3Yrpnh18pXIf/KDAcMJ1v7zZbH
 nGNmd7m4gNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="363591408"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.208])
 ([10.254.210.208])
 by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2020 23:36:20 -0700
Subject: Re: [PATCH v2 07/33] iommu: Add probe_device() and remove_device()
 call-backs
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, David Woodhouse
 <dwmw2@infradead.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-8-joro@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0ad37581-b464-30ac-c503-4c0daaf43867@linux.intel.com>
Date: Wed, 15 Apr 2020 14:36:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414131542.25608-8-joro@8bytes.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_233627_137917_FE4E017A 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020/4/14 21:15, Joerg Roedel wrote:
> From: Joerg Roedel<jroedel@suse.de>
> 
> Add call-backs to 'struct iommu_ops' as an alternative to the
> add_device() and remove_device() call-backs, which will be removed when
> all drivers are converted.
> 
> The new call-backs will not setupt IOMMU groups and domains anymore,
> so also add a probe_finalize() call-back where the IOMMU driver can do
> per-device setup work which require the device to be set up with a
> group and a domain.

The subject is inaccurate. probe_device() and release_device() are
added to replace the add and remove pair.

Best regards,
baolu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
