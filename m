Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6C4C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE14B2085B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQqGQppa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE14B2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YFBqgrRH+Esulbx0P+roTSq9+AB3auxBLzYgB0nk3XY=; b=hQqGQppac8mPTz8BYeSFcyNwN
	JOeZuOlDP73M+4Y+xHPe9vDBN2FiquOVvyS4OHrBTzF0tKG0T2wOS8j9E3NrXe/qiANXuciwWAimH
	NOpyr/1O8ui/lK80sMVmthobcYOWbSoJudfRozqsZykHVfYJUbzSpIfqaFzIWH/IN6lphuLYT9cd3
	vcAmWbe3uAmrZ8OOc4UYiTY3MNMCd173FsxJZ348Xd37PtvTO+1B7p65Cbupn/M3ITtFZn89yBty+
	uhx5ELwRdya6QSw3KFCdEYwtc3o/6bkMrPxrpb0MaagGDhlfx8YA90O5GDSnscsvkHwq7SPRdM8W3
	jL0JBY7XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVyWE-0006aU-VG; Fri, 23 Oct 2020 14:58:14 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVyWB-0006Zl-Tr; Fri, 23 Oct 2020 14:58:12 +0000
Received: by mail-ot1-f66.google.com with SMTP id e20so1583796otj.11;
 Fri, 23 Oct 2020 07:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh4XGYh6HGjEIbya0JlmwandcV47fSdnDSxnvIYHkcU=;
 b=kWSZ6SKTGVTl+0snI55XZ1iXYvFVdhR3e8IQqVyWvxQHHWoXz+jxISN8v4xodUD2JN
 Hr9NRSXklEosWiPS6zoOzIsfdHTAo9EQls+L1+HAC36+se7VFIRv6Bdocepdosvc39SS
 yPDhkte4xZwtlq/Bsj0t2u//jMNZelSWEpsOkvQyMiYLH4gyFmfdl+87OZRuV25qXJIO
 FQLjXsAZiCHdQl8jQHd677V4Lj0qWKuWhHVXAxyRL1U1mcaBTNjTctk9UT1WQbCV/FDf
 9Z1a5jRTuI43KG+uywHHTDvMbW7o8g63TA4s4jQZuf/ltbnmcbnCeu9rlCkCLcJPXGEv
 BoPQ==
X-Gm-Message-State: AOAM533s6QoG6oXIE1jR8KyIVQ6CL9035WZNZAA2sptydNHQxmIDcsui
 Q1W8q6x3bWCWzmRO3kD37mb1Huxv3BkjOpaXTTA=
X-Google-Smtp-Source: ABdhPJwWynZevqQLElXxNd+RoaIFPGIei005wJY7JOjJGbL6bB5o7oYmvdQn9tUKdp++B0dXSF02UcHWy+GnYUcsFf0=
X-Received: by 2002:a9d:ac9:: with SMTP id 67mr1981783otq.321.1603465091227;
 Fri, 23 Oct 2020 07:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201022061748.13730-1-claude.yen@mediatek.com>
 <20201022061748.13730-2-claude.yen@mediatek.com>
 <20201022070154.hqvksoj4nss3er2e@bogus>
 <1603427300.7573.6.camel@mtkswgap22> <20201023144842.zos4pvpwv4r3rv4j@bogus>
In-Reply-To: <20201023144842.zos4pvpwv4r3rv4j@bogus>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Oct 2020 16:58:00 +0200
Message-ID: <CAJZ5v0jJHBBrxANa-+mHFE47TZfE4NKNpgp0-rq2BD=Yw7qMXg@mail.gmail.com>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_105812_029422_636BA60B 
X-CRM114-Status: GOOD (  24.73  )
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
Cc: Len Brown <len.brown@intel.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Linux PM <linux-pm@vger.kernel.org>, claude yen <claude.yen@mediatek.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 4:48 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Oct 23, 2020 at 12:28:20PM +0800, claude yen wrote:
> > On Thu, 2020-10-22 at 08:02 +0100, Sudeep Holla wrote:
> > > On Thu, Oct 22, 2020 at 02:17:48PM +0800, Claude Yen wrote:
> > > > As suspend_set_ops is exported in commit a5e4fd8783a2
> > > > ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> > > > exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> > > >
> > > > In this way, kernel module can hook platform suspend
> > > > functions regardless of Suspend-to-Ram(S2R) or
> > > > Suspend-to-Idle(S2I)
> > > >
> > >
> > > If this is for arm64 platform, then NACK. You must use PSCI and it will
> > > set the ops and it can't be module.
> > >
> >
> > PSCI uses suspend_set_ops instead. And suspend_set_ops has been
> > exported years ago.
> >
> > Suspend-to_Idle(S2I) is another suspend method supported by linux
> > kernel. The corresponding s2idle_ops can be hooked by s2idle_set_ops
> > by underlying platforms.  For example, S2I is now introduced into
> > Mediatek SoC platforms. Besides, power management driver is built as
> > kernel module.
> >
> > Mobile platforms are now call for kernel drivers to be kernel modules.
> > This could help drivers easier to migrate to newer linux kernel.
> > Ref: https://linuxplumbersconf.org/event/7/contributions/790/
> >
>
> I understand that. But I am interested in looking at the module you want
> to use this and how that interacts with PSCI. If this is arm64, you must
> use PSCI for system suspend and cpu suspend. What does this module do on
> top of those is what I want to know. Please post that module or point
> me if it is already present in the tree.

Regardless, generally speaking, patches that export stuff to modules
without an in-the-tree user needing this are not applicable to the
mainline kernel source tree IMV.

Cheers!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
