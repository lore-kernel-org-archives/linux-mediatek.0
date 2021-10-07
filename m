Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC34C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 02:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CD561177
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 02:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93CD561177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eHgqFAGTyGM2cQSaUbQLl5LPvc2umJ9I7urzHlaWHk=; b=DM54izqe/iiEbA
	Vl95eWi4rTp5HnET8bnv5MarSgAO92E9NAEw8dkheF0LfbLA0EXZ2rA9w1Rak3oTlcWUkZryGDNpC
	10DndL11UF5cDY2IUFhZU51SB6Xqteb5WGtKytUhKCMixgB0BIf9aXpAsABf3iiK1927HlCxvvFRv
	Z42v3os3IWFVquFEkx7ZEBXAPRfinGcoJpN4DEDDu1irxcfU6Ya5UBP7ycBlNYlTp8NXjZPCzClst
	e3akzBL/L3CWO1Vk+AJEXjTPO6LKZUNZo4Pr4yJu3NjT6ThVlu/zzMeIy0xEJNj01SKgRBIrkFXve
	vpIH0wpWYnscf87Bg2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYJaz-00G2E7-Jw; Thu, 07 Oct 2021 02:57:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYJal-00G2Bg-Ux; Thu, 07 Oct 2021 02:57:09 +0000
X-UUID: 56df245d033c4d079b5957b5e4dfb173-20211006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=puAeYVHv80gaLD3QPUVP0U9ZlM4HRv166FTTO6hr2Lk=; 
 b=LqzMu5O1Ak1GXXXZIGexmWg/0ZCTwsSG5We2XLOH6iO7Ba4RPqZF5ht9oZZ69+uMg+JklvO1wEOXebFap0K1/ydqHp0no/CJKw0h7AA/w2OoRanFVNXcLOl70D13Lna3urZ/5YBRsjcFc+CPP8WM5CE1JtRZPqAeGH5mq87dze0=;
X-UUID: 56df245d033c4d079b5957b5e4dfb173-20211006
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1683890687; Wed, 06 Oct 2021 19:57:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Oct 2021 19:57:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Oct 2021 10:57:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Oct 2021 10:56:58 +0800
Message-ID: <7703076927822fc31d1af37f8fd3bfe5e0513d29.camel@mediatek.com>
Subject: Re: [PATCH v8 09/12] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
Date: Thu, 7 Oct 2021 10:57:01 +0800
In-Reply-To: <f9829a5a-984c-bced-0286-53f9edc8ae3d@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-10-yong.wu@mediatek.com>
 <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
 <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
 <f9829a5a-984c-bced-0286-53f9edc8ae3d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_195708_010935_FFEF1198 
X-CRM114-Status: GOOD (  35.11  )
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

On Thu, 2021-09-30 at 12:57 +0200, Dafna Hirschfeld wrote:
> 
> On 30.09.21 05:28, Yong Wu wrote:
> > Hi Dafna,
> > 
> > Thanks very much for the review.
> > 
> > On Wed, 2021-09-29 at 14:13 +0200, Dafna Hirschfeld wrote:
> > > 
> > > On 29.09.21 03:37, Yong Wu wrote:
> > > > MediaTek IOMMU has already added the device_link between the
> > > > consumer
> > > > and smi-larb device. If the vcodec device call the
> > > > pm_runtime_get_sync,
> > > > the smi-larb's pm_runtime_get_sync also be called
> > > > automatically.
> > > > 
> > > > CC: Tiffany Lin <tiffany.lin@mediatek.com>
> > > > CC: Irui Wang <irui.wang@mediatek.com>
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > Reviewed-by: Evan Green <evgreen@chromium.org>
> > > > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > > > Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > ---
> > > >    .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 +++----
> > > > -------
> > > > --
> > > >    .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> > > >    .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> > > >    .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 +++----
> > > > -------

[snip]

> > > >    void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> > > >    {
> > > >    	pm_runtime_disable(dev->pm.dev);
> > > > -	put_device(dev->pm.larbvdec);
> > > >    }
> > > 
> > > Now that functions only do  'pm_runtime_disable(dev->pm.dev);' so
> > > it
> > > will be more
> > > readable to remove the function mtk_vcodec_release_dec_pm
> > > and replace with pm_runtime_disable(dev->pm.dev);
> > > Same for the 'enc' equivalent.
> > 
> > Make sense. But It may be not proper if using pm_runtime_disable
> > as the symmetry with mtk_vcodec_init_dec_pm in the
> > mtk_vcodec_probe.
> > 
> > Maybe we should move pm_runtime_enable out from
> > mtk_vcodec_init_dec_pm
> > into mtk_vcodec_probe. I could do a new patch for this. Is this ok
> > for
> > you?
> 
> yes, there is also asymettry when calling pm_runtime* in general,
> I see in the decoder it is called from mtk_vcodec_dec_pm.c
> but in the encoder it is called from mtk_vcodec_enc.c,
> 
> I think all calls to pm_runtime* should be out of the *_pm.c files

OK. I will try this.

> since for example 'mtk_vcodec_dec_pw_on' also do just one call to
> pm_runtime_resume_and_get so this function can also be removed.

I guess this one should be reserved to vcodec guys. I see this function
is changed at [1]. Let's keep this patchset clean.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20210901083215.25984-10-yunfei.dong@mediatek.com/

> 
> thanks,
> Dafna
> 
> > 
> > > 
> > > Thanks,
> > > Dafna
> > 
> > [snip]
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
