Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF6BC11F66
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E2B61249
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E2B61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTFtb5q9F+OufQhabyRSx58pdYWNGjCIrBSdGovIuoE=; b=quDuAkwO4dNXBW
	FkkUTl1VyCyrHL7YEF7JeoB4jWT+kYfxI9U5QpjSQZK9eSdsphqulouK4z+BXbTdy7n+gHbgD7XD1
	LhxjZjmSt4+l0jsoj5IqjSWl8450e4VRAr0D8VnL8us01wLc8J5TFL3vqWagi2u8Nrmep/116nPzr
	5PNvfQCxhJb2dVo5rf90t8YJPoRMhA8kr1LSDvRaT/6V2xl9Pbo+zVXRuVyIvCNYa5dlKHOYEOPqQ
	5P6AN3Nnq3fDqIy1NYvv173Od0KNDDF0bT+041H3/Vhj25qgq9NyGo2TKNy2HpAq6EqEX7oV4W2x6
	opR4iE5wjhAhqHnWLGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2r10-006WI7-Lw; Mon, 12 Jul 2021 08:10:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2r0x-006WGk-Cn; Mon, 12 Jul 2021 08:10:09 +0000
X-UUID: c675db921c414e84a7299430baf90b56-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pYihUe16LMSA8Z5B8sReIfUro/yCMswXaige3lLlv3k=; 
 b=WH3RlvhMtzj5bi2g9GfaCo+Qjkau9BbZftNtDEhMvaunJb4wP5HVjQ9MGlDoAKJV5/RUX6mA/F0BfkDUssc72SEuowPyFrG8JNGOgS5HzMKvQvkRBzY7hW5xO4h0MQQuMQ6erTW+g4QTQvKOyYE6hf+BdfG/bMOsO/luqbrahTs=;
X-UUID: c675db921c414e84a7299430baf90b56-20210712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 536291358; Mon, 12 Jul 2021 01:10:03 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 01:07:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 16:07:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 16:07:07 +0800
Message-ID: <1626077227.7221.20.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 06/14] media: mtk-vcodec: Add irq interface for core
 hardware
From: mtk12024 <yunfei.dong@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Jul 2021 16:07:07 +0800
In-Reply-To: <CA+Px+wWRE0DR15GgorZnoN1xdAqoau94gkoF7-x7h2hd21ZGXg@mail.gmail.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-7-yunfei.dong@mediatek.com>
 <CA+Px+wWRE0DR15GgorZnoN1xdAqoau94gkoF7-x7h2hd21ZGXg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_011007_490445_BAAC2535 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Tzung-Bi,

Thanks for your detail feedback.
I add the description according to your each comments.

On Fri, 2021-07-09 at 15:59 +0800, Tzung-Bi Shih wrote:
> On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > +static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
> > +{
> > +       if (dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
> > +               return 1;
> > +       else if (dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE)
> > +               return 2;
> > +       else
> > +               return 0;
> > +}
> Use a switch .. case .. would be easier to read.
Yes
> Would it be better to use some macro or enums for the magic numbers?
Yes, add enums for magic numbers. 
enum mtk_vdec_hw_count {
	MTK_VDEC_NO_HW = 0,
	MTK_VDEC_ONE_CORE,
	MTK_VDEC_ONE_LAT_ONE_CORE,
	MTK_VDEC_MAX_HW_COUNT,
};
> > @@ -113,8 +114,7 @@ static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
> >         }
> >
> >         ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> > -                               mtk_vdec_comp_irq_handler,
> > -                               0, pdev->name, dev);
> > +                               mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
> The change is irrelevant to this patch.
Will fix.
> > @@ -154,8 +154,10 @@ static int mtk_vdec_comp_probe(struct platform_device *pdev)
> >                 dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> >
> >         ret = mtk_vdec_comp_init_irq(dev);
> > -       if (ret)
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Failed to register irq handler.\n");
> >                 goto err;
> > +       }
> The change shouldn't be in this patch.  Instead, another patch that
> adds the mtk_vdec_comp_init_irq() invocation.
> 
> > +int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
> Remove the extra space before "*ctx".
Wil fix.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
