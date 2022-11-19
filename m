Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11060C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iOq8maYQy8++3jTwpXBr3UtJV/UuKmtgHA+VQG6geA=; b=203BaZ/btLHLXeC3hKDBOuQpwT
	OSgv1gr7OEKQnAr6NUwT2syUxIqDmV++3f10sNMB0Qjt9DZl4ReQMih/f1TzmSg5/5eKBp/wE0Xpr
	O8L8Ik1i1k264n9gaRbHeAutknPvfC8eGY35VVXPAZUpyB1HxBUL11PHBJ9KPtheWMj+co/UtzLnJ
	L5fMHEBV2EZ9K7PBaB/E8cjAUxl3KH2yrHjzDuuxaP31TjKRQzVvYrcQ9banIdkrwC2o9k3+ji8Uu
	EsuKMeFdk1kA4mLlkv58Mrl4Wh2HT8GNEXQn+J0qdgHaY7HN4gCsDMjuL+mLDLtPNi40Pq9eJaZfb
	OgTe6eOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owJrL-00CbvI-PU; Sat, 19 Nov 2022 09:09:59 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owJrI-00CbuN-PX
	for linux-mediatek@lists.infradead.org; Sat, 19 Nov 2022 09:09:58 +0000
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9237D2A02E2;
	Sat, 19 Nov 2022 10:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1668848989;
	bh=kKv4IcWBr50pq+u1BsUqwwkMsNOwSFyjY9GF6aF/+/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ok9bmgNGkOFDK3nBHALmX1F+tClW4U2X15E+un7wmwfbG9fSpCyXUL24R/bHxtX/y
	 RVGtkK/eTLpnyLm+96eGa7VMM3RykjztP+TG9etEOratXP57/PLrTm1KRgrBYRPTUv
	 /iuaeQfENCfGbCGbSFvwTD9MnVSXQyYrfpflUIwC1wjR8w2/RNJBExRObHMiX9s9UX
	 DAOmoTYZXNsUDVvXTzG6dnuprImgAr7lUGCSVbHKF7oUVoxnubQQkOEnYrRBdC5bPW
	 B0/MzTWBXqBD5AMIWiARKjdKNoT75sgNrCcopUvBo6gXV/tSAdSPHrIFR3mydLf6fk
	 jmFwRtOfdI7WQ==
Date: Sat, 19 Nov 2022 10:09:48 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	matthias.bgg@gmail.com
Subject: Re: [PATCH] iommu/mediatek: check return value after calling
 platform_get_resource()
Message-ID: <Y3idXEvo8/uBl4UV@8bytes.org>
References: <20221029103550.3774365-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029103550.3774365-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_010957_105642_5439A7CB 
X-CRM114-Status: UNSURE (   8.67  )
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

On Sat, Oct 29, 2022 at 06:35:50PM +0800, Yang Yingliang wrote:
> platform_get_resource() may return NULL pointer, we need check its
> return value to avoid null-ptr-deref in resource_size().
> 
> Fixes: 42d57fc58aeb ("iommu/mediatek: Initialise/Remove for multi bank dev")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

