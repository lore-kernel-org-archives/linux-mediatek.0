Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 01:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wk3cdhEO1ZNJKur6tJ+2JZRRHFTgySgv6ASoPHW0h0=; b=nk/lUNXbUbY7/Z
	zsADSpVGr/v/f89qLFae8hbXjhgshrENEjcg+Ew5Eg9btVRUF8hTAF7SG5GpLjhqt1yl5uZ0cr6kN
	pnTPkUzBiFRo0Y8vfBT2nNuL7UiuRF3HhIzbiaM3NLqsi+zyYFcJULUYUIga2r14W9ZKnRv+ux3Fz
	7MWJvJaPAptiJS241+INF4rXc0gSmDUTgclT56S7z7kx/XKmwVmmITY2ZoVo33cBxl1TNXijvUb9x
	iCLLi8XQQI1gFIvV0OE3kGo5nvs94snACEBt9aNVqlsq0qyCf4yNqTtOroBRs3PEP4fC8MXZNSKHP
	rTfsFqS+ZOnGsKjtU8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niRQI-005Vtx-9p; Sun, 24 Apr 2022 01:52:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niRQ6-005Vt8-0D; Sun, 24 Apr 2022 01:52:16 +0000
X-UUID: 0e0c787f06f74251af602dda849dd550-20220423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tso1gJuXRVundk75NvHzBknX5CwR+ZWWntscwIXvxrY=; 
 b=CzW+6vwhjftgyCKa/2ehNAIbTVP5z7mw4+S5exSg4ggeVAoqfEzov3jhQ6XpGnQOn23fMuPN2HQ/FWfuyR30jg8b3DDEYC4SK2+GffrOr6tuMtNfDkz2L2k+hVdxMTzC3DmQPlwLH2HTQubEuxB4BF4WVTlcBuPCuRj96dRkJtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:20f109c1-0369-42ed-93b7-2bc64d83c7a0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:487ce2ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0e0c787f06f74251af602dda849dd550-20220423
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 489784829; Sat, 23 Apr 2022 18:52:06 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Apr 2022 18:52:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 24 Apr 2022 09:51:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 24 Apr 2022 09:51:49 +0800
Message-ID: <5f612ff198e3116d01b78d90bc6f0e695207d6a4.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] pwrap: mediatek: fix FSM timeout issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
 <zhiyong.tao@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Sun, 24 Apr 2022 09:51:49 +0800
In-Reply-To: <3765ba9fb62cef8fe9279ba5d6ded1c8b5b31a82.camel@mediatek.com>
References: <20220422033423.11702-1-zhiyong.tao@mediatek.com>
 <20220422033423.11702-2-zhiyong.tao@mediatek.com>
 <3765ba9fb62cef8fe9279ba5d6ded1c8b5b31a82.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_185214_097936_2E979CAF 
X-CRM114-Status: GOOD (  22.89  )
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

On Fri, 2022-04-22 at 16:27 +0800, Rex-BC Chen wrote:
> On Fri, 2022-04-22 at 11:34 +0800, Zhiyong Tao wrote:
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
> > 
> 
> Hello Zhiyong,
> 
> if this is a fix patch.
> IMO, you should add Fixes tag:
> 
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> 
Hi Rex-BC,

we will add it in v3

Thanks

> > Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >  mode change 100644 => 100755 drivers/soc/mediatek/mtk-pmic-wrap.c
> > 
> 
> File mode should be 100644.
> 
> BRs,
> Rex
> 
Hi Rex-BC,

we will fix it in v3

Thanks
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > old mode 100644
> > new mode 100755
> > index 952bc554f443..ac7139a67e87
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/reset.h>
> > +#include <linux/delay.h>
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
