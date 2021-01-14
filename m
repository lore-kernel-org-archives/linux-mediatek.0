Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA0CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 08:36:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 134DE230FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 08:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 134DE230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fERfeTfwboLHW1V+4u4pbzUJBlsIw78wGvsWDGk/qtg=; b=xjnX+Kev4tar+hT8EEVagMbHS
	zjliIdPKMjrLxRqeJS8gSearTQo4E87ZnlZj67w790M5l5xRkyY02sQg9VA72ZnR7e0MF6907bzw4
	7q6EtPKHsrtzIpFBjVFKP7NPBpfI2nCHR/iWdo72sorcI/vEPuWjyWmVuhRNlceCefkTkB4ngIvUT
	EwkoizIczz264UzeHWaDIp51+gZWxk1U7idcnvpvhKlAyJ6SZ0XUxQEMVrYmFTYMe6nq7Kc5MJiMe
	0o+qAtRcR4EibjWUG+WgOR0tC4FfiARcTBXAiIqoUchEullvDEsEfAlbC5/1QLHofWBD9e8mu57CB
	76a1w/eaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzy6l-00082K-SZ; Thu, 14 Jan 2021 08:35:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzy6h-00081G-KL; Thu, 14 Jan 2021 08:35:53 +0000
X-UUID: 83fa4daee5904b07a8606ce1d38e91eb-20210114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3vfvY7ZKwRB4qS/zo2PCJVSCObWf38oxlkKwvoQoKvE=; 
 b=e+g3JUNLC2GDGrGTmoZw7wUbqwdbajdsDTsYGPji9D0TJ082n73ZqIjmnuvYwjDDs1G0VJEuv+yMKvydtIVtfPxm2G2mGQpWBM7wwNRsITV3PA/w6WYPMuEQqY3F+YnijrfWrl/JZdvNyxqBXatbXU7iZOu7SW/Bl4tsuCSq1e4=;
X-UUID: 83fa4daee5904b07a8606ce1d38e91eb-20210114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104991851; Thu, 14 Jan 2021 00:35:46 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Jan 2021 00:29:56 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Jan 2021 16:29:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jan 2021 16:29:52 +0800
Message-ID: <1610612988.30053.15.camel@mhfsdcap03>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 14 Jan 2021 16:29:48 +0800
In-Reply-To: <CAATdQgD2OAmf7_NWSVwzyJE7mF0vngzE=QeE79PS7MJsgPhbtA@mail.gmail.com>
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
 <1610086308.24856.30.camel@mhfsdcap03>
 <e43632e2-08b3-7a1a-8272-1d493e25fc67@linux.intel.com>
 <CAATdQgD2OAmf7_NWSVwzyJE7mF0vngzE=QeE79PS7MJsgPhbtA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 77ED6FFC0E264159D06B048F03B8B8C65875304C49FE305525CD3102406645DB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_033551_798846_CAE73C47 
X-CRM114-Status: GOOD (  30.27  )
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
 Tianping Fang <tianping.fang@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ikjoon,

On Tue, 2021-01-12 at 13:48 +0800, Ikjoon Jang wrote:
> On Fri, Jan 8, 2021 at 10:44 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
> >
> > On 8.1.2021 8.11, Chunfeng Yun wrote:
> > > On Thu, 2021-01-07 at 13:09 +0200, Mathias Nyman wrote:
> > >> On 29.12.2020 8.24, Ikjoon Jang wrote:
> > >>> xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > >>> to handle its own sw bandwidth managements and stores bandwidth data
> > >>> into internal table every time add_endpoint() is called,
> > >>> so when bandwidth allocation fails at one endpoint, all earlier
> > >>> allocation from the same interface could still remain at the table.
> > >>>
> > >>> This patch adds two more hooks from check_bandwidth() and
> > >>> reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > >>> from reset_bandwidth().
> > >>>
> > >>> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > >>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > >>>
> > >>
> > >> ...
> > >>
> > >>>
> > >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > >>> index d4a8d0efbbc4..e1fcd3cf723f 100644
> > >>> --- a/drivers/usb/host/xhci.c
> > >>> +++ b/drivers/usb/host/xhci.c
> > >>> @@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> > >>>     xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
> > >>>     virt_dev = xhci->devs[udev->slot_id];
> > >>>
> > >>> +   if (xhci->quirks & XHCI_MTK_HOST) {
> > >>> +           ret = xhci_mtk_check_bandwidth(hcd, udev);
> > >>> +           if (ret < 0)
> > >>> +                   return ret;
> > >>> +   }
> > >>> +
> > >>
> > >> Just noticed that XHCI_MTK_HOST quirk is only set in xhci-mtk.c.
> > >> xhci-mtk.c calls xhci_init_driver(..., xhci_mtk_overrides) with a .reset override function.
> > >>
> > >> why not add override functions for .check_bandwidth and .reset_bandwidth to xhci_mtk_overrides instead?
> > >>
> > >> Another patch to add similar overrides for .add_endpoint and .drop_endpoint should probably be
> > >> done so that we can get rid of the xhci_mtk_add/drop_ep_quirk() calls in xhci.c as well
> > > You mean, we can export xhci_add/drop_endpoint()?
> >
> > I think so, unless you have a better idea.
> > I prefer exporting the generic add/drop_endpoint functions rather than the vendor specific quirk functions.
> >
> 
> When moving out all MTK_HOST quirks and unlink xhci-mtk-sch from xhci,
> xhci-mtk-sch still needs to touch the xhci internals, at least struct
> xhci_ep_ctx.
> 
> My naive idea is just let xhci export one more function to expose xhci_ep_ctx.
> But I'm not sure whether this is acceptable:
I find that xhci_add_endpoint() ignores some errors with return 0, for
these cases we needn't call xhci_mtk_add_ep-quirk(), so may be not a
good way to just export xhci_add_endpoint().

> 
> +struct xhci_ep_ctx* xhci_get_ep_contex(struct xhci_hcd *xhci, struct
> usb_host_endpoint *ep)
> +{ ... }
> +EXPORT_SYMBOL(xhci_get_ep_context);
> 
> But for v6, I'm going to submit a patch with {check|reset}_bandwidth()
> quirk function
>  switched into xhci_driver_overrides first. (and preserve existing
> MTK_HOST quirk functions).
> 
> Thanks!
> 
> > -Mathias
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
