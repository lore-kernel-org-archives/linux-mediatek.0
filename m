Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05024C83008
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 08:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED4A206D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 08:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpJVXE39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LV6yTAD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED4A206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exffZ8qiPov0cWgl/yNey8q189cYEwEhjzvmCCmRxCI=; b=dpJVXE39LugYK3
	Enuhyc8PNJTSw92hU8URwO3+bSSQ3HqyuWz0dEpKOeAOWkkIRnrM+WNclq608VSAOyZ0zuSTwqd0w
	7z9+EM1E3n2/BHY6E14/cBn+obsKy+0aWvTs6U+H2OZf6iBeyUtwinX/RXEhgmLP4hWkInazp0fjh
	DfGSC+tOsYz8xV/XA54hSzplSWDfOkIfR2U/RMhSpURafAKOLsWwxj9rhQc0nWa2amAESQw/EYDsI
	cIof+pSVNp91stQB197nx25zQN3Nh6Rz2NjUJ0s7GCVoQxZNL8iklTmcY9a/T9I2TDsPZahqcDLz6
	24uk5OmAHzM8EgpZzwSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jThyC-0008Qx-8g; Wed, 29 Apr 2020 08:21:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jThy1-0008IG-9c; Wed, 29 Apr 2020 08:21:19 +0000
X-UUID: 9142eb1fffab48beb44844f7727e4fb2-20200429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lTlqFTrPf5IrpTbBnQKpE5jaipjUNN+C3YGiRSNSEWc=; 
 b=LV6yTAD3UDfkQnSDnLIBnej7cdePvbLY4vLSinZMKhcmAzpjIBp2XQlnaOucWe+eN3ayWnLezCcrUVEYI7Wy2tOqxLCV6VJzk/eB8Q5CjOQfP4DJMxZgn75px+NQJikDpYI9xWBO8FFqJnmoPn3tfGitm2uLjq45xbWlqeWQ8bg=;
X-UUID: 9142eb1fffab48beb44844f7727e4fb2-20200429
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 709936542; Wed, 29 Apr 2020 00:21:41 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Apr 2020 01:21:11 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Apr 2020 16:21:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Apr 2020 16:21:05 +0800
Message-ID: <1588148417.10768.18.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] mmc: core: need do mmc_power_cycle in
 mmc_sdio_resend_if_cond
From: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 29 Apr 2020 16:20:17 +0800
In-Reply-To: <CAPDyKFrBd0E2Qy89JgTE3YH0iiXB7due0JmnSVAhYL5aubSczA@mail.gmail.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
 <1586835611-13857-2-git-send-email-yong.mao@mediatek.com>
 <CAPDyKFo40tBpowmWN3gxH8b=jMmCK8O5ALNQ7y6XZ5AosX=GUA@mail.gmail.com>
 <1588066038.30914.28.camel@mhfsdcap03>
 <CAPDyKFrBd0E2Qy89JgTE3YH0iiXB7due0JmnSVAhYL5aubSczA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A51CEC974ABE8E0E27E20E1F54AE553FB2971B2713AD31F285230F0E28E9CB742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_012117_349910_E75BF433 
X-CRM114-Status: GOOD (  38.73  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-28 at 14:13 +0200, Ulf Hansson wrote:
> On Tue, 28 Apr 2020 at 11:28, yong.mao@mediatek.com
> <yong.mao@mediatek.com> wrote:
> >
> >
> > On Fri, 2020-04-24 at 12:09 +0200, Ulf Hansson wrote:
> > > On Tue, 14 Apr 2020 at 05:40, Yong Mao <yong.mao@mediatek.com> wrote:
> > > >
> > > > From: yong mao <yong.mao@mediatek.com>
> > > >
> > > > When mmc_sdio_resned_if_cond is invoked, it indicates the SDIO
> > > > device is not in the right state. In this condition, the previous
> > > > implementation of mmc_sdio_resend_if_cond can't make sure SDIO
> > > > device be back to idle state. mmc_power_cycle can reset the SDIO
> > > > device by HW and also make sure SDIO device enter to idle state
> > > > correctly.
> > > >
> > > > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > > > ---
> > > >  drivers/mmc/core/sdio.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > > > index ebb387a..ada0a80 100644
> > > > --- a/drivers/mmc/core/sdio.c
> > > > +++ b/drivers/mmc/core/sdio.c
> > > > @@ -546,6 +546,7 @@ static int mmc_sdio_init_uhs_card(struct mmc_card *card)
> > > >  static void mmc_sdio_resend_if_cond(struct mmc_host *host,
> > > >                                     struct mmc_card *card)
> > > >  {
> > > > +       mmc_power_cycle(host, host->card->ocr);
> > >
> > > This looks wrong to me. mmc_sdio_resend_if_cond() is called from two places.
> > >
> > > 1. In the case when mmc_set_uhs_voltage() fails in
> > > mmc_sdio_init_card(), which means a call to mmc_power_cycle() has
> > > already been done.
> > >
> >   Thanks for your comment.
> >   Yes. It is right that mmc_power_cycle() has already been done when
> >   mmc_sdio_resend_if_cond() is called. In normal re-initialization case,
> >   this mmc_power_cycle() (currently in 1.8v voltage and 208Mhz clock)
> >   can make SDIO device really back to idle state. Unfortunately, in some
> >   special SDIO device, it will enter to unstable state.
> >
> >   At this unstable state, device may keep data0 always low after receiving CMD11.
> >   And then every other SDIO CMD can't be sent to device any more due to card
> >   is busy(data0 is low). Therefore, previous implementation can't save the
> >   device. At this time, mmc_power_cycle() may be the final solution to make
> >   sure SDIO device can back to idle state correctly.
> 
> Well, this still sounds a bit vague to me. I need to understand more
> exactly under what circumstances the problem occurs.
> 
> What platform are you testing with and what SDIO card is being used?
 The platform information is mt8173 + Marvell sdio device + kernel-3.18

> 
> Is the problem happening during the system resume phase?
  The problem happen when mmc_sdio_runtime_resume is invoked.
> 
> Are the SDIO func driver using runtime PM and then is the host capable
> of MMC_CAP_POWER_OFF_CARD?
> 
  Yes. SDIO func driver uses runtime PM and MMC_CAP_POWER_OFF_CARD is
enabled.

> Is it easy to reproduce the problem for you?
> 
 There are only two units out of many produced units that can always
reproduce this issue.
 
> >
> > > 2. Wen sdio_read_cccr() fails and when we decide to retry the UHS-I
> > > voltage switch. Then perhaps it could make sense to run a power cycle.
> > > But if so, we better do it only for that path.
> > >
> > > I will continue to look a bit, as I think there are really more issues
> > > that we may want to look into while looking at this piece of code.
> > > However, allow me some more time before I can provide some more ideas
> > > of how to move forward.
> >   In the actual project, we do encounter many relative issues about re-initialized card.
> >   The following two categories are the most common issue we met before.
> >   A. the SDIO card is initialized by UHS-I mode at the first time, but will be
> >      re-initialized by High Speed mode at the second time.
> >      ==> All this type of issues is relative with S18A in response of CMD5.
> >          And most of the issues are related to the interval between powering off and
> >          powering on card.
> >   B. If there is something wrong in the flow of voltage switch(after CMD11), card will
> >      always keep all data pins to low. And then it hangs up because data0 is always low.
> >   Hope this information will be helpful for you.
> 
> Thanks for sharing these details! I think we need to continue to debug
> this issue, to fully understand.
> 
> In principle, it sounds to me that maybe mmc_power_cycle(), isn't
> really successfully power-cycling the SDIO card. Perhaps insert a few
> delays or so in that code to see how that would affect things?
> 
> Anyway, how is the power to the SDIO card controlled in this case? Are
> you using a mmc-pwrseq?
> 
  vmmc is controlled through GPIO to supply 3.3v power.
  And the vqmmc is supplied from PMIC which is always 1.8v.
  (There is no 3.3v here. Perhaps this is one of the reasons to happen
this issues)

> >
> >   Anyway, we will wait for your advises.
> > >
> > > >         sdio_reset(host);
> > > >         mmc_go_idle(host);
> > > >         mmc_send_if_cond(host, host->ocr_avail);
> > > > --
> > > > 1.9.1
> > >
> > > Kind regards
> > > Uffe
> 
> I have a few patches in the pipe, which fixes some other problems in
> mmc_sdio_init_card(). Possibly those can be related, but I need a day
> or so to post them, let's see.
The codebase of this project is kernel-3.18. Maybe it is hard to apply 
these new patches. Anyway, We will try it when we get the patches.
Thanks. 


> 
> Kind regards
> Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
