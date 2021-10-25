Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B85C60F46
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B85C60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODO/mq9UaB8ALob/gHXf12rK02Yu217E6WVKY1y7EK8=; b=Ym0UxggNOGD5Zv
	Y3eVsy2SSH3za9fZkl2W4z/M3SqTCmeJ3tFcPKMshl1mg43ilFL+iv/ZNCP+5kzEWyNdQLkkahQ1c
	l3zOpgUQQOvrUQ8rwrZJtbL5WgG0kDmfT6Q3utVfmiawSfFVS0KwFqqL5zsY0BBble511etKU7Ap3
	uPllbneksg92ctQq0MmmdgFKZp1JG6LaevbyKBFV/rtUmINNtS8Ywjo13S3P8fzwWjEl5llMIBdos
	KTOBezIPMFwCLe1tkTE3mPIpxwgqLVoLrsxa0Kx1JMZ1igX8ktiGg5NYBvBXhlctAz3ebvy2MhzMZ
	EY8I3yZhC8rexZ56MmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezsA-00GVVB-2A; Mon, 25 Oct 2021 13:18:42 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezry-00GVUJ-K0; Mon, 25 Oct 2021 13:18:32 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3ADDB218EF;
 Mon, 25 Oct 2021 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1635167906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E4GZ8lwj0AJYJXN85q+80VUMNpUxuTuCZPkxG+4A/rU=;
 b=a0adzd01RyHm2PWIZX6raGRj+Lrnud1sYTgAiDza1DOigrtlfDoVm+zB2Oicl9EXV3Jzr1
 Nsrrjhc8/sWJ8AXxWGRpfn3xiy3Gajwt3fdZHJjDXxGEZ7XUbbyU+zQeUhvTZlx9PqvWXw
 zKo9MeJV/dn52cGdZzKKtJx3ucaICRw=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1D848A3B8F;
 Mon, 25 Oct 2021 13:18:26 +0000 (UTC)
Date: Mon, 25 Oct 2021 15:18:25 +0200
From: Petr Mladek <pmladek@suse.com>
To: "chunlei.wang" <Chunlei.wang@mediatek.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] Fix prb_next_seq() performance issue
Message-ID: <YXaufehhi8QVCnds@alley>
References: <1587709294.9792.5.camel@mbjsdccf07>
 <20200424070219.GA543@jagdpanzerIV.localdomain>
 <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_061830_851667_1870C31B 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon 2021-10-25 13:51:07, chunlei.wang wrote:
> 
> Subject: [PATCH] Fix prb_next_seq() performance issue.
> 
> prb_next_seq() function have a performance issue, in bad case it will
> check all the seqs. If log buffer is 256K, the number of while loop
> is 8K, 512K is 16K, 2M is 64K, it will cause performance issue.
> we have a process use do_syslog poll&read method to read kernel log,
> sometime the cpu loading is 50%. So we add old_seq to reduce the
> loop time. It only check new log times.

The patch looks good and probably helps in the described use-case.

But the search might still be quite slow because @clear_seq or
@sysrq_seq might be far behind the last_seq.

I am going to send alternative patch that stores @id of the last
finalized message. It starts the search from there. All the tricks
will be hidden in the ring buffer code, so that it will be
easier to use. Also it should be more reliable.

Best Regards,
Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
