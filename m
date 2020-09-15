Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB66C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8637D20738
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cN/QCu5X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="saX+E0IT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8637D20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mIaDZFivJVZMW6Jh2tcFiFBpSyoCyNSJL9rpwSpZm9M=; b=cN/QCu5X3f/bgLqj1+TNbyLHC
	OEuz4TXfZzbBBWBgEvcQ6vFTJJZkb6/q6m9yEjoeNng608+w3BAkgm9OtnU+kvCSQFBVOEUCIqjJe
	FpRaESdztdIJueD415Tyl6BtMxYzPO9RF4W6yM1nACpxKPtEihHpnjAXx84SnsE23sVgcSsU75SQb
	akrlG+qBZPhy3GsRZLQ3uDYknnoWgceLbO9udkDErXLP3rLsAfgoBpyM6JoXTAeaq+tWpWd9sRlkB
	uTM3WGrHtSrqG5JWSz4o9NVvsKjUVvp43tLao3HAdJVvQS/horGy5nn7moUKixuCHzdv3xfNYuLNh
	an+q4GKPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHzk7-0003Ne-DP; Tue, 15 Sep 2020 01:26:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHzk3-0003MU-1v; Tue, 15 Sep 2020 01:26:44 +0000
X-UUID: def8f2c501134b57a0836a6e5d060a36-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=v1LAQZT/+da26rpDxPw8oEAIptxIIsuOkmEvO0weCVA=; 
 b=saX+E0ITo7RPpXuo6nhwQ3xxkMZViPxpWSDX9sVGN1cm7YMpkYb35kLKmnkw9WU/co5FhKV/emydW0fuMfYTSCzcuqTahtCwuvy1Nn5AO/UrnGm9xff9sWAZDMW9pYMsYg7VDLG4/YPdlv5zSn8C6Ab9sjzqjPobb1vmSxfxYM0=;
X-UUID: def8f2c501134b57a0836a6e5d060a36-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1366704192; Mon, 14 Sep 2020 17:26:34 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 18:26:32 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Sep 2020 09:26:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 09:26:29 +0800
Message-ID: <1600133066.25719.9.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
From: Qii Wang <qii.wang@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Sep 2020 09:24:26 +0800
In-Reply-To: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
 <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72A8E3EE9FC676B4DD2AB151602F01D4F7A087AFF58CB94C603E5F97AE3294AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_212643_247558_232387E9 
X-CRM114-Status: GOOD (  25.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Wolfram Sang <wsa@the-dreams.de>,
 Leilk Liu <leilk.liu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 15:48 +0300, Andy Shevchenko wrote:
> On Sat, Sep 12, 2020 at 9:02 AM <qii.wang@mediatek.com> wrote:
> >
> > From: Qii Wang <qii.wang@mediatek.com>
> >
> > The master code needs to being sent when the speed is more than
> > I2C_MAX_FAST_MODE_PLUS_FREQ instead of
> > I2C_MAX_HIGH_SPEED_MODE_FREQ. Fix it.
> >
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index efc1404..0cbdfbe 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
> >         unsigned int cnt_mul;
> >         int ret = -EINVAL;
> >
> > -       if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> > -               target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
> > +       if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> > +               target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
> 
> Thanks for fixing this. Indeed, somehow I messed these up.
> 
> >
> >         max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
> >         base_step_cnt = max_step_cnt;
> > @@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
> >         for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
> >                 clk_src = parent_clk / clk_div;
> >
> > -               if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
> > +               if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
> 
> But this one is not related. Original code used to have
> 
> #define MAX_FS_MODE_SPEED              400000
> 
>        if (target_speed > MAX_FS_MODE_SPEED) {
> 
> And this change doesn't fix the above mentioned problem.
> 
> So, please split into two separate changes.
> 

ok, Thank you for your comments

> >                         /* Set master code speed register */
> >                         ret = mtk_i2c_calculate_speed(i2c, clk_src,
> >                                                       I2C_MAX_FAST_MODE_FREQ,
> > --
> > 1.9.1
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
