Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F8C47247
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 00:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA0E2082E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 00:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nr7+RkmT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjnpwkGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA0E2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66J9BzYhu86wyfv8gP/AvhhEWFxj46uBfoLre0grY3w=; b=Nr7+RkmTrjIkjA
	MOuSgvqiG5wTgbd1UPlldgLggZVLgjWrwrFzyFGCtsTMPUA865SaDB8fD7ycWop9v42Jaz43sbbS9
	u/d5lzoOmNgqyY5hIT3/FZ3DPMhYDSEvs1BRedBEbXF2/Max9kM52Q0inn8Ok61B+lrrapbIQkMzS
	xtdOKhhfabriB90gUtKfvQUSrOEi0AjGA6Lui2pEW70pZKno7qyk4AimVFkXbocfYsGzCQs/7SfkL
	Qv01RpuQunQfoqCV7Hq0Cq3a3ODPeEX6183rJJMnwecY/rpl16sK50E4/cwaon6JBsGt7f1lwp6Pv
	Qlse72t02T2eJRVyhshg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWqVu-0003zI-Hk; Fri, 08 May 2020 00:05:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWqVa-0001jn-2h; Fri, 08 May 2020 00:04:55 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B940E2082E;
 Fri,  8 May 2020 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588896292;
 bh=Ge3nz8WZOJFqzpXNiv8nhoHil6SjiIANRuschyeYJ1I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rjnpwkGmtJKw/4mwFZHZOgAKysf0TfYIOxoqLbOdRr0lNDtGxLdWBH+W5B+mjNczy
 hexKcPq4DCCPhnsl/bonhuZdi7xChtTfSjJuuGJRZxTYWiAimDTLfu+a6alnuxYhvw
 +B9mhA6pqBO41LUKlJtfY88v6rq+xxISTZDx+NBc=
Date: Thu, 7 May 2020 17:04:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v2] stacktrace: cleanup inconsistent variable type
Message-Id: <20200507170448.661b1ef6cf8d870bb19e8cc6@linux-foundation.org>
In-Reply-To: <1588731504.7745.3.camel@mtksdccf07>
References: <20200421013511.5960-1-walter-zh.wu@mediatek.com>
 <d2a9f155-f309-0182-73c9-5c02d7014574@acm.org>
 <1588731504.7745.3.camel@mtksdccf07>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_170454_142249_191306C9 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 6 May 2020 10:18:24 +0800 Walter Wu <walter-zh.wu@mediatek.com> wrote:

> On Wed, 2020-04-22 at 18:21 -0700, Bart Van Assche wrote:
> > On 4/20/20 6:35 PM, Walter Wu wrote:
> > > Modify the variable type of 'skip' member of struct stack_trace.
> > > In theory, the 'skip' variable type should be unsigned int.
> > > There are two reasons:
> > > - The 'skip' only has two situation, 1)Positive value, 2)Zero
> > > - The 'skip' of struct stack_trace has inconsistent type with struct
> > >    stack_trace_data, it makes a bit confusion in the relationship between
> > >    struct stack_trace and stack_trace_data.
> > 
> > Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> 
> Hi Andrew,
> 
> Would you know why not to be picked up this patch yet?
> Do I miss somethings?

I'd decided to pass on this because it's so minor.  We inappropriately
use signed types in soooo many places :(

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
