Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 01:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBV3PKw3k6GiPFmg9S8Vhs4vkoOdgg7yrVoAEW1EObc=; b=DdC5HobVfMzyKE
	nLJB2vWXK1Y9zVfpHEKfITPUMdsNWTWUcegtmkIBmRIORU8RXE6ka26HNFskcpUX7rX+JM9n4PIAk
	G+nwgD6UbR+1pZ1wlCxbDSMT94YzGtKusEYNDyCelRw+X48fYoqA324IEZYqu/Yck42VwGtDnY6Jr
	WKGb5a3/yPmJQWcYkB1xNcCVytJJqLGj9IsPJuFF1sbA3Wh2+xOoPhYe5Y7tRO0jfbFUwRLBuovle
	EPy0inL/CJkvN6vyM/SQGu1TVaEL3OwfVagD5fM+el2ulaEDlK9m9UoILHgyj6oiMvf7TNNtDTylH
	FyfNeTHheOKklGcqR1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njWqI-00GwyE-8E; Wed, 27 Apr 2022 01:51:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njWq7-00Gwtl-Ge; Wed, 27 Apr 2022 01:51:36 +0000
X-UUID: 4f193b66269041188ac284f60dc028e9-20220426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZCme6fswpAgAVaJ6HWIGXKc6W12jTuRdqpz42niqDXI=; 
 b=HILI3zXA6SYXf5UFhjdsi1k7xVn52csn2RMUzC0PG++3L/rf4xWQCdMvNSHBhAVz15Xgn2v/JoVWWzAhrnKuULLN771+XhbHOfgc50fPflyxefUFH8QL/iQBwfi7bYuAvocODBxG1HvYbPDNdcC0XRxqClsMFb8iio9iWBC9v+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e8b7f08d-d949-4a96-b177-c9ab3efcb4b1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:ab1b98c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4f193b66269041188ac284f60dc028e9-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1063565119; Tue, 26 Apr 2022 18:51:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 18:51:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 09:51:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 09:51:23 +0800
Message-ID: <de68bcba2a25aba3e045ecb6280e3ec432e95e96.camel@mediatek.com>
Subject: Re: [PATCH v3 1/1] pwrap: mediatek: fix FSM timeout issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
 <sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 27 Apr 2022 09:51:23 +0800
In-Reply-To: <862706781d408669cd80e7e041d96a878178283c.camel@mediatek.com>
References: <20220424025738.32271-1-zhiyong.tao@mediatek.com>
 <20220424025738.32271-2-zhiyong.tao@mediatek.com>
 <862706781d408669cd80e7e041d96a878178283c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_185135_606413_87216ACF 
X-CRM114-Status: GOOD (  24.08  )
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

On Mon, 2022-04-25 at 10:05 +0800, Rex-BC Chen wrote:
> On Sun, 2022-04-24 at 10:57 +0800, Zhiyong Tao wrote:
> > From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> > 
> > Fix pwrap FSM timeout issue which leads the system crash on GFX
> > VSRAM
> > power on.
> > Add a usleep delay to avoid busy read for the H/W status.
> > For avoiding the system behavior(ex. disable interrupt in
> > suspend/resume
> > flow, schedule block task)cause if (time_after()) be turn first,
> > we change it after sleep delay.
> > Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135
> > and
> > MT8173 SoCs")
> > 
> > Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> > ---
> 
> Hello Zhiyong,
> 
> IMO, commit messages should be
> 
> Fix pwrap FSM timeout issue....
> ...we change it after sleep delay.
> 
> (=> one blank)
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> (=> oneline)
> 
we will change it in v4
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> 
> >  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index 952bc554f443..ac7139a67e87 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/reset.h>
> > +#include <linux/delay.h>
> 
> Sorry, I do not notice this in previous version. It will proper order
> the header in alphabet.
we will change it in v4
> 
>  #include <linux/delay.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> 
> BRs,
> Rex
> >  
> >  #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
> >  #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
> > @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct
> > pmic_wrapper *wrp,
> >  	timeout = jiffies + usecs_to_jiffies(10000);
> >  
> >  	do {
> > -		if (time_after(jiffies, timeout))
> > -			return fp(wrp) ? 0 : -ETIMEDOUT;
> >  		if (fp(wrp))
> >  			return 0;
> > +
> > +		usleep_range(10, 11);
> > +
> > +		if (time_after(jiffies, timeout))
> > +			return fp(wrp) ? 0 : -ETIMEDOUT;
> >  	} while (1);
> >  }
> >  
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
