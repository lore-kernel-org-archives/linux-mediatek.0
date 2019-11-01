Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DE5CA9EC9
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 06:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F2120656
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 06:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOSoXe9a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F2120656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQt2HFOZYo/P8JX1/H/uOHNuiS4cXqTwm3P2R0iOKmE=; b=TOSoXe9aFTh0DZ
	x708xvQZJ4RQJwFHsLvuGyOWVUSgSlWeXVAEbKzfC6h7prinXZSuklU5J3U8vdZMFLPHMAWF6Z+pn
	xnZx/0jyPVbPfZ5JyJq/zqfZHD0EzyXUKtrEPjlxNcsSw6rXx1qmRoKFE5tZ4nT71Nx3Mg+KHVbOE
	EVSdpDc0veimhm+oQD3TJ3kLJg6st/yaU42pcoNl7tVZgvKviuW2zzf1ypKug8geW+JyXOb2yYzVY
	F7pkBINGuR246QyKeloE2wmj5f3OdB4GmGuqWz/R0C2N4E/dcYjwHgQFpl1deN0EXHc9RNmOCkHVb
	hB0fRo8+6lYEqveVpxfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQQ8f-0006PY-UJ; Fri, 01 Nov 2019 06:10:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQQ8R-0005ZT-QU; Fri, 01 Nov 2019 06:10:17 +0000
X-UUID: 24e65507c1494c7aa813e1e79f3bcbee-20191031
X-UUID: 24e65507c1494c7aa813e1e79f3bcbee-20191031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1339201955; Thu, 31 Oct 2019 22:10:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 23:09:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 14:09:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 1 Nov 2019 14:09:57 +0800
Message-ID: <1572588602.6939.1.camel@mtksdaap41>
Subject: Re: [PATCH v5 3/3] PM / AVS: SVS: Introduce SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Fri, 1 Nov 2019 14:10:02 +0800
In-Reply-To: <CANdKZ0dAWWy7QMMZhNHAha5ZpcBo1GHebPc5_FRu5gvBc569QA@mail.gmail.com>
References: <20190906100514.30803-1-roger.lu@mediatek.com>
 <20190906100514.30803-4-roger.lu@mediatek.com>
 <CANdKZ0dAWWy7QMMZhNHAha5ZpcBo1GHebPc5_FRu5gvBc569QA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 37EE6EFD37277920D5707B79253F0016321E83FB9A72C31F0E381067B1C135692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_231012_082260_FFF00FF9 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, yt.lee@mediatek.com, Fan
 Chen <fan.chen@mediatek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth
 Menon <nm@ti.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Pi-Hsun,

Thanks for reminding me. I'll add dev_pm_opp_put(opp) in the next
patchset.

On Mon, 2019-10-21 at 15:51 +0800, Pi-Hsun Shih wrote:
> Hi Roger,
> 
> On Fri, Sep 6, 2019 at 6:06 PM Roger Lu <roger.lu@mediatek.com> wrote:
> > ...
> > +static int svs_resource_setup(struct mtk_svs *svs)
> > ...
> > +               for (i = 0, freq = (u32)-1; i < svsb->opp_count; i++, freq--) {
> > +                       opp = dev_pm_opp_find_freq_floor(svsb->dev, &freq);
> > +                       if (IS_ERR(opp)) {
> > +                               pr_err("%s: error opp entry!!, err = %ld\n",
> > +                                      svsb->name, PTR_ERR(opp));
> > +                               return PTR_ERR(opp);
> > +                       }
> > +
> > +                       svsb->opp_freqs[i] = freq;
> > +                       svsb->opp_volts[i] = dev_pm_opp_get_voltage(opp);
> > +                       svsb->freqs_pct[i] = percent(svsb->opp_freqs[i],
> > +                                                    svsb->freq_base) & 0xff;
> 
> Should have dev_pm_opp_put(opp); here.
Sure. Thanks.

> 
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > ...
> > +static int svs_status_proc_show(struct seq_file *m, void *v)
> > ...
> > +       for (i = 0, freq = (u32)-1; i < svsb->opp_count; i++, freq--) {
> > +               opp = dev_pm_opp_find_freq_floor(svsb->dev, &freq);
> > +               if (IS_ERR(opp)) {
> > +                       seq_printf(m, "%s: error opp entry!!, err = %ld\n",
> > +                                  svsb->name, PTR_ERR(opp));
> > +                       return PTR_ERR(opp);
> > +               }
> > +
> > +               seq_printf(m, "opp_freqs[%02u]: %lu, volts[%02u]: %lu, ",
> > +                          i, freq, i, dev_pm_opp_get_voltage(opp));
> > +               seq_printf(m, "svsb_volts[%02u]: 0x%x, freqs_pct[%02u]: %u\n",
> > +                          i, svsb->volts[i], i, svsb->freqs_pct[i]);
> 
> Same here.
Sure. Thanks.

> 
> > +       }
> > +
> > +       return 0;
> > +}
> > ...



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
