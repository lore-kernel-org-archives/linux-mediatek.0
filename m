Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0512C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:25:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDB4611AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDB4611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ge6TKfA0B/iP7zxLUKOU3W0h6YeNCc7sHjlSkacDgwE=; b=amFRV96IAV43j6RQyco9aIFP7
	SxskcFrL+/H/ZEp+eqBtr+al5w+ChhCQsyT1dd5/mxMzXC92MG9CUKOUEV/nqMjz+iRnv+zVYqzkE
	xqr5/QYD2abMQo1QBT1v/IPVefHIOhWGbS3RgTku3OQp+Nmlq9OWbnp16nZREQwekrfC56Cs2U9zp
	geZQv7+vlwYaAAtISI4pTcSGOuq5PTGb+XLm/J0bYYjYQTcaXvzRJfaRfN2tjQUI/dapY7G5M5gWP
	E0yug4r3fY8x2V6cxFwRPQ5dkWvV5HLYHsP+N/eOrQr8viIFGzp9XdNKu7V4MC0Y6DUHzp/9FlcoD
	LojU5u3Uw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQLG-002cBg-A4; Fri, 16 Apr 2021 15:25:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQL3-002c7V-Hi; Fri, 16 Apr 2021 15:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B4eEZsz9/yINYzZvAZRhVtj3/DAaD2tqAzlZ9AO0pTY=; b=fL/beRcdFL+0bZo62aSPG8ZzOH
 U7GApzzClVdxw6YkcAYNt58eLTG62XuLcfQh/lMEtA4Ta4d/x0P0kHp9078BO7GEY4GgORO9nIT5t
 Vsrv32x4uy8pv9reBHeo/2a3KGXfhBq5Q18gqa7vSeH/MjGm/lBtFcY4Tv3lKpK9o3yMEEDqkvxxw
 6hdToZunv6xydBQIlyBkr++E8x06N7UhkMAWIZRFcfnKKjFRqq3OUdzeiqhO3uzMTvAfdDc6bP1ay
 msbuQ+KDlRmLH6/cqnfSxOSWg6AHTuQi7utp4VSKrMw7KBlG2pkHdiMY43FQSRpO41RSoRvq1B/Ic
 M0Lwv+Dw==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQKz-009VEO-9b; Fri, 16 Apr 2021 15:24:56 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D3E01223; Fri, 16 Apr 2021 17:24:51 +0200 (CEST)
Date: Fri, 16 Apr 2021 17:24:50 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/8] iommu: fix a couple of spelling mistakes detected by
 codespell tool
Message-ID: <YHmsQtm4o5f7fAru@8bytes.org>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326062412.1262-1-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_082453_505319_3CEFE164 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 26, 2021 at 02:24:04PM +0800, Zhen Lei wrote:
> This detection and correction covers the entire driver/iommu directory.
> 
> Zhen Lei (8):
>   iommu/pamu: fix a couple of spelling mistakes
>   iommu/omap: Fix spelling mistake "alignement" -> "alignment"
>   iommu/mediatek: Fix spelling mistake "phyiscal" -> "physical"
>   iommu/sun50i: Fix spelling mistake "consits" -> "consists"
>   iommu: fix a couple of spelling mistakes
>   iommu/amd: fix a couple of spelling mistakes
>   iommu/arm-smmu: Fix spelling mistake "initally" -> "initially"
>   iommu/vt-d: fix a couple of spelling mistakes

This patch-set doesn't apply. Please re-send it as a single patch when
v5.13-rc1 is released.

Thanks,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
