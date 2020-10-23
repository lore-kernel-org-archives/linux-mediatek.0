Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20176C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 11:18:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBE9207BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 11:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vT5LCPFx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hULYTVvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADBE9207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sJ0Gf5LlhTECgiWw+J++51Jh3I3fGYgcgF8YDfSa5oA=; b=vT5LCPFxDb4Lgk/DQ3Y/CmCLK
	yMe8KLo9jGfEv8syYpvYsLoIIV02NTark/h4LS91132exIWEptoCKn/KwH+vbnTsUbmQsZBKUoUlj
	XnIvHs20sVJJbz9QqM9HaZxtd/Jelctt+HHF3Tu7UxIl3IBbAAPMVXGq0vWuapyq9R9Q71gFzslG/
	KO+50JA4PJIXgy+P2pVaVO5IlVhQtOItu37awmJZFxPyOGwRKgwSMy7s8BtXA1oIZlPD6KNg+aTUZ
	/ZvEPHqIn6E6+coUNR9Y1qzmjHU1WxsGuZCQFjIKpeZjKvCsCyHnF53sXBxl+k6Gh81WcwmcRi04u
	4Mgz2iy3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVv50-0000Ca-2i; Fri, 23 Oct 2020 11:17:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVv4v-0000B3-1Q; Fri, 23 Oct 2020 11:17:49 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99D83207BB;
 Fri, 23 Oct 2020 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603451868;
 bh=FMY1pwU92BhVoBdk6p1+lhsYf8oY2OspVIzwsdBME40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hULYTVvLFl4f+Cpv5lt8polFR0TAAUl17U/ruVVcZpILx6kRHx3YJpFAxHaF/TdfF
 bcUfdlnYX9W4ehIxlXHqLUrnouA5UJIvo6J/CjFUer4nwlY8Ivwwl0vCRsQhSgP66H
 xlIc9+GM6ulIV4o9PEs1acazSYt7uer0MMAv371o=
Date: Fri, 23 Oct 2020 12:17:41 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 08/24] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
Message-ID: <20201023111740.GA20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-9-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-9-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_071749_193474_B5DC4573 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:31PM +0800, Yong Wu wrote:
> Use the ias for the valid iova checking in arm_v7s_unmap. This is a
> preparing patch for supporting iova 34bit for MediaTek.
> BTW, change the ias/oas checking format in arm_v7s_map.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index a688f22cbe3b..4c9d8dccfc5a 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -526,8 +526,7 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
>  		return 0;
>  
> -	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> -		    paddr >= (1ULL << data->iop.cfg.oas)))
> +	if (WARN_ON(iova >> data->iop.cfg.ias || paddr >> data->iop.cfg.oas))
>  		return -ERANGE;

As discussed when reviewing these for Android, please leave this code as-is.

>  
>  	ret = __arm_v7s_map(data, iova, paddr, size, prot, 1, data->pgd, gfp);
> @@ -717,7 +716,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  {
>  	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  
> -	if (WARN_ON(upper_32_bits(iova)))
> +	if (WARN_ON(iova >> data->iop.cfg.ias))
>  		return 0;

And avoid the UB here for 32-bit machines by comparing with 1ULL <<
iop.cfg.ias instead.

Thanks,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
