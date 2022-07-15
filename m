Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11883C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUs+Fa77krOyO5S4vACFreFi4W0sYUD0E2jG/FaLPJ0=; b=o57DZUJSSCZT/mBfBV9ODfP5se
	mahyJ5wUZKtzVkz1gXMq3sWarOnVN0GZhH3J6UHHsVLc2g8V/JyEfbGdL1YFEfs59xB3NYkub7rEJ
	ir4FG35P40KwNHUex/+mW+mWuvyNRd++O3VHfVFeaDJPSMiG2PhB3kxLpPgyeVWV2coq1AqJKJuL0
	21EaFbBJeqRtfOKbp+7siS7cN1hQidBd7c2b/+u1tS39pF1s7jvf8Pmil9mqg/kYH+YvM3HisVWuJ
	tFUX1WnJmGSFJpMiEi/jSvVJD5CHEORcVM5Dt14rcWPFuPUMFg7MwAyb11lRuDJd0d/unWoN4zCeA
	fKHaa73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCM5H-007Z7I-3d; Fri, 15 Jul 2022 14:14:23 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCM55-007Z0s-Tu; Fri, 15 Jul 2022 14:14:13 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EA2735C00ED;
	Fri, 15 Jul 2022 10:14:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 15 Jul 2022 10:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1657894447; x=1657980847; bh=xUs+Fa77kr
	OyO5S4vACFreFi4W0sYUD0E2jG/FaLPJ0=; b=uaewZsONjI/FGiYO1CmrPp94pQ
	+EbTpYs0zltsiN2zMcbuHKqz+tMuJBG+Sfyoi+Aqaea1aUVFy353BG9zI0sp+lPQ
	d4ikMUtESrDAACgDP8/Mwa0TB18rkhZyhHvR8tHBlnCeadx80VWnpbJ9ChQY4oZx
	5IDXfBc9IufgaZsEr80vvyqBgtHfEuRuL87trpnzs/jzyZRdD0gpNll6V2t7XNac
	0+ybP8HVbyc9Q/xc/9+WymO1XojBSD+/gziOUM/S1Vo3J7bLVaJRD8il3c3BLYPr
	ui9ozAf8Bg8fSr/ZmSCltcx2Fy5vTF50KUYT/+Np7PzNSO1yxuJlBXKIZQXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657894447; x=1657980847; bh=xUs+Fa77krOyO5S4vACFreFi4W0s
	YUD0E2jG/FaLPJ0=; b=SNTD2mKFMG7hVD/tArK44XjJLKLmu4pB0SPLWpq46sWe
	xuTJBQp/aMsPpt/b+0ZAQEGh+1j/d+mGrvkNWDtJYlHim4UJSXAHP/wAhtFIfmiX
	Fu8NoCYXo3mq/eywmwzNuNn44Q8c37zpLSxI7ktB2V0gz4819KN69EwQFuUNNNi+
	3JDTxUeruv+F9+yU892LZslG2HkThCroJktB5kAmjKGtwq1NJYE9rAG1R9mXucU2
	DMj/r+Q8p08ZWN/STNeSgyogRekKO1/LKNZQ5A4TbTLzU7arSL7HqXr+L3IMnw10
	KpEjSsePRapzvA4eHB0QuiyG3tgGCzAsKvN21FH3qg==
X-ME-Sender: <xms:LnbRYu6JK8A7QOtt4SbNnQ449ycSfQ-JE4mnwika5sFRRGpmZ3ndbA>
    <xme:LnbRYn6q08OotmzFw85NojQZ2m5YZBrs6LSjBHegrMScM4FptF699GdBiQcCqE4xW
    R873XoyMPHtng>
X-ME-Received: <xmr:LnbRYtcj1fNhVrkPq-fKecq3nK8fQ7RAm0DWiSsTMrCjip7kqTqMCjBpLuSmWUljeQSpc3TWJt-OM_17kQJezGwSFcfy-lua>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgeehue
    ehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeelvedttddvnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:LnbRYrLYChHAFVJRn5QfggQl0gIp_TOWK68oBJDa1Y4UMJKfYfVELw>
    <xmx:LnbRYiL0qVztBl62gRF6IhfIHg8tDmlBEc8UPnVlHzdLXyy5CVwEgg>
    <xmx:LnbRYswa8jHVHu00hk_UZQ7a2SMFNuB-8zFP31uv4XaGkDwV1emNJA>
    <xmx:L3bRYhUmyk13avp4LuEqBpwv2OrsMg-Hv7rezY9IfN7Ze7iviscOGw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 10:14:05 -0400 (EDT)
Date: Fri, 15 Jul 2022 16:14:01 +0200
From: Greg KH <greg@kroah.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.4] sched/rt: Disable RT_RUNTIME_SHARE by default
Message-ID: <YtF2KVJkAnUlx5li@kroah.com>
References: <20220714073055.15049-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714073055.15049-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_071412_341078_0AC47EA5 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, Jul 14, 2022 at 03:30:52PM +0800, Mark-PK Tsai wrote:
> From: Daniel Bristot de Oliveira <bristot@redhat.com>
> 
> commit 2586af1ac187f6b3a50930a4e33497074e81762d upstream.
> 
> The RT_RUNTIME_SHARE sched feature enables the sharing of rt_runtime
> between CPUs, allowing a CPU to run a real-time task up to 100% of the
> time while leaving more space for non-real-time tasks to run on the CPU
> that lend rt_runtime.
> 
> The problem is that a CPU can easily borrow enough rt_runtime to allow
> a spinning rt-task to run forever, starving per-cpu tasks like kworkers,
> which are non-real-time by design.
> 
> This patch disables RT_RUNTIME_SHARE by default, avoiding this problem.
> The feature will still be present for users that want to enable it,
> though.
> 
> Signed-off-by: Daniel Bristot de Oliveira <bristot@redhat.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Wei Wang <wvw@google.com>
> Link: https://lkml.kernel.org/r/b776ab46817e3db5d8ef79175fa0d71073c051c7.1600697903.git.bristot@redhat.com
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
>  kernel/sched/features.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Now queued up, thanks.

greg k-h

