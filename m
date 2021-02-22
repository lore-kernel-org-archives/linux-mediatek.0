Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE78DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 05:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7296D64EDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 05:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7296D64EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Eh4+aTim6urylbfk4KE1cejryOQFs/ECCIAOwMwKOo=; b=0PxIbu5zcLc7MoaB8qxjQ1rdM
	2Qjejm5QCfE6f5BI4ag4tKgqWff4V8/9NsTsGNZSNY3CvL7nSywn2qLb3nNeMU8ZPt6YL74xCXjqp
	PUXjhF2nVEhfPzdnVX0BHxDHiqiTjWecduIDFgQ2i1Mg9p2XQKZpBpxXaJsuyTZUNXNrhI+2PzWHv
	6YT4UsaKweLinAMk4Qf07+NvQ2DNSjCbnH0H/9By3iBF4bLOB/NJtgXdMBGjLTFzCgpZg3rg79hfT
	MbBMU2b74wJ8lqo/6R9Psy6tR6DPSwQIdekk/Ww2zO7kxhkEvzt511X/F8JSrXPXQ9SXO6frs+1xM
	+V833AZzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE478-0000On-Vj; Mon, 22 Feb 2021 05:50:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE476-0000OC-9S; Mon, 22 Feb 2021 05:50:33 +0000
X-UUID: c97ebb23a21e4185a889b33557f51563-20210221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nqKImsvcZdKwTXpwc5QzWpqx3pFjWlmpqLQWHoUe6n8=; 
 b=iqVn0YeGFmL10CIGj3iodQJEZNSIYp+dC+b3HHecjKQOq3PRzqFZicsw0vSCUaMGDROR+EX2on/fpe8GeixOlI2m9GT7GZSoIinJ9fDNDtxKgF43HhujE+dVM+v4hPIF/NRHxFljPHkO8OFMDF/2XObAfr767igeDVlUsvIXwQA=;
X-UUID: c97ebb23a21e4185a889b33557f51563-20210221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1757605988; Sun, 21 Feb 2021 21:50:24 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Feb 2021 21:50:23 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 22 Feb 2021 13:50:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Feb 2021 13:50:17 +0800
Message-ID: <1613973017.31669.5.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v2 2/3] usb: xhci-mtk: modify the SOF/ITP interval
 for mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Mon, 22 Feb 2021 13:50:17 +0800
In-Reply-To: <c0a65a3b-aec9-e27e-9110-9713596b9ecd@linux.intel.com>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
 <20210203102642.7353-2-chunfeng.yun@mediatek.com>
 <1612664833.5147.30.camel@mhfsdcap03>
 <c0a65a3b-aec9-e27e-9110-9713596b9ecd@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAE0441427E52403E8BEE5458F274B90BF2277165CA50BE675B433B94E9E2C372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_005032_544275_058BAF47 
X-CRM114-Status: GOOD (  28.45  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-08 at 13:43 +0200, Mathias Nyman wrote:
> On 7.2.2021 4.27, Chunfeng Yun wrote:
> > Hi Mathias,
> > 
> > On Wed, 2021-02-03 at 18:26 +0800, Chunfeng Yun wrote:
> >> There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
> >> exclude IP0) have a wrong default SOF/ITP interval which is
> >> calculated from the frame counter clock 24Mhz by default, but
> >> in fact, the frame counter clock is 48Mhz, so we should set
> >> the accurate interval according to 48Mhz for those controllers.
> >> Note: the first controller no need set it.
> >>
> >> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >> ---
> >> v2: fix typo of comaptible
> >> ---
> >>  drivers/usb/host/xhci-mtk.c | 63 +++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >>
> >> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> >> index 8f321f39ab96..0a68c4ac8b48 100644
> >> --- a/drivers/usb/host/xhci-mtk.c
> >> +++ b/drivers/usb/host/xhci-mtk.c
> >> @@ -68,11 +68,71 @@
> >>  #define SSC_IP_SLEEP_EN	BIT(4)
> >>  #define SSC_SPM_INT_EN		BIT(1)
> >>  
> > Can I Read/Write the following xHCI controller's registers  in
> > xhci-mtk.c?
> > 
> > Ideally, xhci-mtk.c should not access them, because xhci-mtk is only a
> > glue driver used to initialize clocks/power and IPPC registers which
> > don't belong to xHCI controller.
> > 
> 
> These *_EOF registers look like they are Mediatek vendor specific registers
> and not part of public xHCI register-level spec. 
> So I think accessing them from xhci-mtk.c makes sense.
> 
> If those register offsets are hardcoded like this in the Mediatek spec then
> this is fine, 
Check it with our DE, it's this case.
> but if those offsets are found from a vendor specific xHCI
> extended capability entry (see xhci spec section 7) then we should dig them out
> from there. 
> >> +/* xHCI csr */
> >> +#define LS_EOF			0x930
> >> +#define LS_EOF_OFFSET		0x89
> >> +
> >> +#define FS_EOF			0x934
> >> +#define FS_EOF_OFFSET		0x2e
> >> +
> >> +#define SS_GEN1_EOF		0x93c
> >> +#define SS_GEN1_EOF_OFFSET	0x78
> >> +
> >> +#define HFCNTR_CFG		0x944
> >> +#define ITP_DELTA_CLK		(0xa << 1)
> >> +#define ITP_DELTA_CLK_MASK	GENMASK(5, 1)
> >> +#define FRMCNT_LEV1_RANG	(0x12b << 8)
> >> +#define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
> >> +
> >> +#define SS_GEN2_EOF		0x990
> >> +#define SS_GEN2_EOF_OFFSET	0x3c
> >> +#define EOF_OFFSET_MASK		GENMASK(11, 0)
> >> +
> >>  enum ssusb_uwk_vers {
> >>  	SSUSB_UWK_V1 = 1,
> >>  	SSUSB_UWK_V2,
> >>  };
> >>  
> >> +/*
> >> + * MT8195 has 4 controllers, the controller1~3's default SOF/ITP interval
> >> + * is calculated from the frame counter clock 24M, but in fact, the clock
> >> + * is 48M, so need change the interval.
> >> + */
> >> +static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
> >> +{
> >> +	struct device *dev = mtk->dev;
> >> +	struct usb_hcd *hcd = mtk->hcd;
> >> +	u32 value;
> >> +
> >> +	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8195-xhci"))
> >> +		return;
> >> +
> >> +	value = readl(hcd->regs + HFCNTR_CFG);
> >> +	value &= ~(ITP_DELTA_CLK_MASK | FRMCNT_LEV1_RANG_MASK);
> >> +	value |= (ITP_DELTA_CLK | FRMCNT_LEV1_RANG);
> >> +	writel(value, hcd->regs + HFCNTR_CFG);
> >> +
> >> +	value = readl(hcd->regs + LS_EOF);
> >> +	value &= ~EOF_OFFSET_MASK;
> >> +	value |= LS_EOF_OFFSET;
> >> +	writel(value, hcd->regs + LS_EOF);
> >> +
> >> +	value = readl(hcd->regs + FS_EOF);
> >> +	value &= ~EOF_OFFSET_MASK;
> >> +	value |= FS_EOF_OFFSET;
> >> +	writel(value, hcd->regs + FS_EOF);
> >> +
> >> +	value = readl(hcd->regs + SS_GEN1_EOF);
> >> +	value &= ~EOF_OFFSET_MASK;
> >> +	value |= SS_GEN1_EOF_OFFSET;
> >> +	writel(value, hcd->regs + SS_GEN1_EOF);
> >> +
> >> +	value = readl(hcd->regs + SS_GEN2_EOF);
> >> +	value &= ~EOF_OFFSET_MASK;
> >> +	value |= SS_GEN2_EOF_OFFSET;
> >> +	writel(value, hcd->regs + SS_GEN2_EOF);
> 
> Minor nit about names,
> Register offsets from MMIO start are named *_EOF while clock multipliers? are named *_EOF_OFFSET.
> This was a bit confusing
Good point, the names come from register map docs, I'll modify it,
thanks a lot
> 
> Thanks
> -Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
