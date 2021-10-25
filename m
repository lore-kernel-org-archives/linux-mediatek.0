Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 03:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4578760FBF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 03:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4578760FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvrsJoPEVmiPX+Mg4PlngeLnVgjm20wvDJ+ncQUOtYA=; b=Zt3O9c3uJ18F05
	FW24Zo5M8f709QJwwPXtpwyMs87XLsWOyfVrUtWIyxHeaMsuPAcdes61mfPLQ7Oy2zTb1kn0HjT7I
	yLeLtxplbv5NLbB155pqoEuYPdZxUAiMIAML6kWqd8jjbYot9CDOxP1qDQg2CmH5/dhz7ifFx6QwZ
	e+wchich9N7BLEZyWmqC0QoCsOHgSUnve+3fL/5Ekn5VqwaK8WTGO0mGoYqxvehtiDSybQqwr0vXs
	CuOQOE2xyTHqQ5+IVyxI5ajFHsMQza4FQL6VRNNIKGZU6g+gzTL/zHbImREutidHhH1BexnAFOZay
	TP0t5pzkASaI0qfTm8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meqM5-00F4eB-Vn; Mon, 25 Oct 2021 03:08:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meqM3-00F4dS-Va; Mon, 25 Oct 2021 03:08:57 +0000
X-UUID: 39188ab04a2a4e238e783c5ec0cdfa36-20211024
X-UUID: 39188ab04a2a4e238e783c5ec0cdfa36-20211024
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1853782293; Sun, 24 Oct 2021 20:08:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Oct 2021 20:08:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Oct 2021 11:08:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 11:08:46 +0800
Message-ID: <4b22df368dc3c8b93eb458c94b20f1138900ffa0.camel@mediatek.com>
Subject: Re: [PATCH] mailbox: remove the error message when gce clk is defer
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Date: Mon, 25 Oct 2021 11:08:46 +0800
In-Reply-To: <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
References: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
 <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_200856_058306_033AD067 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Russell,

Thanks for the reviews.


On Sun, 2021-10-24 at 21:25 +0100, Russell King (Oracle) wrote:
> On Sun, Oct 24, 2021 at 12:48:31AM +0800, jason-jh.lin wrote:
> > Remove the error message when gce clk is defer.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index fd5576a9f8b4..684b8aa1e445 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  				snprintf(clk_id, sizeof(clk_id),
> > "%s%d", clk_name, alias_id);
> >  				cmdq->clocks[alias_id].id = clk_id;
> >  				cmdq->clocks[alias_id].clk =
> > of_clk_get(node, 0);
> > -				if (IS_ERR(cmdq->clocks[alias_id].clk)) 
> > {
> > +				if (IS_ERR(cmdq->clocks[alias_id].clk)
> > &&
> > +				    PTR_ERR(cmdq->clocks[alias_id].clk) 
> > != -EPROBE_DEFER) {
> >  					dev_err(dev, "failed to get gce
> > clk: %d\n", alias_id);
> >  					return PTR_ERR(cmdq-
> > >clocks[alias_id].clk);
> >  				}
> 
> So when you get -EPROBE_DEFER, you omit the error message _and_
> ignore
> the -EPROBE_DEFER. Is that really what you want to do?
> 

Oh, you're right. I should return the -EPROBE_DEFER.

I just want to ignore the error msg because gce clk may not ready while
gce probing.

I'll update this patch at next version.

-- 
Regrads,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
