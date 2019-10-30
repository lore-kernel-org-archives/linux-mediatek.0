Return-Path: <SRS0=ckAq=YX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C61CA9EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2019 08:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF2220717
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2019 08:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O/VC06x/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF2220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5C8GAeSsdxuQCM1NA4MqNgIHeFyN6rkpHEOsJ6/9XE4=; b=O/VC06x/MyeC8n
	fYQJTGaCL2P1GUPaKed0LICC+Bp7SWlKWCDZrhcEQJRbUp4TVE3UCsX+KD2191rgTrgDm4dXf2/XT
	DWX4BlWqU9tY8wKBlEY5zOPdvdeODpPDW+ID1nHTZZKc4Hz7QIRkv0abmn7//Ijlrp5AdmazsGAei
	UBi2Qi2jN7H5Wek/ohW0Y47m5QVJ9GmxYmlObjuy8/gnvGMIFn1dlzJpv1ITFThCLSYEmEm8XHbNB
	2u7OmjBZd5O8du3gg6463c3zw4XZYQLMnh62BUZsXXvRzMDW+RQDGwCPCbyYHwnnKdCsYI7PB3tdu
	+R6BI1lJkAHhrbbBzUSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPj84-0006oy-Mv; Wed, 30 Oct 2019 08:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPj82-0006oY-Nt; Wed, 30 Oct 2019 08:14:56 +0000
X-UUID: 07aed7db15a348d1a860412bf55c6508-20191030
X-UUID: 07aed7db15a348d1a860412bf55c6508-20191030
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 401261223; Wed, 30 Oct 2019 00:15:07 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 30 Oct 2019 01:14:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 30 Oct 2019 16:14:47 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 30 Oct 2019 16:14:46 +0800
Message-ID: <1572423288.18464.38.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 30 Oct 2019 16:14:48 +0800
In-Reply-To: <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
References: <20191010075004.192818-1-tfiga@chromium.org>
 <1570697118.32135.20.camel@mhfsdcap03>
 <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
 <1570705147.22261.13.camel@mhfsdcap03>
 <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 60E1840DBE94508B2E5CDABD7A6FC01DE1971C6B2AD893D3FFBB7A973753CDDD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_011454_781601_BA876359 
X-CRM114-Status: GOOD (  31.95  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Changqi Hu <Changqi.Hu@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Shik Chen <shik@chromium.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Fri, 2019-10-11 at 13:35 +0900, Tomasz Figa wrote:
> On Thu, Oct 10, 2019 at 7:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Thu, 2019-10-10 at 18:00 +0900, Tomasz Figa wrote:
> > > Hi Chunfeng,
> > >
> > > On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > Hi, Tomasz,
> > > >
> > > > On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> > > > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > > > because xhci_gen_setup() overrides it according to hardware
> > > > > capabilities.
> > Yes, this is what I want to do, maybe need remove DMA mask setting in
> > platform-specific.
> >
> > > > >
> > > > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > > > 32-bit DMA mask instead.
> > > > >
> > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > ---
> > > > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > > index b18a6baef204a..4d101d52cc11b 100644
> > > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > > >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > > >       if (mtk->lpm_support)
> > > > >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > > +     /*
> > > > > +      * MTK host controller does not support 64-bit addressing, despite
> > > > > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > > > > +      */
> > > > > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > > > Somes SoCs support 64bits in fact, so can't support this quirk, do you
> > > > encounter any issues without this quirk?
> > > >
> > >
> > > Thanks for taking a look at this patch.
> > >
> > > Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
> > > according to the information I received from MediaTek, the controller
> > > on that SoC only supports 32 bits.
> > As I know, mt8183 doesn't support memory greater than 4G mode.
> >
> 
> We have 4GB of DRAM at 0x40000000-0x140000000 on our board with
> MT8183. What happens if you attempt to use the memory from
> 0x100000000-0x140000000 with the XHCI controller on this SoC?

Sorry for the late reply.

I've checked it with USB DE, USB IP supports 64bit on MT8183, so no need
set XHCI_NO_64BIT_SUPPORT. 
Would you please help to send a new patch to remove local dma mask
setting, no need set it.

Thanks a lot


> 
> > >
> > > If some SoCs support only 32 bits and some support 64 bits, we may
> > > either need to use different DT compatible string for them or add a DT
> > > property and set the quirk based on that. Right now in upstream we
> > > have:
> > >
> > > 1) "mediatek,mt8173-xhci", used by:
> > > MT8173
> > >
> > > 2)"mediatek,mtk-xhci", used by:
> > > MT2712
> > > MT7622
> > > MT8183 (not yet upstream, but I suppose it's on the mailing lists)
> > >
> > > Would you be able to check which of the SoCs above report 64 bits but
> > > support only 32? (and so would need this quirk)
> > I'm afraid I can't, almost all MTK SoCs supporting xHCI are using this
> > driver, AC64 should be set rightly according to addressing capability.
> >
> 
> Does it mean that only MT8183 may be the only SoC with a problem with
> this capability bit?
> 
> Matthias, do you have access to MT2712 and MT7622 devices? I have
> MT8173 and MT8183, so I can check them, but would be good to check
> this on the other ones too.


> 
> Best regards,
> Tomasz



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
