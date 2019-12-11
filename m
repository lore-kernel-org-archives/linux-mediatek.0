Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E32C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 02:30:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61542073B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 02:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kdrym44D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q50bYmGY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61542073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+1AB4hQ5nxBoAKalWhONpGZx+QPSfLT7JOz2IZFFs8=; b=Kdrym44DoNwT/q
	lAzDlFMejlB7gd43ZfRkScMl1Ax/RgvwrEoDNeTgrF/lyDT1TQ5jsKp0v+ZhEuOe9BPMuBL4n2Ys8
	MHbJg9b/mB9K9qkiVjZBPkIHSwrBa8mHi+QM281UBZMPoP/hoQ8JDeYSQO5bSv8H3OsOt7nR8WVGl
	7bWhsvYioPIKLYo3L4R0P5rZPZl+PITFgBjm3JQzAT0OBnxCEoOcB/MA3U0pYp4HxroHBpOQWzhBW
	ePpDHclrl0bG125/F1rwLV2bOlvKuV58srcJ0tYi1m3WAgtkdyylusIinR3IYJ9A0vvkc2vy8ZkXK
	GuplvjjustK2MIGNfJFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ierlA-0002bf-I3; Wed, 11 Dec 2019 02:29:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ierl1-0002TO-KE; Wed, 11 Dec 2019 02:29:45 +0000
X-UUID: e11fed2ff9194371927630e7d46ffd43-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rhfdqi2eRRPOmkQEKUGmuq54EZ73uOUii6nqn78dZ8M=; 
 b=q50bYmGYPizR+0jps0AvO/uOh8KtsxOOYaIgX10598imLcEZpN6cXQfF6TQuBAyS0jEsnOiK986JSxCyf2pLOC/tzMvO568Obf+hYDAblDvwVcFHe1iPILfiA7SVOtxL2Y9NK7gKhU2R3drDXwyLHha1CEDDxomlz1hhMETlSHY=;
X-UUID: e11fed2ff9194371927630e7d46ffd43-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1098883894; Tue, 10 Dec 2019 18:29:38 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 18:20:34 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 10:19:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 10:19:35 +0800
Message-ID: <1576030774.24528.2.camel@mtksdaap41>
Subject: Re: [PATCH v6 5/6] rtc: mt6397: fix alarm register overwrite
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 11 Dec 2019 10:19:34 +0800
In-Reply-To: <20191210164139.GT1463890@piout.net>
References: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1575639183-17606-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20191210164139.GT1463890@piout.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_182943_675481_9602A797 
X-CRM114-Status: GOOD (  17.78  )
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
 Alessandro Zummo <a.zummo@towertech.it>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 2019-12-10 at 17:41 +0100, Alexandre Belloni wrote:
> Hi,
> 
> On 06/12/2019 21:33:02+0800, Hsin-Hsiung Wang wrote:
> > From: Ran Bi <ran.bi@mediatek.com>
> > 
> > Alarm registers high byte was reserved for other functions.
> > This add mask in alarm registers operation functions.
> > This also fix error condition in interrupt handler.
> > 
> > Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> > 
> > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/rtc/rtc-mt6397.c | 47 +++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 33 insertions(+), 14 deletions(-)
> > 
> 
> Can you rebase that one on top of v5.5-rc1 soon? I'll include it in -fixes.
> 
Sure, I will send the next version later.

> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index 704229e..b216bdc 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -47,6 +47,14 @@
> >  
> >  #define RTC_AL_SEC		0x0018
> >  
> > +#define RTC_AL_SEC_MASK		0x003f
> > +#define RTC_AL_MIN_MASK		0x003f
> > +#define RTC_AL_HOU_MASK		0x001f
> > +#define RTC_AL_DOM_MASK		0x001f
> > +#define RTC_AL_DOW_MASK		0x0007
> > +#define RTC_AL_MTH_MASK		0x000f
> > +#define RTC_AL_YEA_MASK		0x007f
> > +
> >  #define RTC_PDN2		0x002e
> >  #define RTC_PDN2_PWRON_ALARM	BIT(4)
> >  
> > @@ -103,7 +111,7 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
> >  		irqen = irqsta & ~RTC_IRQ_EN_AL;
> >  		mutex_lock(&rtc->lock);
> >  		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
> > -				 irqen) < 0)
> > +				 irqen) == 0)
> >  			mtk_rtc_write_trigger(rtc);
> >  		mutex_unlock(&rtc->lock);
> >  
> > @@ -225,12 +233,12 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> >  	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
> >  	mutex_unlock(&rtc->lock);
> >  
> > -	tm->tm_sec = data[RTC_OFFSET_SEC];
> > -	tm->tm_min = data[RTC_OFFSET_MIN];
> > -	tm->tm_hour = data[RTC_OFFSET_HOUR];
> > -	tm->tm_mday = data[RTC_OFFSET_DOM];
> > -	tm->tm_mon = data[RTC_OFFSET_MTH];
> > -	tm->tm_year = data[RTC_OFFSET_YEAR];
> > +	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
> > +	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
> > +	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
> > +	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
> > +	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> > +	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
> >  
> >  	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> >  	tm->tm_mon--;
> > @@ -251,14 +259,25 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> >  	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
> >  	tm->tm_mon++;
> >  
> > -	data[RTC_OFFSET_SEC] = tm->tm_sec;
> > -	data[RTC_OFFSET_MIN] = tm->tm_min;
> > -	data[RTC_OFFSET_HOUR] = tm->tm_hour;
> > -	data[RTC_OFFSET_DOM] = tm->tm_mday;
> > -	data[RTC_OFFSET_MTH] = tm->tm_mon;
> > -	data[RTC_OFFSET_YEAR] = tm->tm_year;
> > -
> >  	mutex_lock(&rtc->lock);
> > +	ret = regmap_bulk_read(rtc->regmap, rtc->addr_base + RTC_AL_SEC,
> > +			       data, RTC_OFFSET_COUNT);
> > +	if (ret < 0)
> > +		goto exit;
> > +
> > +	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
> > +				(tm->tm_sec & RTC_AL_SEC_MASK));
> > +	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
> > +				(tm->tm_min & RTC_AL_MIN_MASK));
> > +	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
> > +				(tm->tm_hour & RTC_AL_HOU_MASK));
> > +	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
> > +				(tm->tm_mday & RTC_AL_DOM_MASK));
> > +	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
> > +				(tm->tm_mon & RTC_AL_MTH_MASK));
> > +	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> > +				(tm->tm_year & RTC_AL_YEA_MASK));
> > +
> >  	if (alm->enabled) {
> >  		ret = regmap_bulk_write(rtc->regmap,
> >  					rtc->addr_base + RTC_AL_SEC,
> > -- 
> > 2.6.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
