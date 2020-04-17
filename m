Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39BAC38A29
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 08:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FA322201
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 08:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uie7DXx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dWjdb0Qq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FA322201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2m2vsdHhcsPe8MnatorF/pMWmODw+V05cQYYB4yeVM8=; b=uie7DXx1M6mu60
	GtOFR1474GjpONpsl4aXjEKvLYvGkcVU2yn8L8sLjhoMadHm1qYXOq0I0KpUExdkVo5KOJWIT1EZf
	Lm5FgKFzWaL/MosA618e6sEc/KJcZaPa7TbmGiGwxU53OlhViTC/k3G4qCChBugpuQG9KHPzV25ND
	fsiJjIFqZ/TePgU49FX5uK7RPd726sh0PlbTPmHMZIMbFTYVrDAIluic0IqX84nMbeHoTn8LEMASL
	d+Tvnmn4lYZM+O3DmUQZvSUuRtxpBvItWDUneD5eyEZ1cqeENdQUeMyd1Ys7YOH67BgvwyOjPnJO1
	1MW7C2UMVSa+cEoNDtMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPMhm-0007RP-H6; Fri, 17 Apr 2020 08:50:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPMhd-0007JO-G1; Fri, 17 Apr 2020 08:50:26 +0000
X-UUID: aa163e5ede1946888b43677e2d2c2bfa-20200417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CvLwXNbZt4YLZj84U8Z1qWNABI7ku9CPPMrN1RBYWo4=; 
 b=dWjdb0Qq2FqWB9CgJutYv88Jk3cuRB6e7sGPsY1SmMa/L7HZ0B096+OwuUx1o+YirKE6alxIjAWXolVuUSYA3ZQ9EbzTXX5cjHVKXRwehlTq4cIHZTnxIyKBvdN2KghdETXHmmleq3bjuMUY6iPMfYLnbYUrZxvW2pQGWhyNoOU=;
X-UUID: aa163e5ede1946888b43677e2d2c2bfa-20200417
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ran.bi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1499942287; Fri, 17 Apr 2020 00:50:17 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Apr 2020 01:50:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Apr 2020 16:50:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Apr 2020 16:50:16 +0800
Message-ID: <1587113392.13323.3.camel@mhfsdcap03>
Subject: Re: [PATCH v12 5/6] rtc: mt6397: Add support for the MediaTek
 MT6358 RTC
From: Ran Bi <ran.bi@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 17 Apr 2020 16:49:52 +0800
In-Reply-To: <1587112169.12875.2.camel@mhfsdcap03>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200416091438.GA2167633@dell> <1587112169.12875.2.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_015025_545986_E73937BB 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kate
 Stewart <kstewart@linuxfoundation.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-04-17 at 16:29 +0800, Ran Bi wrote:
> On Thu, 2020-04-16 at 10:14 +0100, Lee Jones wrote:
> > On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:
> > 
> > > From: Ran Bi <ran.bi@mediatek.com>
> > > 
> > > This add support for the MediaTek MT6358 RTC. Driver using
> > > compatible data to store different RTC_WRTGR address offset.
> > > This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> > > driver which only needed by armv7 CPU without ATF.
> > > 
> > > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Acked-by: Sebastian Reichel <sre@kernel.org>
> > > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > 
> > Please place these in chronological order.  They should provide some
> > history, rather than a unordered slab list of random sign-offs.
> > 
> 
> I suppose that you mean the order should be like below, right?
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> 

Correction, I think following is the correct chronological order:
Signed-off-by: Ran Bi <ran.bi@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Sebastian Reichel <sre@kernel.org>
Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

> > > ---
> > >  drivers/power/reset/mt6323-poweroff.c |  2 +-
> > >  drivers/rtc/rtc-mt6397.c              | 18 +++++++++++++++---
> > >  include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
> > >  3 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > [...]
> > 
> > > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> > > index 7dfb63b..6200f3b 100644
> > > --- a/include/linux/mfd/mt6397/rtc.h
> > > +++ b/include/linux/mfd/mt6397/rtc.h
> > > @@ -18,7 +18,9 @@
> > >  #define RTC_BBPU_CBUSY         BIT(6)
> > >  #define RTC_BBPU_KEY            (0x43 << 8)
> > >  
> > > -#define RTC_WRTGR              0x003c
> > > +#define RTC_WRTGR_MT6358       0x3a
> > > +#define RTC_WRTGR_MT6397       0x3c
> > 
> > Why remove the leading 00's?
> > 
> > These are now different to the other regs defined in this header.
> > 
> 
> I will fix this at next patch.
> 
> > > +#define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
> > >  
> > >  #define RTC_IRQ_STA            0x0002
> > 
> > Like here for instance  --^
> > 
> > >  #define RTC_IRQ_STA_AL         BIT(0)
> > > @@ -65,6 +67,10 @@
> > >  #define MTK_RTC_POLL_DELAY_US  10
> > >  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> > >  
> > > +struct mtk_rtc_data {
> > > +	u32                     wrtgr;
> > > +};
> > > +
> > >  struct mt6397_rtc {
> > >  	struct device           *dev;
> > >  	struct rtc_device       *rtc_dev;
> > > @@ -74,6 +80,7 @@ struct mt6397_rtc {
> > >  	struct regmap           *regmap;
> > >  	int                     irq;
> > >  	u32                     addr_base;
> > > +	const struct mtk_rtc_data *data;
> > >  };
> > >  
> > >  #endif /* _LINUX_MFD_MT6397_RTC_H_ */
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
