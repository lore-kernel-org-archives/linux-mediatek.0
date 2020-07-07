Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4188EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 02:57:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4B120708
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 02:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WushsyAB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s5Tou4sO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F4B120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NTE6Jx1YLtJvfq2qNCS0ILadKYXjqaHTPwD9OE0LA88=; b=WushsyABRhsCPNZ0rUtvKo9qI
	VLoRMMSB5EBJE7Bz7wOBjI6ISNFx75UPVIEDx5UZCd3XPJKd8bzQWg9G6e8ojF+r3gzNoeiTUaqG2
	nGf4dx0MKyRA4MZ783AwhVcsYiDlRQXHWtLzs+50eZ3gkipTIm2H8gFvg5WwOTFcdmld7PjMbR3KR
	qyMTtQK2LEizaxhg1Xg/D4FUEa5rEMiLkelJ3sASLFtV+z1KW+0NUktEYfNUTKknl60pbNJumHTnk
	5aSEMO05r6roNHN5FtxR8nUMpmW9AbGZvKRMtE64/H6YEoFY76ll7/c2U5hWG5Nuw8kJbJN0yEsl8
	diXavEnZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsdnH-0002QK-RZ; Tue, 07 Jul 2020 02:57:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsdnE-0002PJ-I2; Tue, 07 Jul 2020 02:57:14 +0000
X-UUID: 88fc7af55c5b4bfb9b94d21e32fe5a20-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JlmGTHZwHTcXgIMKxnpcmoCUwU10rO0W8+zkm1qjoio=; 
 b=s5Tou4sOz+JKnJNL8Lc8zbXWnqt4G+5UxOHIbRh5ZjtFy3R8JMbPQX7lyvdZugTpPGbm7OvKYmdD6uD5PBNDWn8Xd2IOlAKoOvzxFdwxzWF3u66oK3jJnLWlQ6oiYWMTN2kYAy9H6LM/TE2NbSot7lViUo6cHHbCgGQu1cU7FM0=;
X-UUID: 88fc7af55c5b4bfb9b94d21e32fe5a20-20200706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 338544127; Mon, 06 Jul 2020 18:57:06 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 19:57:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 10:56:59 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 10:57:00 +0800
Message-ID: <1594090621.20216.0.camel@mtksdccf07>
Subject: Re: [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 7 Jul 2020 10:57:01 +0800
In-Reply-To: <1591329023.12739.0.camel@mtksdccf07>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-8-michael.kao@mediatek.com>
 <1afbf412-fbeb-8abe-66d8-bd7ac4e9dd83@linaro.org>
 <1591329023.12739.0.camel@mtksdccf07>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_225712_912466_A95DF669 
X-CRM114-Status: GOOD (  24.75  )
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
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-05 at 11:50 +0800, Michael Kao wrote:
> On Fri, 2020-05-22 at 17:36 +0200, Daniel Lezcano wrote:
> > On 23/03/2020 13:15, Michael Kao wrote:
> > > From: "michael.kao" <michael.kao@mediatek.com>
> > > 
> > > The driver of thermal and svs will use the
> > > same register for the project which should select
> > > bank before reading sensor value.
> > 
> > Here there is a design problem AFAICT. The sensor should not be using
> > external locks.
> > 
> The PTPCORESEL is a common register used by svs and thermal.
> The thermal need to ensure PTPCORESEL register will not be changed by
> svs when thermal switch bank to read raw data of temperature.
> So we use svs_lock to make sure there is no conflict between the two
> drivers.
> > 
> > > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > > ---
> > >  drivers/thermal/mtk_thermal.c | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> > > index 9eaca432920e..594ad4f0f8cd 100644
> > > --- a/drivers/thermal/mtk_thermal.c
> > > +++ b/drivers/thermal/mtk_thermal.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/thermal.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/types.h>
> > > +#include <linux/power/mtk_svs.h>
> > >  
> > >  /* AUXADC Registers */
> > >  #define AUXADC_CON1_SET_V	0x008
> > > @@ -262,7 +263,7 @@ struct mtk_thermal {
> > >  	struct clk *clk_peri_therm;
> > >  	struct clk *clk_auxadc;
> > >  	/* lock: for getting and putting banks */
> > > -	struct mutex lock;
> > > +	unsigned long flags;
> > >  
> > >  	/* Calibration values */
> > >  	s32 adc_ge;
> > > @@ -561,7 +562,7 @@ static void mtk_thermal_get_bank(struct mtk_thermal_bank *bank)
> > >  	u32 val;
> > >  
> > >  	if (mt->conf->need_switch_bank) {
> > > -		mutex_lock(&mt->lock);
> > > +		mt->flags = claim_mtk_svs_lock();
> > >  
> > >  		val = readl(mt->thermal_base + PTPCORESEL);
> > >  		val &= ~0xf;
> > > @@ -581,7 +582,7 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
> > >  	struct mtk_thermal *mt = bank->mt;
> > >  
> > >  	if (mt->conf->need_switch_bank)
> > > -		mutex_unlock(&mt->lock);
> > > +		release_mtk_svs_lock(mt->flags);
> > >  }
> > >  
> > >  /**
> > > @@ -938,8 +939,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	mutex_init(&mt->lock);
> > > -
> > >  	mt->dev = &pdev->dev;
> > >  
> > >  	auxadc = of_parse_phandle(np, "mediatek,auxadc", 0);
> > > 
> > 
> > 
> Hi Daniel,

Gently ping.
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
