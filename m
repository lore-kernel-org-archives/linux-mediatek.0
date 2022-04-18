Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jBEBYMIDv5hgdUCLSxicrhzKAj/kTdARcQ4uVsamlY=; b=kxYxEgxsVa8m7+
	wAqFniUtFRhM1tvHI5MEaxfiUn36CyZf+9ckRJtFRKxVjoK8otkAOUPgiIZC/8/jZ1b564WgYxR3n
	G5y1wu+SMzUN2ff4oQr4Wh0jO4igTjyWoGys+TH7dq7EsPwK7+hnl8gS79T12TTrryzzs8zxG9S5Y
	lLu4OEPRBKW1Vhpimt+aooeQnZ1DFVEGJ+EYogDt+FBhq4BzFMRVETZ6bfTmPE7GmYFVjS+/vxwL+
	/DzYumQzp+IcZNMBAuRHo/e7zd4y3s6C8soJtCDjT8z6ey2qnlP64jv/ub08y+QP0UbUSwOoajFIb
	wKz376RoQiaNthuwb1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGDC-00FDY1-2T; Mon, 18 Apr 2022 01:29:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGCy-00FDVj-GC; Mon, 18 Apr 2022 01:29:42 +0000
X-UUID: e90e07d597834283b37f0c8b41bff3e9-20220417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m+A9hEFpLd30wXkh2Z0r28xOTa49VmlT6gqTrTyD6+Y=; 
 b=UZfqy6S2BDobIZMTfd+IxM3z8swR1lzTRzTaOSb5VWkS3sv1uoJ4DV2FznybfrGz6aK/LrZKCDL6ohgN9T4SBOS75LQFcJSbx6xAmh+UpDptCvcwzFGz9a0qo9lvyViy34KjttuEl0fQ+wIC8XSFSGeFCK2fd2nWfo9I599LAqs=;
X-UUID: e90e07d597834283b37f0c8b41bff3e9-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1320497867; Sun, 17 Apr 2022 18:29:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:29:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 18 Apr 2022 09:29:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:29:26 +0800
Message-ID: <2658f200dabe3ef69a8f60a731701e17d7fb64fc.camel@mediatek.com>
Subject: Re: [PATCH v1 1/1] pwrap: mediatek: fix wait time out issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 18 Apr 2022 09:29:26 +0800
In-Reply-To: <d3b8f78b-24b0-d0f1-f5cd-c3cb29ee25d7@gmail.com>
References: <20220329115824.13005-1-zhiyong.tao@mediatek.com>
 <20220329115824.13005-2-zhiyong.tao@mediatek.com>
 <d3b8f78b-24b0-d0f1-f5cd-c3cb29ee25d7@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_182940_592360_160CB4D1 
X-CRM114-Status: GOOD (  23.28  )
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

On Tue, 2022-03-29 at 16:44 +0200, Matthias Brugger wrote:
> 
> On 29/03/2022 13:58, Zhiyong Tao wrote:
> > From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> > 
> > add sleep delay before read "jiffies"
> > 
> > Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >   mode change 100644 => 100755 drivers/soc/mediatek/mtk-pmic-wrap.c
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > old mode 100644
> > new mode 100755
> > index 952bc554f443..ac7139a67e87
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -12,6 +12,7 @@
> >   #include <linux/platform_device.h>
> >   #include <linux/regmap.h>
> >   #include <linux/reset.h>
> > +#include <linux/delay.h>
> >   
> >   #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
> >   #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
> > @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct
> > pmic_wrapper *wrp,
> >   	timeout = jiffies + usecs_to_jiffies(10000);
> >   
> >   	do {
> > -		if (time_after(jiffies, timeout))
> > -			return fp(wrp) ? 0 : -ETIMEDOUT;
> >   		if (fp(wrp))
> >   			return 0;
> > +
> > +		usleep_range(10, 11);
> > +
> 
> You need to explain this change. Why is it needed, are you sure it
> does not 
> break other platforms etc.
> 
> I can guess why you need that patch here. In any case in the code you
> provide, 
> it would make sense to move the first if out of the do loop and only
> after this 
> wait 10 us before reading again. Right now the code does usleep only
> after every 
> other read.
> 
> Regards,
> Matthias
> 
Hi Mattias,

we confirm the delay time with our pwrap designer.
we should add the 10us delay before reading again.
The patch is accord with all platforms pwrap design.
we will explain this in next version.

Thanks.
> > +		if (time_after(jiffies, timeout))
> > +			return fp(wrp) ? 0 : -ETIMEDOUT;
> >   	} while (1);
> >   }
> >   
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
