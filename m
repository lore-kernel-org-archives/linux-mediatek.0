Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47671C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D549720853
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5cdrpZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D549720853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+B7Z6I5intpngKKXJyo8q9TIwzUeGvVjpzXBczQI6Qg=; b=S5cdrpZ8xZjLr7iiIQtFl7zor
	n8cNt0O9eIToQDjQ7HzULv2KCOERXLPr71z4mWmiJyuGaLocEdmiKNb3NDIJ3fyDS8BKx7Y6UZ8XW
	RbmezqYbeEjpOn9VWXaH75FXc0V+NPxfS0ekTZIog5CoxJnnUgnUaRFR6bkd+qy9W13AZmWE3565r
	KAhWEvygYRby089ntY+gVxbek6BVb7lasHpjscGARQ4/DvWaCmDCL0UaKB2wxRHZsv3vp1IoQhiNe
	6a+oWAwoj6ADvvVliEo0WOj3VphFAokz00Dgte50DVst4GM2KVoH2Lo7w+s7X19Ec2NTJV1LNVFOM
	631mbPRBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVyNE-0005Ip-3i; Fri, 23 Oct 2020 14:48:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVyN9-0005Hg-KD; Fri, 23 Oct 2020 14:48:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF27A113E;
 Fri, 23 Oct 2020 07:48:47 -0700 (PDT)
Received: from bogus (unknown [10.57.15.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC673F66E;
 Fri, 23 Oct 2020 07:48:45 -0700 (PDT)
Date: Fri, 23 Oct 2020 15:48:42 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: claude yen <claude.yen@mediatek.com>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
Message-ID: <20201023144842.zos4pvpwv4r3rv4j@bogus>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
 <20201022061748.13730-2-claude.yen@mediatek.com>
 <20201022070154.hqvksoj4nss3er2e@bogus>
 <1603427300.7573.6.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603427300.7573.6.camel@mtkswgap22>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_104851_724136_48C92B41 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: Len Brown <len.brown@intel.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 12:28:20PM +0800, claude yen wrote:
> On Thu, 2020-10-22 at 08:02 +0100, Sudeep Holla wrote:
> > On Thu, Oct 22, 2020 at 02:17:48PM +0800, Claude Yen wrote:
> > > As suspend_set_ops is exported in commit a5e4fd8783a2
> > > ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> > > exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> > > 
> > > In this way, kernel module can hook platform suspend
> > > functions regardless of Suspend-to-Ram(S2R) or
> > > Suspend-to-Idle(S2I)
> > >
> > 
> > If this is for arm64 platform, then NACK. You must use PSCI and it will
> > set the ops and it can't be module.
> > 
> 
> PSCI uses suspend_set_ops instead. And suspend_set_ops has been
> exported years ago.
> 
> Suspend-to_Idle(S2I) is another suspend method supported by linux
> kernel. The corresponding s2idle_ops can be hooked by s2idle_set_ops
> by underlying platforms.  For example, S2I is now introduced into
> Mediatek SoC platforms. Besides, power management driver is built as
> kernel module.
> 
> Mobile platforms are now call for kernel drivers to be kernel modules.
> This could help drivers easier to migrate to newer linux kernel.
> Ref: https://linuxplumbersconf.org/event/7/contributions/790/
> 

I understand that. But I am interested in looking at the module you want
to use this and how that interacts with PSCI. If this is arm64, you must
use PSCI for system suspend and cpu suspend. What does this module do on
top of those is what I want to know. Please post that module or point
me if it is already present in the tree.

-- 
Regards,
Sudeep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
