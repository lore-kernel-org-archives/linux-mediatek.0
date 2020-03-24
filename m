Return-Path: <SRS0=XWkL=5J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3941CC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 10:08:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF1B20775
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 10:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sw7K5j3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF1B20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgLatk1ZO71X3MAt81hHXblZPUgLTQCPMpNgYHFEsHk=; b=Sw7K5j3XADiSap
	nXNLI/+bY26RuwQQKUt+hIUFHsbJyZ9yKu/X73CSuKmIUeBmnushaVKNXv2Sa58rAxF+mQVTGB3ZR
	JlpOz3t1e9SG+u0iQMcYNiS6sEzgTHe7rWks9V5hZ9X6SBpIVnQw16fN0Fy6NopvRjca6yegsKM5T
	1Q5h/iFlIeqDceZwlFOqnI15Vg5K8Pt1w2vUKWDbVBUwZR/XGZBiB50POt+/EZeuQfkTEr/bC6kJ1
	RQdkua5zW+cv1y18VfJ8KsimSznS9cFw4S8D8Ddscu43kkSiKvdXkhOKE72123bskrZmag9hEe3FZ
	5ZTF8YAXCBi1l3IOHoqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgU3-0004md-0I; Tue, 24 Mar 2020 10:08:31 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgU0-0004lS-0B
 for linux-mediatek@lists.infradead.org; Tue, 24 Mar 2020 10:08:29 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 998162E2; Tue, 24 Mar 2020 11:08:20 +0100 (CET)
Date: Tue, 24 Mar 2020 11:08:19 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for
 iommu private data
Message-ID: <20200324100819.GA4038@8bytes.org>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
 <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_030828_184974_ABAC8CBA 
X-CRM114-Status: UNSURE (   8.97  )
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
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hey Robin,

On Mon, Mar 23, 2020 at 04:02:33PM +0000, Robin Murphy wrote:
> Yikes, this ends up pretty ugly, and I'd prefer not have this much
> complexity hidden in macros that were intended just to be convenient
> shorthand. Would you mind pulling in the patch below as a precursor?

Sure thing, but your mail-client seemed to have fiddled with the patch
so that is is unusable to me. I tried to fix it up, but it still doesn't
apply. Can you please re-send it to me either via git-send-email or just
as a mime-attachement?

> Other than that, the rest of the series looks OK at a glance. We should also
> move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather than
> "firmware" data, but let's consider that separately as this series is
> already long enough.

Yes, moving ops out of fwspec is next on the list, and moving the
iommu_group pointer into dev_iommu.

Regards,

	Joerg


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
