Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C500C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 09:59:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABFC222EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 09:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lut0I2fu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hnLHNoZt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABFC222EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QSn0eSeHHyouBs0n+bIwmWs+3btR/sDISlNmImIguJ0=; b=lut0I2fuKsuP0zq4GjaajxQrZ
	hBdXko0D0/abpiDiamodNl2qvKGadqyJPYccdiZG6EO7A75keve3ylcFkUX0s48nESONGk9jxVA46
	mQYMorMn52TGOntWRbfyU7DmaVxqMgBVMyj1Q42ep4TIRt6kw2NCpyuc+p14NV/SCEMUqcPmy5Fdl
	A/VrOznBAaV2xr2XQeBWS0KaVUJtFmBwcwXiOFNsL+zOlgPDsXjCwftJvzDFNwOuimHdlCTlgZpM6
	JfJqlXSRw6yg6wuyvzUp93LaXwHBcAh5zd6cdGk5aJyl/fuefc4iFkvFJ5+0AqRSCtzw26kGRIY/B
	KFtomwkxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWzHy-0005XD-MG; Mon, 26 Oct 2020 09:59:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWzHt-0005VY-3U; Mon, 26 Oct 2020 09:59:38 +0000
X-UUID: 2b7e10825d5146c290fc030852bc9422-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=20g0W1OHC8ECWUuvX8bYtkQwtQjsCCtxJSPzMi5pZ3Y=; 
 b=hnLHNoZt83lzo3EIi+h9NFGmBN9lxqgSR3A4N+lQmDENvgqZkaUzhWL5ZLkWdFUJgwitHtkAezv0DvsbiD9hebpU2iDLC1GzBLjck1mrkdukeV+IQDbI/p3KXjJYWeaEPLXgy7Qg0Yvkq+/i/3Lmce3BcbC/xoOta0XfX0cvaus=;
X-UUID: 2b7e10825d5146c290fc030852bc9422-20201026
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1038577914; Mon, 26 Oct 2020 01:55:21 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 02:55:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 17:55:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 17:55:18 +0800
Message-ID: <1603706118.2127.2.camel@mtkswgap22>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
From: claude yen <claude.yen@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Oct 2020 17:55:18 +0800
In-Reply-To: <CAJZ5v0jJHBBrxANa-+mHFE47TZfE4NKNpgp0-rq2BD=Yw7qMXg@mail.gmail.com>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
 <20201022061748.13730-2-claude.yen@mediatek.com>
 <20201022070154.hqvksoj4nss3er2e@bogus>
 <1603427300.7573.6.camel@mtkswgap22>
 <20201023144842.zos4pvpwv4r3rv4j@bogus>
 <CAJZ5v0jJHBBrxANa-+mHFE47TZfE4NKNpgp0-rq2BD=Yw7qMXg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_055937_356504_92889058 
X-CRM114-Status: GOOD (  30.02  )
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
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 16:58 +0200, Rafael J. Wysocki wrote:
> On Fri, Oct 23, 2020 at 4:48 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Fri, Oct 23, 2020 at 12:28:20PM +0800, claude yen wrote:
> > > On Thu, 2020-10-22 at 08:02 +0100, Sudeep Holla wrote:
> > > > On Thu, Oct 22, 2020 at 02:17:48PM +0800, Claude Yen wrote:
> > > > > As suspend_set_ops is exported in commit a5e4fd8783a2
> > > > > ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> > > > > exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> > > > >
> > > > > In this way, kernel module can hook platform suspend
> > > > > functions regardless of Suspend-to-Ram(S2R) or
> > > > > Suspend-to-Idle(S2I)
> > > > >
> > > >
> > > > If this is for arm64 platform, then NACK. You must use PSCI and it will
> > > > set the ops and it can't be module.
> > > >
> > >
> > > PSCI uses suspend_set_ops instead. And suspend_set_ops has been
> > > exported years ago.
> > >
> > > Suspend-to_Idle(S2I) is another suspend method supported by linux
> > > kernel. The corresponding s2idle_ops can be hooked by s2idle_set_ops
> > > by underlying platforms.  For example, S2I is now introduced into
> > > Mediatek SoC platforms. Besides, power management driver is built as
> > > kernel module.
> > >
> > > Mobile platforms are now call for kernel drivers to be kernel modules.
> > > This could help drivers easier to migrate to newer linux kernel.
> > > Ref: https://linuxplumbersconf.org/event/7/contributions/790/
> > >
> >
> > I understand that. But I am interested in looking at the module you want
> > to use this and how that interacts with PSCI. If this is arm64, you must
> > use PSCI for system suspend and cpu suspend. What does this module do on
> > top of those is what I want to know. Please post that module or point
> > me if it is already present in the tree.
> 
> Regardless, generally speaking, patches that export stuff to modules
> without an in-the-tree user needing this are not applicable to the
> mainline kernel source tree IMV.
> 
> Cheers!


Thank for your feedbacks!

Indeed, there is no actual kernel module which uses s2idle_set_ops in
Mainline kernel right now.

However, Google recently ask SoC vendors to build drivers as kernel
modules for reducing migration efforts. For example, The power
management driver on Mediatek platform is now built as vendor module,
which has no plan to upstream so far. 

From Mainline kernel's perspective, I am wondering whether such vendor
modules are applicable to export APIs. Exporting APIs only at Google's
Android Common Kernel is an option, but this would make Android Kernel
and Mainline kernel much more diverse.

Regards,
Claude

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
