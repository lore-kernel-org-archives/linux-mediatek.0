Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2972C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujkK/Q/jIm3LCnFEVGhVb36kM5CzRWlncGOeu0pZR1g=; b=a7NlKOVdky3M3p
	HXaas/nAlhlQ04EPWKzk0ca4PQ0PwFjydo9kjNXu2Mn19xwe379V/LQQKmBo6y3MsW4hv+xyxMnLh
	JlhG3xbobL5TeOSGrR/PaVhhZQoFTRuQktL2eUoxECUEETPXY3q1KgipCmqKzYAyXBLH8DgFuQYEy
	Udj3RVSXMq0+Cfoup5f4nA/Ah7WWKjIwX2FKzU5kEVU9bHyMryKykgz+15caG+S+DJoP2l78HIN5h
	I1pMRyPduupAWy8svnNxWbUP+r5izdBqo59iFRl7sWasTpAm3t+uWVIot5M1RuCTVnGRAi5aZIAIb
	rmA20cs59+PHoX77Xb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyg0V-009ZGX-Jy; Tue, 07 Jun 2022 20:40:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyg0L-009ZFf-Rs; Tue, 07 Jun 2022 20:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hLlh5dd23gtFll790mlFzAVHOw25knLJBnmeD7lrxUY=; b=GE7Iug5mVImj8mlk3hSUF91wFS
	vLKslCkf/OU6VKAvNogPSPeTGQmjgDl51K+NokVtQAV8vBaQ6Y2dr8RmLLzPf6VKFX8/IYAoHo/1a
	yHfsPma80fVN1Z9R9UNFwhUD8KzZW921cvXnNqBSATTWF1gn+FoU5+RCpUwpGpFnEUf+K/sbFrVdC
	/9Nqlv9LtUjJ4XsCkhOk5hYrpl4WTYfMqRRl1b3GRtjCl6Ooo9zOxZ/rVgz89M/GjvWp/XBkfNdFy
	K6maMpCGIxSHyJ0XhC2HWHF5pma39N2uktSXI2ZjT+zUnEN6Xcy+Edn69pegghdQZbYd4BQpRAiz6
	hzfC+kdw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyg0D-005pII-8e; Tue, 07 Jun 2022 20:40:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6621F302AC0;
	Tue,  7 Jun 2022 22:40:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2FD6B20832694; Tue,  7 Jun 2022 22:40:36 +0200 (CEST)
Date: Tue, 7 Jun 2022 22:40:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, tglx@linutronix.de,
	wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
	"chris.redpath@arm.com" <chris.redpath@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Donnefort <vdonnefort@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [SPAM]Re: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
Message-ID: <Yp+3xFMrypvHcLua@hirez.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
 <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
 <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
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

On Fri, Jun 03, 2022 at 12:15:51AM +0800, Jing-Ting Wu wrote:
> Hi Peter
> 
> 
> > > > How easy can you reproduce; does the below hack make it better?
> 
> The patch is helpful to the syndrome, passed stability test over 10
> days so far. (as-is: < 48 hours failed)

Excellent, let me go write a Changelog for it, or something.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
