Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00232C47420
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 15:30:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8090220789
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 15:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKP/sMM9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fC9bWFoE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WRJ8lzbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8090220789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c7UFlP9XwI//JycV3ZHVpyogvCS4KQUJNNUjMaNthYY=; b=fKP/sMM9BjrPWEaKyXuJTabs1
	ZkaeMeseaZ31xu0FW2lNk4fL9mbirWI0sLI8eEnY2H0jdlO33k0o7EILNRkx2qrA8oAXkwgbYGfi6
	bSg7V6IJc7nvWRMmb3kJdcAJlBUiLy1w3poOQaawYkIeHdThuw21VroZ3iCroe7Qmv1cKXLsT72kG
	03VwaRdqf4uBMDhLErIfxvj3tvn2cgP1iy9K78NsEMM7CO4kmA47KgfZ6HOISBC5C/Jo9cgtctx/a
	bz0ENxALUUF0OXASsx0BEWiFk92RbK61q98rWv+5WCIpYPF1hRlP8SG3Btod43t8SMJqfIP1DbNBx
	E+yOgHsRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNe3C-00069c-GC; Wed, 30 Sep 2020 15:29:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNe36-00066t-AN; Wed, 30 Sep 2020 15:29:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601479781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqZau5xYcLfz7fU6kWPWcUxXzOYMn4YTVPKLqoPQKaY=;
 b=fC9bWFoE1/eG/uG47jmppe9UycpzJfawCIUeh06a6YZbeslJwiHmJp1L5pQFxneWoDVeI2
 b0iFw0DfB4SP31ej0/wjpjX07O7+H7hhTYERNNgNBdM/DJKhLgP3L6tXl1kYwfXtniVwvx
 GCfjWUZsJJjrQxaxfPCRwC4b3RWDYPdDtNYJEsOM6Li9lkZg59Wq30CqCfUXHmXHOKba29
 /ZGOuA8Jun2KFV67EZn5T4R1fWMeNALFR7iEX97fJfH1V+6zjAuv0OGXw1icrd5DpxrUMT
 UysUUPquljDDnILpx2jORVm2BKGZbxH1eqeC/Vlz/O9B8xn82Q1rCc9B1oXfLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601479781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqZau5xYcLfz7fU6kWPWcUxXzOYMn4YTVPKLqoPQKaY=;
 b=WRJ8lzbKXtdFgjF58fjm4nGD/pJNjZ042WFzkiYHsftWabD/dNyRXEBhWXIVTsNMsuG3Q6
 umneCJHc1w51WwCA==
To: Walter Wu <walter-zh.wu@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Elver <elver@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
In-Reply-To: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
Date: Wed, 30 Sep 2020 17:29:40 +0200
Message-ID: <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_112944_456630_6E04C26B 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
> Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> In some of these access/allocation happened in process_one_work(),
> we see the free stack is useless in KASAN report, it doesn't help
> programmers to solve UAF on workqueue. The same may stand for times.
>
> This patchset improves KASAN reports by making them to have workqueue
> queueing stack and timer stack information. It is useful for programmers
> to solve use-after-free or double-free memory issue.
>
> Generic KASAN also records the last two workqueue and timer stacks and
> prints them in KASAN report. It is only suitable for generic KASAN.
>
> [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers

How are these links useful for people who do not have a gurgle account?



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
