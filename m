Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FD4C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA0261490
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 16:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA0261490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfjWYmRwxCwpopWqIxHErzEPUgT9iE6UeScvj3JgVSA=; b=mtoYcWHJo3BiEE
	mLGT1hNRWTrocmbE6ihfwOYX02C3uUWBfgEzY5wbLgvygzcQFi+oHyxfUrgq7IBYwfLS0WRaygSPk
	wLW6OsLTASiYiUZTUZZ+gb7+TBDnsOALmH0/0V3Ry8PC5snfFd26HLLd/rehhRI2Moa6Wp9SQijKT
	r2V2boUWUqAKS0snyP5QFa/UCcwVZDZuvRUy0CCfs/68DgACyjbHeWKed6bcNo1u7XofT2fNgdptx
	lhPLAR7y4Qxb4qmjhbgG9G98rot4RWeQwek7x5gqVHJiMTRpIDqslZseKcJ3Bdijvnks9t+WcPxhz
	Y5vaZK84f5CJ7UoFMhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBcH-001EKR-To; Tue, 15 Jun 2021 16:08:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9R9-000E8e-38; Tue, 15 Jun 2021 13:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uCY1G8F+R+hDbFnivL5vV3pmXtIw8uNunG7ewSPDoYo=; b=DUK1PIkFhWg4JjyJpdqDm+T/Mr
 r56fVgVOjxAsV241LcmLWkD0koPonRmEv2xPOAdt8TDT5TMjxYj9sHA8Pi7mnInOy7UpoQyZb0j80
 6Y826TK8i0zP+xL72aJRnIwW5NGLbnLQql3ijYIv5yHuqx6kVDrOdJNPEFzf7zdkssx5XUoSdcepJ
 15d3kgv6/I7cuRlH46DQ9Rg9aq2oAglIw2H/khCjJfSELNKrh1Ndv/188Gq8s3Pn7FXMxJl5+hwrc
 wNWsF0umQNYgJ6w9fLZFuhdsme6klUNG8LtP2ovsYIpEv6Zw6dZHWtU9hJQXf0sEI0w8zQe/KYoIH
 xEvazKRQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsy9T-007F1u-CY; Tue, 15 Jun 2021 01:46:16 +0000
X-UUID: 60b3c9c27f3f4428a251c960df9b0f47-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uCY1G8F+R+hDbFnivL5vV3pmXtIw8uNunG7ewSPDoYo=; 
 b=SA2vVdMJhRmBW0Pbe9VPfYNE3jbEaeTeh44+yOWBRjcQh/s9kuh8PTCClQAZLd/DpGjUk/KsgPC9NrMoEgTBPZFEaUnNuYO55HX/+YoM+Rvl4Ykh/3lurtgrvZ6DMHqg9LFIBctvN1d2xTcW90jkAWAyuiV1pg9VTieQJfQEvv8=;
X-UUID: 60b3c9c27f3f4428a251c960df9b0f47-20210614
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1336353930; Mon, 14 Jun 2021 18:42:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 18:42:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 09:42:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 09:42:36 +0800
Message-ID: <0ce161d31c4b0a8dc862d5e6c89a3e2f62d32a10.camel@mediatek.com>
Subject: Re: [PATCH 3/3] soc: mediatek: pm-domains: Add support for mt8195
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.corp-partner.google.com>
Date: Tue, 15 Jun 2021 09:42:36 +0800
In-Reply-To: <f050f072-1732-b6f0-f505-2d0a44563ce5@gmail.com>
References: <20210610023614.5375-1-chun-jie.chen@mediatek.com>
 <20210610023614.5375-4-chun-jie.chen@mediatek.com>
 <f050f072-1732-b6f0-f505-2d0a44563ce5@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_024613_618555_8250AA16 
X-CRM114-Status: GOOD (  20.33  )
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

On Thu, 2021-06-10 at 10:50 +0200, Matthias Brugger wrote:
> Hi Chun-Jie,
> 
> Thanks for the patch, comments below.
> 
> On 10/06/2021 04:36, Chun-Jie Chen wrote:
> > From: "chun-jie.chen" <
> > chun-jie.chen@mediatek.corp-partner.google.com>
> > 
> > Add the needed board data to support mt8195 SoC.
> > 
> 
> Please try to come up with a better commit message. Especially
> mention that we
> have to increase the SPM_MAX_BUS_PROT_DATA.
> 
> > Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> 
> I suppose your name would be "Chun-Jie Chen"
> 
> Please also fix your git settings to that From and Signed-off-by
> matches.
> 
> [...]
> 
> >  
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h
> > b/drivers/soc/mediatek/mtk-pm-domains.h
> > index 8b86ed22ca56..1b8967b9829e 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -37,7 +37,7 @@
> >  #define PWR_STATUS_AUDIO		BIT(24)
> >  #define PWR_STATUS_USB			BIT(25)
> >  
> > -#define SPM_MAX_BUS_PROT_DATA		5
> > +#define SPM_MAX_BUS_PROT_DATA		6
> >  
> >  #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	
> > \
> >  		.bus_prot_mask = (_mask),			\
> > @@ -72,8 +72,6 @@ struct scpsys_bus_prot_data {
> >  	bool ignore_clr_ack;
> >  };
> >  
> > -#define MAX_SUBSYS_CLKS 10
> > -
> 
> Good catch, not needed define. Can you put that in a new patch
> please?
> 
> Regards,
> Matthias

Thanks for your comments, I will send v2 to fix it.

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
