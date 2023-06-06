Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1CBC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t/XgkGqBCLKUC8d1njSJJxENs0RTSWtVoo3mxuZvAs=; b=FlnVphG9uOi/SiDuLXC2wsZh57
	Kk9UEZPMTI01ygWIQCqPhH4lr2r80kHMTijoyl2NM82E3IpSadcn67gymW761GBkeRCFCjnveIH1M
	Y4R9ia7F9UOYTs8qoIUDO/S19OST3vSb0BxveO2s3D4amPqYVxLXijP4r3Tpur7CvhZ1guPhQy+93
	A+LxaCwUMSp7m+Es6wIVBJndLW5JFiWpLfc9oT/YQi55433REq7ESK7UsqjvR1A3HRofjBCFeS6L4
	edeUmu+3S3Oj5WIdO5V9REIrFfAH/k8hSZPJaSwJ+Dm6hJcAS/42H7p8n4D7h6u7qblv0DtLP4lBV
	F6k+W7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TpS-0019tG-2k;
	Tue, 06 Jun 2023 10:22:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TpP-0019rT-1x;
	Tue, 06 Jun 2023 10:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686046935; x=1717582935;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=K73CgqDhV6+wYuuwO+L54HYNSyp1lD7d/wmA1mlNlZM=;
  b=ZE8KznCUm3Xgie+Oh7HadGG5snGGADAc2mSVW0ZTuB+K6E/ofmhrx3LX
   UjFpVmNAN3msYncw1RewbBOAs+3xs2U1sALbcTQv2kA+E0Kd9XtkiMpO/
   cz9NtinmQ1pYTxGWAcF5aLc9VHz2iabziodllQ5C2X+1Xk6pU+2wRbrUW
   IgZLb/HqUrKlzb/aq+UyHHhcrZU3iviPsyIY3lIvYY0XjEGJCgMlJWdWo
   TiBpXKyWfereaalXrmfVhyofh/beZ8I/juQGvVZED2U2us69/pYjcjoIa
   HjIr10JyDDn5qgvcenSJh51lzBQ+nsn0k1XRrEk4pKxftLGXNDu00OzJS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443004664"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="443004664"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 03:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709033551"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="709033551"
Received: from vkkalava-mobl1.amr.corp.intel.com ([10.249.42.194])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 03:21:58 -0700
Date: Tue, 6 Jun 2023 13:21:55 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    LKML <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] serial: 8250_mtk: Simplify clock sequencing and runtime
 PM
In-Reply-To: <CAGXv+5GRBOWFMw+BmkSpczHcm_R6=mvL2GSKnWWyhpng1xw21w@mail.gmail.com>
Message-ID: <61ec34d0-6cc2-951e-c990-fdfd57381d7@linux.intel.com>
References: <20230606091747.2031168-1-wenst@chromium.org> <58949bbd-1506-90a0-7154-e6e57d8ddf70@collabora.com> <CAGXv+5GRBOWFMw+BmkSpczHcm_R6=mvL2GSKnWWyhpng1xw21w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1339228617-1686046822=:2339"
Content-ID: <2c863382-e720-b6b7-8c78-4cab41dcba20@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_032215_656693_35B53290 
X-CRM114-Status: GOOD (  32.84  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1339228617-1686046822=:2339
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <b22da189-5993-cbb5-5c44-4a56a22022cf@linux.intel.com>

On Tue, 6 Jun 2023, Chen-Yu Tsai wrote:

> On Tue, Jun 6, 2023 at 5:36 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 06/06/23 11:17, Chen-Yu Tsai ha scritto:
> > > The 8250_mtk driver's runtime PM support has some issues:
> > >
> > > - The bus clock is enabled (through runtime PM callback) later than a
> > >    register write
> > > - runtime PM resume callback directly called in probe, but no
> > >    pm_runtime_set_active() call is present
> > > - UART PM function calls the callbacks directly, _and_ calls runtime
> > >    PM API
> > > - runtime PM callbacks try to do reference counting, adding yet another
> > >    count between runtime PM and clocks
> > >
> > > This fragile setup worked in a way, but broke recently with runtime PM
> > > support added to the serial core. The system would hang when the UART
> > > console was probed and brought up.
> > >
> > > Tony provided some potential fixes [1][2], though they were still a bit
> > > complicated. The 8250_dw driver, which the 8250_mtk driver might have
> > > been based on, has a similar structure but simpler runtime PM usage.
> > >
> > > Simplify clock sequencing and runtime PM support in the 8250_mtk driver.
> > > Specifically, the clock is acquired enabled and assumed to be active,
> > > unless toggled through runtime PM suspend/resume. Reference counting is
> > > removed and left to the runtime PM core. The serial pm function now
> > > only calls the runtime PM API.
> > >
> > > [1] https://lore.kernel.org/linux-serial/20230602092701.GP14287@atomide.com/
> > > [2] https://lore.kernel.org/linux-serial/20230605061511.GW14287@atomide.com/
> > >
> > > Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> > > Suggested-by: Tony Lindgren <tony@atomide.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > You're both cleaning this up and solving a critical issue and I 
> > completely agree about doing that.
> >
> > I can imagine what actually fixes the driver, but still, is it 
> > possible to split this commit in two?
> > One that solves the issue, one that performs the much needed cleanups.
> >
> > If it's not possible, then we can leave this commit as it is... and if the problem
> > about splitting is the Fixes tag... well, we don't forcefully need it: after all,
> > issues started arising after runtime PM support for 8250 landed and before that the
> > driver technically worked, even though it was fragile.
> 
> The pure fix would look like what Tony posted [1]. However it would add stuff
> that isn't strictly needed after the cleanup. Doing it in one patch results
> in less churn. Think of it another way: it's a nice cleanup that just so
> happens to fix a regression.
> 
> As for the fixes tag, it's there so other people potentially doing backports
> of the 8250 runtime PM work can spot this followup fix.

Tony's patch is recent enough to not have progressed beyond tty-next so 
fixing it shouldn't really require paying that much attention to stable 
rules wrt. Fixes tag and minimality.

As the target currently is tty-next, a cleanup which also happens to fix 
the issue seems perfectly fine.


-- 
 i.
--8323329-1339228617-1686046822=:2339--

