Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6380C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 09:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FD964D99
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 09:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86FD964D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNHPoU+VVp6sHwVSkT9x+ZedGI/aqcSTS9s2/A0bpB4=; b=Q7lIOXhsQstSAd9PEpkDTQstX
	M6JeonAeJrEFHKWtkFthChJxOwSEsN1uLC2q1k2MJMpHYHgomFp8+QqK7ON2GNmAEJZ7bzT02qFCW
	tQMthy1d3CoG9KGzI/zRUN8MD7zBpz7ujntNM1xmmdSdbgh4pnK7kjXDwWdUOOrECJP+G1wc26XzD
	1w2ex8pVRaV9+CFMfduByqq+vH7vk/U4qNr5Y0jMvZvyaEJS8CMjyKxmPvWPeI2uyJ1RDDhN1ch/9
	gIde0Aj2AN18H8hwk5ZdqIhYzUjzx15biMWaEqTkYB47nWv+Hhb4zmpSC1Yg2Mgy4w0/zKtXDVQ8B
	cGljAriqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7att-0000Au-97; Thu, 04 Feb 2021 09:26:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7atp-0000AD-Bm; Thu, 04 Feb 2021 09:26:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B8A964F48;
 Thu,  4 Feb 2021 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612430764;
 bh=iPr0CA2pIHDHh2dXkae4rNvFekouTDxQFLqezinvrzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pWSNLJIttnbgsu3Ltschs2qhIDAn3WsWGlCpTGDn5YCZSXTbF+ZoZJYp0uzRXGLOU
 tEkRiLiu80c4yGmWLO8kZbRsZ+ye9vUeOtYUWDa1aDk11OOplr9Z86NsjPVDmZlVFV
 62t8B3MrYdVi37kaqdN5IqTn8aVW6QFgVn6hlKoeiEKsQGjw+RNmZtUdsac/7qvYsG
 AHseRnGyZ9DloI+Ng/A6MPwGv6q8duHiDS5+0rIOv2Bj5rWl+XqbxC5pmGwORXlqkY
 dHcM2nOLZyKERvGRzkEWss4zBUQe6q9y7H4Oca3P3p2GswRWxJfqy5QbZG6UmA3syV
 7BbxUlIPU5i+w==
Date: Thu, 4 Feb 2021 09:25:58 +0000
From: Will Deacon <will@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with
 less than zero
Message-ID: <20210204092558.GA20244@willie-the-truck>
References: <20210203135936.23016-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203135936.23016-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_042605_520301_FBD789DA 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: Anan sun <anan.sun@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 01:59:36PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned.  Fix this by making it signed.
> 
> Addresses-CoverityL ("Unsigned comparison against 0")

Typo here ('L' instead of ':')

> Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..823d719945b2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  				       struct list_head *head)
>  {
>  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
> -	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
> +	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;

Not sure if it's intentional, but this also makes 'i' signed. It probably
should remain 'unsigned' to match 'iova_region_nr' in
'struct mtk_iommu_plat_data'.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
