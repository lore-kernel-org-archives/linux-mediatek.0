Return-Path: <SRS0=Dmy6=IF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBF4C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 16:01:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE26A650E5
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 16:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE26A650E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B3bS+stAoisp5cYlSawAsyxxYloVF5MK3Lejstw5RhU=; b=cQbyLz2DhvjY0CYqfv7ghjO5o
	ztS8Z2UavMZHHPvQBTmeOTvGHXWVmBmCySMH1GCOsYwTe5XC735KVLZJHrRCvkVvzLyHCafmPhjNH
	bNkx3mct+k8+t1k6KEHELFfSnYrTjT4vN9Xpbo+KArwY3m7p8lAnfV4t8WmCpQlNsvWbzpLCg/VWx
	wKH09k1m4w25+z5gl1Ir2KVL179yLF8U2wt6eG45V778/88FVSE4O3h64//DF+7neSSJsk1cmphe3
	NhzBkZTY/+94XUQYRtHG5/7bFwQVz99QbVYZOcvB2TzmOzNam9d2jCaCaDTqEUCvsBMi93M50SCqa
	OLsyr53Bw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvpx-00AqjV-IN; Sun, 07 Mar 2021 16:00:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvpl-00Aqea-3A; Sun, 07 Mar 2021 16:00:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5421A650A0;
 Sun,  7 Mar 2021 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615132841;
 bh=nNt0pGGU/ofH/w83o0mxL+LLmwH6VXk5fV0QcqBwQRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rL9HRj44aSg3k3DeEU5GvPgAptNE450cjqhSUK2IBxODcJXJOPc7oja1T43QY03+m
 tX7q1zeigSb1HPyVwzMpZTrM99FbFNo70jaeRVHHtG6vssQ2mceZDH9VtNBTV5QOuc
 Ghky4a8nLtcwu3cME5/NEhR47dZQCI3FK0f6brnw=
Date: Sun, 7 Mar 2021 17:00:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 15/17] usb: xhci-mtk: support to build xhci-mtk-hcd.ko
Message-ID: <YET4p6rKSynLGEUv@kroah.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-15-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614934975-15188-15-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_160045_519908_FF3EC0DC 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, Mar 05, 2021 at 05:02:53PM +0800, Chunfeng Yun wrote:
> Currently xhci-hcd.ko building depends on USB_XHCI_MTK, this
> is not flexible for some cases. For example:
> USB_XHCI_HCD is y, and USB_XHCI_MTK is m, then we can't
> implement extended functions if only update xhci-mtk.ko
> This patch is used to remove the dependence.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Oh nice, I tried to unwind this once, but did not succeed.

Mathias, any objection to this?  I think this is the only patch in this
series that touches the non-mtk code, want me to just queue it up in my
tree, or are you going to send it to me through your patches?

thanks,
g
reg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
