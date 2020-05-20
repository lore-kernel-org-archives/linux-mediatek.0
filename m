Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445B3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 09:21:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8AE207D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 09:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kpNP2Tel";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jB5Lq1jX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8AE207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEoIyn3oQvE+689UIVnNDqRy07hEKEHSeLdx8zwGxjE=; b=kpNP2TelbfxMnn
	sXGKYCnWCCZiVtbmPfOD/GHiExEUXeClXKymxQ44JI489JQDJITNStZzxe1AMxz3UeJQnkB1B/F7A
	Fy+Tu4H4I+plr7oHhGR+sD0L7CWahTbD3rDeW0ou/onCu0Lu5kHhX7FUrXLD+wvR9YneLZmLoSG6g
	L+CsrN4sIhmcqiLjUqOfAbQWO8kSHmA7jHBjfzYxy/CKSlNihUJxmgURoAL9XYERagthLwYhLi2IO
	2K3+ftfW1UYKd29v33CZzM3dy9aMeAWFeMpLFV/5C5foPGyZV7xUEGmP8A6WgX5Q2SipGzo+JoaM5
	BHubDuixw57iDzV/60/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbKuy-00085j-Ee; Wed, 20 May 2020 09:21:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbKuv-000857-6Y; Wed, 20 May 2020 09:21:39 +0000
X-UUID: c41168c4cd144cbeaf6ed7ee7fbd3205-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K8ak0JSXJixdtwvCiossf6ujQlSNi19Cg+Ap0Gxff1k=; 
 b=jB5Lq1jXLZfuGavlSoFR4egUEO7naGFuPZGbOGKEO9WbQND6w26kXjRDf9s5AjQtEptwyDnEYaAGBdUjpj8CcXtWwj/dk9djZ90cKaKB7ZycW6aY9GKV42aWeydaVqhY4zBxcKEaLht+cqw52fTYiPLsI+XRNRF2tAqiEgz4PGA=;
X-UUID: c41168c4cd144cbeaf6ed7ee7fbd3205-20200520
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 141999083; Wed, 20 May 2020 01:21:25 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 02:16:02 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 May 2020 17:15:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 17:15:59 +0800
Message-ID: <1589966065.25512.70.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From: Qii Wang <qii.wang@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2020 17:14:25 +0800
In-Reply-To: <CAMuHMdXZTU+4-WyVjvv=i28x+MRVrAdRPM0_ybvkkFuh-ps+eg@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
 <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
 <1589857073.25512.34.camel@mhfsdcap03>
 <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
 <1589964062.25512.67.camel@mhfsdcap03>
 <CAMuHMdXZTU+4-WyVjvv=i28x+MRVrAdRPM0_ybvkkFuh-ps+eg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D677F009DFC332B6657700B42BB3688C0851682D969FAD19BE398644F5528A602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_022137_251496_79F6A81D 
X-CRM114-Status: GOOD (  34.48  )
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

On Wed, 2020-05-20 at 10:58 +0200, Geert Uytterhoeven wrote:
> Hi Qii,
> 
> On Wed, May 20, 2020 at 10:44 AM Qii Wang <qii.wang@mediatek.com> wrote:
> > On Tue, 2020-05-19 at 09:14 +0200, Geert Uytterhoeven wrote:
> > > On Tue, May 19, 2020 at 4:59 AM Qii Wang <qii.wang@mediatek.com> wrote:
> > > > On Mon, 2020-05-18 at 17:44 +0200, Geert Uytterhoeven wrote:
> > > > > On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> > > > > > This patch adds a algorithm to calculate some ac-timing parameters
> > > > > > which can fully meet I2C Spec.
> > > > > >
> > > > > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > > > > > ---
> > > > > >  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
> > > > > >  1 file changed, 277 insertions(+), 51 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > > > > > index 0ca6c38a..7020618 100644
> > > > > > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > > > > > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > > > >
> > > > > > +/*
> > > > > > + * Check and Calculate i2c ac-timing
> > > > > > + *
> > > > > > + * Hardware design:
> > > > > > + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> > > > > > + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> > > > > > + *
> > > > > > + * Sample_ns is rounded down for xxx_cnt_div would be greater
> > > > > > + * than the smallest spec.
> > > > > > + * The sda_timing is chosen as the middle value between
> > > > > > + * the largest and smallest.
> > > > > > + */
> > > > > > +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> > > > > > +                                  unsigned int clk_src,
> > > > > > +                                  unsigned int check_speed,
> > > > > > +                                  unsigned int step_cnt,
> > > > > > +                                  unsigned int sample_cnt)
> > > > > > +{
> > > > > > +       const struct i2c_spec_values *spec;
> > > > > > +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> > > > > > +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > > > > > +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > > > >
> > > > > So sample_ns is a 64-bit value. Is that really needed?
> > > > >
> > > >
> > > > (1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
> > > > * (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.
> > >
> > > The intermediate value will indeed not fit in 32-bit.
> > > But that doesn't mean the end result won't fit in 32-bit.
> > > As you divide spec->min_low_ns and spec->min_su_dat_ns (which I assume
> > > are small numbers) by sample_ns below, sample_ns cannot be very large,
> > > or the quotient will be zero anyway.
> > > So just doing the multiplication in 64-bit, followed by a 64-by-32
> > > division is probably fine:
> > >
> > >     unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1), clk_src);
> > >
> > > You may want to take precautions for the case where the passed value of
> > > clk_src is a small number (can that happen?).
> > >
> > > BTW, clk_get_rate() returns "unsigned long", while mtk_i2c_set_speed()
> > > takes an "unsigned int" parent_clk, which may cause future issues.
> > > You may want to change that to "unsigned long", along the whole
> > > propagation path, and use div64_ul() instead of div_u64() above.
> > >
> >
> > The return type of div_u64 is u64(unsigned long long), there is a
> > compulsory type conversion operator. Do you think it is needed?
> 
> The result of a 64-by-32 bit division may indeed not fit in 32-bit, so that's
> why it returns u64.
> If you know the quotient will always fit, it's fine.
> 
> > BTW, we just need to change the type of sample_ns to unsigned int, no
> > matter which method is used, what is your opinion?
> 
> Indeed.
> 
> BTW, I just realize
> 
>     long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> 
> wasn't doing what you wanted anyway, as 1000000000 is (implicit) int,
> and sample_cnt is unsigned int, so the multiplication was done in 32-bit,
> possible leading to a truncation.  Hence that division was done in 32-bit, too,
> that's why I didn't notice a call to __udivdi3() in the assembler output here.
> 
> So you have to force the multiplication to be done in 64-bit, e.g.
> by changing the constant to 1000000000ULL, and use div_u64() for
> the division.
> 

ok, I will give a patch with your way, thanks for your opinion.

> >
> > > > I think 1000000000 and clk_src is too big, maybe I can reduce then with
> > > > be divided all by 1000.
> > > > example:
> > > >
> > > > unsigned int sample_ns;
> > > > unsigned int clk_src_khz = clk_src / 1000;
> > >
> > > That may cause too much loss of precision.
> > >
> >
> > clk_src is more than MHz and less than GHZ for MTK i2c controller, so it
> > wouldn't cause too much loss of precision.
> 
> OK, so that would work, too.
> 
> > > >
> > > > if(clk_src_khz)
> > > >         sample_ns = (1000000 * (sample_cnt + 1)) / clk_src_khz;
> > > > else
> > > >         return -EINVAL;
> > > >
> > > > > > +       if (!i2c->dev_comp->timing_adjust)
> > > > > > +               return 0;
> > > > > > +
> > > > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > > > +               max_sta_cnt = 0x100;
> > > > > > +
> > > > > > +       spec = mtk_i2c_get_spec(check_speed);
> > > > > > +
> > > > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > > > +               clk_ns = 1000000000 / clk_src;
> > > > > > +       else
> > > > > > +               clk_ns = sample_ns / 2;
> > > > > > +
> > > > > > +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> > > > > > +       if (su_sta_cnt > max_sta_cnt)
> > > > > > +               return -1;
> > > > > > +
> > > > > > +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);
> > > > >
> > > > > So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
