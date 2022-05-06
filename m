Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FD6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNKzV6OHo2VA7Rmb6dxgFLoRt2vytKpVf6xi/sY76oI=; b=XJ9hnj5ga34kVI
	ou6l/pzvIujoowdjOv289laIsCKAJhyftyAP2d8/QlOVzbLBqPIwDg9bvQRVmC2YDnzLKgc2zloAC
	FTJyFar3LCRF7wiab4055avu/sucurnIfmtPchB9fDl0485y6atVX5PveFp1PE+3DvrTLCwQGBm9X
	V4qq/oT5Xs1DAS1hs7G+zy+SDaQ72JMduNOn4rADwUE4q5XLCy02ARYoPZCR6rF+BedSWLx7fl/IF
	w4LGWhrOVhtDTdjI3kbL7sihFO7QeajyoH3qbmyTeZFHNsrwFK/WgH2az1Yk/DQUbkmCB0XvGLmWR
	WfSX4O0aKqa1aG8lFEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmshS-001uiv-Au; Fri, 06 May 2022 07:48:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmsgr-001uXN-ND; Fri, 06 May 2022 07:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dqV06l9hyml70u6UYDDgGXk07kcMwhP5UCiNm6H86Lc=; b=gv7CEenGPb4KIXLZVg3FkA2C+9
 G+MPvDn3sOs+kfvZs3KIgb7lVKdSejpQB+a6LWpFu1wk1Ni47tYFOuUfyH0vQExHg02D0KznoKwqc
 QSHHe489/+scSHH4fS286+Y87iA6vnp0e46TNIZdJeMTCTXA1Iay3qCwQE6s+qywPS4/Rzf+Bv0Xu
 3CfWg6zxA5XECoQUW9lpYV+xx3wAD0J8vxur5YGXQjRv0j5EfrZPoGiQSvD5Q0JKMcvii/Iao9axd
 7nkXZ43nRWZRYz+9D0rE9QPvJvzbk6WkY4wSdCAaUfVFiCoc7r0AokQvmkVB6w0jrapu+WuUh5phu
 NtfxX4Tg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmsgk-00Bbr2-Ec; Fri, 06 May 2022 07:47:47 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 64582980E75; Fri,  6 May 2022 09:47:44 +0200 (CEST)
Date: Fri, 6 May 2022 09:47:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: tglx@linutronix.de, valentin.schneider@arm.com, bristot@redhat.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
 Chris.Redpath@arm.com
Subject: Re: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
Message-ID: <20220506074744.GH2501@worktop.programming.kicks-ass.net>
References: <6013fb81cdb18892b75c796ab0e6756ee0e9cf71.camel@mediatek.com>
 <a34049745934652483e3958e0a030a45b6fcfb40.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a34049745934652483e3958e0a030a45b6fcfb40.camel@mediatek.com>
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

On Fri, May 06, 2022 at 12:19:28PM +0800, Jing-Ting Wu wrote:
> Hi all
> Add Chris for status sync.

Please try another posting, that's eminently unreadable garbage due to
line wrapping.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
