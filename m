Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8406EC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5124B207ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTRPm4vh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="luKthv+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5124B207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9AXFxLSTQWg7cxNPCQKkMy3YBaGWdODwZBh9dlg8Lt4=; b=ZTRPm4vhzxxtV1
	7u6VnMHoAq3ft5H8+2xww6iNCXzBKxDam/qy5JHFP1abSkRpTuTUg6cJxxfGhJflqbjHnwlKNLoVR
	94uqnrOtKp67Z11PiYnVt1bCG42AEoW1nbAX+S1miwOOt8HsKloRjJVoPwUBrPM1ge4y+A8kS2cBs
	7tZ8YKGtsXtczg3cUqb49YRGpcqRJwPTUU8XSgDp6a3So3JuSV8Ciw4gNAx5lyByL+Zuow2884yGm
	vVU+qSbpKtqe7h3gGqEJtaaAJ7Qc7whmxx/lpsE9XjqeNnhWP0AhKoHrupl/Jz1TdWYamfX6o7eS4
	yRLw7Gf5mHO06zpdN30w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbKKc-0004YI-S4; Wed, 20 May 2020 08:44:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbKKZ-0004XU-N9; Wed, 20 May 2020 08:44:05 +0000
X-UUID: d3f0d11871f44e949601b0de0728d015-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u0K9CvT5HV61VJXYYwxkYfqIusTCbFNVtZQAS+tl34Q=; 
 b=luKthv+eR0xrTVxdbHlaDd4k9oQjtvxMr/QNDzQKGBVUKw9IbG4QylxeWXGAnoUEIq/uuYTOjxDKqm+S7hmCBRf1LP5w90XZzJ/qxaky9IISaUKd/S1BYII6L8HUemO/mjkt0y2GYvQKFekhcMC1h6UiyTaAxcoNwHWFRhpoCf4=;
X-UUID: d3f0d11871f44e949601b0de0728d015-20200520
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 864790960; Wed, 20 May 2020 00:43:59 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 01:43:54 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 May 2020 16:42:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 16:42:34 +0800
Message-ID: <1589964062.25512.67.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From: Qii Wang <qii.wang@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2020 16:41:02 +0800
In-Reply-To: <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
 <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
 <1589857073.25512.34.camel@mhfsdcap03>
 <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 419D878692A456EACB25265C39EB5C4831837D6DCD95B04EF9B86113CAB6032B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_014403_762923_A44E607F 
X-CRM114-Status: GOOD (  27.66  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
 Wolfram Sang <wsa@the-dreams.de>, leilk.liu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Linux
 I2C <linux-i2c@vger.kernel.org>, Joe Perches <joe@perches.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Geert,

On Tue, 2020-05-19 at 09:14 +0200, Geert Uytterhoeven wrote:
> Hi Qii,
> 
> On Tue, May 19, 2020 at 4:59 AM Qii Wang <qii.wang@mediatek.com> wrote:
> > On Mon, 2020-05-18 at 17:44 +0200, Geert Uytterhoeven wrote:
> > > On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> > > > This patch adds a algorithm to calculate some ac-timing parameters
> > > > which can fully meet I2C Spec.
> > > >
> > > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 277 insertions(+), 51 deletions(-)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > > > index 0ca6c38a..7020618 100644
> > > > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > > > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > >
> > > > +/*
> > > > + * Check and Calculate i2c ac-timing
> > > > + *
> > > > + * Hardware design:
> > > > + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> > > > + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> > > > + *
> > > > + * Sample_ns is rounded down for xxx_cnt_div would be greater
> > > > + * than the smallest spec.
> > > > + * The sda_timing is chosen as the middle value between
> > > > + * the largest and smallest.
> > > > + */
> > > > +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> > > > +                                  unsigned int clk_src,
> > > > +                                  unsigned int check_speed,
> > > > +                                  unsigned int step_cnt,
> > > > +                                  unsigned int sample_cnt)
> > > > +{
> > > > +       const struct i2c_spec_values *spec;
> > > > +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> > > > +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > > > +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > >
> > > So sample_ns is a 64-bit value. Is that really needed?
> > >
> >
> > (1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
> > * (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.
> 
> The intermediate value will indeed not fit in 32-bit.
> But that doesn't mean the end result won't fit in 32-bit.
> As you divide spec->min_low_ns and spec->min_su_dat_ns (which I assume
> are small numbers) by sample_ns below, sample_ns cannot be very large,
> or the quotient will be zero anyway.
> So just doing the multiplication in 64-bit, followed by a 64-by-32
> division is probably fine:
> 
>     unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1), clk_src);
> 
> You may want to take precautions for the case where the passed value of
> clk_src is a small number (can that happen?).
> 
> BTW, clk_get_rate() returns "unsigned long", while mtk_i2c_set_speed()
> takes an "unsigned int" parent_clk, which may cause future issues.
> You may want to change that to "unsigned long", along the whole
> propagation path, and use div64_ul() instead of div_u64() above.
> 

The return type of div_u64 is u64(unsigned long long), there is a
compulsory type conversion operator. Do you think it is needed?
BTW, we just need to change the type of sample_ns to unsigned int, no
matter which method is used, what is your opinion?

> > I think 1000000000 and clk_src is too big, maybe I can reduce then with
> > be divided all by 1000.
> > example:
> >
> > unsigned int sample_ns;
> > unsigned int clk_src_khz = clk_src / 1000;
> 
> That may cause too much loss of precision.
> 

clk_src is more than MHz and less than GHZ for MTK i2c controller, so it
wouldn't cause too much loss of precision.

> >
> > if(clk_src_khz)
> >         sample_ns = (1000000 * (sample_cnt + 1)) / clk_src_khz;
> > else
> >         return -EINVAL;
> >
> > > > +       if (!i2c->dev_comp->timing_adjust)
> > > > +               return 0;
> > > > +
> > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > +               max_sta_cnt = 0x100;
> > > > +
> > > > +       spec = mtk_i2c_get_spec(check_speed);
> > > > +
> > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > +               clk_ns = 1000000000 / clk_src;
> > > > +       else
> > > > +               clk_ns = sample_ns / 2;
> > > > +
> > > > +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> > > > +       if (su_sta_cnt > max_sta_cnt)
> > > > +               return -1;
> > > > +
> > > > +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);
> > >
> > > So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
