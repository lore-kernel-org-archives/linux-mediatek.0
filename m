Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8FAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54D16101D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B54D16101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPnfTKfM4soQ0wsTkkufN8jFXCSxchCuTgumnx95AO8=; b=YTZJvQtPpQQjhY
	k50hGrOihcRS4fK4BcxQyQluG51Pp4JmCzjcT07qjpIscHo0rmWlltp7Tolff0NrxYlx3XNgQ70fA
	/IdAN3rPM4AQlloKrKgqgpWvyr+A5MvsVTgJjjmd4NKUjEyr/KUWmKpcga1bUeI/dcAtC5oGo59nq
	ea0rHbH8JJZOoJZyhMXHpihrRkuJglGwdas5d9WUJMKdeARhMBh5t2Pc7FFeTqfdvGBxxgzQWYomz
	MqbXhNOBCjVf2ye7dGdeum+LTpDkACIwS+dEEa+n0HaAhuuuers5j9krMya8z2GGS32b7rDdx8y7Q
	D/mWOJ6nrFWuwyBUnjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD1KB-00HYd6-TE; Mon, 09 Aug 2021 09:11:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD1Jx-00HYYF-FG; Mon, 09 Aug 2021 09:11:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A562D6101D;
 Mon,  9 Aug 2021 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628500305;
 bh=UCLknj9tc8LczjOHUUN+VpDgDoLql2fB1/oOaHk0U18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AAfCz0PGiIhXhwGWCYjbYcGQe5P9XYiS7XrTSkAINzG3Tv8LOJJSOxhTDE81G7Oty
 42Dx+ZcLlxZWtIEOFGroZlWZAAN2A/TVkEM1uRAy8Va3jmvOgXAp+p9uqyjpqBMF3l
 BP/vLH9aUsg9j2tKycFfDaoEFQG1CDZnFQ8hGSVk=
Date: Mon, 9 Aug 2021 11:11:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ikjoon Jang <ikjn@chromium.org>
Cc: linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
Message-ID: <YRDxTodNNqtnpPpn@kroah.com>
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_021145_570846_82171E81 
X-CRM114-Status: GOOD (  10.83  )
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

On Mon, Aug 09, 2021 at 04:59:29PM +0800, Ikjoon Jang wrote:
> xhci-mtk has 64 slots for periodic bandwidth calculations and each
> slot represents byte budgets on a microframe. When an endpoint's
> allocation sits on the boundary of the table, byte budgets' slot
> should be rolled over but the current implementation doesn't.
> 
> This patch applies a 6 bits mask to the microframe index to handle
> its rollover 64 slots and prevent out-of-bounds array access.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
>  drivers/usb/host/xhci-mtk-sch.c | 79 +++++++++------------------------
>  drivers/usb/host/xhci-mtk.h     |  1 +
>  2 files changed, 23 insertions(+), 57 deletions(-)

Why is this "RFC"?  What needs to be addressed in this change before it
can be accepted?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
