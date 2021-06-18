Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5919C48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 17:15:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8EA613EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 17:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E8EA613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8sh494thgdBazQwH+0+z5GgJfWG5JQs4EmldIAUcns=; b=rH7caBVTMmHhd5
	ABFfeRluU5OGzYs93Pv1jIegEJ272Eb8v44axX3DjnPL7IgEbtHnov49t1T1cpr12feF4jrWnzJcq
	fhH2c/OJKvSAT1yERbm4xgKmMOd4Efjg81AXti8TnkdIPM1Cmj+tBs6tx4fOYMcbW4W2jqRy/OUb4
	eRfOLwbXNrZ+Br8/HgZigyfPnple23Rt93dsMMIoB3wcf36CkCVbB/GNf0wfIXqEjHHYHzn2rrdqh
	HBR2u8rCPwjfkYsiOSJzlfIXCM2BfsHhraEmcd8ZoVxR1hb+dsVBnsxzG8l/4hmH8vvj/rom2EZ3m
	o0wCKQdrajWfPlMi5Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luI5K-00F2uR-5D; Fri, 18 Jun 2021 17:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luI56-00F2sH-9h; Fri, 18 Jun 2021 17:15:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA8541424;
 Fri, 18 Jun 2021 10:14:55 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB7143F70D;
 Fri, 18 Jun 2021 10:14:52 -0700 (PDT)
Date: Fri, 18 Jun 2021 18:14:50 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: YT Chang <yt.chang@mediatek.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>,
 Iurii Zaikin <yzaikin@google.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Turner <pjt@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH 1/1] sched: Add tunable capacity margin for fis_capacity
Message-ID: <20210618171450.c5tgggydukcmap5v@e107158-lin.cambridge.arm.com>
References: <1623855954-6970-1-git-send-email-yt.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623855954-6970-1-git-send-email-yt.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_101500_482282_4D6F212C 
X-CRM114-Status: GOOD (  19.54  )
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

Hi YT Chang

Thanks for the patch.

On 06/16/21 23:05, YT Chang wrote:
> Currently, the margin of cpu frequency raising and cpu overutilized are
> hard-coded as 25% (1280/1024). Make the margin tunable

The way I see cpu overutilized is that we check if we're above the 80% range.

> to control the aggressive for placement and frequency control. Such as
> for power tuning framework could adjust smaller margin to slow down
> frequency raising speed and let task stay in smaller cpu.
> 
> For light loading scenarios, like beach buggy blitz and messaging apps,
> the app threads are moved big core with 25% margin and causing
> unnecessary power.
> With 0% capacity margin (1024/1024), the app threads could be kept in
> little core and deliver better power results without any fps drop.
> 
> capacity margin        0%          10%          20%          30%
>                      current        current       current      current
>                   Fps  (mA)    Fps    (mA)   Fps   (mA)    Fps  (mA)
> Beach buggy blitz  60 198.164  60   203.211  60   209.984  60  213.374
> Yahoo browser      60 232.301 59.97 237.52  59.95 248.213  60  262.809
> 
> Change-Id: Iba48c556ed1b73c9a2699e9e809bc7d9333dc004
> Signed-off-by: YT Chang <yt.chang@mediatek.com>
> ---

We are aware of the cpu overutilized value not being adequate on some modern
platforms. But I haven't considered or seen any issues with the frequency one.
So the latter is an interesting one.

I like your patch, but sadly I can't agree with it too.

The dilemma is that there are several options forward based on what we've seen
vendors do/want:

	1. Modify the margin to be small for high end SoC and larger for lower
	   end ones. Which is what your patch allows.
	2. Some vendors have a per cluster (perf domain) value. So within the
	   same SoC different margins are used for each capacity level.
	3. Some vendors have asymmetric margin. A margin to move up and a
	   different margin to go down.

We're still not sure which approach is the best way forward.

Your patch allows 1, but if it turned out options 2 or 3 are better; the ABI
will make it hard to change.

Have you considered all these options? Do you have any data to help support
1 is enough for the range of platforms you work with at least?

We were considering also whether we can have a smarter logic to automagically
set a better value for the platform, but no concrete suggestions yet.

So while I agree the current margin value of one size fits all is no longer
suitable. But the variation of hardware and the possible approaches we could
take need more careful thinking and consideration before committing to an ABI.

This patch is a good start for this discussion :)


Thanks

--
Qais Yousef

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
