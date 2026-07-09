Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14213C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MlbD+ftOwKt4BByEZtFD+Ks2aukeevZw3PKFlwFAqo=; b=HmEgD7vZLkoYvcjbFPKJbm/SE2
	O/P8GiQ8QmmzdsGS5FXQiVRBEJX/8zDben5Rh7cAbdQvlRKnvaCQY7PqJSsIAhVTo98lsC9hyQXYF
	3/aqB0eBiqVWVJS4rX1ZuyCBYo1NGLt0rFt78kUO92wDAR5LUJOK+Th698ISJXvWEprAVjmOJMiba
	wWTAAZOKGfzEf1GsdCKJWhFhBu9qNml+SJb0lzEtICdbixj3tHZgNiI1VMMoPhFFI2EW9BZ4XT7oa
	pSuT3qq5SgFYHKWgE5DgCjUR7KpTZ5c6ZKCjnDMW6i1YkPFVmmtCIK3wDvHfwx347zjdYnX8Azzfh
	MD1ws+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjtJ-00000001OEd-3dMY;
	Thu, 09 Jul 2026 08:13:53 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjtE-00000001ODW-34Jt;
	Thu, 09 Jul 2026 08:13:52 +0000
Received: from 8bytes.org (p200300f6af4fc500c39e96c98da8598f.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:c39e:96c9:8da8:598f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1AAEA203552;
	Thu,  9 Jul 2026 10:13:46 +0200 (CEST)
Date: Thu, 9 Jul 2026 10:13:44 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Miles Chen <miles.chen@mediatek.com>, 
	Joerg Roedel <jroedel@suse.de>, "open list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux.dev>, 
	"moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
Message-ID: <ak9YKsvML_WIXNhY@8bytes.org>
References: <20260629145946.312819-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629145946.312819-1-akkun11.open@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_011350_849507_284164E7 
X-CRM114-Status: UNSURE (   8.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2026 at 11:59:44PM +0900, Akari Tsuyukusa wrote:
>  drivers/iommu/mtk_iommu_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

