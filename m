Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FD3C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0AB20848
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d200cegY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0AB20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glenSMQEe2pZ1UrVQHwgegQIqlLS6ctxuNET69IulDY=; b=d200cegYuNovBe
	DL+G6ivIf6/LKgL/5+U7apNK//h6EqBiQ+JMUh5UWApkNNTPS0S2qpfJ2PJBaiazfkUuFMAATGTrD
	Tlo/SgfXl9GTa2VzzMSO6KKtZN45wMnTEIi76kG6HycrrvSuk/Ko7+P1l6lRGNmcJtEnOOamWHgks
	d1Tw0kHieJD+HgetMuoPBbGe4u0KgvCI65HbZy+USTz7KRRVbBz/s7DH5+PaDu06YIwymautJ2akY
	j2davmdF9VhXrRA3Rc2j6Crad+qQNoWlex12x2XpEGukAzdyi7YcZZ72apRAykIVgLuNRb4pgjvPF
	+9p7DMes3su6C0GeC/sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9U4K-0006L4-Rg; Wed, 04 Mar 2020 13:28:12 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9U4I-0006Ju-Op
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 13:28:12 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 59B1C3A4; Wed,  4 Mar 2020 14:27:59 +0100 (CET)
Date: Wed, 4 Mar 2020 14:27:53 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200304132753.GA4177@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
 <20200303191624.GC27329@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303191624.GC27329@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_052810_956865_6920C9BA 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Will,

On Tue, Mar 03, 2020 at 07:16:25PM +0000, Will Deacon wrote:
> I haven't had a chance to review this properly yet, but I did take it
> for a spin on my Seattle board with MMU-400 (arm-smmu) and it seems to
> work the same as before, so:
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> 
> I'll try to review the patches soon.

Thanks for testing it! I will send out a new version probably beginning
of next week (I am travelling this week) to fix the kbuild issue and
anything you might find.

Thanks,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
