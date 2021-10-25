Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A220C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 22:24:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E705260E73
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 22:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E705260E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUeZH4kRdaL79J63mET9BShXCNL1o5Gi21bxGo0Nspw=; b=HIyenR0T/Rk/gD
	ln2BZ8cfriDmvXsc4+araX66iHamyYD5irtx9E82lTkCObPlN0l6AFi+j/u2DkXJkE/bmsNMl1YxN
	xZVNleEmIUjJAVWAD6pfXZweVkwZBjeqBTeDpr8R5LeiLN8CTu5Tpgihb+X4HmCVGfEj1TenEonJv
	tMxW31PfHP2S/LGV793Odf8nl2AS4JCLTHbmCCfZAdh81zELNZw8N2c8XR5BuiiMSFv3lN7x/e/pv
	68ZIrI9nsVkMJkU10WQ4LyGvHp2o7ZL45BD+4OdSKL6znveULENlQiUcR1P4n1nJl8o1aDcyFH8PF
	np2vraXbz+in/iqyKG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf8OU-000DV2-Td; Mon, 25 Oct 2021 22:24:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf8OH-000DS9-Jl; Mon, 25 Oct 2021 22:24:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635200660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMXAAuXRBH5hTLgoH2Pckn31kUaVMFAbQlGvzQKFivU=;
 b=fPWMwba6U2R0TeKCaLJ3YIi3w4e4tkYTaWJUmmNSSfnCvO2TK8/WffCi6NAb1y1p34s2X0
 jPbruyW1xYk3tCfp3CAMdnqNdafQ25DnW8bVStIpat2/GEzA0X8nW1raM3nIJ/WTXDWmBZ
 0REDrzeCk/5mwSOxQHx/ckXd7/csus0g5R+se1rVnXRUOkKH2Pm5QMrGLZh5WcmUfWGFAN
 v6/H6Jt0aLeF8dqZMiD/CACoEg/XvefMERVTCcrI7cRhFM3cv+44RCoOVJhcua51o8qyNp
 c4os+BtRqed5FEZA0x2eYfPk2K6HhMy+bU60E/1lJv64gTHSMxYgEPlMwe9BgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635200660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMXAAuXRBH5hTLgoH2Pckn31kUaVMFAbQlGvzQKFivU=;
 b=1wsCbu8hnal0BRqaxpzAlZtqekoGqffQJKy5xNbtHtBaBwUhJqYswhHFqI3cK4Y0i48ycB
 L3lK/mKPau7Ph4AQ==
To: Petr Mladek <pmladek@suse.com>, "chunlei.wang" <Chunlei.wang@mediatek.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] printk: ringbuffer: Improve prb_next_seq() performance
In-Reply-To: <87o87c92to.fsf@jogness.linutronix.de>
References: <1587709294.9792.5.camel@mbjsdccf07>
 <20200424070219.GA543@jagdpanzerIV.localdomain>
 <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
 <YXaufehhi8QVCnds@alley> <YXavL+XxgAPbtJQf@alley>
 <87o87c92to.fsf@jogness.linutronix.de>
Date: Tue, 26 Oct 2021 00:30:20 +0206
Message-ID: <87lf2g920b.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_152425_822904_2BA64BAF 
X-CRM114-Status: GOOD (  17.61  )
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

On 2021-10-26, John Ogness <john.ogness@linutronix.de> wrote:
> If prb_last_finalized_seq() was successful (which can also be 0 on
> success) then there is no point reading that record. We already know
> that it must be higher.
>
> I suggest implementing everything within prb_next_seq() instead of
> adding the helper function prb_last_finalized_seq(). IMHO this cleanly
> handles the case of a failed read for the last finalized id and avoids
> an unnecessary descriptor read.
>
> u64 prb_next_seq(struct printk_ringbuffer *rb)
> {
> 	struct prb_desc_ring *desc_ring = &rb->desc_ring;
> 	enum desc_state d_state;
> 	unsigned long id;
> 	u64 seq;
>
> 	/* Check if the cached @id still points to a valid @seq. */
> 	id = atomic_long_read(&desc_ring->last_finalized_id);
> 	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);
>
> 	if (d_state == desc_finalized || d_state == desc_reusable) {
> 		/* Begin searching after the last finalized record. */
> 		seq++;

I just realized that this doesn't work for the case when the ringbuffer
is empty (due to hack#2 of the bootstrapping). That would need to be
handled here. Something like:

 		/*
 		 * Begin searching after the last finalized record.
 		 * (On 0, the search must begin at 0 because of hack#2
 		 * of the bootstrapping phase it is not known if a
 		 * record at index 0 exists.)
 		 */
 		if (seq != 0)
 			seq++;

> 	} else {
> 		/*
> 		 * The information about the last finalized sequence number
> 		 * has gone. It should happen only when there is a flood of
> 		 * new messages and the ringbuffer is rapidly recycled.
> 		 * Give up and start from the beginning.
> 		 */
> 		seq = 0;
> 	}
>
> 	/*
> 	 * The information about the last finalized @seq might be inaccurate.
> 	 * Search forward to find the current one.
> 	 */
> 	while (_prb_read_valid(rb, &seq, NULL, NULL))
> 		seq++;
>
> 	return seq;
> }

John Ogness

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
