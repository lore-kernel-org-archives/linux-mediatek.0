Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7866CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 09:11:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C30E222BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 09:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JWT8udwT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C30E222BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8Y/DT3hSAUxGNf35Zqdgq7kewg8bC7YtTJRuwufEGc=; b=JWT8udwTGZXxvp
	MQA711XcrLufZ4jfL3niHDKTEQN5zP3nldKMwBZYMpiH5ZWtoMe5dr/6Yx1Op9BLjGdNvQ38l3eSi
	aDpO6TpWwtDOGgKCXprIB57eCVUkTNBlwCxSRiSgpAKkbUP7kzzWFpGa6O/JbZymtacONtZRqSwvJ
	j3RI6BvRpqVp1DoEBTUAnJdU5qL7YHHTRBFLXoDusGcaALPVdgcuMPsF0kbk2LbV4gBaCqfi3hmhn
	Is5lhnrhjjCbX12iQ708pDXBC4HLJjkFxXttrNC6fhat7WXaPuNFc+67hBtjW2KKLXaJNsyofgKVN
	vxa3NNCns3NU/wgMZOWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLOHv-0008J8-7P; Fri, 18 Oct 2019 09:11:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLOHs-0008I8-0d; Fri, 18 Oct 2019 09:11:09 +0000
X-UUID: 85dd635cae1d4460bdbb6f0179ef34af-20191018
X-UUID: 85dd635cae1d4460bdbb6f0179ef34af-20191018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1153757082; Fri, 18 Oct 2019 01:10:23 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 18 Oct 2019 02:10:59 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 18 Oct 2019 17:10:56 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 18 Oct 2019 17:10:55 +0800
Message-ID: <1571389858.28949.13.camel@mhfsdcap03>
Subject: Re: [PATCH v8 6/6] usb: musb: Add support for MediaTek musb controller
From: Min Guo <min.guo@mediatek.com>
To: Tony Lindgren <tony@atomide.com>
Date: Fri, 18 Oct 2019 17:10:58 +0800
In-Reply-To: <20191017163433.GN5610@atomide.com>
References: <20191017094126.29045-1-min.guo@mediatek.com>
 <20191017094126.29045-7-min.guo@mediatek.com>
 <20191017163433.GN5610@atomide.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13098244CDB25E873947D08018311C68E73616178ECC778BC1294947B6B966362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_021108_055537_C6B80877 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yonglong Wu <yonglong.wu@mediatek.com>, hdegoede@redhat.com, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, Alan
 Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
On Thu, 2019-10-17 at 09:34 -0700, Tony Lindgren wrote:
> Hi,
> 
> Just few comments for future changes that might help below.
> 
> * min.guo@mediatek.com <min.guo@mediatek.com> [191017 09:42]:
> > --- /dev/null
> > +++ b/drivers/usb/musb/mediatek.c
> > +static int musb_usb_role_sx_set(struct device *dev, enum usb_role role)
> > +{
> > +	struct mtk_glue *glue = dev_get_drvdata(dev);
> > +	struct musb *musb = glue->musb;
> > +	u8 devctl = readb(musb->mregs + MUSB_DEVCTL);
> > +	enum usb_role new_role;
> > +
> > +	if (role == glue->role)
> > +		return 0;
> > +
> > +	switch (role) {
> > +	case USB_ROLE_HOST:
> > +		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
> > +		glue->phy_mode = PHY_MODE_USB_HOST;
> > +		new_role = USB_ROLE_HOST;
> > +		if (glue->role == USB_ROLE_NONE)
> > +			phy_power_on(glue->phy);
> > +
> > +		devctl |= MUSB_DEVCTL_SESSION;
> > +		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
> > +		MUSB_HST_MODE(musb);
> > +		break;
> > +	case USB_ROLE_DEVICE:
> > +		musb->xceiv->otg->state = OTG_STATE_B_IDLE;
> > +		glue->phy_mode = PHY_MODE_USB_DEVICE;
> > +		new_role = USB_ROLE_DEVICE;
> > +		devctl &= ~MUSB_DEVCTL_SESSION;
> > +		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
> > +		if (glue->role == USB_ROLE_NONE)
> > +			phy_power_on(glue->phy);
> > +
> > +		MUSB_DEV_MODE(musb);
> > +		break;
> > +	case USB_ROLE_NONE:
> > +		glue->phy_mode = PHY_MODE_USB_OTG;
> > +		new_role = USB_ROLE_NONE;
> > +		devctl &= ~MUSB_DEVCTL_SESSION;
> > +		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
> > +		if (glue->role != USB_ROLE_NONE)
> > +			phy_power_off(glue->phy);
> > +
> > +		break;
> > +	default:
> > +		dev_err(glue->dev, "Invalid State\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	glue->role = new_role;
> > +	phy_set_mode(glue->phy, glue->phy_mode);
> > +
> > +	return 0;
> > +}
> 
> For the role change, I recently posted a patch "[PATCH 4/7] usb: musb:
> Add musb_set_host and peripheral and use them for omap2430". That
> should work for you looking at the code above, so later on you might
> want to change to use that. Probably best done as a follow-up patch
> to avoid adding extra dependencies to your series.
OK, thanks. I will try this patch.

> Please also note that musb core attempts to do things automagically
> on it's own. So trying to force mode in general does not work reliably.
> This is because VBUS may not yet have risen for example.
VBUS control is through a GPIO on MediaTek musb controller. The host/device switching method is to use the driver of gpio-usb-b-connector, it sets the debounce of GPIO, the link of patch is as follows:
	Usb: roles: add USB Type-B GPIO connector driver
	Https://patchwork.kernel.org/patch/10966361/

> The role change is best done based on the USB PHY as then usually
> musb has already switched to the right mode automatically :)
Considering the use of type-c connector later, the foce phy method is used.

> > +static const struct musb_platform_ops mtk_musb_ops = {
> > +	.quirks = MUSB_DMA_INVENTRA,
> > +	.init = mtk_musb_init,
> > +	.get_toggle = mtk_musb_get_toggle,
> > +	.set_toggle = mtk_musb_set_toggle,
> > +	.exit = mtk_musb_exit,
> > +#ifdef CONFIG_USB_INVENTRA_DMA
> > +	.dma_init = musbhs_dma_controller_create_noirq,
> > +	.dma_exit = musbhs_dma_controller_destroy,
> > +#endif
> > +	.clearb = mtk_musb_clearb,
> > +	.clearw = mtk_musb_clearw,
> > +	.busctl_offset = mtk_musb_busctl_offset,
> > +	.set_mode = mtk_musb_set_mode,
> > +};
> 
> So you may want to consider getting rid of .set_mode completely
> and rely on USB PHY calls instead.
> 
> In some cases you need to use struct phy_companion for set_vbus
> depending how things are wired.
> 
> Regards,
> 
> Tony



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
