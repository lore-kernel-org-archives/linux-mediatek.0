Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF49C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlQx7JiUThAJBmvcKuVJ5hwiwisWySSSnzSo5ma2EqI=; b=XGwLMVnnyttcDnyiHTeVKud2cW
	TiJ+WgTWorJFvq7eUBKdG3EfDpSLpI9HQ2V9RGkThyeQsIAiXOe0fHz0vBpmofXwL8fnXYlv0YGlD
	az28nTKsGK6Jn32rkEa9q8ZAwD9q7gmGcr9ubqWmm086QXQZDpCgTE1eIWVNrarflRMDt1ogLrvMq
	afB9DJT8/stsyIr1Itzzu7mXaYvJ9NrKdIyY0mSpQd5WUyGnigVqEb79/UmUfldMVgS8jg4vQUmDV
	P7EMepEvIcHQkBYYnYwgH1pY3kEZL0m7V317oFByqNiuFadJ1gx+8Kfwf/h36+TTAiuz9YgBS7qAi
	Tsoi7NYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6yV-000000065xc-01PX;
	Thu, 23 May 2024 11:51:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6yR-000000065wW-2jFp;
	Thu, 23 May 2024 11:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53AFBCE1396;
	Thu, 23 May 2024 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F859C2BD10;
	Thu, 23 May 2024 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716465064;
	bh=u0YkCFRTcTzKFzBamw33g0wiWbg4CD2Oj29HPPLaiG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j69GnM6lUKEsUvLF6CSUTdJnZUzjyrOfSUiLri50hnx12fMUur5J2bi7ll6TSVuXq
	 v+KPSJ1nwGadce/sXyARB69vMXNmVhEJy62ni9Nqc1+/D2f1fiAzZef+LwDWCgUIWf
	 19ZCntMxQhbtk4FI0wqtRRQe39JmlDVtNGYsizeg=
Date: Thu, 23 May 2024 13:51:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Sasha Levin <sashal@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Pedro Tammela <pctammela@mojatatu.com>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>, Thomas Graf <tgraf@suug.ch>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15 0/2] netlink, fix issues caught by syzbot
Message-ID: <2024052354-cubical-taste-44e8@gregkh>
References: <20240515073644.32503-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515073644.32503-1-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_045107_909501_2D0B0F6D 
X-CRM114-Status: GOOD (  11.66  )
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

On Wed, May 15, 2024 at 03:36:36PM +0800, Yenchia Chen wrote:
> From: "yenchia.chen" <yenchia.chen@mediatek.com>
> 
> Hi,
> 
> We think 5.15.y could pick these commits.
> 
> Below is the mainline commit:
> 
> netlink: annotate lockless accesses to nlk->max_recvmsg_len
> [ Upstream commit a1865f2e7d10dde00d35a2122b38d2e469ae67ed ]
> 
> netlink: annotate data-races around sk->sk_err
> [ Upstream commit d0f95894fda7d4f895b29c1097f92d7fee278cb2 ]
> 
> Eric Dumazet (2):
>   netlink: annotate lockless accesses to nlk->max_recvmsg_len
>   netlink: annotate data-races around sk->sk_err
> 
>  net/netlink/af_netlink.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> -- 
> 2.18.0
> 
> 

All now queued up, thanks.

greg k-h

