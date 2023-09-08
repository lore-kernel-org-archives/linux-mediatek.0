Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF163EC875F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 02:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31PEewpa4+B4dFeiN37i8Fbea/ZaAvd1i5ssowflYuE=; b=YfMi26EV+X3mrX/rr9WGO8jmXs
	8EdIp9v/KxELo3Z7bP2whEgRe1bIl05re5ukeA1bl8sCv2zzPLRPzXpHrg5j3tDJD7oo8b3jDTIZe
	uXToiB9LZoo06RzydHUE0rdOhsqyPtOTZAx+Oe+ZWlPgjI1X9wt538x8QNFcTCeBfL0rjzeTq8owW
	w1cdgMixl0KjSl3qr+gEL2vvnWJS5tUj7cRkXoWqzVd95B3AOBlSC7uqQq/ZIr7fr0a9DjeYVr84I
	vvE593xxCigTU3hXSi5ArN6EBhSyeOTEWPgEU8MIAU1sxpkG26IDT+5VxG6vmbiwxySxEomsLwDi3
	tcsmZZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeR68-00Cvi5-2K;
	Fri, 08 Sep 2023 02:19:52 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeR63-00Cvh4-2p;
	Fri, 08 Sep 2023 02:19:50 +0000
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(696440:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 08 Sep 2023 10:19:13 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 8 Sep
 2023 10:19:13 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 8 Sep 2023 10:19:13 +0800
Date: Fri, 8 Sep 2023 10:19:13 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Sebastian Reichel
	<sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	<error27@gmail.com>
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
Message-ID: <20230908021913.GB3115@linuxcarl2.richtek.com>
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
 <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
 <1092ffb3-0238-4dc0-baf3-344a653fca3f@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1092ffb3-0238-4dc0-baf3-344a653fca3f@kadam.mountain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_191948_355975_F760DFCE 
X-CRM114-Status: GOOD (  16.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 07, 2023 at 02:08:17PM +0300, Dan Carpenter wrote:

[...]

> > > diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> > > index f27dae5043f5..a9641bd3d8cf 100644
> > > --- a/drivers/power/supply/mt6370-charger.c
> > > +++ b/drivers/power/supply/mt6370-charger.c
> > > @@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
> > >   	if (fl_strobe) {
> > >   		dev_err(priv->dev, "Flash led is still in strobe mode\n");
> > > -		return ret;
> > > +		return -EINVAL;
> > 
> > I think that returning 0 here was intentional, but I agree on a return ret
> > here being both confusing and wrong.
> 
> If it's a success path then probably we should remove the dev_err().
> 

Hi all,
Sorry for the late reply!

I agree with the first half of Angelo's statement, I did make the
mistake on this 'return ret'.
What I was trying to say is that you should not to toggle cfo function
when the FLED of MT6370 is still in "strobe mode".

Therefore, I think the change of Harshit's patch is correct.
It should be 'return -EINVAL' or 'return -EPERM' here.

Thanks!


Reviewed-by: ChiaEn Wu <chiaen_wu@richtek.com>


Best regards,
ChiaEn Wu

