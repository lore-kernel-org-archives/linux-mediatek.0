Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5106C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQhJ2ie7A+CKtBwvwOsJ1bIqUkffAmxUOIF/7rb0FxQ=; b=UzfmYl4qBYdVky
	WaLH1CRhWzght+c5gtq37KcgPV6uhgq/1St230Wo7iancdhK9OgILHeICUjn05yD1J7jhvvw9Clsd
	IKb2V0nbHCfieNvkp/Dd6qSZVMevu9tfjfLPY+ZkfcwUax9hKi6ssGL1/FZ8g71cvcxyPkP0Dm98h
	UcoSzTICSh5QX0jmJ1WwBZ15J8973kKECzkc1IzJeAPNWCnbT8R42mLGyMcfLstmSqO1YJ/BG0LgL
	XfPvqOx00rloIjORs7vTNmHNsElFlaNc525YUYhwgnEmWMtQcUFmBF5giXmbFIJ4AQ6/3TQR/MKX5
	wxxp1OJcUrTbbaGoa/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrg3f-006z8L-6A; Thu, 19 May 2022 13:19:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfzb-006wzt-Uk; Thu, 19 May 2022 13:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1Qau8N189c6qQ1DvRBrKCoXkXc1SDys4onw+5HcpY5E=; b=fcDupoRAlyaVYJq+I47XWhkzlj
 6WSik0t0jWw6bEJbJ8K6IS8g+pPNRZfPo2b9CE5dH8ULDL9XeXn2X3tPp+9zJRWkQ+UG7xHz2OLlG
 eS8lksWeyKEULSEXCW0T8BNsyBhIl9EHRHZZydwa35qv8lXv8zUnR+8N8gAeMc7B/x47PraXHowS5
 KKh8zkxkGOGv+fZbEqNbzXI2WHm9Ip9xuIK8tp+UGFRzGzIBBHQXpBJyrX+w11iUv7X+QAjTvBaw3
 9pngOvaUDh2w/ptQUfGR3CC8Z//WWDiHBJ10a9Ygo09cBObNZEVeWEQE5+/nhq3lpLbD02+R5KYid
 qtrcc84Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfzT-00CkKT-0P; Thu, 19 May 2022 13:14:55 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B351980E0B; Thu, 19 May 2022 15:14:52 +0200 (CEST)
Date: Thu, 19 May 2022 15:14:52 +0200
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
Subject: Re: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
Message-ID: <20220519131452.GG2578@worktop.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
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

On Thu, May 19, 2022 at 08:53:15PM +0800, Jing-Ting Wu wrote:
> Hi all
> 
> 
> There is a race condition between CPU hotplug off flow and
> __sched_setscheduler(), which will cause hang-up in CPU hotplug off
> flow.

Oooh, you're using core scheduling and the A/B are SMT siblings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
