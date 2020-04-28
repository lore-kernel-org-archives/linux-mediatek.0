Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64021C83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 09:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364E320663
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 09:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HC2v7KR1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B20eOiTh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364E320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=no9CmkyP/5t3EzkBk9qw4JOhn3VER3MjXt3iPcnrdfA=; b=HC2v7KR1tFNJWj
	qaRqzBQoTLCCSE6JvE/H8GYF7ktuXbNdHcrhzFH0z7Gg5/km4fKdrbFXz30uaim5JSVIesJMtL7Ut
	HdRFMkYuGaqBEdl9VnE994qRP2HTFjF0KFUsEU0ALNm9KG0NbQdduH4wLLj628SOoJABS26GqhY5y
	tnbVVBqVuWOQEfj98out7nJPHAyW3n2KLitu2Wx2q8lmLHu8A7gJB904GD/3ZWnPWI66t/CSARdn4
	UAxwrFmjzEjKzUbn9eXhUeU7+Hw5c4RKpWav2u54+sLPwcZ6r7mvlxf5YkojOkSdqFBx73ufDwtEk
	9rOdje3eMwbAN5utEktg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMXW-0005D0-4D; Tue, 28 Apr 2020 09:28:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMXK-00051R-5b; Tue, 28 Apr 2020 09:28:19 +0000
X-UUID: 9a29e7e72cbe4ae6893718ca6ee2c864-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m3Ksv+ksgjGvXF0pXLMlpIAwkf0dzAHmcRs39NPBbsk=; 
 b=B20eOiTh7l/29srMJjLhvV6XU6dgavF3w0G5qapIRMzTQERJSWLXte/kGX19TPu/goL6PaCf7AHznx0QVxyIeSgqbT45LX3rChPq6vEVyB9bS9Rd/VaAToJ3TVslxM5LKvd+tiBhtlPazL2156Yd0Q/+9usO3eRk207zoAz0/XM=;
X-UUID: 9a29e7e72cbe4ae6893718ca6ee2c864-20200428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 890450091; Tue, 28 Apr 2020 01:28:13 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 02:28:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Apr 2020 17:28:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 17:28:04 +0800
Message-ID: <1588066038.30914.28.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] mmc: core: need do mmc_power_cycle in
 mmc_sdio_resend_if_cond
From: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Apr 2020 17:27:18 +0800
In-Reply-To: <CAPDyKFo40tBpowmWN3gxH8b=jMmCK8O5ALNQ7y6XZ5AosX=GUA@mail.gmail.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
 <1586835611-13857-2-git-send-email-yong.mao@mediatek.com>
 <CAPDyKFo40tBpowmWN3gxH8b=jMmCK8O5ALNQ7y6XZ5AosX=GUA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BAFC90E4F4919F58F4A0398CAB2A7E72863110198F1657AD58274E69C3418E782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_022818_235806_2A87A4C3 
X-CRM114-Status: GOOD (  24.96  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mka@chromium.org,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 2020-04-24 at 12:09 +0200, Ulf Hansson wrote:
> On Tue, 14 Apr 2020 at 05:40, Yong Mao <yong.mao@mediatek.com> wrote:
> >
> > From: yong mao <yong.mao@mediatek.com>
> >
> > When mmc_sdio_resned_if_cond is invoked, it indicates the SDIO
> > device is not in the right state. In this condition, the previous
> > implementation of mmc_sdio_resend_if_cond can't make sure SDIO
> > device be back to idle state. mmc_power_cycle can reset the SDIO
> > device by HW and also make sure SDIO device enter to idle state
> > correctly.
> >
> > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > ---
> >  drivers/mmc/core/sdio.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > index ebb387a..ada0a80 100644
> > --- a/drivers/mmc/core/sdio.c
> > +++ b/drivers/mmc/core/sdio.c
> > @@ -546,6 +546,7 @@ static int mmc_sdio_init_uhs_card(struct mmc_card *card)
> >  static void mmc_sdio_resend_if_cond(struct mmc_host *host,
> >                                     struct mmc_card *card)
> >  {
> > +       mmc_power_cycle(host, host->card->ocr);
> 
> This looks wrong to me. mmc_sdio_resend_if_cond() is called from two places.
> 
> 1. In the case when mmc_set_uhs_voltage() fails in
> mmc_sdio_init_card(), which means a call to mmc_power_cycle() has
> already been done.
> 
  Thanks for your comment.
  Yes. It is right that mmc_power_cycle() has already been done when
  mmc_sdio_resend_if_cond() is called. In normal re-initialization case, 
  this mmc_power_cycle() (currently in 1.8v voltage and 208Mhz clock) 
  can make SDIO device really back to idle state. Unfortunately, in some
  special SDIO device, it will enter to unstable state.

  At this unstable state, device may keep data0 always low after receiving CMD11.
  And then every other SDIO CMD can't be sent to device any more due to card 
  is busy(data0 is low). Therefore, previous implementation can't save the 
  device. At this time, mmc_power_cycle() may be the final solution to make 
  sure SDIO device can back to idle state correctly.

> 2. Wen sdio_read_cccr() fails and when we decide to retry the UHS-I
> voltage switch. Then perhaps it could make sense to run a power cycle.
> But if so, we better do it only for that path.
> 
> I will continue to look a bit, as I think there are really more issues
> that we may want to look into while looking at this piece of code.
> However, allow me some more time before I can provide some more ideas
> of how to move forward.
  In the actual project, we do encounter many relative issues about re-initialized card.
  The following two categories are the most common issue we met before.
  A. the SDIO card is initialized by UHS-I mode at the first time, but will be 
     re-initialized by High Speed mode at the second time.
     ==> All this type of issues is relative with S18A in response of CMD5.
	 And most of the issues are related to the interval between powering off and 
         powering on card.
  B. If there is something wrong in the flow of voltage switch(after CMD11), card will
     always keep all data pins to low. And then it hangs up because data0 is always low.
  Hope this information will be helpful for you.
  
  Anyway, we will wait for your advises. 
> 
> >         sdio_reset(host);
> >         mmc_go_idle(host);
> >         mmc_send_if_cond(host, host->ocr_avail);
> > --
> > 1.9.1
> 
> Kind regards
> Uffe



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
