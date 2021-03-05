Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E98C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:17:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A8264F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A8264F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ym9b7rb8gVUZN3MDn7f/QIUSlhvfBquHipFERgSRhnc=; b=gmp1dNEDgYfe+YH4e2S8yrbiT
	AjdyVofyCzwom1UsNiJuuFxU8083uDNNcwc7Pv9RqsPXFwohFxXQMMFDUgmL1A3MO7VvWtt079+ep
	Ts+vTJ7tjKG6pk6+bPEYJSrt5tbTHXJazUwfzKybXT4XJXwsuTwOlHbw5q4+2XXgfMRj3O6ZmQo+s
	6UbLmOsW8Jbz7vdyRMNheKHJlu5iBUoAmQiGNHf2J+gDQ7lnJhs0Wd7VG1PINnwQNpvKHDsO5GzYx
	pxARGdzpohetzQoPHq7izNnifGZ7KO+wo11ZebNo6hFjgRYqi8GskJdKKuR1yuCMAzOpqs3a5K2pL
	ZZOblOBOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6Zn-00EDdI-BQ; Fri, 05 Mar 2021 09:16:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6ZS-00EDSx-B4; Fri, 05 Mar 2021 09:16:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16E8864F45;
 Fri,  5 Mar 2021 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614935788;
 bh=KEwMRCIZF4N4qvSPoe3DClNVeplmH4EkZWy7fg+Ty8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8ksPqQVEmCqAb+LBFF6xySukXRl2l7PWsjWkgGEnQkcfvNoAAJR9DY8Y4erLja8o
 8jJ08I9P195p2aHynAEx+PlPZPgbn8S2g83bYnXGxOWy5vbzteVPvVOc+81YfsrDhY
 H2oeI/ngitJ8V5rEpt95rIJ5rX3lqMNP0MKHXuaI=
Date: Fri, 5 Mar 2021 10:16:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 03/17] usb: xhci-mtk: get the microframe boundary for ESIT
Message-ID: <YEH26UVlV/yWfk0S@kroah.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-3-git-send-email-chunfeng.yun@mediatek.com>
 <cfa6dccb-d784-06fd-e5bc-0b53d105b7f6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfa6dccb-d784-06fd-e5bc-0b53d105b7f6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091631_542775_081E0564 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, Mar 05, 2021 at 12:13:33PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 05.03.2021 12:02, Chunfeng Yun wrote:
> 
> > Tune the boundary for FS/LS ESIT due to CS:
> > For ISOC out-ep, the controller starts transfer data after
> > the first SS; for others, the data is already transfered
> 
>    Transferred.
> 
> > before the last CS.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/usb/host/xhci-mtk-sch.c | 24 +++++++++++++++++++-----
> >   1 file changed, 19 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > index 8950d1f10a7f..e3b18dfca874 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -513,22 +513,35 @@ static void update_sch_tt(struct usb_device *udev,
> >   		list_del(&sch_ep->tt_endpoint);
> >   }
> > +static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
> > +{
> > +	u32 boundary = sch_ep->esit;
> > +
> > +	if (sch_ep->sch_tt) { /* LS/FS with TT */
> > +		/* tune for CS */
> > +		if (sch_ep->ep_type != ISOC_OUT_EP)
> > +			boundary += 1;
> 
>    Why not:
> 
> 			boundary++;
> 
> > +		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
> > +			boundary -= 1;
> 
> 			boundary--;

Doesn't matter either way, it's the author's choice.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
