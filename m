Return-Path: <SRS0=Q1uE=BE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E669C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 15:49:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C209206F6
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 15:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Rwl1Xi6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C209206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c63hkOxCEuiV0/v9iHbsgL/fqf1mPE+94Od0z54Z0sU=; b=3Rwl1Xi6GnV4fCW8Ax71zd0Lx
	qLK7fxZb/pD1X3NJdonAxYVphnek1dWuc8JwHneGJqcHq5586W59SiXe8XKzD56qwax9w8On/6Ze4
	P5q6v8bCXA7UUk3yzzzMqkfTG4f6Or5I21TJOPVsNnr46kDYXlcn/SUwiIEfzwdJon1j/We2vCEEo
	m+WrE+OCkeXR6q57FRRc/ta+ZWWjIWU1/j9+OSu5iVtNS4MYv3pUR4H6ad1h0RbBmK6bvnEZB2bFy
	2Ao151kMoW3lS8IhBAtkMS5h9Yxh0PKlb7wH6CRTHOpCxFN11FaxHhc2Wed52yjoUOwY8G//Zxt7O
	E5ujooUIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzMPx-0004CW-5W; Sat, 25 Jul 2020 15:48:57 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzMPs-0004BY-Pj; Sat, 25 Jul 2020 15:48:53 +0000
Received: by mail-ot1-f67.google.com with SMTP id 95so9227999otw.10;
 Sat, 25 Jul 2020 08:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C2tWIq6ckvPQ/yQ9n0OcVSF3V7zuB66fdFiG7czZWrM=;
 b=cZ5gYBV8YC2GKc8hre968lc0cLHEdlkz4vJI1NUxLX8VjMgi7/bRIun3CWzjQch/Fo
 c6bLt36TlRLFTbey5zMow37MQeik/hwQrwSZmQ1i5sWX05UfWcyTSkg/0vk5dVoPGNJW
 osa2DRBvFSjJP7hfEZhvvOtarny8oSy64PZyx5DoXR+uUoOArQcgaDhR63v2iXYUfZz4
 rQwPPvvxmfxkcZeKs0MtEp4pPbCuqDXZ8Uhco/1PIj4gvkIqmHC7kUEU+c0oaU87LjYw
 /Ms0GnKmbvf3Ff/cRlvh/a5eDE0qF8qBptE1ZJCgfcICYo6GrFCjSWfVzmpsK3MYXWAA
 PYgg==
X-Gm-Message-State: AOAM530YurFhfbGD2Pww290yezHeGb7kPjYZyk1W/J5ERZDguSPZAJXd
 YsNQQGcd8Qq8qx4ydbIxYX5TFZX/tDuNHdZLmOE=
X-Google-Smtp-Source: ABdhPJxdIbJjT+WXUymtPF9yecfsiFiCGsZKNzDMvi+8ZkivU76IBsZTeqiLhBkUl+vQbEzionhR0LjlVM4VyaFCCjM=
X-Received: by 2002:a05:6830:30ba:: with SMTP id
 g26mr13183298ots.118.1595692130877; 
 Sat, 25 Jul 2020 08:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22> <1595233294.8055.0.camel@mtkswgap22>
 <20200723190724.GA1339461@google.com>
 <CAJZ5v0g_14D-tyWFEZ9eOJC=GmzR-31iAAPff=Ch8KjFyK2wfw@mail.gmail.com>
 <1595586289.14121.5.camel@mtkswgap22>
 <CAJZ5v0hnW5NB1T90QNSVuzFSZrrXzxKASWYDTW=mFF6MOan9hQ@mail.gmail.com>
 <1595591389.14564.3.camel@mtkswgap22>
In-Reply-To: <1595591389.14564.3.camel@mtkswgap22>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 25 Jul 2020 17:48:39 +0200
Message-ID: <CAJZ5v0jyWbnztoTGkA88-4FwUjbvQvbW5a+GreJT-uJoNREPOA@mail.gmail.com>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_114852_866310_49A52032 
X-CRM114-Status: GOOD (  37.99  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 1:50 PM Neal Liu <neal.liu@mediatek.com> wrote:
>
> On Fri, 2020-07-24 at 13:20 +0200, Rafael J. Wysocki wrote:
> > On Fri, Jul 24, 2020 at 12:24 PM Neal Liu <neal.liu@mediatek.com> wrote:
> > >
> > > On Fri, 2020-07-24 at 11:57 +0200, Rafael J. Wysocki wrote:
> > > > On Thu, Jul 23, 2020 at 9:07 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> > > > >
> > > > > On Mon, Jul 20, 2020 at 04:21:34PM +0800, Neal Liu wrote:
> > > > > > Gentle ping on this patch.
> > > > > >
> > > > > >
> > > > > > On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> > > > > > > On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > > > > > > > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > > > > > > changes to the original control flow graph of a compiled binary,
> > > > > > > > > making it significantly harder to perform such attacks.
> > > > > > > > >
> > > > > > > > > init_state_node() assign same function callback to different
> > > > > > > > > function pointer declarations.
> > > > > > > > >
> > > > > > > > > static int init_state_node(struct cpuidle_state *idle_state,
> > > > > > > > >                            const struct of_device_id *matches,
> > > > > > > > >                            struct device_node *state_node) { ...
> > > > > > > > >         idle_state->enter = match_id->data; ...
> > > > > > > > >         idle_state->enter_s2idle = match_id->data; }
> > > > > > > > >
> > > > > > > > > Function declarations:
> > > > > > > > >
> > > > > > > > > struct cpuidle_state { ...
> > > > > > > > >         int (*enter) (struct cpuidle_device *dev,
> > > > > > > > >                       struct cpuidle_driver *drv,
> > > > > > > > >                       int index);
> > > > > > > > >
> > > > > > > > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > > > > > > > >                               struct cpuidle_driver *drv,
> > > > > > > > >                               int index); };
> > > > > > > > >
> > > > > > > > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > > > > > > > failed since they use same callee.
> > > > > > > >
> > > > > > > > Can you please explain this in a bit more detail?
> > > > > > > >
> > > > > > > > As it stands, I don't understand the problem statement enough to apply
> > > > > > > > the patch.
> > > > > > > >
> > > > > > >
> > > > > > > Okay, Let's me try to explain more details.
> > > > > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > > > > changes to the original control flow graph of a compiled binary, making
> > > > > > > it significantly harder to perform such attacks.
> > > > > > >
> > > > > > > There are multiple control flow instructions that could be manipulated
> > > > > > > by the attacker and subvert control flow. The target instructions that
> > > > > > > use data to determine the actual destination.
> > > > > > > - indirect jump
> > > > > > > - indirect call
> > > > > > > - return
> > > > > > >
> > > > > > > In this case, function prototype between caller and callee are mismatch.
> > > > > > > Caller: (type A)funcA
> > > > > > > Callee: (type A)funcB
> > > > > > > Callee: (type C)funcC
> > > > > > >
> > > > > > > funcA calls funcB -> no problem
> > > > > > > funcA calls funcC -> CFI check failed
> > > > > > >
> > > > > > > That's why we try to align function prototype.
> > > > > > > Please feel free to feedback if you have any questions.
> > > > >
> > > > > I think you should include a better explanation in the commit message.
> > > > > Perhaps something like this?
> > > > >
> > > > >   init_state_node assigns the same callback function to both enter and
> > > > >   enter_s2idle despite mismatching function types, which trips indirect
> > > > >   call checking with Control-Flow Integrity (CFI).
> > > > >
> > > > > > > > > Align function prototype of enter() since it needs return value for
> > > > > > > > > some use cases. The return value of enter_s2idle() is no
> > > > > > > > > need currently.
> > > > > > > >
> > > > > > > > So last time I requested you to document why ->enter_s2idle needs to
> > > > > > > > return an int in the code, which has not been done.  Please do that.
> > > > >
> > > > > Rafael, are you happy with the commit message documenting the reason,
> > > > > or would you prefer to also add a comment before enter_s2idle?
> > > >
> > > > As I said before, it would be good to have a comment in the code as
> > > > well or people will be wondering why it is necessary to return
> > > > anything from that callback, because its return value is never used.
> > > >
> > > > Thanks!
> > >
> > > Is it okay to add these comments before enter_s2idle?
> > >
> > > /*
> > >  * Align function type since init_state_node assigns the same callback
> >
> > init_state_node()
> >
> > >  * function to both enter and enter_s2idle despite mismatching function
> >
> > ->enter_s2idle
> >
> > >  * types, which trips indirect call checking with Control-Flow Integrity
> > >  * (CFI).
> > >  */
> > > int (*enter_s2idle)(struct cpuidle_device *dev,
> > >                     struct cpuidle_driver *drv,
> > >                     int index);
> >
> > But IMO it would be sufficient to add something like this to the
> > existing comment regarding ->enter_s2idle:
> >
> > "This callback may point to the same function as ->enter if all of the
> > above requirements are met by it."
> >
> > That would explain why the signature is the same sufficiently in my view.
> >
> > Thanks!
>
> For clarification, do you mean add this comment on enter_s2idle function
> pointer declaration is enough?

Yes, I do.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
