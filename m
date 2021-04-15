Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C01C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:49:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4705613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4705613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLxyR0uH+9LQvhmScaT4b7HF9jc5ZzSCKDGVbyWbpH4=; b=GMX93hgGrVrgtGnkqdkKpgcFO
	A5Yh6JvB/8q6NbEhhtlqngFKsNHWA0DG3ToBVI8ldy7MnbM0xT8xjo2UXgK044hiQeQZc5frqwUwG
	tgBM1A5gwC/pb/1JQT9/lbuO5GqZrKqFFypiitTdCrmyCLzJWY0R7Nq8lbwdDLBmpwuC8L+NRcdQk
	MjCvNj2S6e+3Aq4yvFuodxI1NAS21p3tZfRaBw16quBP61rE3UNYmIbRd5adp3xcK5ocmPRQ34iId
	OIfRgtB64z273Pi2bgtiu6BKm7VhsiXNmrKRF+eZ+h4n2ySer0yC+IHS2//g8deB4/tHKZmf7aj8R
	rGINKQjRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2Mk-00GKPN-Os; Thu, 15 Apr 2021 13:49:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2MO-00GKHG-9q; Thu, 15 Apr 2021 13:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vo4l1vCHKCU5srGRUHw3fDZ6pTr9XXs+8HMxxyEgJRc=; b=4qp1L8QI3ODWh/Tm7assuQN/f2
 roCNPx0UAMt55uF+/R7HKUgH2sAGgXlNzgdHLRZn9KzSyn/hwLy3Gh6n6WRYAZyTuIRsxu3J5fNvs
 jol4dmwmHLl4S3hCaVoimuIeWQa1Knu9XqJlB4Z9pdpw3fPcaVNH9O/H4G4rDbtpVZiKqstR1lFNw
 tCX+jdIR3jiHDm+XjwkriWUIjFeW6W8n5s5/a2wgkkciUo99Fh4oHxejDB9x4y30dqkBYHSdVEKEZ
 qOMzeyrRgcFIhrOv8F4Rt85ghWR2cker56JF5HSpYIdpx37MfxAD8VUp95derNQ1NL3fXd9nyiErF
 9TJsLNuQ==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2ML-008cfX-Rj; Thu, 15 Apr 2021 13:48:43 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6A328387; Thu, 15 Apr 2021 15:48:40 +0200 (CEST)
Date: Thu, 15 Apr 2021 15:48:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 Krzysztof Kozlowski <krzk@kernel.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, chao.hao@mediatek.com,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Avoid build fail when build as
 module
Message-ID: <YHhENs5Jh5h0Pz+r@8bytes.org>
References: <20210412064843.11614-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412064843.11614-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_064842_066183_E8E7558E 
X-CRM114-Status: GOOD (  14.09  )
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

On Mon, Apr 12, 2021 at 02:48:42PM +0800, Yong Wu wrote:
> When this driver build as module, It build fail like:
> 
> ERROR: modpost: "of_phandle_iterator_args"
> [drivers/iommu/mtk_iommu_v1.ko] undefined!
> 
> This patch remove this interface to avoid this build fail.
> 
> Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Currently below patch is only in linux-next-20210409. This fixes tag may be
> not needed. we can add this if it is need.
> Fixes: 8de000cf0265 ("iommu/mediatek-v1: Allow building as module")
> ---
>  drivers/iommu/mtk_iommu_v1.c | 62 ++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 34 deletions(-)

Applied both, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
