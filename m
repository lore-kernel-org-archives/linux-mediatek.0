Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3ADC43331
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F2E206F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k54qfq9Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB6iYL+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F2E206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+E7cPME4GDpSNDQfRs2JNXo4pz1qsQm+NYNdnRNkUQ=; b=k54qfq9YBsfxyT
	lkHpOM6kW9jXx+URwv64P3pnVJQJMOmbPfD5rToQ+qeU2/2b7C2S3mbl87OQZ8YKbahugpK430jGG
	TxehQ+qs8dAh1jEDl9OviX3q214fvOQccvpHualwvxrW1M5tqqQBb4PAzVOLaSULWS18BcACYRVAB
	lht4lfx1I+u9ggZE682wDDmfhN/vFb+J/24hL7MUI+xr0M8DohAm1N+00EODiHf7pfMexmKvWddQQ
	QYrfN5UHgs9kE6/E1MVT7DEMqE4EowMNyMDtPoNRNkEVVMXSi8p4ELvkADSogFmDUNe9AAYGO9+/Z
	yet9AUaZJ0RTEPyd8YrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHUBm-0006sc-QA; Thu, 26 Mar 2020 15:12:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHUBk-0006sI-7m
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 15:12:57 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71C1F206F8;
 Thu, 26 Mar 2020 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585235575;
 bh=03mOQkVXlkFBKtHce0kJ1Hjv4XLAxHKPWrBdcc+gBF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pB6iYL+WEVZqT2WkDjiggFRumLwoyzjPLuJ1Jb+asfmoXqv1A2OM1FAKmtPyVQ48C
 YmBaV/UeyEvUQtjDY+VkWeHiF0D+DUlgSn9bQXxHQ1WHqPYhhnk1lo1hNj8fesnDbf
 wNyEl8BhD/Hg/SJU7WCVwTk9mel7DhYPoax6Ax7E=
Date: Thu, 26 Mar 2020 16:12:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 05/16] iommu: Rename struct iommu_param to dev_iommu
Message-ID: <20200326151253.GB1530064@kroah.com>
References: <20200326150841.10083-1-joro@8bytes.org>
 <20200326150841.10083-6-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326150841.10083-6-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_081256_295884_E375C93D 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Clark <robdclark@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-arm-msm@vger.kernel.org, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2020 at 04:08:30PM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The term dev_iommu aligns better with other existing structures and
> their accessor functions.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c  | 28 ++++++++++++++--------------
>  include/linux/device.h |  6 +++---
>  include/linux/iommu.h  |  4 ++--
>  3 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
