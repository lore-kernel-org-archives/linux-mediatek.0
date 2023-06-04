Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B186C7EE23
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 06:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABygB8GIbc3cPzvIop5r9YOrRdeKK4Mi8VAH/yukmyg=; b=J3CGizQn50x9hnRBeYhqfFXYrv
	274bl0K1uljh9IOLsMsEuhY9bIQelJLG6HkWokt0k8JBKkzqNvWqAsCCwTLQcm3ScJvYL3YeoM/1o
	1xYwjdR79ltRcKiVSXorhjhuI7s0Ncj1DoAuSL+t8WRXutoLdgDCcVBHgeDoDhQF+UXedd4Oy0UHt
	zARWUmNOcsYzz2XqGfqw+ib9DoTswJXxt77jYwS2wvlbqdzu9gCc4pFizOkIzoetr/7/izEQTUOzE
	InOiY6KdhzsFgKVF+r96+7NvbCowailSr7LJr1gWdf2MQuJ0doJDGrFJm9QxbV2QaRR1Kt8S4L9nf
	dWvIpEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gr9-00BPyC-16;
	Sun, 04 Jun 2023 06:04:47 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gr5-00BPxO-2W
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Jun 2023 06:04:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id B52C0804D;
	Sun,  4 Jun 2023 06:04:37 +0000 (UTC)
Date: Sun, 4 Jun 2023 09:04:36 +0300
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Message-ID: <20230604060436.GT14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603215718.ca5hdzdsj4btnlc2@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230603215718.ca5hdzdsj4btnlc2@mercury.elektranox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_230443_880643_C8A92DD9 
X-CRM114-Status: GOOD (  13.79  )
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

* Sebastian Reichel <sebastian.reichel@collabora.com> [230603 21:57]:
> On Sat, Jun 03, 2023 at 08:41:39AM +0300, Tony Lindgren wrote:
> > Looking at the kernelci.org test boot results for Linux next [0], seems
> > this issue is somehow 8250_mtk specific. I don't think the rk3399 boot
> > issue is serial port related.
> 
> The rk3399-gru-kevin board is broken because of a change from me
> renaming CONFIG_MFD_RK808 to CONFIG_MFD_RK8XX and forgetting to
> update the defconfig :( This means the board is missing its PMIC
> driver. It should be fixed once the defconfig update is queued:
> 
> https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/

OK thanks for the info.

> Unfortuantely nobody seems to feel responsible for the generic arm
> defconfig files :(

You could put together a git branch with the defconfig changes and
send a pull request to the SoC maintainers if it does not get picked
up before that.

Regards,

Tony


