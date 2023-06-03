Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A2BC77B73
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jun 2023 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoxGu0NCJs5N9p740cfbgOA3PpP0r3rx9MYHFuvSeq8=; b=JP4I9F3FVtL85QmI90ks0nOu1O
	LQrZB+Nv2v6d6Kphe5un2x9ai/79qRtrJX0gH8KJP2ec7+97AY2kcHg78d+kfiKc36SYXuzF2djG/
	MGBTGy//ZKgwOWjVlgt5afDmbpETOgGm4gYldt3vWy5hgk8mRNC9sWnhvuRKCH1Uq1OOQPE0U2t0G
	0tJtK4k/mURH/bNigujnMl4/2EuhRQHz+DGbRLh6biLyLGcMqjI4N7lT9Ix9Vbsua4KRB4lbsXdHC
	exfbw7AT5XWFUClreYfXxLTeczWggqZC8ts9256MDu5yxA+YH3s553EEDYJUEpqOV3Gfo2XUngKea
	gYtGIMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5K1K-008rEx-12;
	Sat, 03 Jun 2023 05:41:46 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5K1H-008rEJ-0S
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jun 2023 05:41:44 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 9E7208111;
	Sat,  3 Jun 2023 05:41:40 +0000 (UTC)
Date: Sat, 3 Jun 2023 08:41:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230603054139.GR14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5xii33r.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_224143_247028_066BA60B 
X-CRM114-Status: GOOD (  13.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

* John Ogness <john.ogness@linutronix.de> [230602 10:13]:
> Unfortunately next-20230601 also brought in a series that added
> spinlocking to the 8250 driver. That may be the issue here instead.

I think you're off the hook here with the spinlocking changes :)

My guess right now is that 8250_mtk does not want runtime PM resume called
on probe for some reason, and assumes it won't happen until until in
mtk8250_do_pm()?

Looking at the probe, the driver does pm_runtime_enable(), but then calls
mtk8250_runtime_resume() directly. Not sure what the intention here is.
Maybe adding pm_runtime_set_active() in probe might provide more clues.

When we add the new serial_ctrl and serial_port devices, their runtime PM
functions propagate to the parent 8250_mtk device. And then something goes
wrong, well this is my guess on what's going on..

To me it seems the 8250_mtk should just do pm_runtime_resume_and_get()
instead of mtk8250_runtime_resume(), then do pm_runtime_put() at the end
of the probe?

I don't think 8250_mtk needs to do register access before and after the
serial port registration, but if it does, then adding custom read/write
functions can be done that do not rely on initialized port like
serial_out().

Looking at the kernelci.org test boot results for Linux next [0], seems
this issue is somehow 8250_mtk specific. I don't think the rk3399 boot
issue is serial port related.

Regards,

Tony

[0] https://linux.kernelci.org/test/job/next/branch/master/kernel/next-20230602/plan/baseline/

