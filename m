Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8493C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5xz1mpLLp0Q3nfC4uT/e4bvG501XPL6TyTs8e6lytE=; b=eIcm7xfepv0blRBftefnyp7/99
	W/ekCdyNDSKRMWPm9J4rBHTGSaXNkRTEt+TtTO23yuyC26YB5L3h1wk1Qsg1lDhyUYYo598lxdm01
	MRvHdmWY6ivgsRnyQ6B2T2xxjBdC4qnVbkC037ciw3btc6Th8vLzwhyrYp9HcqxYAidb52zCnKxFq
	CD/DQC8Tsy0CujzQVo4aeNuIT0YrYq2vx4Xyi0CjLedj2EKPKmLgrJJrZibah3pRhl8vEsUvLBi94
	HsCtcq82GC/ysspBNuoVBqp4lzO+/lDKZwS70TO1DfR4//3Q8laphsPFR2PkbqSosr7tXeXuNrrpL
	1VSNTqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVzN-0040pH-BO; Mon, 30 Jan 2023 15:22:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVyw-0040nz-Nw
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 15:22:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB0506117B;
	Mon, 30 Jan 2023 15:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B30C433EF;
	Mon, 30 Jan 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675091697;
	bh=a90xOxXdB9OfE6RDvIPeW0/Rs9qLjfMK4/iU5SQsr+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qhg7Gq0GRWzDG5WdtbKlYpHeurP+ox7s6RY3ZxVqgYy4MD+SlfNvlTqMud9BvVmgn
	 toS83V+xCfsTDkxn6G+XbNfr+xoGIos68x1ytoBWb742IgNud/mWDZybq2qAo8pU5w
	 j94Ed+1zOKFp+EUvby24Iig8Cp8L9HtfPoscQqn4=
Date: Mon, 30 Jan 2023 15:01:23 +0100
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
Message-ID: <Y9fNs5QWbrJh+yH6@kroah.com>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com>
 <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
 <Y9fIFirNHNP06e1L@kroah.com>
 <e17c785dbacf4605a726cc939bee6533@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e17c785dbacf4605a726cc939bee6533@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_072206_835744_4B84C54D 
X-CRM114-Status: GOOD (  18.68  )
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

On Mon, Jan 30, 2023 at 01:48:24PM +0000, Жандарович Никита Игоревич wrote:
> > On Mon, Jan 30, 2023 at 01:27:26PM +0000, Жандарович Никита Игоревич
> > wrote:
> > > > What is the git commit id of this upstream?
> > > >
> > > > And I can't apply this as-is for the obvious reason it would mess up
> > > > the changelog, how did you create this?
> > > >
> > > > confused,
> > > >
> > > > greg k-h
> > >
> > > Commit in question is b671da33d1c5973f90f098ff66a91953691df582
> > > upstream. I wasn't certain it makes sense to backport the whole patch
> > > as only a small portion of it pertains to the fault at question.
> > 
> > What is the "fault"?
> 
> In 5.10.y "mt7615_init_tx_queues() returns 0 regardless of how final
> mt7615_init_tx_queue() performs. If mt7615_init_tx_queue() fails (due to
> memory issues, for instance), parent function will still erroneously
> return 0."

And how can memory issues actually be triggered in a real system?  Is
this a fake problem or something you can validate and verify works
properly?

Don't worry about fake issues for stable backports please.

thanks,

greg k-h

