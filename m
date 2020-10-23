Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A81C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 04:40:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61884223C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 04:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2x2RTXb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F8PBq/T0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61884223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRhSi2+yV1epbciXY24Ih/In4XnjCjv9a6lGiFIJ/a4=; b=W2x2RTXb3A57ccsSn6qKN/kJK
	FJXHuz3PybgSDRfrNLn/JBOpPGgmhGKuLc4/OMx6q/fYwfdus7/bFY2/qmbR89fFYM2HuiX0iwLGy
	P/n5cQ0iOJahAsDMgkYksTwc6s/gDhLn5eeBMep1PlHHlaYQ5hrhIoxBi215bJUahmTma2X1HArO7
	QSXYNB/hi+UD8FNHRh8CNWMcMpDU6tsEZSCwyOKOJH2FhSdhG3dhHWcUs+F6oS1+3CaLSU4xf/MhR
	gStDIk966p6e8TkGI6o9oRLMLsIgxNfujHMhU3azccFSDxqgnvDSPB4tOiDrsirePMr8+DJJ8Kbt5
	epxdKcQfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVorq-0008Ph-Qr; Fri, 23 Oct 2020 04:39:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVoqe-00084H-9a; Fri, 23 Oct 2020 04:38:42 +0000
X-UUID: 75d1391f214d4b958e952624d4f68c81-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5YtfPoYxtZBRSyiC2VkB5O7C49n+8i4TSqxu4hkRUGI=; 
 b=F8PBq/T06NrljqSOBDL8tVx3WwPGZAyqftd/B0gkcCTyelBzeQJxKg0cMMktF5lXImbV5T7jq+umyY0zdkNa2+sRNLMQ372yXQNjw+tyH119OSdGfPtBjlJY89s2YLmG9JiDV0pbALOI2qNcnhNBJBXZTfNxxhiu2lFHM896u2c=;
X-UUID: 75d1391f214d4b958e952624d4f68c81-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1789997043; Thu, 22 Oct 2020 20:38:30 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 21:28:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 12:28:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 12:28:20 +0800
Message-ID: <1603427300.7573.6.camel@mtkswgap22>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
From: claude yen <claude.yen@mediatek.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 23 Oct 2020 12:28:20 +0800
In-Reply-To: <20201022070154.hqvksoj4nss3er2e@bogus>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
 <20201022061748.13730-2-claude.yen@mediatek.com>
 <20201022070154.hqvksoj4nss3er2e@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 029A931861513CD54378A52D951671A7F8FC70A8B55464CB36672ECEF508EE072000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_003840_533324_DD115F00 
X-CRM114-Status: GOOD (  16.85  )
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
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-22 at 08:02 +0100, Sudeep Holla wrote:
> On Thu, Oct 22, 2020 at 02:17:48PM +0800, Claude Yen wrote:
> > As suspend_set_ops is exported in commit a5e4fd8783a2
> > ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> > exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> > 
> > In this way, kernel module can hook platform suspend
> > functions regardless of Suspend-to-Ram(S2R) or
> > Suspend-to-Idle(S2I)
> >
> 
> If this is for arm64 platform, then NACK. You must use PSCI and it will
> set the ops and it can't be module.
> 

PSCI uses suspend_set_ops instead. And suspend_set_ops has been
exported years ago.

Suspend-to_Idle(S2I) is another suspend method supported by linux
kernel. The corresponding s2idle_ops can be hooked by s2idle_set_ops
by underlying platforms.  For example, S2I is now introduced into
Mediatek SoC platforms. Besides, power management driver is built as
kernel module.

Mobile platforms are now call for kernel drivers to be kernel modules.
This could help drivers easier to migrate to newer linux kernel.
Ref: https://linuxplumbersconf.org/event/7/contributions/790/

Regards,
Claude 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
