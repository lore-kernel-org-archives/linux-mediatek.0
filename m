Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E53C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 08:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D9A20678
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 08:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kAh32ltF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EglGzROt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18D9A20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHur9//uKZwTj3Vk6dAy1H2ChxylIT5yt2KEG8sxNLc=; b=kAh32ltFIudRp0
	xtBXc/m2cFBdOo4HLR2tKEFAMC9MZ0V9spRylbnCOOJy51h+7B40C6Iobpi7/FQF90g3DEHPfmbwq
	tL6SCP88cv5l6cKc9c01xbZQjBcYV3gcUchhYYvXjuQ02FBWSjiixWnLHl4UUfeNqaNyHhyeGs3wx
	qOVdO4OwEgEJP0Y2Lu2tP6KfxE1dZ1RItla9ZDa5sVumTza+Go2JFaAU/GhJcP2kEaYfuYcy1PJOl
	fyvLmghVrxO+/mRXYLIGXgxIkqEWmDFDoU/1WX3y+BqUIt2PlULAHN+CrhJ6Zdo3yivlIV+d5dWHy
	M5bjEcTqVxe6upD5CM2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgP9E-0000Mq-Ft; Wed, 03 Jun 2020 08:53:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgP94-0000ET-SW; Wed, 03 Jun 2020 08:53:12 +0000
X-UUID: 5be725479fcb482d99c5fd8e1ac9a491-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GqhgG6L1zGtST6u5yF493LQmjohmvvIpbn2zNdLG3lI=; 
 b=EglGzROtLnjGP6UZ7vtLOLO5lL7jNEVYEoUCIoIuLfLHEOTqUvF9DjQG4pbPUSbhipRSvqUq/8y9yfbB3PixdysjiKhpCwP1Kc8RRtA3Om4bWvICDizKNaBk7433ramkhTVmPUezXbIx6d7GXgKnXMF0Pujhp2WqTGC92QMAMlc=;
X-UUID: 5be725479fcb482d99c5fd8e1ac9a491-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 353105554; Wed, 03 Jun 2020 00:53:00 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 01:45:34 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs01n2.mediatek.inc
 (172.21.101.79) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Jun 2020 16:45:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 16:45:26 +0800
Message-ID: <1591173806.15527.1.camel@mhfsdcap03>
Subject: Re: [PATCH v2] usb: host: xhci-mtk: avoid runtime suspend when
 removing hcd
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Wed, 3 Jun 2020 16:43:26 +0800
In-Reply-To: <1590726778-29065-1-git-send-email-macpaul.lin@mediatek.com>
References: <1590726569-28248-1-git-send-email-macpaul.lin@mediatek.com>
 <1590726778-29065-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CA6D6B5CA1B57E8E80E8EA32F96818490747DA2EE90F21A39CF72B716572D3462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_015310_932823_59C5B526 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-29 at 12:32 +0800, Macpaul Lin wrote:
> When runtime suspend was enabled, runtime suspend might happened
> when xhci is removing hcd. This might cause kernel panic when hcd
> has been freed but runtime pm suspend related handle need to
> reference it.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index bfbdb3c..641d24e 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -587,6 +587,9 @@ static int xhci_mtk_remove(struct platform_device *dev)
>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>  	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
>  
> +	pm_runtime_put_sync(&dev->dev);
> +	pm_runtime_disable(&dev->dev);
> +
>  	usb_remove_hcd(shared_hcd);
>  	xhci->shared_hcd = NULL;
>  	device_init_wakeup(&dev->dev, false);
> @@ -597,8 +600,6 @@ static int xhci_mtk_remove(struct platform_device *dev)
>  	xhci_mtk_sch_exit(mtk);
>  	xhci_mtk_clks_disable(mtk);
>  	xhci_mtk_ldos_disable(mtk);
> -	pm_runtime_put_sync(&dev->dev);
> -	pm_runtime_disable(&dev->dev);
>  
>  	return 0;
>  }

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
