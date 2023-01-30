Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D76C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2SOsdkOz48dHTXiDAODjC4Eh+MwhbJnONZEe1YW0NM=; b=KOG1sW3+wkmZQyUekSjjprBDw6
	28k4AwOEES/HK0xjMEkKxrgv+JBXUvOHhMR9g/LJJoCbLGFzcxot5LtgWt9XsUExaBej8Szvbq4qC
	XTIPo3i1vhe0U4Vz482OLNlW9MXUSyPd8aygD3b7VhamcNbIFWF77ORCVtFcUHdj9BKvdMFPslFE6
	N/X8D+EPekHuguyg/vSpvdxRoq+EG8G1X99NmYLNhNVPobA4Yvnm5hQEhPWQ+G6kyAH7XXP7H8giu
	8c8n+BM6sMUzfAWoaR1HhYqDNtL5I49D8hQaJfaAsctmM3rguU5v9cUSu3vn382t2x5LfbqVSDG3/
	cmA1jo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXGN-004HRd-R3; Mon, 30 Jan 2023 16:44:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXFq-004HQK-JV
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 16:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0813B81260;
	Mon, 30 Jan 2023 16:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2805C433D2;
	Mon, 30 Jan 2023 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675096066;
	bh=MpRxwOorlRNqi9cT3F3n0BN25b601lq2po+QEY2VOdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJzy+jQBBZrIO4R3XUtjRzTPckHuk4fxqmTyS8OWyquU3If0q3g2ab7EP9LAaVsS6
	 PidWsqxtQojYwETN3TDNeUWHkxv/FmygE2fTkQ0ki/CgcyCQeB0qhCNdWmK3Tc9k84
	 oZgxFCaZ+2uFhrk7INNmUO433PNsMBz0P++62MLU=
Date: Mon, 30 Jan 2023 17:27:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JbQsNC90LTQsNGA0L7QstC40Ycg0J3QuNC60LjRgtCwINCY0LPQvtGA0LU=?=
	=?utf-8?B?0LLQuNGH?= <n.zhandarovich@fintech.ru>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Message-ID: <Y9fv/7g4EduQmllt@kroah.com>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com>
 <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
 <Y9fIFirNHNP06e1L@kroah.com>
 <e17c785dbacf4605a726cc939bee6533@fintech.ru>
 <Y9fNs5QWbrJh+yH6@kroah.com>
 <bbd1ce753d8144ee9d4d9da7f3033c68@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbd1ce753d8144ee9d4d9da7f3033c68@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_084338_810913_AA488660 
X-CRM114-Status: GOOD (  17.16  )
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

On Mon, Jan 30, 2023 at 04:13:11PM +0000, Жандарович Никита Игоревич wrote:
> > > > What is the "fault"?
> > >
> > > In 5.10.y "mt7615_init_tx_queues() returns 0 regardless of how final
> > > mt7615_init_tx_queue() performs. If mt7615_init_tx_queue() fails (due
> > > to memory issues, for instance), parent function will still
> > > erroneously return 0."
> > 
> > And how can memory issues actually be triggered in a real system?  Is this a
> > fake problem or something you can validate and verify works properly?
> > 
> > Don't worry about fake issues for stable backports please.
> > 
> > thanks,
> > 
> > greg k-h
> 
> mt7615_init_tx_queue() calls devm_kzalloc() (which can throw -ENOMEM) and mt76_queue_alloc() (which can also fail). It's hard for me to gauge how probable these failures can be. But I feel like at the very least it's a logical sanity check. 

Again, how can those allocations really fail?  Or the queue allocation?
Can you test this?  If not, it's not a real failure that you need to
backport.  Otherwise all of the little tiny "fix up this potential
failure path" patches would need to be backported, and that's just crazy
if they can not be hit in normal operation.

And please line-wrap your emails :(

thanks,

greg k-h

