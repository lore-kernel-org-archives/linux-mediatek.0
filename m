Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46786C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFSST2IPcphHp0s0ZVW69jTby06FrGpKRLFSGMOoRNw=; b=WJdTt9/rTFExUhujVIyVHryxWR
	GoBQ9g7j8HsSiulCuvcE4JXHQoCx/lHir8hfShYJfCGH/E4bM67b4XZlgWpamEixeHrFyoiEgtDMR
	jXtovjj3LtPrmQIp2KRSvBXLyResC2vXjm8umbZkdkoYPFU2pA06hVjsS7fqSu6GdAsJ8walfBRI3
	7grRNb1jIv/4BiwLNnOfdtz3CxSV7Q8ky+1+19f90JsOo2L5Nzhyu0EBhD8psSwBa1xVo1E/K24Tt
	80d6t9LzzPSSpG+dltlheZ2jvm6vTewzsPP/HyTbFcanEEvMTT6keGFu1tzeAQWXMquFj5O+pWc1z
	G1iLTkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t5Q-00B9u7-6K; Mon, 10 Jan 2022 11:43:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t58-00B9ju-7z; Mon, 10 Jan 2022 11:43:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 675691F4341F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641815001;
 bh=qfdA38UV8rxTxGZXUeaOK67ifAtN+GX7ogFR3pqhe3E=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GbGeOl3ElrEfAbWKu7HuLcsqmZNTsV5mLhcFol3/mI7QS14/9DcbiP9i1TRFU2C2f
 l8OSZ+mkmPzoq4KRAJThArDrwv4rDvuKF8Cv6KS9ce33lwgBzJdYZCnvnGxQuYfdEL
 bqDeUO5LVTtsrN8THSCo3XuA19u29dlPi0Em94ZsJQlJdvLqCWwH4u0M+wUrRnczVi
 7C1ZC0NsjEfFE2LiKhRwainELvqFgypkULQbbJIITPehBElsslgS1nauOGmSBKtEbI
 OUQ0yiW+3whbBsbblvBjOYMNRxxT1u73ToGdYHqKeCDm2dG1V7HRJ3tGhu66r7bowU
 MDHQZVWe/XXbQ==
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Always check runtime PM status in
 tlb flush range callback
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-3-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f91157b6-886c-2d69-451e-6ddeb52f95d7@collabora.com>
Date: Mon, 10 Jan 2022 12:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-3-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034322_486147_2B84826B 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/12/21 13:07, Dafna Hirschfeld ha scritto:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In case of v4l2_reqbufs() it is possible, that a TLB flush is done
> without runtime PM being enabled. In that case the "Partial TLB flush
> timed out, falling back to full flush" warning is printed.
> 
> Commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> introduced has_pm as optimization to avoid checking runtime PM
> when there is no power domain attached. But without the PM domain
> there is still the device driver's runtime PM suspend handler, which
> disables the clock. Thus flushing should also be avoided when there
> is no PM domain involved.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
