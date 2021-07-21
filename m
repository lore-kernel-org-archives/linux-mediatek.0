Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFC0C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 09:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7A0611CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 09:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7A0611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36s/RcVsguu9YVouUv2v9NXW9L3O83P8TeYjhCIgrMs=; b=RRc0/hpQpHyf9z
	KhfttDoraLZ3E7LKYn1MT0tyJ3gPPk9WVZoZR9s5r2k8dnvH18SY1VQBI9sPBg+1EPByRJjB0zU0w
	dgpMohqZ8K4Ij/vC+KYeymM4ene8hLyZ+pO2A90VhPcScFDXdRJoVa+9IKdflr2Scnm94yzVSgJUo
	LtAcOXfj9SPogJAxJDLTJvLEQXx3LwDWxJ5aIxU+16PhubTYS3PYOseucCT2tzMoOjIVpM6zwrXuW
	HkA66jwnQ0cex74uGmjVSnpKxEbBM4NAL44gYyBWUjDo5ad7P3doUz25X4KLKvk1jWs8+YIxtGwQD
	W9xdIXxNgQ+K4SEGttYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m68vN-00F8l5-GP; Wed, 21 Jul 2021 09:53:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m68v9-00F8fq-Ex
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 09:53:44 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m68uy-0000iB-MM; Wed, 21 Jul 2021 11:53:32 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m68uw-0003Cy-QZ; Wed, 21 Jul 2021 11:53:30 +0200
Message-ID: <83b95ddab7c43ada71b7863522348aca076fe291.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com, 
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org,  matthias.bgg@gmail.com,
 jitao.shi@mediatek.com,  linux-arm-kernel@lists.infradead.org
Date: Wed, 21 Jul 2021 11:53:30 +0200
In-Reply-To: <a3227633-626d-10f5-c190-86dbf36a469c@collabora.com>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
 <039151e1f17676a101fb9c0682f5ee9fb8ad502d.camel@pengutronix.de>
 <a3227633-626d-10f5-c190-86dbf36a469c@collabora.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_025343_583463_690E3CF5 
X-CRM114-Status: GOOD (  22.32  )
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

On Tue, 2021-07-20 at 19:07 +0200, Enric Balletbo i Serra wrote:
> Hi Philipp,
> 
> Thank you to take a look
> 
> On 20/7/21 12:52, Philipp Zabel wrote:
> > Hi Enric,
> > 
> > On Wed, 2021-07-14 at 12:11 +0200, Enric Balletbo i Serra wrote:
> > > Among other features the mmsys driver should implement a reset
> > > controller to be able to reset different bits from their space.
> > > 
> > > Cc: Jitao Shi <jitao.shi@mediatek.com>
> > > Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > 
> > The reset controller driver looks fine, just two questions below.
> > 
> > > ---
> > > 
> > > (no changes since v1)
> > > 
> > >  drivers/soc/mediatek/mtk-mmsys.c | 69 ++++++++++++++++++++++++++++++++
> > >  drivers/soc/mediatek/mtk-mmsys.h |  2 +
> > >  2 files changed, 71 insertions(+)
> > > 
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > > index e681029fe804..6ac4deff0164 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > [...]
> > > @@ -91,6 +95,59 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> > [...]
> > > +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev, unsigned long id)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = mtk_mmsys_reset_assert(rcdev, id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	usleep_range(1000, 1100);
> > 
> > Is this known to be enough for all IP cores that can be reset by this
> > controller?
> > 
> 
> This time is copied from the downstream kernel, so, tbh, I am not totally sure
> is enough or needed. Let me try to reach the Mediatek people for if they can
> answer this.

That would be great. When this is resolved either way, feel free to add

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
