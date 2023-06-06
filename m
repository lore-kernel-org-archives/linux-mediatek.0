Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFCCC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Brv50cdXScO6IBr3ZUETxFzBo3Q4dkTFtkQ5cdeh1t8=; b=euBTFL+Bnvz8kT0nRl9ldxeSQF
	FBkhQ7Y57qCSo/kfxCY3am6r6ZtX1trfgaCPhRPcYcFnNH5saRTLzCcC9DmJEXfoopFCLaXaaTZEe
	2gDRjC+/y5ZuQSgm0WlKU0eBYiFUccJqIFfCtVTydgiu/bzObID0i5l3lzsmtAS16E5MfTfiDXAW6
	mzwv50t/w6fMHe/6XGLmQTM8OtCzYnjFvEmzJCy6eREoSQuNvfZNsEOuBwrPNctpHa0kRRqUmRdlA
	gguUqa4zavlGITQ47RlA5Om13oUJH8IdNam9v4Wzw3cfBZGa5/hBollA5/zh1aKphYeSAtRdATqH6
	vGPN/YgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VgP-001bzI-12;
	Tue, 06 Jun 2023 12:21:05 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VgM-001bys-0T
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 12:21:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 303FA80AE;
	Tue,  6 Jun 2023 12:21:01 +0000 (UTC)
Date: Tue, 6 Jun 2023 15:20:59 +0300
From: Tony Lindgren <tony@atomide.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: John Ogness <john.ogness@linutronix.de>,
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
Message-ID: <20230606122059.GC14287@atomide.com>
References: <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com>
 <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
 <20230605131803.GA14287@atomide.com>
 <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_052102_250170_52F8D4FE 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

* Chen-Yu Tsai <wenst@chromium.org> [230606 09:17]:
> I ended up following 8250_dw's design, which seemed less convoluted.
> The original code was waaay too convoluted.

OK that looks good to me thanks. Good to hear you got it sorted out.

The 8250_dw style runtime PM is a good solution for simple cases. Where
it won't work are SoCs where runtime PM calls need to propagate up the
bus hierarchy. For example, 8250_omap needs runtime PM calls for the
interconnect and power domain to get register access working.

> BTW, the Bluetooth breakage seems like a different problem.

OK seems like we're good to go then :)

Regards,

Tony

