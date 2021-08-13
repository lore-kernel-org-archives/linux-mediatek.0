Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431B3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:09:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1683B60FBF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1683B60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATNkU0sTjqq1/O1Qxlyk8UESz53EfV2CGrQMZTcD1P8=; b=HLkcg2+Hc+ZkcM
	/tHJ19mwAgbX2HrNGZbqCLFT9/PQKmziMrF/GRxhJk/c6rxsfKGVQbHJVtUu62826vMXgkYgeR8Zi
	Mlm+Zamfbs5Rj3YglYT467jQvswekuAa+4eHAGEUl3NHRgumTYmbliuNo4AJ+wP3QvKqecvMFaYiJ
	C7rhXhJqXX+VoMFO9iogIXf2lN0pj61mWou6pX2s2aF3QNIWa5J7zuSXRuHymllrdOBTeJP9h7sTW
	VPSD6MOFRqCODAzU9IHoYl7s9nFJOOU1IBgPcDkthIwik8dEeWJFeEnSdS6L1X2IM3HzSzARLgQK2
	AMlTt1FyPHs+wSeH/N0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZkL-00D4LP-5P; Fri, 13 Aug 2021 16:09:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZkG-00D4Jc-Jf
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 16:09:24 +0000
X-UUID: 0460738d3fca4cceb9f998f711297a13-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=l+ySDnC1xxmiXel2dEsTe3+lMh8lrZDZ747TEAnrsjA=; 
 b=FJBJbcfwkb/+oAn8oeC++RRZk6hAAJPtdiywRe37rZAxQ9ggqI8fGtO1IwGd2jwiFDMIGQ8qlKfDqvNf3FOQLS4yqSRF9CYOwouh2kPrqDQ/K3C05uvnOelZPPTE8pykld/QO4Dilz+wlavOuGVWwCcUvHukAOFR/FFmVC6GzfM=;
X-UUID: 0460738d3fca4cceb9f998f711297a13-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1847385884; Fri, 13 Aug 2021 09:09:11 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 09:09:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 14 Aug 2021 00:09:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 14 Aug 2021 00:09:07 +0800
Message-ID: <bbe7e343d6788a3327aa5bc81509328568883c51.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: add LED support
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, MeiChia Chiu <MeiChia.Chiu@mediatek.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Money
 Wang <money.wang@mediatek.com>
Date: Sat, 14 Aug 2021 00:09:08 +0800
In-Reply-To: <670252a9-636c-9d3d-5d6e-acfcabfff4c0@nbd.name>
References: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
 <670252a9-636c-9d3d-5d6e-acfcabfff4c0@nbd.name>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_090920_694579_270965EB 
X-CRM114-Status: GOOD (  16.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-08-13 at 12:52 +0200, Felix Fietkau wrote:
> On 2021-06-21 16:14, MeiChia Chiu wrote:
> > From: MeiChia Chiu <meichia.chiu@mediatek.com>
> > 
> > Initialize brightness_set and blink_set callbacks to enable LED
> > support.
> > 
> > Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Money Wang <money.wang@mediatek.com>
> > ---
> >  .../net/wireless/mediatek/mt76/mt7915/init.c | 69
> > +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  .../net/wireless/mediatek/mt76/mt7915/mmio.c |  6 +++--
> >  .../net/wireless/mediatek/mt76/mt7915/regs.h | 19 ++++++++++++++
> >  3 files changed, 92 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > index e027273..defb0ec 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> > @@ -151,6 +151,64 @@ static int mt7915_thermal_init(struct
> > mt7915_phy *phy)
> >  	return 0;
> >  }
> >  
> > +static void mt7915_led_set_config(struct led_classdev *led_cdev,
> > +				  u8 delay_on, u8 delay_off)
> > +{
> > +	struct mt7915_dev *dev;
> > +	struct mt76_dev *mt76;
> > +	u32 val;
> > +
> > +	mt76 = container_of(led_cdev, struct mt76_dev, led_cdev);
> > +	dev = container_of(mt76, struct mt7915_dev, mt76);
> > +
> > +	/* select TX blink mode, 2: only data frames */
> > +	mt76_rmw_field(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TX_BLINK, 2);
> 
> Does that mean the hw triggers the LED with the configured on/off
> delay
> on TX? I think blinking should be controlled entirely by software.
> 

Blink is still contolled by software. This means upper layer can set
on/off directly.


Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
