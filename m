Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E26C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:32:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22E5622242
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22E5622242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkcXphHuT7Q1gMc6NM77rw22Qk2KMjKVt1vOkSNo0BA=; b=Zzb/psaaKKKrRofb2yYOA+FCOx
	fOg15JOoS9UGoJitdPsDj3dWumVnwvAQvlmHtDDJHCMgvYKeo83qqIXYI08u4X5kYoSSBkLk2o0MX
	bNBWBom8Y02vGI0Rq3s23tO5UsDNljqWn9FeYuL8Zud8TkzvkxcibKmlNvY8mWhD+RNEmL3tUxwh1
	jcbICi8HnDMy6i0H8IVHFglhDrxr491NZC/hAEMkLCoFbZFkEKQ1fKlbxVL5jM6walxfdSIlLJgrq
	lADyhMaXyE5g0brB5tQuuo2Ixh3IRvGP14+YZB/np8F9+uv5o1/vxpTuOzOcbgBBYJBpZ+mAK0M/u
	doPw7BtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krt0O-0001qu-Jx; Wed, 23 Dec 2020 01:31:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krt0H-0001ok-I0; Wed, 23 Dec 2020 01:31:51 +0000
X-UUID: c875dfb141884595a6df2d0693f9dd2f-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xZSMGNycrUGCDcc+7tKfKZ1TjnIFUd/ecXWYJopv86Q=; 
 b=MuTzwgtTPxToCm+XYb+xNDDKmBwf6e6AcEaKd281ns+cFVWwPM+DZ5aNJ/VpSbpa+St5LwuoDMNFaLkcyTDj/aGf6oYI/Ye/uPAMqI6YUt56z2z0xu8ZGaKzahxVJhYgU5TFheDgDqk3DxRkBgmlDCYGsHtSApPpOVRqFo2ivtY=;
X-UUID: c875dfb141884595a6df2d0693f9dd2f-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 304366369; Tue, 22 Dec 2020 17:31:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:23:52 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:23:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:23:46 +0800
Message-ID: <1608686629.18252.8.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 07/17] drm/mediatek: add disp config and mm 26mhz
 clock into mutex device
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 23 Dec 2020 09:23:49 +0800
In-Reply-To: <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_203149_879294_55C1FD32 
X-CRM114-Status: GOOD (  27.38  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-15 at 21:37 +0800, Nicolas Boichat wrote:
> On Sat, Dec 12, 2020 at 12:12 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > there are 2 more clock need enable for display.
> > parser these clock when mutex device probe,
> > enable and disable when mutex on/off
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > index 60788c1..de618a1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > @@ -118,7 +118,7 @@ struct mtk_ddp_data {
> >
> >  struct mtk_ddp {
> >         struct device                   *dev;
> > -       struct clk                      *clk;
> > +       struct clk                      *clk[3];
> >         void __iomem                    *regs;
> >         struct mtk_disp_mutex           mutex[10];
> >         const struct mtk_ddp_data       *data;
> > @@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
> >  {
> >         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> >                                            mutex[mutex->id]);
> > -       return clk_prepare_enable(ddp->clk);
> > +       int ret;
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +               if (IS_ERR(ddp->clk[i]))
> > +                       continue;
> > +               ret = clk_prepare_enable(ddp->clk[i]);
> > +               if (ret) {
> > +                       pr_err("failed to enable clock, err %d. i:%d\n",
> > +                               ret, i);
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +
> > +err:
> > +       while (--i >= 0)
> > +               clk_disable_unprepare(ddp->clk[i]);
> > +       return ret;
> >  }
> >
> >  void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
> >  {
> >         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> >                                            mutex[mutex->id]);
> > -       clk_disable_unprepare(ddp->clk);
> > +       int i;
> > +
> > +        for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +               if (IS_ERR(ddp->clk[i]))
> > +                       continue;
> > +               clk_disable_unprepare(ddp->clk[i]);
> > +       }
> >  }
> >
> >  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> > @@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
> >         ddp->data = of_device_get_match_data(dev);
> >
> >         if (!ddp->data->no_clk) {
> > -               ddp->clk = devm_clk_get(dev, NULL);
> > -               if (IS_ERR(ddp->clk)) {
> > -                       if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> > -                               dev_err(dev, "Failed to get clock\n");
> > -                       return PTR_ERR(ddp->clk);
> > +               int ret;
> > +
> > +               for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +                       ddp->clk[i] = of_clk_get(dev->of_node, i);
> > +
> > +                       if (IS_ERR(ddp->clk[i])) {
> > +                               ret = PTR_ERR(ddp->clk[i]);
> > +                               if (ret != EPROBE_DEFER)
> > +                                       dev_err(dev, "Failed to get clock %d\n",
> > +                                               ret);
> > +
> > +                               return ret;
> > +                       }
> 
> Use of_clk_bulk_get_all instead?
> 
> ddp->num_clks = of_clk_bulk_get_all(dev->of_node, &ddp->clks);
> ...
> 
> Then the calls above can be clk_bulk_enable/clk_bulk_disable using
> num_clks and clks.
> 

will be fixed in next version
> 
> >                 }
> >         }
> >
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
