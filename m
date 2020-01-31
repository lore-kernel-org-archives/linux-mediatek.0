Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99886C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 14:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66338206D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjRrPlQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66338206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQwrtZN8GMhP7k1iY6CNAbTe2kxiBArBSOqIXOcK2A4=; b=WjRrPlQVZ88FwJOyWrDa07Avk
	PM+BZv96aZm/pGN+bTjigSlt6nmF8wUiS0PmyD3lGwVit2r7fj/ay8bVoizcATfzgVXkNnRUpPBX/
	eyU7kEqNNilHGnh74Z+M57Rpzqt7cEO3e8FLmDPaKKUN2E3TZjx2EXRO3VzjVr5/OC/8tu9LrhkOV
	mKKpBkmAiXLM8xeboydPFB5fJiC6q8aNfeLSGf41MbVbyWYDCVygcb63P0LR3nXwNQpopmJN5LwQM
	cWG4TMsND8waIxM76wDw9YVzYDFOEmeX34q123PGGyDPzA6npEhKbZ0vCVXdh2p8cqhk82xMBHfpQ
	YHFfF6adw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixXak-0002XC-5H; Fri, 31 Jan 2020 14:48:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixXaV-0002Kc-JE; Fri, 31 Jan 2020 14:48:05 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 06:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; d="scan'208";a="310020734"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170])
 ([10.237.72.170])
 by orsmga001.jf.intel.com with ESMTP; 31 Jan 2020 06:47:56 -0800
Subject: Re: [PATCH] xhci-mtk: Fix NULL pointer dereference with xhci_irq()
 for shared_hcd
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <1579246910-22736-1-git-send-email-macpaul.lin@mediatek.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <08f69bab-2ada-d6ab-7bf7-d960e9f148a0@linux.intel.com>
Date: Fri, 31 Jan 2020 16:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1579246910-22736-1-git-send-email-macpaul.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_064803_645033_AC49B3D5 
X-CRM114-Status: GOOD (  21.50  )
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
Cc: Sriharsha Allenki <sallenki@codeaurora.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.1.2020 9.41, Macpaul Lin wrote:
> According to NULL pointer fix: https://tinyurl.com/uqft5ra
> xhci: Fix NULL pointer dereference with xhci_irq() for shared_hcd
> The similar issue has also been found in QC activities in Mediatek.
> 
> Here quote the description from the referenced patch as follows.
> "Commit ("f068090426ea xhci: Fix leaking USB3 shared_hcd
> at xhci removal") sets xhci_shared_hcd to NULL without
> stopping xhci host. This results into a race condition
> where shared_hcd (super speed roothub) related interrupts
> are being handled with xhci_irq happens when the
> xhci_plat_remove is called and shared_hcd is set to NULL.
> Fix this by setting the shared_hcd to NULL only after the
> controller is halted and no interrupts are generated."
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b18a6baef204..c227c67f5dc5 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -593,11 +593,11 @@ static int xhci_mtk_remove(struct platform_device *dev)
>   	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
>   
>   	usb_remove_hcd(shared_hcd);
> -	xhci->shared_hcd = NULL;
>   	device_init_wakeup(&dev->dev, false);
>   
>   	usb_remove_hcd(hcd);
>   	usb_put_hcd(shared_hcd);
> +	xhci->shared_hcd = NULL;
>   	usb_put_hcd(hcd);
>   	xhci_mtk_sch_exit(mtk);
>   	xhci_mtk_clks_disable(mtk);
> 

Could you share details of the NULL pointer dereference, (backtrace).

The USB3 hcd is already removed when xhci->shared_hcd is set to NULL.
We might want to add some checks to make sure we are not using the removed
hcd anymore in that codepath anymore.

-Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
