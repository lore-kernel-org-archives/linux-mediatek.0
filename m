Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F503C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:29:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4C06142A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4C06142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TYxhtVid/5JxQSkMn9WBKXXEjYyC3W/XX9V3URkIp+A=; b=W24zABtSaJTuUUn7+66Pn5KPN
	Efw42doltiZ34yP2BPC+EIZ5hHpQs9bqTyXklOJcz3svCbysu2nYc7reBUNSyBS2H9JNYkvIdwiJ6
	dL3vcyqnXkmpyGxTG7LE3qYgbCwVQ5h3W3wybgKRbJdUSLoquoUzIqUb1OMfrqKSlSfx9RRpMiQ+w
	KhmwL+K8D0RKFTddauVHsFFREdhaeG5FTrFTwpCuAJZbpWTx8Np8TG60LzadeM1kJbWBBFkuiPVB8
	9A3rnjlAQDVB30omJSeHM78s31mkgMW7tUd6tDwx+s78s1GuGH77suwdf3u93cs/LwDPCSUkT9BHS
	miRbhfw/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNag-007QjM-PU; Fri, 30 Apr 2021 07:29:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNaS-007Qhx-Rv; Fri, 30 Apr 2021 07:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IgK3ze1LZCQFzkp0GEBFB8++Nwq+njhHwBa/cbmTwkk=; b=a5ItKrPr3y3xpDAVlFOxjmgHkr
 AOdDPNtiCF/QNIcT4jWNUA2y+fxqKdMU1PrxIKzUsXbvMj/ykKxjQZx2CQYqlpTg1agPN2+MOsLzc
 aPlFoR4FXENhFO0xDRsJBZEKVIPdsjNzI/DX4eisxhBFbMLtKxDoSNC6O5rn9gYFG/fw4Rm55Udd7
 BNHxO0SGIK/eDOmAzixLeLSL8GeTHF7O6j6Um7+aFFekfOqN1LsCoqaIiPjD/S9ht50ifHv5ssycT
 8sqTXUNc7EugnhZUqVgokHqjzMM+6coGkyKlpEH87Q6K8HuIYRDq4ktCnFlxPlwVP3hhah0juLWiX
 uTeQ4GYw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNaQ-001CPM-5Q; Fri, 30 Apr 2021 07:29:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B005613B3;
 Fri, 30 Apr 2021 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619767757;
 bh=UOwbjp9n6THAwLNXnYFCjvVARM6laoU+YRJMD42KQK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gU4BEDg0/+ToTZ2RLKPtxpLCkg1nhxGnQ8RspU3df5YPn62XPsoMgFcKABoGFTnx7
 YUIfcIP6MgesZP9FsgkR7YT08dqiAwb8Cv2LhNv2B1USKPFknp/7VsE5Sy+yKcDRVx
 QJFIR5QVt7Lu3Aa5x8NalJDFND8ufOJeLUfFHgdk=
Date: Fri, 30 Apr 2021 09:29:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 1/3] usb: xhci-mtk: use bitfield instead of bool
Message-ID: <YIuxy9OtlNzq7zwM@kroah.com>
References: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_002918_261305_BC158F34 
X-CRM114-Status: GOOD (  16.32  )
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

On Fri, Apr 30, 2021 at 03:15:30PM +0800, Chunfeng Yun wrote:
> Use bitfield instead of bool in struct

That says what you did, but not why you did it.

Why?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c | 2 --
>  drivers/usb/host/xhci-mtk.h | 8 ++++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b2058b3bc834..2548976bcf05 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  			goto put_usb2_hcd;
>  		}
>  		mtk->has_ippc = true;
> -	} else {
> -		mtk->has_ippc = false;

Why did you remove this chunk?  That is not described in the changelog
at all.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
