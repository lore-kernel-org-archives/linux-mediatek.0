Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BE4C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 19:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C96C20A8B
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 19:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m1Nc+MIX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gaa05K/B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C96C20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=epoYG/8AekLU3q6g6kPotoXIzcs2FsuhRxEGsufscrE=; b=m1Nc+MIXrdVZE6Yi7iGdV8B9e
	1NcNHos3w2KGamHam0R1HRlcGxu4l/EFK4G2cXIxJRLKFXtGdheVN6GBJoNGeUEMLmsD72FsxcmgW
	lstY/nojFztN0vfaoe+nmXLlQeOrsS+6tPH9EgFzoud6sSy+mzCtsmnEGnZ5Her2lUgJS7BdOUIRs
	toiWs5R4wS/CwUa6B6CIqVm2kE3hMzcS0h7MbbGxhjjeGphPoeIRXlZdIvshivzYXzg00hglcxwox
	S5cCeLLBTG+uiOA1LvQIY+225mNiTeUmzypvK9+E2wNa6HD6Z27swszByyte2xLAde++bhQZ6myrJ
	VdCZD3r5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2fxs-0001mr-RB; Mon, 03 Aug 2020 19:17:40 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2fxp-0001lh-AZ
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 19:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596482255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JlRPcUiCaDRmWVJAxXsR/XyWp+YNVRWRo58Ec1/lUXg=;
 b=Gaa05K/BUJhcmroMdsPLWDt5P91PpAI/1beHl7cit0vBGMVoX9sRwET8LLWCXdHXt66HXD
 zgPZrgEB2QE5tJpUxrG1rbxnr+6L4zRFgdy/+bWh38alrAZ+2PW9bkfI+y3oDaxZaC6t1L
 vwSYZUz/u1a+juh9SDVlEJ/rY9v1NRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-l43cMm2WM0i38uQMayFyhA-1; Mon, 03 Aug 2020 15:17:31 -0400
X-MC-Unique: l43cMm2WM0i38uQMayFyhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B982100AA27;
 Mon,  3 Aug 2020 19:17:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.110])
 by smtp.corp.redhat.com (Postfix) with SMTP id 0C46E19C66;
 Mon,  3 Aug 2020 19:17:26 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Mon,  3 Aug 2020 21:17:29 +0200 (CEST)
Date: Mon, 3 Aug 2020 21:17:25 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "chunlei.wang" <Chunlei.wang@mediatek.com>
Subject: Re: [PATCH] siganl: ignore other signals when doing coredump
Message-ID: <20200803191725.GA2078@redhat.com>
References: <1595487143.29785.9.camel@mbjsdccf07>
 <20200723175126.cf6a660e46c8da26b1293eb4@linux-foundation.org>
 <1596185654.11648.1.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596185654.11648.1.camel@mbjsdccf07>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_151737_421312_117E4843 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: weiwei.zhang@mediatek.com, wsd_upstream@mediatek.com,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/31, chunlei.wang wrote:
>
> Please tell us much more about why you think Linux would benefit from
> this change.  Precisely what operational problems are you seeing with
> the current code?
> =>
>        Sorry for the late reply.
>
>        If coredump is incomplete, R&D can not find root cause through
> coredump.
>  If the issue is seldom, this modification will speed up the process of
> solving the problem.

To be honest, I do not even know what can I say, except that I disagree
with this change. The very idea looks wrong to me.

Granted, SIGKILL can kill the process which does something useful. Say,
dumps a core. So what?

Where does this SIGKILL come from? How often does this happen?

And why do you think the core dumping is special? Say, you try to debug
the buggy application, but a sudden SIGKILL kills the debuggee and you
lose the debugging session. Does this mean that the kernel needs another
patch to protect the process running under gdb from SIGKILL?

I don't think so. Please feel free to resend this patch, but it needs
a very convincing changelog. And please send it to lkml.

Oleg.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
