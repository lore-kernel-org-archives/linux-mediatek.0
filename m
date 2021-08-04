Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE65C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:11:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7CD60E09
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B7CD60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApZAz2xkdn/L76nfD0DtfCVTxoV6cejFj7XaecGkQEA=; b=lcyTNB+fUXOOdX
	KmRYnWpCzP7Yl1TbtzlBORt65II5u8FDtf2nME10bexAOrdeR1j8i54cKQebGWWu05/laKN20f4Jm
	Iw8+h48UWwtsmST5la4mjLK09/tadCVfUjN5LkSDg8WsLKNP+jstk/m5Qw6rS2JQjXbrOwApRJBJO
	1dH8EnHyFs2VORrjiD+x10sKHrjhRjgqdGGL16B2Fw1AtDM5M4RzMkbir9CsHk5h/1DUZK8VwCNDQ
	iNIX922T7QWjnhgHzTPCQl4B8N64IIK1yk7DsLq2/eIenxUb2PCTpEUx5dejZddjLm3yMkLKTQPYu
	CYM4UPtV908bwADQpBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHcR-006M3G-AM; Wed, 04 Aug 2021 14:11:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHXW-006ItB-Fr
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:06:39 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso3715797pjf.4
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Aug 2021 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jonaqYUQJ0diYuQBbvYjToEHMp/OqMbSlxfrN33MdQ=;
 b=Ap9tlhDdEp/AJBj4+9xnNJYAH05TJNTE9T/+nvoyXzwrPO1vwIm/fsmsBTew+7/Y6Q
 PFi4tXAMw3L70vXk2NpKBWTLjk4dLFPXjGTrMEzXYBH4YAwrlY++hdW5jnskj90WpIRT
 TYt1DbcqyZcutqm7YwT24ePu7gI09rK/BdDHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jonaqYUQJ0diYuQBbvYjToEHMp/OqMbSlxfrN33MdQ=;
 b=dvLuib/nprBK5NNyFzH28S2PK3lYcShNebu7tfbU8ZAPjDIxRzkr/np3bmuxDPgcTn
 1o/sNbiA7XNrYqQvZ7DeQlYrdK/CC7cCcxsW5PIiIDTpuIBrwc7nd/M19FmSCepYGzf2
 dt+v0DQEx9UXBkheIHlWvAtylUX8W9FgOv37Jt2m/b7CUoyljCS8zPHRELLaPPcm9+mZ
 8bt2gB4pigUUEX+HHdk3Zn+Hs712BBtznRuPGMW/QVbLlYGbY6OQjOVr8OyhBYvHGaYQ
 u11VRdfn+Nv7YgN6OSaEWdd3cqc+a8UCPtcZeHRu6mPXV8Tty2o1Juiv/YHWIKnJqQ86
 8ihQ==
X-Gm-Message-State: AOAM531rvDAArnNLHdgzBrGgwuwROrOgIGk3BiOYGW+JMAjkS7K6FzsC
 fRsvvMKwFJ6fpowv3SthlVkPdpdAA8NoPZ0e8HyIYg==
X-Google-Smtp-Source: ABdhPJyBXL0MlcNDm9Hj6VmY9zZtlebY6O+dFuoHiEnNNkxOsmsy453mYWi6o74BLFoLuQVRX6FtB/RCRaV0q3U05UU=
X-Received: by 2002:a17:90a:e513:: with SMTP id
 t19mr10011223pjy.144.1628085992692; 
 Wed, 04 Aug 2021 07:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-8-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgDWkohpzgr=z+uzro4m9Bd=v88DNnJ-M88-5-0annhH_w@mail.gmail.com>
 <1628054384.14982.12.camel@mhfsdcap03>
In-Reply-To: <1628054384.14982.12.camel@mhfsdcap03>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 4 Aug 2021 22:06:21 +0800
Message-ID: <CAATdQgA9WeKr2UkrcAKY1rP22GtT0bMezdWkb-wyF9Yjx2p_9w@mail.gmail.com>
Subject: Re: [PATCH 08/11] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 Eddie Hung <eddie.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070634_620359_12ED3B4F 
X-CRM114-Status: GOOD (  32.55  )
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

Hi,

On Wed, Aug 4, 2021 at 1:19 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2021-08-03 at 14:05 +0800, Ikjoon Jang wrote:
> > Hi Chunfeng,
> >
> > On Fri, Jul 30, 2021 at 4:51 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > Use @bw_budget_table[] to update fs bus bandwidth due to
> > > not all microframes consume @bw_cost_per_microframe, see
> > > setup_sch_info().
> > >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
> > >  1 file changed, 7 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > > index 0bb1a6295d64..10c0f0f6461f 100644
> > > --- a/drivers/usb/host/xhci-mtk-sch.c
> > > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > > @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
> > >                  * Compared with hs bus, no matter what ep type,
> > >                  * the hub will always delay one uframe to send data
> > >                  */
> > > -               for (j = 0; j < sch_ep->cs_count; j++) {
> > > -                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> > > +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > > +                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
> > >                         if (tmp > FS_PAYLOAD_MAX)
> > >                                 return -ESCH_BW_OVERFLOW;
> > >                 }
> > > @@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
> > >  {
> > >         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> > >         u32 base, num_esit;
> > > -       int bw_updated;
> > >         int i, j;
> > >
> > >         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> > >
> > > -       if (used)
> > > -               bw_updated = sch_ep->bw_cost_per_microframe;
> > > -       else
> > > -               bw_updated = -sch_ep->bw_cost_per_microframe;
> > > -
> > >         for (i = 0; i < num_esit; i++) {
> > >                 base = sch_ep->offset + i * sch_ep->esit;
> > >
> > > -               for (j = 0; j < sch_ep->cs_count; j++)
> > > -                       tt->fs_bus_bw[base + j] += bw_updated;
> > > +               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> > > +                       if (used)
> > > +                               tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
> > > +                       else
> > > +                               tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
> >
> > I agree that xhci-mtk-sch still has more rooms for tt periodic bandwidth
> > but I think this approach could trigger a problem.
> See updat_bus_bw(), when add fs ep's bandwidth, it uses
> bw_budget_table[], so prefer to use the same way
>
> >
> > for example, if there are two endpoints scheduled in the same u-frame index,
> > * ep1out  = iso 192bytes bw_budget_table[] = { 188, 188, 0, ...} --> y0
> > * ep2in = int 64bytes, bw_budget_table[] = { 0, 0, 64, ... }  --> y0
> >
> > (If this is possible allocation from this patch),
> > I guess xhci-mtk could have some problems on internal scheduling?
>
> Test it on dvt env. don't encounter issues;
>

As you can see In the above example, this patch starts to allow that allocation.
Do you mean that we don't have to worry about such a case (on all MTK
platforms)?

thanks

> Thanks
>
> >
> > >         }
> > >
> > >         if (used)
> >
> > > --
> > > 2.18.0
> > >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
