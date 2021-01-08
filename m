Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10904C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:57:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5DFF236F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5DFF236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DBtHVj/t1uVC/Z6XPCw04qh6CkjbGtUts0ualeD1m3Q=; b=w9MauammZd1KNskAIwY6QFf9g
	rsXR2HMUbZ0O4s56Al3yfUYXZvwsi/FQOWUjse0qxWCL9n3baG58ABa56g952OFjfU6QVG2DCaToP
	uwzsMFzA0rfFdBjMeoIkBBOCU4aOK8OoXcaJ3bOsLBsyCN353/aDkBAjUldZNBrXVI2tD7c6gTrP9
	b99Den7TRwkpnJzFDoTMwh3V73V1pukpRlcSLVrcMyc9czCOzTtTv0gZ9XZEIL9vD8zn5fflcn+DE
	JabyZaiUWYieAESKQ/rFunpqi37FVXCgXh/zYwHpRq7u2Hv5TdKW/CUG5rwJP8Rb5LqAtAIViX6F+
	AXfGr5rCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxhxG-0008LN-Ag; Fri, 08 Jan 2021 02:56:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxhxB-0008Iy-HD
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 02:56:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id j13so5356653pjz.3
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 18:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3O9zuZkl9ZCDWe21i1b+VXFMIgQt5YzM+o0I5kD2q18=;
 b=EsLZpaTiHt45R+RX9vSof5hFiKU/thtsi7O0RCTnt7lezGkxOIc+1P6/BWbTv9yESI
 p8CTkQQLqtCqTaS8bEbkrsgrOkCPgzXnm3odm7+DBejXM4P1aP388fNOcOrFZZMUuiYH
 eiJqFXqS2CE+gC5m/PJv6Yjwm0TbnubxcYJ2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3O9zuZkl9ZCDWe21i1b+VXFMIgQt5YzM+o0I5kD2q18=;
 b=e15utQDyuLw7l0j6Lww9OC+41WYNjeJlZBA1M2OIxQTkczzasnIZDGTTRhM1uWZ6Kq
 WgLcASZJBmaGiZFd7dy6p+O6sFClYykh0UcK3gtGffMBjrOhZMcI9NjMbncKGXjcyqGV
 2Dt7N6M817ofGadhmmZNGp1PHX//d04caM7TcPMXIQK1Cdvx4VDYOeXTMYErTAWiHi24
 5/6SpIYR8AYMozBW5TuMGYWWAGuYovDrfUmLNUbHbMDdzYI0frscaga7DA+3qYV5Qb+b
 vl83sK3hnVjOW4bJw4k6P5fpxv5RBNSK6ne9D5pLuIMqTzF1X2/Gy2w+GcRlcGDut80p
 Advw==
X-Gm-Message-State: AOAM533sEENeuS6zfrZPj8gqu9o3wUB6eiZ5cpkvs0c0al0TCSOm6Gtl
 CLyzlsdNErSAJ2vNbUNFuIPHu2E08RGYwrH9FM2c8Q==
X-Google-Smtp-Source: ABdhPJzKGxYU6yAsvjkCKTP+2vQ3R7MIV+PsqPkURWLcF6PiijJ9ZVBxcWLGKVYSFjx9ws0RQhVHdLOmDDgsMI6i+zI=
X-Received: by 2002:a17:90a:2e83:: with SMTP id
 r3mr1457895pjd.112.1610074597749; 
 Thu, 07 Jan 2021 18:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
In-Reply-To: <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 8 Jan 2021 10:56:26 +0800
Message-ID: <CAATdQgBSh+Rkfj5a=g=4LwoNYcG+87zTJJF-VdeaA4WH5ARhuA@mail.gmail.com>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
To: Mathias Nyman <mathias.nyman@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_215641_688022_2B5B4C68 
X-CRM114-Status: GOOD (  22.75  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 7:07 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 29.12.2020 8.24, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
>
> ...
>
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index d4a8d0efbbc4..e1fcd3cf723f 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >       xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
> >       virt_dev = xhci->devs[udev->slot_id];
> >
> > +     if (xhci->quirks & XHCI_MTK_HOST) {
> > +             ret = xhci_mtk_check_bandwidth(hcd, udev);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
>
> Just noticed that XHCI_MTK_HOST quirk is only set in xhci-mtk.c.
> xhci-mtk.c calls xhci_init_driver(..., xhci_mtk_overrides) with a .reset override function.
>
> why not add override functions for .check_bandwidth and .reset_bandwidth to xhci_mtk_overrides instead?
>
> Another patch to add similar overrides for .add_endpoint and .drop_endpoint should probably be
> done so that we can get rid of the xhci_mtk_add/drop_ep_quirk() calls in xhci.c as well

Yes, I agree.
Let me submit another patch adding more overridables to xhci_driver_overrides.
Thanks.

>
> Thanks
> -Mathias
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
