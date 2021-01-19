Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EC9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 07:02:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A110523131
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 07:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A110523131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9cRaUa3VGy1eLsNXGfl9VM/KzmTU8STF12pQn1qa3xo=; b=O1fQovfO43UZY/gIgDeYIHEC/
	BqOLuOKz2TzMnwiDLX+J6de3e1Yf+a0fbYT/tKgWww4N9mFMxddmUlkv6jswI2WR1O/YpapIEyvAR
	UKxHGkYpsrwb9ja/dsoojL//Kn7xEk6+grnpwixUZfKSY9LjUeXG+N7HA5Pml8bODkQ3RoeXCFVSK
	0YsTs+S2Qyoy828jlBLRn85Fkd941glzC65UFFvyAnD7+qs5nlXVZZxB9zSH2vYyj9Xl1E8G0pI1e
	N03aDN3YglG1dBYy20l5zmiVNyNNOgf0omH9hmhg3rxRCF4MSqmEZj2I9yO1yJgYrBNsAB4F76Uuu
	tatYZb/sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1l1b-0007oD-4c; Tue, 19 Jan 2021 07:01:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1l1X-0007n4-F1
 for linux-mediatek@lists.infradead.org; Tue, 19 Jan 2021 07:01:57 +0000
X-UUID: 15b36021292e43afb9e0ae2811427f67-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6V5zD/iXHA0wDTMuAHf0jHgOG6fsknw3TmnvLpL2RoM=; 
 b=Y7Gu0PfWeFqEUIrgeLvQNNslCffta/OHQMQifHC7q4cLgkSV/sZyvboGkcB5NRQnZR/MrIbkhr2RSW8WB817I6N3FdGrN6PEwKMY/nPNJ4MrDawdq1ShNL9TJy3xM7oI/3BjuEkv3p8EvBkVPRnojh/j53jUTYXPEqvD2DpDlCo=;
X-UUID: 15b36021292e43afb9e0ae2811427f67-20210118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 675608031; Mon, 18 Jan 2021 23:01:53 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 22:57:08 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 14:57:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 14:57:04 +0800
Message-ID: <1611039425.12761.2.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v3 1/5] usb: xhci-mtk: improve bandwidth scheduling
 with multi-TT
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 19 Jan 2021 14:57:05 +0800
In-Reply-To: <CAATdQgAx_3X6=HXa78P_UNumCyrt9ejyuVu_y5YZc4cPsJ6=ww@mail.gmail.com>
References: <1608629682-8535-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgAx_3X6=HXa78P_UNumCyrt9ejyuVu_y5YZc4cPsJ6=ww@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9F112484B25E67B7DA334E6D5373F16DB43BB880BF7764171F09A6E318CC0E52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_020155_808890_1950CA73 
X-CRM114-Status: GOOD (  27.06  )
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
Cc: Yaqii Wu <yaqii.wu@mediatek.com>,
 Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Zhanyong Wang <zhangyong.wang@mediatek.com>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-13 at 17:43 +0800, Ikjoon Jang wrote:
> On Tue, Dec 22, 2020 at 5:35 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > From: Zhanyong Wang <zhanyong.wang@mediatek.com>
> >
> > After inserted the usb type-c 3.5mm dongle with headset, dmesg showed:
> > usb 1-1.1: new full-speed USB device number 5 using xhci-mtk
> > usb 1-1.1: New USB device found, idVendor=05ac, idProduct=110a, bcdDevice=26.11
> > usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > usb 1-1.1: Product: USB-C to 3.5mm Headphone Jack Adapter
> > usb 1-1.1: Manufacturer: Apple, Inc.
> > usb 1-1.1: SerialNumber: DWH915501TFJKLTAM
> > xhci-mtk 11200000.xhci: Not enough bandwidth!
> > usb 1-1.1: can't set config #2, error -28
> >
> > improve low-speed/full-speed INT/ISOC bandwidth scheduling with USB
> > muli-TT.
> >
> > Signed-off-by: Yaqii Wu <yaqii.wu@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2~v3: no changes
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 91 ++++++++++++++++++++++++++++-----
> >  drivers/usb/host/xhci-mtk.h     |  8 ++-
> >  2 files changed, 84 insertions(+), 15 deletions(-)
> >  mode change 100644 => 100755 drivers/usb/host/xhci-mtk-sch.c
> >
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > old mode 100644
> > new mode 100755
> > index 45c54d56ecbd..94292b9bbc63
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -383,7 +383,9 @@ static int check_sch_tt(struct usb_device *udev,
> >         u32 fs_budget_start;
> >         u32 start_ss, last_ss;
> >         u32 start_cs, last_cs;
> > -       int i;
> > +       u32 num_esit, base;
> > +       int i, j;
> > +       u32 tmp;
> >
> >         start_ss = offset % 8;
> >         fs_budget_start = (start_ss + 1) % 8;
> > @@ -398,10 +400,13 @@ static int check_sch_tt(struct usb_device *udev,
> >                 if (!(start_ss == 7 || last_ss < 6))
> >                         return -ERANGE;
> >
> > -               for (i = 0; i < sch_ep->cs_count; i++)
> > -                       if (test_bit(offset + i, tt->split_bit_map))
> > +               for (i = 0; i < sch_ep->cs_count; i++) {
> > +                       if (test_bit(offset + i, tt->ss_bit_map))
> >                                 return -ERANGE;
> >
> > +                       if (test_bit(offset + i, tt->cs_bit_map))
> > +                               return -ERANGE;
> > +               }
> 
> Are there any reasons for doing this?
> Why can only one split packet be scheduled in a u-frame for isochronous out?
> This looks like overkill.
[From DR]: We will calculate the number of uframes based on the isoc out
ep maxp. Except for the last uframe, all other consumed bandwidth is
188. But to be safe, we also count the bandwidth consumed by the last SS
as 188.

> 
> >         } else {
> >                 u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
> >
> > @@ -428,8 +433,10 @@ static int check_sch_tt(struct usb_device *udev,
> >                 if (cs_count > 7)
> >                         cs_count = 7; /* HW limit */
> >
> > -               for (i = 0; i < cs_count + 2; i++) {
> > -                       if (test_bit(offset + i, tt->split_bit_map))
> > +               if (test_bit(offset, tt->ss_bit_map))
> > +                       return -ERANGE;
> > +               for (i = 0; i < cs_count; i++) {
> > +                       if (test_bit(offset + 2 + i, tt->cs_bit_map))
> >                                 return -ERANGE;
> >                 }
> >
> 
> same here. It would be much better to understand
> if you can provide some counterexamples of schedule
> that can happen when this bitmap checking logic is omitted.
[From DR] Maybe you are right, it will indeed double check. I will
delete the bandwidth check, and then perform a regression test.

> 
> > @@ -445,11 +452,22 @@ static int check_sch_tt(struct usb_device *udev,
> >                         sch_ep->num_budget_microframes = sch_ep->esit;
> >         }
> >
> > +       num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> > +       for (i = 0; i < num_esit; i++) {
> > +               base = sch_ep->offset + i * sch_ep->esit;
> > +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > +                       tmp = tt->fs_bus_bw[base + j]
> > +                             + sch_ep->bw_cost_per_microframe;
> > +                       if (tmp > FS_PAYLOAD_MAX)
> > +                               return -ERANGE;
> > +               }
> > +       }
> 
> I guess this is enough to check the bandwidth limit of the
> lower speed bus without a bitmap.
[From DR]As explained in issue tracker that ss cannot be overlapped.
This is a hub compatibility issue. Therefore we need bitmap to prevent
ss overlap.

Thanks
> 
> > +
> >         return 0;
> >  }
> >
> >  static void update_sch_tt(struct usb_device *udev,
> > -       struct mu3h_sch_ep_info *sch_ep)
> > +       struct mu3h_sch_ep_info *sch_ep, bool used)
> >  {
> >         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> >         u32 base, num_esit;
> > @@ -458,11 +476,52 @@ static void update_sch_tt(struct usb_device *udev,
> >         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> >         for (i = 0; i < num_esit; i++) {
> >                 base = sch_ep->offset + i * sch_ep->esit;
> > -               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> > -                       set_bit(base + j, tt->split_bit_map);
> > +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > +                       if (used)
> > +                               set_bit(base + j, tt->split_bit_map);
> > +                       else
> > +                               clear_bit(base + j, tt->split_bit_map);
> > +               }
> > +
> > +               if (sch_ep->ep_type == ISOC_OUT_EP) {
> > +                       for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > +                               if (used) {
> > +                                       set_bit(base + j, tt->ss_bit_map);
> > +                                       set_bit(base + j, tt->cs_bit_map);
> > +                                       tt->fs_bus_bw[base + j] +=
> > +                                               sch_ep->bw_cost_per_microframe;
> > +                               } else {
> > +                                       clear_bit(base + j, tt->ss_bit_map);
> > +                                       clear_bit(base + j, tt->cs_bit_map);
> > +                                       tt->fs_bus_bw[base + j] -=
> > +                                               sch_ep->bw_cost_per_microframe;
> > +                               }
> > +                       }
> > +               } else {
> > +                       if (used)
> > +                               set_bit(base, tt->ss_bit_map);
> > +                       else
> > +                               clear_bit(base, tt->ss_bit_map);
> > +
> > +                       for (j = 0; j < sch_ep->cs_count; j++) {
> > +                               if (used) {
> > +                                       set_bit(base + 2 + j, tt->cs_bit_map);
> > +
> > +                                       tt->fs_bus_bw[base + 2 + j] +=
> > +                                               sch_ep->bw_cost_per_microframe;
> > +                               } else {
> > +                                       clear_bit(base + 2 + j, tt->cs_bit_map);
> > +                                       tt->fs_bus_bw[base + 2 + j] -=
> > +                                               sch_ep->bw_cost_per_microframe;
> > +                               }
> > +                       }
> > +               }
> >         }
> >
> > -       list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
> > +       if (used)
> > +               list_add_tail(&sch_ep->tt_endpoint, &tt->ep_list);
> > +       else
> > +               list_del(&sch_ep->tt_endpoint);
> >  }
> >
> >  static int check_sch_bw(struct usb_device *udev,
> > @@ -470,6 +529,7 @@ static int check_sch_bw(struct usb_device *udev,
> >  {
> >         u32 offset;
> >         u32 esit;
> > +       u32 boundary;
> >         u32 min_bw;
> >         u32 min_index;
> >         u32 worst_bw;
> > @@ -487,10 +547,13 @@ static int check_sch_bw(struct usb_device *udev,
> >          */
> >         min_bw = ~0;
> >         min_index = 0;
> > +       boundary = esit;
> >         min_cs_count = sch_ep->cs_count;
> >         min_num_budget = sch_ep->num_budget_microframes;
> >         for (offset = 0; offset < esit; offset++) {
> >                 if (is_fs_or_ls(udev->speed)) {
> > +                       if (sch_ep->ep_type != ISOC_OUT_EP)
> > +                               boundary = esit + 1;
> >                         ret = check_sch_tt(udev, sch_ep, offset);
> >                         if (ret)
> >                                 continue;
> > @@ -498,7 +561,7 @@ static int check_sch_bw(struct usb_device *udev,
> >                                 tt_offset_ok = true;
> >                 }
> >
> > -               if ((offset + sch_ep->num_budget_microframes) > sch_ep->esit)
> > +               if ((offset + sch_ep->num_budget_microframes) > boundary)
> >                         break;
> >
> >                 worst_bw = get_max_bw(sch_bw, sch_ep, offset);
> > @@ -532,7 +595,7 @@ static int check_sch_bw(struct usb_device *udev,
> >                 if (!tt_offset_ok)
> >                         return -ERANGE;
> >
> > -               update_sch_tt(udev, sch_ep);
> > +               update_sch_tt(udev, sch_ep, 1);
> >         }
> >
> >         /* update bus bandwidth info */
> > @@ -696,12 +759,12 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
> >
> >         list_for_each_entry(sch_ep, &sch_bw->bw_ep_list, endpoint) {
> >                 if (sch_ep->ep == ep) {
> > -                       update_bus_bw(sch_bw, sch_ep, 0);
> > -                       list_del(&sch_ep->endpoint);
> >                         if (is_fs_or_ls(udev->speed)) {
> > -                               list_del(&sch_ep->tt_endpoint);
> > +                               update_sch_tt(udev, sch_ep, 0);
> >                                 drop_tt(udev);
> >                         }
> > +                       update_bus_bw(sch_bw, sch_ep, 0);
> > +                       list_del(&sch_ep->endpoint);
> >                         kfree(sch_ep);
> >                         break;
> >                 }
> > diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> > index a93cfe817904..323b281933b9 100644
> > --- a/drivers/usb/host/xhci-mtk.h
> > +++ b/drivers/usb/host/xhci-mtk.h
> > @@ -21,12 +21,18 @@
> >
> >  /**
> >   * @split_bit_map: used to avoid split microframes overlay
> > + * @ss_bit_map: used to avoid start split microframes overlay
> > + * @cs_bit_map: used to avoid complete split microframes overlay
> > + * @fs_bus_bw: array to keep track of bandwidth already used at full speed
> >   * @ep_list: Endpoints using this TT
> >   * @usb_tt: usb TT related
> >   * @tt_port: TT port number
> >   */
> >  struct mu3h_sch_tt {
> >         DECLARE_BITMAP(split_bit_map, XHCI_MTK_MAX_ESIT);
> > +       DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
> > +       DECLARE_BITMAP(cs_bit_map, XHCI_MTK_MAX_ESIT + 1);
> > +       u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
> >         struct list_head ep_list;
> >         struct usb_tt *usb_tt;
> >         int tt_port;
> > @@ -42,7 +48,7 @@ struct mu3h_sch_tt {
> >   * two bandwidth domains, one for IN eps and another for OUT eps.
> >   */
> >  struct mu3h_sch_bw_info {
> > -       u32 bus_bw[XHCI_MTK_MAX_ESIT];
> > +       u32 bus_bw[XHCI_MTK_MAX_ESIT + 1];
> >         struct list_head bw_ep_list;
> >  };
> >
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
