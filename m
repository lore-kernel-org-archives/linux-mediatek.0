Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE92C11F6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B11361476
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B11361476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd1wc0qBu36MlHuseoI49zXkCIQC7c/nqSffhOCOScQ=; b=z2MOjLxLsB4WzO
	sGHikjunQhE08id9ZrwQAbDKREBmxddCWOO1tPxRLrEqyc6LveiVnHkaSkqtCb/zZYOKrFMx1qWLb
	SUltbGhBwuZoMNcUrCsEQj2WettIDn0yxIPl1XVctkhIC53jW4fWJUTcWqMJYQjWIMXhVnP+Y72Mb
	9f3+th5Q7P/9j1TKsrWy6AR+wh1oW+DXEQ4FpTByBjZR5eJUZI8nTd+EGHk5mMxeaNdAVnei8+J3k
	lIWZWlIAs9bUW71RuH8PsHScB+2J2sLbJMd8QCgSxqimvadMH5Fr2h4BkJSHwDqkH7zzskXP8f0KP
	ekI8eKWlV59EuvS23yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lysZ5-00GcRP-0Y; Thu, 01 Jul 2021 09:00:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lysXM-00GbiU-7d; Thu, 01 Jul 2021 08:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2qqgC+Ulx5UrM01EMJZVrA3rn7EUXuF7xXclSNsscao=; b=hueftNHuJVVsy8VqzYarbH7xZ6
 OVqpjm1YF3YsRXMpBA9jY8na8Pb5Np44UNj+z3NT0Zr8bmiygqxQASHMJ3FJ48PrIY66O2CyW0q+M
 CMHrftyLF+oN2tuFIqWv7plKtDcNuCZzpmq+Tz9JoN43+LT+OBRSNn5LUqidFEUSSTHZVkQHKSf6E
 EFeEonSZHjDebT3OYHCeS+O7pgGaorDRmZ9O49Vv5s02ILgtEPDZ45vP4OJexU8k3uVwBkNxhAmbL
 SItpOa8tzZypbJVt+IDkP+i7Aux7rFjpuM0nvbpqnh60I6xqXpooyqZEhHUk17JXRKHBAxwDd3i/g
 JnAdCGlQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lysWh-006N2B-S9; Thu, 01 Jul 2021 08:58:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 029FA3001DC;
 Thu,  1 Jul 2021 10:58:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D45642041E842; Thu,  1 Jul 2021 10:58:24 +0200 (CEST)
Date: Thu, 1 Jul 2021 10:58:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: hannes@cmpxchg.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, matthias.bgg@gmail.com, minchan@google.com,
 timmurray@google.com, yt.chang@mediatek.com, wenju.xu@mediatek.com,
 jonathan.jmchen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
References: <20210630205151.137001-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630205151.137001-1-surenb@google.com>
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

On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> +	/* cmpxchg should be called even when !force to set poll_scheduled */
> +	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
>  		return;

Why is that a cmpxchg() ?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
