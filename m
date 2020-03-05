Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8D4C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 07:39:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0231208C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 07:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dsf4ixRt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YITnAwVA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0231208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC6YshQkw+4sp6+TGI2IdnRHBFY8v8myXw3Y+uGL1LY=; b=Dsf4ixRtT6xdnJ
	uxr0nYXDN3Yd/TCF1N22Hq/CQgfpfeR9aIj0l5Z7NG1GPjREnubT3pxIU07McmA245a2o9lMtNhQE
	g8BX6syeOYLYVftswiEYGD4XOkfun5YLvo359FGeoe6DgDyr9944Iu8kjQVLVe6BW6UhV+0dT1oeg
	ImmVLBoJDv4yqiJURdOiAtabOc6iKxAO++QVXsSlg/Zn6OxUC91NaH3iMHh+qf/4WO4olq33uTn47
	wUKT8i2uqssQp/FOZl5Xr5CqnRhDHb4803UmzPH2QGQTpG1tEfo9vCWmSNud3+DNuL2Fi45ZOtXEN
	62wiv2rG6jtupqa5cpSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9l6V-00079j-MW; Thu, 05 Mar 2020 07:39:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9l6J-0006zA-Im; Thu, 05 Mar 2020 07:39:25 +0000
X-UUID: 27dea743eda3439e9f837154b68a1aac-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UzudwNhVDUcthlnPvlM184xOjHlnmrBmdjwOXd3Z/P0=; 
 b=YITnAwVAD8iQoz0tsgHKLc4S6vZ7505O/om/CXejCt5781E85xGVoXjm6YEbRBOmO7rm+Xe1K0y1x+TRjleeOqdfqssmjMP6+mcOcmi0AbV70TH1burSk9aVRJD5oZErRPLyJ5Y6tl+QaDElqOAOJfoqim9QN7zywdA9JVOKjA0=;
X-UUID: 27dea743eda3439e9f837154b68a1aac-20200304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ran.bi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1183649210; Wed, 04 Mar 2020 23:39:10 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 23:38:18 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 5 Mar 2020 15:35:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 15:37:00 +0800
Message-ID: <1583393876.8521.15.camel@mhfsdcap03>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
From: Ran Bi <ran.bi@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 5 Mar 2020 15:37:56 +0800
In-Reply-To: <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580748607.31376.3.camel@mtksdaap41>
 <1581911502.20099.13.camel@mhfsdcap03>
 <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F43A3E10FD4B782182AA4645396F770C2D8067640B573F7D3D741AB006ECAD6B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_233923_629110_9382FA61 
X-CRM114-Status: GOOD (  26.52  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Friedl <josef.friedl@speed.at>,
 lkml <linux-kernel@vger.kernel.org>, Richard
 Fontana <rfontana@redhat.com>, Devicetree List <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 2020-03-04 at 20:59 +0800, Nicolas Boichat wrote:
> Hi,
> 
> On Mon, Feb 17, 2020 at 11:52 AM Ran Bi <ran.bi@mediatek.com> wrote:
> >
> > On Tue, 2020-02-04 at 00:50 +0800, Yingjoe Chen wrote:
> > > > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> > > > index f84b916..fffe34a 100644
> > > > --- a/include/linux/mfd/mt6397/rtc.h
> > > > +++ b/include/linux/mfd/mt6397/rtc.h
> > > > @@ -18,7 +18,8 @@
> > > >  #define RTC_BBPU_CBUSY         BIT(6)
> > > >  #define RTC_BBPU_KEY            (0x43 << 8)
> > > >
> > > > -#define RTC_WRTGR              0x003c
> > > > +#define RTC_WRTGR_MT6358       0x3a
> > > > +#define RTC_WRTGR_MT6397       0x3c
> > > >
> > > >  #define RTC_IRQ_STA            0x0002
> > > >  #define RTC_IRQ_STA_AL         BIT(0)
> > > > @@ -57,6 +58,10 @@
> > > >  #define MTK_RTC_POLL_DELAY_US  10
> > > >  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> > > >
> > > > +struct mtk_rtc_data {
> > > > +   u32                     wrtgr;
> > > > +};
> > > > +
> > > >  struct mt6397_rtc {
> > > >     struct device           *dev;
> > > >     struct rtc_device       *rtc_dev;
> > > > @@ -66,6 +71,15 @@ struct mt6397_rtc {
> > > >     struct regmap           *regmap;
> > > >     int                     irq;
> > > >     u32                     addr_base;
> > > > +   const struct mtk_rtc_data *data;
> > > > +};
> > > > +
> > > > +static const struct mtk_rtc_data mt6358_rtc_data = {
> > > > +   .wrtgr = RTC_WRTGR_MT6358,
> > > > +};
> > > > +
> > > > +static const struct mtk_rtc_data mt6397_rtc_data = {
> > > > +   .wrtgr = RTC_WRTGR_MT6397,
> > > >  };
> > >
> > > Hi,
> > >
> > > Putting these in header file doesn't looks right to me.
> > > Who need this? can you move them back to rtc-mt6397.c?
> > > Joe.C
> > >
> >
> > This could also effect kernel/drivers/power/reset/mt6323-poweroff.c
> > which using same region of RTC registers.
> > There are 2 ways of modification:
> > 1. kernel/drivers/rtc/rtc-mt6397.c implement do_pwroff function and
> > export to mt6323-poweroff.c
> > 2. Just modify mt6323-poweroff.c file to compatible this patch. I mean
> > using RTC_WRTGR_MT6397 to replace RTC_WRTGR. Or modify mt6323-poweroff.c
> > like rtc-mt6397.c
> 
> Oh, I see, so basically both rtc-mt6397.c and mt6323-poweroff.c need
> to know at what offset RTC_WRTGR actually is. Correct?
> 

Yes, you are right both drivers need to know RTC_WRTGR offset. Offsets
of other registers are the same.

> Is there any plan to have mt6323-poweroff.c support any of the other
> PMICs (not just MT6323?)?
> 

Currently, we don't have a plan to let mt6323-poweroff.c support other
PMICs. Because other PMICs like mt6397 and mt6358 could using
arm-trust-firmware PSCI power off flow instead. mt6323-poweroff.c was
prepared for platform without arm-trust-firmware.

> a. If not, I'd just add:
> #define RTC_WRTGR_MT6323 RTC_WRTGR_MT6397
> in rtc.h, for added clarity, use that in mt6323-poweroff.c
> (s/RTC_WRTGR/RTC_WRTGR_MT6323/), and be done with it.
> 

I would just change RTC_WRTGR to RTC_WRTGR_MT6397 in mt6323-poweroff.c
at next patchset.

> Actually, even if there's a plan, you can go ahead with this simpler
> solution for now, and fix later when the issue comes up.
> 
> b. If you ever want to support multiple PMICs with mt6323-poweroff.c,
> you'd need that offset for 2 different sub-devices under the same mfd,
> so the matching logic belongs in the main mfd device, not in
> rtc/poweroff driver.
> 
> So I'd move the matching logic in drivers/mfd/mt6397-core.c, and add
> rtc_wrtgr offset (or a full _data structure) to `struct mt6397_chip`,
> or, probably better, add a IORESOURCE_REG to the matching resources to
> specify the offset (that's what drivers/mfd/88pm860x-core.c seems to
> be doing, for example).
> 
> And then mt6323-poweroff.c should probably be renamed to mt6397-poweroff.c.
> 
> (actually, looking at this, I'm even questioning if mt6323-poweroff.c
> should even exist, and if you should just fold it into rtc-mt6397.c?
> Since they use the same registers?)
> 

mt6323-poweroff.c which hijack pm_power_off pointer is only for platform
without arm-trust-firmware. This is the reason I am considering
mt6323-poweroff.c should not be folded into rtc-mt6397.c.

> Hope this makes sense?
> 
> Best,

Thanks for your suggestions.

Best,
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
