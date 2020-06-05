Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DA1C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 03:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8E82074B
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 03:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAzhiO89";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o7OE5JzG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD8E82074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvVacoWHlKX0D4SsaVyxf4vw0hNIXwjs0XBsR2RWqGc=; b=IAzhiO89UPTgaH
	IQtYXsiWYS7EPkGXizQlPIEdTMx+l9iyrV/F6P7ihQiLUUNKMpqOlX3yNd/8yCV4VjzgIqDYP5888
	9WeZ0gvHBktW7yMdAMDRz3Or2M0YlnClHQvP9sNGVR8zsF8vFv3fvm5YJvklJVOmA2y6ODVFRCBaV
	QhpgNxhV9t+wO4kTZDDqGTPLDE/Va2b3qq6KnFXLiEHA1LDBN2dBRfSFOwDXBKjyOZv2LaMHOuBiQ
	UxRPiUVU/Q5cvpHoK9h7xK81yYcWaAqwVMzxBhLZkO8PR70MFUGDxaLHhewXkIT6uMbQuhG/HeLId
	OfA1hLXO1ZqASP4JRfHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh3Sy-0000xA-GW; Fri, 05 Jun 2020 03:56:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh3Sv-0000vk-J6; Fri, 05 Jun 2020 03:56:22 +0000
X-UUID: b34e46de3d844048bf2bb71306102db9-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nodj+mPReRlQXG2TgUtq1ZD5ZB5fPazugGHuHFy4WJ8=; 
 b=o7OE5JzGpclymNhuqCgJNCGWuLRtTUNx8K4D9U1WQUZqMtSPUSP5+dV+ZyhmMdKlDYGdbbxCeGxL/EX+ZcHkkTfXSpoK8atd6c/Od/UHjg3C823PofOyG+toC6vPBWh1iM1cEQZN8ZZAqC+H8xn37MvzAtVdCEBZRvJKW7ODCk0=;
X-UUID: b34e46de3d844048bf2bb71306102db9-20200604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 994925515; Thu, 04 Jun 2020 19:56:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 20:50:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 11:50:22 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 11:50:22 +0800
Message-ID: <1591329023.12739.0.camel@mtksdccf07>
Subject: Re: [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 5 Jun 2020 11:50:23 +0800
In-Reply-To: <1afbf412-fbeb-8abe-66d8-bd7ac4e9dd83@linaro.org>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-8-michael.kao@mediatek.com>
 <1afbf412-fbeb-8abe-66d8-bd7ac4e9dd83@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_205621_632844_8A80AFB6 
X-CRM114-Status: GOOD (  18.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-22 at 17:36 +0200, Daniel Lezcano wrote:
> On 23/03/2020 13:15, Michael Kao wrote:
> > From: "michael.kao" <michael.kao@mediatek.com>
> > 
> > The driver of thermal and svs will use the
> > same register for the project which should select
> > bank before reading sensor value.
> 
> Here there is a design problem AFAICT. The sensor should not be using
> external locks.
> 
The PTPCORESEL is a common register used by svs and thermal.
The thermal need to ensure PTPCORESEL register will not be changed by
svs when thermal switch bank to read raw data of temperature.
So we use svs_lock to make sure there is no conflict between the two
drivers.
> 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > ---
> >  drivers/thermal/mtk_thermal.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> > index 9eaca432920e..594ad4f0f8cd 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mtk_thermal.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/thermal.h>
> >  #include <linux/reset.h>
> >  #include <linux/types.h>
> > +#include <linux/power/mtk_svs.h>
> >  
> >  /* AUXADC Registers */
> >  #define AUXADC_CON1_SET_V	0x008
> > @@ -262,7 +263,7 @@ struct mtk_thermal {
> >  	struct clk *clk_peri_therm;
> >  	struct clk *clk_auxadc;
> >  	/* lock: for getting and putting banks */
> > -	struct mutex lock;
> > +	unsigned long flags;
> >  
> >  	/* Calibration values */
> >  	s32 adc_ge;
> > @@ -561,7 +562,7 @@ static void mtk_thermal_get_bank(struct mtk_thermal_bank *bank)
> >  	u32 val;
> >  
> >  	if (mt->conf->need_switch_bank) {
> > -		mutex_lock(&mt->lock);
> > +		mt->flags = claim_mtk_svs_lock();
> >  
> >  		val = readl(mt->thermal_base + PTPCORESEL);
> >  		val &= ~0xf;
> > @@ -581,7 +582,7 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
> >  	struct mtk_thermal *mt = bank->mt;
> >  
> >  	if (mt->conf->need_switch_bank)
> > -		mutex_unlock(&mt->lock);
> > +		release_mtk_svs_lock(mt->flags);
> >  }
> >  
> >  /**
> > @@ -938,8 +939,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	mutex_init(&mt->lock);
> > -
> >  	mt->dev = &pdev->dev;
> >  
> >  	auxadc = of_parse_phandle(np, "mediatek,auxadc", 0);
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
