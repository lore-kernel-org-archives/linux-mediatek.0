Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10794C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 05:15:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB37D61263
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 05:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB37D61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpC1it5rLgtQnVSsHjZYsQnCoAVe8K5OIijP+jAjOOg=; b=w8/rsTGY16ixDp
	ZUROrsXV9mzcd4GA5PVVcRtw+Lqhu0SWWIWAM2ggNWfGX5qi5dHbwJPXkTWoqlFISO2Mcykhq7pXZ
	l/grql4W13PpJOxqq4mWiNjrAMqbXythTVuVDPjVl6qQnJ35S/PkTYBhHSHsQAPY7TCcRWI53kP7+
	rkTASnbBB8CKPRVjvKKWfOGv9Iw/QqErMMNNRtWt0aCqcC8gSDCZih3A5PNmeErPGth75Yj12z06b
	waFiotBQn4HwUnbzuOihNbS62TyOrpm2ruiw2fCDjQoanN8OFkM/jIHNhJLtgZ9WtEiLlvUCCnMEe
	jMcIpzbj8g4D4ZKkkfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu6r4-00CgVA-BN; Fri, 18 Jun 2021 05:15:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu6qz-00CgUD-FC; Fri, 18 Jun 2021 05:15:44 +0000
X-UUID: 775131e022764e15841355dca99acae4-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MCAYgtrEWwxFrtj93jLlwwnS1NNN9pXyMmhqwZFtpXc=; 
 b=uzXBXqEeRwmyIVNTNny111qTwSVSqpa5D0CEY5qFopsvhs8laQhRu4LDH7fLoNCXalpdsG2QjXtlw9vauejGlLmThXwIP5fe/SzAAjVHABOvNBg23TCOcKRfU4R3LMmGBMn6tbI/hfsZGUdLuTGeV2arT00dwf5sNsW2676J7p4=;
X-UUID: 775131e022764e15841355dca99acae4-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1779182285; Thu, 17 Jun 2021 22:15:38 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 22:15:36 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Jun 2021 13:15:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 13:15:25 +0800
Message-ID: <1623993325.25153.0.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: xhci-mtk: allow multiple Start-Split in a microframe
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>, "Tianping
 Fang" <tianping.fang@mediatek.com>
Date: Fri, 18 Jun 2021 13:15:25 +0800
In-Reply-To: <YMtOtC1j2DouJ9Is@kroah.com>
References: <1623895911-29259-1-git-send-email-chunfeng.yun@mediatek.com>
 <YMtOtC1j2DouJ9Is@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A4CED631902C6185AC2A9B0E844E6065C8B55134D3565F89B98FEFA91885E8D82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_221542_960441_B4BB3D9D 
X-CRM114-Status: GOOD (  24.34  )
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

On Thu, 2021-06-17 at 15:31 +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 17, 2021 at 10:11:51AM +0800, Chunfeng Yun wrote:
> > This patch is used to relax bandwidth schedule by allowing multiple
> > Start-Split in the same microframe.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 16 ----------------
> >  drivers/usb/host/xhci-mtk.h     |  2 --
> >  2 files changed, 18 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > index c07411d9b16f..149a0f4a6ec4 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -470,11 +470,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
> >  
> >  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
> >  {
> > -	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> >  	u32 extra_cs_count;
> >  	u32 start_ss, last_ss;
> >  	u32 start_cs, last_cs;
> > -	int i;
> >  
> >  	if (!sch_ep->sch_tt)
> >  		return 0;
> > @@ -491,10 +489,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
> >  		if (!(start_ss == 7 || last_ss < 6))
> >  			return -ESCH_SS_Y6;
> >  
> > -		for (i = 0; i < sch_ep->cs_count; i++)
> > -			if (test_bit(offset + i, tt->ss_bit_map))
> > -				return -ESCH_SS_OVERLAP;
> > -
> >  	} else {
> >  		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
> >  
> > @@ -521,9 +515,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
> >  		if (cs_count > 7)
> >  			cs_count = 7; /* HW limit */
> >  
> > -		if (test_bit(offset, tt->ss_bit_map))
> > -			return -ESCH_SS_OVERLAP;
> > -
> >  		sch_ep->cs_count = cs_count;
> >  		/* one for ss, the other for idle */
> >  		sch_ep->num_budget_microframes = cs_count + 2;
> > @@ -558,13 +549,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
> >  	for (i = 0; i < num_esit; i++) {
> >  		base = sch_ep->offset + i * sch_ep->esit;
> >  
> > -		for (j = 0; j < bits; j++) {
> 
> Now that bits is no longer used, we get a build warning.
> 
> Can you fix this patch and resend it?
Ok, thanks

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
