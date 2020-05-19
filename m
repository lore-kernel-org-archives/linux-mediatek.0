Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A0BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 02:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD862075F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 02:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLPlTPdl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hfb1/kAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD862075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEL0Fu3UTUTBDjswmiUcZ+SjTugSzKXuX+5zYIbkW7A=; b=kLPlTPdl9KMmt+
	2b23p07U6Ei9KL4eXOef1TtFp9GQrxIDJzkrOOuRuOSdkQ7BHaQScK+DSy/BfdYGZOzmqoGS1GTDg
	wxBAt8+NiqO9QbEwwS15oItoqeML6rGKMNBHG8MaSMqV/nM2UQ1qgYv5ObEUsWzXMo9RJKg3SYTsV
	RqqO+TEjcLNCzpU+wLYANWOdrd3oYcvO4BoxSxokcRn07DfE1m5cnqnY7eQLjTJbyv4USrvlRLiMh
	qDVHrHMam9fo1VkKHfOgcUPQoSSM6SWCfbsR3fB/sdFSXWj3QrgknvrqVKGEPN53FpcavdxdQJxg7
	aT79tEtJFAfr0hqWoMtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jasTn-0001pd-P8; Tue, 19 May 2020 02:59:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jasTc-0001gQ-GQ; Tue, 19 May 2020 02:59:33 +0000
X-UUID: 252051eb575b46c18f0f01d725b0f314-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=M+o0Anz4/UQjLm5nYoVibliTyzmVqym+xJdpP5blyMg=; 
 b=Hfb1/kAcOMyc62ESYxEaNe9rl85iTGBbye1u2kksbh65RXJ/yGx23mtBAhLKezkSCdBF8Q3sh19OqhMixugH6/LkpgS4Y3+k+Nlp/GnY0FoSR4Y7kqF9mJDxD0EA4nBnOLW8vDTEyeIenlvNDv23Kp2epA7Xr+UARfVcANG+sOM=;
X-UUID: 252051eb575b46c18f0f01d725b0f314-20200518
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 652344176; Mon, 18 May 2020 18:59:30 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 19:59:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 May 2020 10:59:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 10:59:21 +0800
Message-ID: <1589857073.25512.34.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From: Qii Wang <qii.wang@mediatek.com>
To: Joe Perches <joe@perches.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2020 10:57:53 +0800
In-Reply-To: <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
 <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E488EF03A7622D1ADEEB7C7CD1CCABA41B9EB17953038A2511499CEDEE1E7E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_195932_553660_66057EF0 
X-CRM114-Status: GOOD (  19.83  )
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
 Wolfram Sang <wsa@the-dreams.de>, leilk.liu@mediatek.com, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-18 at 17:44 +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> > This patch adds a algorithm to calculate some ac-timing parameters
> > which can fully meet I2C Spec.
> >
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
> >  1 file changed, 277 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 0ca6c38a..7020618 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> 
> > +/*
> > + * Check and Calculate i2c ac-timing
> > + *
> > + * Hardware design:
> > + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> > + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> > + *
> > + * Sample_ns is rounded down for xxx_cnt_div would be greater
> > + * than the smallest spec.
> > + * The sda_timing is chosen as the middle value between
> > + * the largest and smallest.
> > + */
> > +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> > +                                  unsigned int clk_src,
> > +                                  unsigned int check_speed,
> > +                                  unsigned int step_cnt,
> > +                                  unsigned int sample_cnt)
> > +{
> > +       const struct i2c_spec_values *spec;
> > +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> > +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> 
> So sample_ns is a 64-bit value. Is that really needed?
> 

(1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
* (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.

I think 1000000000 and clk_src is too big, maybe I can reduce then with
be divided all by 1000.
example:

unsigned int sample_ns;
unsigned int clk_src_khz = clk_src / 1000;

if(clk_src_khz)
	sample_ns = (1000000 * (sample_cnt + 1)) / clk_src_khz;
else
	return -EINVAL;

> > +       if (!i2c->dev_comp->timing_adjust)
> > +               return 0;
> > +
> > +       if (i2c->dev_comp->ltiming_adjust)
> > +               max_sta_cnt = 0x100;
> > +
> > +       spec = mtk_i2c_get_spec(check_speed);
> > +
> > +       if (i2c->dev_comp->ltiming_adjust)
> > +               clk_ns = 1000000000 / clk_src;
> > +       else
> > +               clk_ns = sample_ns / 2;
> > +
> > +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> > +       if (su_sta_cnt > max_sta_cnt)
> > +               return -1;
> > +
> > +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);
> 
> So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)
> 
> noreply@ellerman.id.au reports:
> 
>     ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
>     ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
> 
> for 32-bit builds.
> 
> > +       max_step_cnt = mtk_i2c_max_step_cnt(check_speed);
> > +       if ((2 * step_cnt) > low_cnt && low_cnt < max_step_cnt) {
> > +               if (low_cnt > step_cnt) {
> > +                       high_cnt = 2 * step_cnt - low_cnt;
> > +               } else {
> > +                       high_cnt = step_cnt;
> > +                       low_cnt = step_cnt;
> > +               }
> > +       } else {
> > +               return -2;
> > +       }
> > +
> > +       sda_max = spec->max_hd_dat_ns / sample_ns;
> > +       if (sda_max > low_cnt)
> > +               sda_max = 0;
> > +
> > +       sda_min = DIV_ROUND_UP(spec->min_su_dat_ns, sample_ns);
> 
> One more.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
