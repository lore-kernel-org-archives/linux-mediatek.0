Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1328FC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D21792072A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hU6bdiIP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SjfdFlS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D21792072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ/N66Tdjo+XaEs+hRuzuen1e7HY1x+xyKm+vJP65hY=; b=hU6bdiIPcR1SDl
	zK3C6UifsGiN+VghoXyMDr4/kDhrCUwgpCO56w9c/qRwRhVQvLjDaXpWyz6NyuxAKVPBm6m8KEcjt
	MtcmEg+alZnKduFG1dI8SqVDflFXmsa8DqlIOJC3UZA83D7F/cMZ28mjhMIfNgFyHQHz1cd0TSC9G
	8BFv7Hribh+12FS9VnT7rY0V+JIbAPM+/9MRenyAs7XUHysjtysoGZkdUAEweQUDfuNaYU0hfYM/9
	lJlIz205QHddYEewmBkXcN/Vkxq2ehaa8vYAXyT6sp9B7xV36e69WFSKMIRABpP0+ptkkVoYvBItH
	RwTOhxlOtQTpL7y/qvsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9TdJ-0005M3-10; Wed, 04 Mar 2020 13:00:17 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9TdB-0004mn-62
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 13:00:11 +0000
Received: by mail-qv1-xf41.google.com with SMTP id p3so724349qvq.0
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2020 05:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Beu3qvFTUH06Rlm0/R7E/eA87SF87SDv5KPlGbUEFUY=;
 b=SjfdFlS3wO55dVhIbilav3RQtVBWgW91Cnb/+8n7jkIY3LxEaXZNW4wSRZ1w0P+Y2Z
 m2wcVG3v4ccrUcE2gOaZ9eeheXa1jOFC15/2rUmkBSsjvSz5A70/65MZ8+07ABoV8gmL
 lUJOwfGxVQgX8ZwatFqrgLAj0QQ4QVNzVsKWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Beu3qvFTUH06Rlm0/R7E/eA87SF87SDv5KPlGbUEFUY=;
 b=iVahuCHvOOfnpDn4Ub4kFePhjVdykIj9B0/W0Og1k5uSuCMurvkOpoPmBnpk6LIE76
 /4PgK5+7Xh1982x+Ruhf5v3SV8PtAsCHU/OaCK9X8BJ30j50kCH84V5/MTNUcLNOojOm
 DQ+QvPhexHg0enyPN8ToXlmGvP34zTukDFyRyv+iwOu1WNZntPVS5mMd1quGHQL5QtSV
 WCpBlNyX8sFB/etw60aPzTClS8IsNsFVCwYCYeRDY1x3i8HQq6bN6+mQy3L3Zr/Nw1o2
 z1KPa/Tj2BHXzRc/nxxQaTeIV5KMH3OpvL67OCM5OIe4EvJNyh7WvcZq5Ee42731UHFP
 +EKQ==
X-Gm-Message-State: ANhLgQ0Vj5PuhbeBM0DBE4/3HesmOSTJ+HDzquKgS9nn+DKzlRxQhTbP
 8uC9QS0f/sXvc04q0dXrlQp5Gycwys7XiDqEeNEC5w==
X-Google-Smtp-Source: ADFU+vvAPd9eUBLgxOcz8KO1mdbkjC+PQUvSPfxQ3LEaj+3mlGdcvGhxsv7PsukxnD5IbwUM3xFfAimQpPOT+wKAGoo=
X-Received: by 2002:a05:6214:1750:: with SMTP id
 dc16mr1985308qvb.47.1583326806377; 
 Wed, 04 Mar 2020 05:00:06 -0800 (PST)
MIME-Version: 1.0
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580748607.31376.3.camel@mtksdaap41> <1581911502.20099.13.camel@mhfsdcap03>
In-Reply-To: <1581911502.20099.13.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 4 Mar 2020 20:59:55 +0800
Message-ID: <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
To: Ran Bi <ran.bi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_050009_265084_B416DAC5 
X-CRM114-Status: GOOD (  18.96  )
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
 lkml <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
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

On Mon, Feb 17, 2020 at 11:52 AM Ran Bi <ran.bi@mediatek.com> wrote:
>
> On Tue, 2020-02-04 at 00:50 +0800, Yingjoe Chen wrote:
> > > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> > > index f84b916..fffe34a 100644
> > > --- a/include/linux/mfd/mt6397/rtc.h
> > > +++ b/include/linux/mfd/mt6397/rtc.h
> > > @@ -18,7 +18,8 @@
> > >  #define RTC_BBPU_CBUSY         BIT(6)
> > >  #define RTC_BBPU_KEY            (0x43 << 8)
> > >
> > > -#define RTC_WRTGR              0x003c
> > > +#define RTC_WRTGR_MT6358       0x3a
> > > +#define RTC_WRTGR_MT6397       0x3c
> > >
> > >  #define RTC_IRQ_STA            0x0002
> > >  #define RTC_IRQ_STA_AL         BIT(0)
> > > @@ -57,6 +58,10 @@
> > >  #define MTK_RTC_POLL_DELAY_US  10
> > >  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> > >
> > > +struct mtk_rtc_data {
> > > +   u32                     wrtgr;
> > > +};
> > > +
> > >  struct mt6397_rtc {
> > >     struct device           *dev;
> > >     struct rtc_device       *rtc_dev;
> > > @@ -66,6 +71,15 @@ struct mt6397_rtc {
> > >     struct regmap           *regmap;
> > >     int                     irq;
> > >     u32                     addr_base;
> > > +   const struct mtk_rtc_data *data;
> > > +};
> > > +
> > > +static const struct mtk_rtc_data mt6358_rtc_data = {
> > > +   .wrtgr = RTC_WRTGR_MT6358,
> > > +};
> > > +
> > > +static const struct mtk_rtc_data mt6397_rtc_data = {
> > > +   .wrtgr = RTC_WRTGR_MT6397,
> > >  };
> >
> > Hi,
> >
> > Putting these in header file doesn't looks right to me.
> > Who need this? can you move them back to rtc-mt6397.c?
> > Joe.C
> >
>
> This could also effect kernel/drivers/power/reset/mt6323-poweroff.c
> which using same region of RTC registers.
> There are 2 ways of modification:
> 1. kernel/drivers/rtc/rtc-mt6397.c implement do_pwroff function and
> export to mt6323-poweroff.c
> 2. Just modify mt6323-poweroff.c file to compatible this patch. I mean
> using RTC_WRTGR_MT6397 to replace RTC_WRTGR. Or modify mt6323-poweroff.c
> like rtc-mt6397.c

Oh, I see, so basically both rtc-mt6397.c and mt6323-poweroff.c need
to know at what offset RTC_WRTGR actually is. Correct?

Is there any plan to have mt6323-poweroff.c support any of the other
PMICs (not just MT6323?)?

a. If not, I'd just add:
#define RTC_WRTGR_MT6323 RTC_WRTGR_MT6397
in rtc.h, for added clarity, use that in mt6323-poweroff.c
(s/RTC_WRTGR/RTC_WRTGR_MT6323/), and be done with it.

Actually, even if there's a plan, you can go ahead with this simpler
solution for now, and fix later when the issue comes up.

b. If you ever want to support multiple PMICs with mt6323-poweroff.c,
you'd need that offset for 2 different sub-devices under the same mfd,
so the matching logic belongs in the main mfd device, not in
rtc/poweroff driver.

So I'd move the matching logic in drivers/mfd/mt6397-core.c, and add
rtc_wrtgr offset (or a full _data structure) to `struct mt6397_chip`,
or, probably better, add a IORESOURCE_REG to the matching resources to
specify the offset (that's what drivers/mfd/88pm860x-core.c seems to
be doing, for example).

And then mt6323-poweroff.c should probably be renamed to mt6397-poweroff.c.

(actually, looking at this, I'm even questioning if mt6323-poweroff.c
should even exist, and if you should just fold it into rtc-mt6397.c?
Since they use the same registers?)

Hope this makes sense?

Best,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
