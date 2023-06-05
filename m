Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4BDC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb4o8kPSgOND+L4Vboq73Dg9U1VrJLjkQgH48uYDhRs=; b=T9f/1IjAiTKaxGMWKx54M+Ai9s
	/dum6Fely/RbP4Jy9xSAeEwX/tehEDagiBFptsBxTmpraz/WGmDSNn/9ASUk9J6mzNvVuRXa5UR5Y
	UZ8yfurC0lPtY874ov9h/JDl6WbugJSxQfVyjl8rZw1w0FRnaLB3QZQa2JhAeU78UY8klKOnnW9Fe
	dGgv156j/9uIBBTxlw83iNseJSDhxK/6Jf25QVjDInN8LQ0KOs7MbL6l5AQbXhZE+4RNoa0vM6Azu
	Qweu7OY4fqGvVWCEAH1qSrzjkebSic14HmAFLB6vUojL7kiTNDdHZXHEds0amX/8L1ln1F0bah5ap
	WY0DdkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69Gt-00FQG1-35;
	Mon, 05 Jun 2023 12:25:15 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69Gr-00FQFQ-2Q
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 12:25:14 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 2D9F380FE;
	Mon,  5 Jun 2023 12:25:13 +0000 (UTC)
Date: Mon, 5 Jun 2023 15:25:11 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230605122511.GZ14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
 <ZH3Gxwb7/VYzIW3r@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH3Gxwb7/VYzIW3r@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_052513_834681_FAB8A722 
X-CRM114-Status: UNSURE (   8.11  )
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

* Andy Shevchenko <andriy.shevchenko@intel.com> [230605 11:28]:
> On Mon, Jun 05, 2023 at 09:15:11AM +0300, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [230603 06:35]:
> 
> ...
> 
> >  	/* wait until UART in idle status */
> >  	while
> > -		(serial_in(up, MTK_UART_DEBUG0));
> > +		(mtk8250_read(data, MTK_UART_DEBUG0));
> 
> In case you go with this, make it a single line.

OK makes sense thanks.

Tony

