Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92719C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Hatty36K65cqwK6lkTwTMwi8cb4kn478xt8XncQik4=; b=4nwy2eWMMHzhKK
	f3NhieSlfBrGbHT2kVZoQ+zaP2Tiww9zBVyA2+Y4YZgT6GIcugdKJgJMtrTXrFwIvZc/Egv5+zRnA
	Avl4R7dPXpwOpvSQQPYLUl3GnZJy9F8T0yPp18r7IxJ8mLaQYvuH7Whx6YYC6I2wWA16yCUY3MAJP
	8Qe2Ov5eaSzT6r3VIM3ZnN0tD5dVw7fxn26yCuSw5fR2UyS5woLMp2hOAodv1uuUo2MFO4QukOeYV
	wp7cKN+FH1HtsN05bIRoZc3WuWzzXqKhaYok/LWGJIrNjVzgeR+nF+JCd9kij9DcJ32tM43VLuH94
	jAf61EUCQdgiXzpclDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4kM-0030AJ-VT; Mon, 23 May 2022 09:53:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3rs-002cLe-In; Mon, 23 May 2022 08:56:50 +0000
X-UUID: db92aaccfb794ef18147addd87fc3fee-20220523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EP4870WDlBmHAqAt87r+joV31SN7Xl3tZYlNECuyRTk=; 
 b=HTf0tqlC8rtm4oUHyseewsWl903Y6oSSlS6h+dIYvkbhTbBtm9FYNcg/KDC50sTbbkZjLzGAZzEwZ6jdhCtXlyv72tkFTSVtEsSro1OVnvlepJOoc+iU9iM5uq/XFLw/JYmHY7eV/eKf6K3FOdXB3wKoUcF2kM3bcCyRCkrgGB0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:cc6cb4e3-22ea-4e38-8b5f-9f5a218ab4ea, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:d830467a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: db92aaccfb794ef18147addd87fc3fee-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 689009682; Mon, 23 May 2022 01:56:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 01:55:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 16:55:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 16:55:52 +0800
Message-ID: <e48b8f9194df9add1849a50186570f30f086262f.camel@mediatek.com>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: fix fs isoc's transfer error
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, <stable@vger.kernel.org>
Date: Mon, 23 May 2022 16:55:52 +0800
In-Reply-To: <7781eaaf-ad09-7283-dbb8-69d0fb3f1d14@collabora.com>
References: <20220512064931.31670-1-chunfeng.yun@mediatek.com>
 <7781eaaf-ad09-7283-dbb8-69d0fb3f1d14@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015648_681756_44C5D986 
X-CRM114-Status: GOOD (  22.91  )
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

On Wed, 2022-05-18 at 14:01 +0200, AngeloGioacchino Del Regno wrote:
> Il 12/05/22 08:49, Chunfeng Yun ha scritto:
> > Due to the scheduler allocates the optimal bandwidth for FS ISOC
> > endpoints,
> > this may be not enough actually and causes data transfer error, so
> > come up
> > with an estimate that is no less than the worst case bandwidth used
> > for
> > any one mframe, but may be an over-estimate.
> > 
> > Fixes: 451d3912586a ("usb: xhci-mtk: update fs bus bandwidth by
> > bw_budget_table")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Hello Chunfeng,
> I agree this is "a fix"... but is it the best fix?
> 
> Shooting the bandwidth very high will have power consumption
> consequences, are
> those measurable?
This is usually limited into one interval; e.g. the last interval
transfers 8 bytes in fact, but I assume it may transfer 188 bytes, I
think the consumption increase can be ignored.

> And if they are, what is the expected power consumption increase in
> percentage
> (and/or microamperes)? Also, out of the expected increase, have you
> got any
> measurement for that?
> 
> Assuming that the measurement is done for one SoC, it's possible to
> make some
> assumption about a different part.
> 
> Regards,
> Angelo
> 
> > ---
> >   drivers/usb/host/xhci-mtk-sch.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c
> > b/drivers/usb/host/xhci-mtk-sch.c
> > index f3139ce7b0a9..953d2cd1d4cc 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
