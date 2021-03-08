Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EDBC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:01:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C44156514D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C44156514D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLAL1dn6Z/FtfMmSQQVyX4aaKmAWOOihy0KiFpe68d8=; b=LUGpia8nQtIwgyqv7tlijLXEG
	ILPoJ6jqCVsT0cKNZSIUyWnZER9YoW7DvhXhjhZa50UrJI1mDxcJGrIFRwiUjDBNBIjJj8HQ8B5lD
	YUSmqj0mPNofhm3lcM+XzMfQeCUFk1SCdJJuwM1ajDT4YqXpjB/zNPP0o487MoyaD4O/MC8yzGe7m
	qYMd4Tf+tDQPoOw88TeYS6pvzTjDf3w51Cgxa2KTrD/mAFK0LhptT1XzUh5fkTGBP1LqpD37NGmfO
	7G3GfkNXvKJUZHIPGpqx9KLbcKtX7wagdXTrDbndRQvpisKmZLblpJpdSqnIgHvD6AYcf5hahtxAq
	SPAyeRiZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ5Cj-00EUJr-BT; Mon, 08 Mar 2021 02:01:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ5CK-00EUC6-D1; Mon, 08 Mar 2021 02:00:44 +0000
X-UUID: e48f1fa181a5407b80813a05e2f0a544-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cAEtYNvirduPPDmsHCYYxu63PGqbUKC1f0wMKO0QDrs=; 
 b=REl9V3YbBf/A4lRXnkgcZqm+QVDdesTHipweNyXp2EXxBxQmM6R0PEqwA2apt66PAJLfST7iSUURsBdJDEjgH5NVFej8gwkHYLOkOnfv50fVDMRlf2UNuRceWY//zmlEQmSzRVsoHAfllrBuDKkvuSO2uWAtkScsBL85+9Es7P0=;
X-UUID: e48f1fa181a5407b80813a05e2f0a544-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2127080580; Sun, 07 Mar 2021 18:00:30 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 17:58:08 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Mar 2021 09:57:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 09:57:43 +0800
Message-ID: <1615168663.32109.5.camel@mhfsdcap03>
Subject: Re: [PATCH 03/17] usb: xhci-mtk: get the microframe boundary for ESIT
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Date: Mon, 8 Mar 2021 09:57:43 +0800
In-Reply-To: <cfa6dccb-d784-06fd-e5bc-0b53d105b7f6@gmail.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
 <1614934975-15188-3-git-send-email-chunfeng.yun@mediatek.com>
 <cfa6dccb-d784-06fd-e5bc-0b53d105b7f6@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_020040_843972_ED3553AC 
X-CRM114-Status: GOOD (  17.52  )
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

On Fri, 2021-03-05 at 12:13 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 05.03.2021 12:02, Chunfeng Yun wrote:
> 
> > Tune the boundary for FS/LS ESIT due to CS:
> > For ISOC out-ep, the controller starts transfer data after
> > the first SS; for others, the data is already transfered
> 
>     Transferred.
Ok
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
> >   
> > +static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
> > +{
> > +	u32 boundary = sch_ep->esit;
> > +
> > +	if (sch_ep->sch_tt) { /* LS/FS with TT */
> > +		/* tune for CS */
> > +		if (sch_ep->ep_type != ISOC_OUT_EP)
> > +			boundary += 1;
> 
>     Why not:
> 
> 			boundary++;
Forgot it, it's modified from "boundary = sch_ep->esit + 1;"

Thanks
> 
> > +		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
> > +			boundary -= 1;
> 
> 			boundary--;
> 
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
