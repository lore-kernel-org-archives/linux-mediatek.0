Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68208C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBC464F51
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBC464F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0sZNmO7LaKmmqgrB+M/h43rmTey/zftxyEj/YFVKg/w=; b=Qh0Kbbmq9A1Did1G50h+OfQuU
	epNp1ylrv0RZoS1aiPD1K4zNMzfx7T4HrReRUSViDHW8CzFjVXtf+vplS6qwR01o2S7dJN/BlAoxl
	F6NaBIRL8ocdWBZZgis37qFFmygGmJXU9Qhc0qDPcGW4vyvLUVpSf1l26cX6+xXSHDlYLynfZur07
	HravEy62EEj/HFUsSvU7hgofYpVk7PvocGxnWayh4xFxzM6hm/JyRLYA7uCZWJNEI22OXlTzvbCpA
	aXDKj7jE9uqUfSEBD7VTuW1dF/kBnN1Tq1+HfpCNL2KqS/xVRDEVI08co5G9shJKxLcTCQGs2sBGa
	psKqI5Qlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7gp3-0005ws-8y; Thu, 04 Feb 2021 15:45:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7goy-0005vt-Qs; Thu, 04 Feb 2021 15:45:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39B5864F4A;
 Thu,  4 Feb 2021 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612453527;
 bh=lI0HC3GQbRFgXxSEIB/73Da0jQE/c8jAVtTEPB7vO28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hw7jGjaOFkLAvQ61LL+VxqPi61iCFS1TZYi2B+cwgM1q3w4+wR4x7emm3TtBViZSm
 2GrhUdgflJlyA+3u1JkgT7g8skKX5b+ttzIYkKYfQUS0BUV02aYO6Vu9aMuWtT+a/J
 HYXBSDBHv3esRV8xFzPZ0ZZsEwLG6E7+g0tJKRYthwIUBadcNIZ4Nl+Fc5PzKNxBkS
 P4ep96lwNbV642I7ry+o7/5eT0bzGj2Is8PseM6TWB5lR91u2uVlVK+KG6Guhsy/Mx
 FHr2kz+NeXH4zrLOD04Eq42qyz8QOF9S1LNXYEOhfHwN0aDczIa6cgbUbFdj5jW86r
 Sgee71aeHeEGQ==
Date: Thu, 4 Feb 2021 15:45:23 +0000
From: Will Deacon <will@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next][V2] iommu/mediatek: Fix unsigned domid comparison
 with less than zero
Message-ID: <20210204154522.GD21058@willie-the-truck>
References: <20210204150001.102672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204150001.102672-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_104528_950543_48480E9D 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 03:00:01PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned. Fix this by casting domid to an int before making
> the comparison.
> 
> Addresses-Coverity: ("Unsigned comparison against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: cast domid rather than making it an int. Replace L with : in
>     the commit message.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..1f262621ef19 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -645,7 +645,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_READ;
>  
> -	if (domid < 0)
> +	if ((int)domid < 0)
>  		return;
>  	curdom = data->plat_data->iova_region + domid;
>  	for (i = 0; i < data->plat_data->iova_region_nr; i++) {

Thanks, Colin.

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
