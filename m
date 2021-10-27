Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B466FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E6C7610A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E6C7610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M968lHzt8l3Kthntdni2/vdkrOD3BpwysqjulgkH9bo=; b=aDnkrv4MiYnayG
	NIN+HfeXz4EHZG0UNzK9VkZOXm/pzAW7pHNNBXwALgYMrj7jFFqXn7vMtvCB30Ff4eipBQE9e+uYe
	x3VqdYCD5VRz1AJAgKi3szm8vhEqtfAFxcJkQD8XrfqHOsiwjMboplU4XD9iFrCXacASGpR6zPfIp
	6MkNrDgEVSTrasgOg8qOumFafCvsFp2Y5AWTyfvOAVdrFGPDdizvCrWLvrH/wVmT1tW0RdO3rhLWr
	9MZPMfxlEe0xsy0+tqJttn+8qhkeZurA9V5XWQBJfpKZSebJLAO0Ye4QUMgCe+8PSywtqxUezf9L+
	Jzii1SRVyYriqX3lDCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfa0t-003m9Z-0w; Wed, 27 Oct 2021 03:54:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfa0h-003m6p-Hg; Wed, 27 Oct 2021 03:53:56 +0000
X-UUID: 3c35bfe4eb9a463b930bdeba9059fee9-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KatCz9XKGgtCBLEzEVLf0OO9NA8gS5alukduL27YpSU=; 
 b=rLJWOuTKzukOyNpV1HwETlbGN4XuakW34dVx/z20HvLwj9f7nAsUwr9HUVnRBv01CY2pTvUiG6omqe0TTzk69wbno6cRsVIva51qOkkF62MJP6xaysKxW59WTktnoG7u7v5x3AArZdfo0RYp2jaHz6o62BJWbrp10z7jvYwXOoc=;
X-UUID: 3c35bfe4eb9a463b930bdeba9059fee9-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 554026981; Tue, 26 Oct 2021 20:53:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 20:44:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Oct 2021 11:44:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 11:44:35 +0800
Message-ID: <629c605bc547a3d025eace87eb5f1ef724c2f080.camel@mediatek.com>
Subject: Re: [PATCH v7, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 11:44:35 +0800
In-Reply-To: <5e1c165d-176c-0141-dc96-0fdbda367c03@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-13-yunfei.dong@mediatek.com>
 <5e1c165d-176c-0141-dc96-0fdbda367c03@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_205355_621160_070E73B0 
X-CRM114-Status: GOOD (  22.07  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.
On Thu, 2021-10-14 at 13:02 +0200, AngeloGioacchino Del Regno wrote:
> > Use the dma_set_mask_and_coherent helper to set vdec
> > DMA bit mask to support 34bits iova space(16GB) that
> > the mt8192 iommu HW support.
> > 
> > Whole the iova range separate to 0~4G/4G~8G/8G~12G/12G~16G,
> > regarding which iova range VDEC actually locate, it
> > depends on the dma-ranges property of vdec dtsi node.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index de83e3b821b4..da963cdac96b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -376,6 +376,9 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   		}
> >   	}
> >   
> > +	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> > +		dma_set_mask_and_coherent(&pdev->dev,
> > DMA_BIT_MASK(34));
> > +
> 
Will fix in patch v8.
> This function returns 0 for success, or negative number for failure:
> please check
> the return value, or this driver may not work correctly in some
> corner cases.
> 
> Regards,
> - Angelo
> 
> >   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
> >   		mutex_init(&dev->dec_mutex[i]);
> >   	spin_lock_init(&dev->irqlock);
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
