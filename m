Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4651C4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 05:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F202072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 05:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjkhulKt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="EZIUuPiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F202072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCKj9W1X+M+Y9z1ifdBOiAIB2BbH/0fXtz4wJrFhPCo=; b=DjkhulKtXRJSv7
	Bfo4ecgSR36AFz81fwEi232dMcVAG9JA7SviqBtSxHTdWBCmav0sSwnSBOnQpt8It1m32yFXkJcMf
	dZUAQLtyYcTxo2XZ93bpQyR6OJQFKyWNe6MATWrN1F07YKCjc/+/V7voRZZlO1syVOpfw3a2omjNG
	CeXromh6E2iR0Sn6c3OV8xg5Et5QZOsPtxWvir4tUfApg3iRXmDlDoTp9zCSQFUBGbfmh1FSfV9cb
	rYflgB1dbLCR4Ao44CZpcewOyXnLN/Gs7Ax3fj1jEU5GU+sTYyY3ud8xBsrfdytNDyHj1nDKywoCC
	4vQZO26KZXDP84NZttJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFAEl-0001on-39; Fri, 20 Mar 2020 05:30:27 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFAEd-0001iE-90
 for linux-mediatek@lists.infradead.org; Fri, 20 Mar 2020 05:30:20 +0000
Received: by mail-oi1-x242.google.com with SMTP id j5so5355401oij.1
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2020 22:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+thAp6yyX7UKE9dtUxDENsQxMtVNf3sefwYHyrkPjH0=;
 b=EZIUuPizsyWJamEo8OnXltTQLT0zbEnN7i0eoveXQdd8aAXB0sTHgk0h0j2aPv3xdl
 PvlcmCU9Qqo6UPCU0YGJjPZHZklXi0mnfTFFSMmLJO2+8XQJhgG2+SrUYGqJLbRUs34w
 MHA/fMaS5ydEyWuSCzaNeVFjEQP3llaZOTs2mjgeihPn7LkbpRz5ycvSOPlzm6gBjn0W
 OaxQcy9AeArJqrxxJWa3gm8Z8TuZZTaY8qlWeFQ/x5EcXXheQhyOAhxkq6P9XBi6DkuI
 q84xSlpwp6t9y/DeFQzUxsQx2V8ge6Z5qW1kL9lgqfzvKq4NqI8zeJih0o6Bvzr7ePwC
 XgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+thAp6yyX7UKE9dtUxDENsQxMtVNf3sefwYHyrkPjH0=;
 b=eYzG5C8akj3SZEF1DkX1vYtg4IX6nq+kLuKvTSqhMcdIjPq8Z2CYjr2QpXsSCiZrrI
 d3mF4V50WDoqCzhIuAHRzlUyHJpXrXRZRp+MwJ2H3SHaM/qM+2vdr4XjC95aDj/wlGrH
 hF4U5WicgNdbJdqQSuDr1qstjs0acNPeTT0pK5DEd6hGAaPmr3KYlMtipP9t9s7nX6zV
 25kXtjLB56WOA8KHau2QCQyXtc9nCQ1Oq7piUnrQBLVTyx6xrsZWepOySRi/vzFjIPZ4
 DY+AP7gV/EDGaeY7RhIO18rdt71Ou8RDiP6XBi18rF++w1MoKJTeYdj7j25lTqjUod49
 OeZQ==
X-Gm-Message-State: ANhLgQ1B2dNBIl8eo+KFZme0HlHUdffFmmdluJxMdt/WLar1inNn86Yd
 ofgNQR5d8YhreUFZ+rBdC8GCzdhQXL7Gkwrn691+Tw==
X-Google-Smtp-Source: ADFU+vs9ry2XYsgdK4314uO1jxo2AlhedtLaVepDUfyzcjwnRtJPqD/97uig5eK0Wc99bItxHnujbp8fjRWMCAR3xjM=
X-Received: by 2002:aca:f541:: with SMTP id t62mr5236270oih.172.1584682212108; 
 Thu, 19 Mar 2020 22:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200317065452.236670-1-saravanak@google.com>
 <CAGETcx-uZ3YJHCYqFm3so8-woTvL3SSDY2deNonthTetcE+mXQ@mail.gmail.com>
 <20200319073927.GA3442166@kroah.com>
In-Reply-To: <20200319073927.GA3442166@kroah.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 19 Mar 2020 22:29:36 -0700
Message-ID: <CAGETcx-3oeJOvpCYj==RJuBU9HP8F0ZNr0YLvUHGHF52b=F7HA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Fix device links functional breakage in 4.19.99
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_223019_315170_F2E045BD 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 19, 2020 at 12:39 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 18, 2020 at 12:10:43PM -0700, Saravana Kannan wrote:
> > On Mon, Mar 16, 2020 at 11:54 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > As mentioned in an earlier email thread [1], 4.19.99 broke the ability
> > > to create stateful and stateless device links between the same set of
> > > devices when it pulled in a valid bug fix [2]. While the fix was valid,
> > > it removes a functionality that was present before the bug fix.
> > >
> > > This patch series attempts to fix that by pulling in more patches from
> > > upstream. I've just done compilation testing so far. But wanted to send
> > > out a v1 to see if this patch list was acceptable before I fixed up the
> > > commit text format to match what's needed for stable mailing list.
> > >
> > > Some of the patches are new functionality, but for a first pass, it was
> > > easier to pull these in than try and fix the conflicts. If these patches
> > > are okay to pull into stable, then all I need to do is fix the commit
> > > text.
> >
> > I took a closer look at all the patches. Everyone of them is a bug fix
> > except Patch 4/6. But Patch 4/6 is a fairly minimal change and I think
> > it's easier/cleaner to just pick it up too instead of trying to
> > resolve merge conflicts in the stable branch.
> >
> > 1/6 - Fixes what appears to be a memory leak bug in upstream.
> > 2/6 - Fixes error in initial state of the device link if it's created
> > under some circumstances.
> > 3/6 - Fixes a ref count bug in upstream. Looks like it can lead to memory leaks?
> > 4/6 - Adds a minor feature to kick off a probe attempt of a consumer
> > 5/6 - Fixes the break in functionality that happened in 4.19.99
> > 6/6 - Fixes bug in 5/6 (upstream bug)
> >
> > Greg
> >
> > Do these patches look okay for you to pull into 4.19 stable? If so,
> > please let me know if you need me to send v2 with commit fix up.
> >
> > The only fix up needed is to these patches at this point is changing
> > "(cherry picked from commit ...)" with "[ Upstream commit ... ]". The
> > SHAs themselves are the correct SHAs from upstream.
>
> These all look good to me, now all queued up, thanks.

Awesome, thanks!

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
