Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12106CCA485
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYJpuuFDMZ+mKVVxDWKrkItmYlrwaPyp/qkw0Q5Bhzk=; b=nDEkW0FXxtT8fV
	grpATquUWtXtQVKB5t94j7/duJyhdvTrKVNaxqqGH7WTfABMGH1bPoJh0rs+6DB5eL1vbYt/1IHQT
	4VuO+i+u9mM68yGN6Vhn93VBpnTMZe+0oCwYeSpXqbfo6foT58s7yvMABlcY/ihiIoJk/h2XWnFv+
	x8KVU5zT/xnu/EUSujv4l4JaFdYmncIvJEuXcqfiaZ3MaM060jqOTndo+ChWDnuB4DylLxb0d5btn
	n2tjHSs57ohbxLP0OfTgkjWtMM8VrGDImOFFmu7rcf74i4oSpk7iMmZrNl6NHSGy7bLse3//0dAHW
	WkQkY2dVYehGoSVWK74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyx14-00DmxT-Gl; Wed, 08 Jun 2022 14:50:38 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywz2-00DlST-NJ; Wed, 08 Jun 2022 14:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ynbcduYnQPY1qe6pk+2Qg8JWumGJLJPqMue4O90LXI0=; b=jB1VxiGeoYt00J+l8QE28FUOAT
	PUeMJyGrq5ZSnl2cPYZASbFJD41AI4UNiG+o02PHBTAUgcyLWPOtvAi861AiAPR6cXPP8ZjXbhEOt
	9gToGxQ/9GP3GRA3Mwy0sOB64PPNH2DKVgSqyDvDtBCEVpJmXHiI/iNLuKbo0DCYEn1Wiww/ooOds
	SasUPwrulfvzy6Chtw/LZqL0c/Yuva8TWhIUmzPB3sR224IsDhd5DPrBh3uxdkBc0unReTgNZ90X8
	UipU4vSRR7H2LqOQiINU8ihzktxxrrAvbsn5mc0hjy74k4ds4FrO1K2hzuMwCJ6xaxuqNLMta0dn1
	mZzfBxrw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywyy-0067Hv-U7; Wed, 08 Jun 2022 14:48:29 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7C75B302F3F;
	Wed,  8 Jun 2022 16:48:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6711C20967F25; Wed,  8 Jun 2022 16:48:28 +0200 (CEST)
Date: Wed, 8 Jun 2022 16:48:28 +0200
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
Subject: Re: [PATCH] sched: Fix balance_push() vs __sched_setscheduler()
Message-ID: <YqC2vHJ3BLN0XSMz@hirez.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
 <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
 <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
 <Yp+3xFMrypvHcLua@hirez.programming.kicks-ass.net>
 <Yp/Frp7BMp9E5dSp@hirez.programming.kicks-ass.net>
 <7e49e2b73aae471514f277d89bc925da269c89d6.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e49e2b73aae471514f277d89bc925da269c89d6.camel@mediatek.com>
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

On Wed, Jun 08, 2022 at 10:16:43PM +0800, Jing-Ting Wu wrote:
> > +	/*
> > +	 * Must not take balance_push_callback off the list when
> > +	 * splace_balance_callbac() and balance_callbacks() are not
> 
> 
> Should we change splace_balance_callbac() to splice_balance_callbacks()
> at here?

Pff, typing is so hard.. :-)

I'll also go find me a Fixes tag I suppose.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
