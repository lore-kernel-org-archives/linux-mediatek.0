Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF82C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 05:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0C060F10
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 05:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC0C060F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5vZxL/S4FdtDfgcViVoivSbTIuYrbB7mPS1t5e2FRU=; b=12Hj6weGWtQIWL
	G2PPtp22MPKa8TyWXclrvfNSBS9vQ3E4FwdqdX7dmRuhiZTTRM+M2UE8XYNhnrNll8qKjwf6CXmkV
	sGf2tbbEKkV63JSTm5J62WhKulIX8vASlnU62j4yhtkg/4ijb0VdbIzdhrq+c4HjvKSmf9aHeNHgC
	nWDT6vp0lZF2UmJQsE/HUtM5R9rG7nvGuHQjZuPsv4eAe6fwN4Ld2eT0ZfV3YFLt5oPfw0Slq2IUQ
	c9eTz2cpC5W2xh0rvEX5HwmeoLRB2geZO6XYmokvpwwhCBcMRMtwd3qTn4RoouQMCDCc9yJfcfsbw
	mSR6ccHfRwCiyrj8qPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB9K3-004smJ-Uo; Wed, 04 Aug 2021 05:20:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB9Jo-004sk7-OU; Wed, 04 Aug 2021 05:19:55 +0000
X-UUID: c8c5fa7ab08147d3af3dbf32bac3fd46-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lTtejfzC/dI1hPB49Y0KNSixxnq5EFnA0JdBRkQ8O7g=; 
 b=I+4OB8kqeMMB9e2ENYDVTj9S35N6OUJiWGgcQB/wEeWOKhf2aAm/YQKzsVZwP3xhN/MSeQADFZ5TvsVQKnQaMIoc1QI6MSg1k9UpjIHdpgJNnV06T5L9gcz2Lc/1ndMufqPL1Cp78wnv8SGMpOBaIs5Zv/TM451lDUhtinrYVZg=;
X-UUID: c8c5fa7ab08147d3af3dbf32bac3fd46-20210803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2088812324; Tue, 03 Aug 2021 22:19:48 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 22:19:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 4 Aug 2021 13:19:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 13:19:44 +0800
Message-ID: <1628054384.14982.12.camel@mhfsdcap03>
Subject: Re: [PATCH 08/11] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Wed, 4 Aug 2021 13:19:44 +0800
In-Reply-To: <CAATdQgDWkohpzgr=z+uzro4m9Bd=v88DNnJ-M88-5-0annhH_w@mail.gmail.com>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-8-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgDWkohpzgr=z+uzro4m9Bd=v88DNnJ-M88-5-0annhH_w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_221954_259323_0F4014C1 
X-CRM114-Status: GOOD (  28.94  )
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

On Tue, 2021-08-03 at 14:05 +0800, Ikjoon Jang wrote:
> Hi Chunfeng,
> 
> On Fri, Jul 30, 2021 at 4:51 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > Use @bw_budget_table[] to update fs bus bandwidth due to
> > not all microframes consume @bw_cost_per_microframe, see
> > setup_sch_info().
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > index 0bb1a6295d64..10c0f0f6461f 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
> >                  * Compared with hs bus, no matter what ep type,
> >                  * the hub will always delay one uframe to send data
> >                  */
> > -               for (j = 0; j < sch_ep->cs_count; j++) {
> > -                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> > +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > +                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
> >                         if (tmp > FS_PAYLOAD_MAX)
> >                                 return -ESCH_BW_OVERFLOW;
> >                 }
> > @@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
> >  {
> >         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> >         u32 base, num_esit;
> > -       int bw_updated;
> >         int i, j;
> >
> >         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> >
> > -       if (used)
> > -               bw_updated = sch_ep->bw_cost_per_microframe;
> > -       else
> > -               bw_updated = -sch_ep->bw_cost_per_microframe;
> > -
> >         for (i = 0; i < num_esit; i++) {
> >                 base = sch_ep->offset + i * sch_ep->esit;
> >
> > -               for (j = 0; j < sch_ep->cs_count; j++)
> > -                       tt->fs_bus_bw[base + j] += bw_updated;
> > +               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> > +                       if (used)
> > +                               tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
> > +                       else
> > +                               tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
> 
> I agree that xhci-mtk-sch still has more rooms for tt periodic bandwidth
> but I think this approach could trigger a problem.
See updat_bus_bw(), when add fs ep's bandwidth, it uses
bw_budget_table[], so prefer to use the same way

> 
> for example, if there are two endpoints scheduled in the same u-frame index,
> * ep1out  = iso 192bytes bw_budget_table[] = { 188, 188, 0, ...} --> y0
> * ep2in = int 64bytes, bw_budget_table[] = { 0, 0, 64, ... }  --> y0
> 
> (If this is possible allocation from this patch),
> I guess xhci-mtk could have some problems on internal scheduling?

Test it on dvt env. don't encounter issues;

Thanks

> 
> >         }
> >
> >         if (used)
> 
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
