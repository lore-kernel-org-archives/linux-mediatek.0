Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53CEC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA8520716
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lF7yfHj0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WMazE14J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA8520716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQXqCMGSvFglt8jxStSFgB2JmRtqyEzhevahjX69dNk=; b=lF7yfHj0BdvM9FZTS1hxDV6R4
	VkxMOgS8hdG0RUMlLGPVqXS338dE42N6V3Oy3eourCSygWl7eZpSRIZy+eZdroA/IowNBdQCWpX7i
	3zttIYnLUk4zjy2/uJoKzJEK17/lt92ZpUD1SMvYgphR61f4p1FblkBzlfC2d6PiytbOfFYMHhkUs
	AMUekkwmF2M9qpZT61iNyUHOerC8slu601oYvns/2WKiahix33UTkY+8UyWBNiTVZS9rcg7Sz85Uf
	MMiW8rtivE/sntC9NXuj0h8X1B4Wju1ZOVxkq/mB6UkirzduzcNAwCRljK+p3O8kgTLaUit54Cozl
	slNole64w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDgJZ-00014s-9h; Thu, 03 Sep 2020 03:53:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDgJW-00014B-9A; Thu, 03 Sep 2020 03:53:31 +0000
X-UUID: d253dcda250f4f689535adfeb4573f62-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hiSqof+tHuVm7trBU2CFXBcC9LKcMdjBtiXhg7bI7Do=; 
 b=WMazE14J0wd2gxSlXRZqxHR4Svpgg9DWx7y7EHXKvFgBUz4pI1uJNx8nhcpacVArQi89smfwZpCleR98gTc9wVLz/8DzpsbIFOYavMON1udjF/enIgFaCXkHaWNU8n3R2X0TIAjT8vZG9cIS1aDTxmPAohxjy9bPD9TG0nu7GJ0=;
X-UUID: d253dcda250f4f689535adfeb4573f62-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 124780397; Wed, 02 Sep 2020 19:53:28 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:43:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:43:23 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:43:23 +0800
Message-ID: <1599104604.4435.7.camel@mtksdccf07>
Subject: Re: [PATCH 1/1] PM: s2idle: Introduce syscore callbacks in s2idle flow
From: Claude.Yen <Claude.Yen@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
Date: Thu, 3 Sep 2020 11:43:24 +0800
In-Reply-To: <159894602346.334488.4470501636825871587@swboyd.mtv.corp.google.com>
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
 <1598943859-21857-2-git-send-email-claude.yen@mediatek.com>
 <159894602346.334488.4470501636825871587@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_235330_514890_DA6B8FD8 
X-CRM114-Status: GOOD (  18.90  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J.Wysocki" <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-01 at 00:40 -0700, Stephen Boyd wrote:
> Quoting Claude Yen (2020-09-01 00:04:19)
> > From: "claude.yen" <claude.yen@mediatek.com>
> > 
> > Adding syscore callbacks to s2idle makes the behavior of s2idle become
> > more similar to Suspend-to-Ram (S2R) and reduces potential porting
> > effort.
> > 
> > tick_freeze() in s2idle flow calls sched_clock_suspend() and
> > timekeeping_suspend(), which both functions are also registered as
> > syscore callback. sched_clock_suspend() introduced in
> > commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
> > wrap caused by tick_freeze()") is added due to clock wrap issue.
> > By adding syscore callbacks in s2idle, if there is any syscore callbacks
> > also required in s2idle, additional porting effort could be saved.
> > 
> > Besides, in both S2R and s2idle, before the system entering low power
> > state, there is a state when only one cpu alive with interrupt-disabled,
> > which is syscore callback designed for. Adding syscore callbacks in
> > s2idle is feasible option.
> > 
> > Scenarios to call syscore callback:
> > S2R: one cpu alive when nonboot cpus are hotplug-ed off
> > s2idle: one cpu alive when other cpus have enter idle state
> > 
> 
> Do you have syscore ops that can't be converted to something else like
> CPU_PM notifier? At this point most syscore code that is important has
> been converted so I don't see much benefit for this patch. If anything,
> it will prevent conversions to code that works for both cases.

In Mediatek SoC's implementation, battery voltage and remaining capacity
are tracked in syscore callback when system going to suspend. The reason
to hook callback in syscore is that all devices are suspended, and thus
battery output become steady and suitable for measurement. Such callback
is not suitable for CPU_PM notifier.

If s2idle is applied, the callback to track battery status is not
triggered due to syscore is not called by current design.

Regards,
Claude
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
