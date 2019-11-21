Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610B3C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 12:31:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3277320872
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 12:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aC6BrqUF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3277320872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ytyrGD6h8zfkjdQx8HaiY/WDxuw4ahLI8EmRjG66Yk=; b=aC6BrqUFucKrrR
	Kpabkw0kIHzog38eEPyFwX8wDM26U2BidW0hr7qHBWhkTkj2jBon7rXFRHZpzw01a5LhbfjJldyp6
	VFKo97K0RtKTKNpGmbkvTnruRsyMLgqWoQZlG5F2iaTK59FjlTo2KKpJVZzfBB/jyQJsRFIv4Mlk0
	fPtntsWOaoxu88kvSIsr0bf5T71LwpauHrn28BLjabvWFRcYx/f7aiWp4ysO/6q3WfG+njc88qxOL
	JNTtaKzJu/i3vlt8isLnLj0PKseWw7nnQ3mwehRLbWE2fdJnX4Y1TvZ9JHPUtWhlOasHrKmm+xyAp
	KLEeNgQLKNPlyqZIn9Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXlbv-00041U-Sy; Thu, 21 Nov 2019 12:30:59 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXlbn-0003sd-7d; Thu, 21 Nov 2019 12:30:51 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1FEC030068E;
 Thu, 21 Nov 2019 13:29:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 02224201DD6AF; Thu, 21 Nov 2019 13:30:48 +0100 (CET)
Date: Thu, 21 Nov 2019 13:30:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: YT Chang <yt.chang@mediatek.com>
Subject: Re: [PATCH 1/1] sched: panic, when call schedule with preemption
 disable
Message-ID: <20191121123048.GQ4097@hirez.programming.kicks-ass.net>
References: <1574323985-24193-1-git-send-email-yt.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574323985-24193-1-git-send-email-yt.chang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 04:13:05PM +0800, YT Chang wrote:
> When preemption is disable, call schedule() is incorrect behavior.
> Suggest to panic directly rather than depend on panic_on_warn.

Why!?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
