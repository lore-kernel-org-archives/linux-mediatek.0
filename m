Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CFDC55178
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 11:18:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33B7204FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 11:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n+dnF7oe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SxaYmaE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33B7204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cFR2MpTAqz61KnyqckNHsD8GQlkYEPjeeZFrDgRghXc=; b=n+dnF7oef15rATvh9kM3wXzlX
	cDtv+ktXlAJ7cO58XdbLPJCK7ifJP4MFvQR1wwAFkYUFBoaj7QnhTrqId17WhCMEPIlrthfRXYqGm
	pe0FMd6jhmRLbNv+vvTCjn/nWtlj41euuf0chRVQvfNByURZMiNKQjzfwvnZ1gjcVWRethBHunI5E
	m0+73T9enOWr6Lzdi+uDANwvvYE8Oj6p+LCXZHZj4rDr4XBhYecZkGyCoA2oVUil43TaQvrfH7CuB
	qjET9QhrzEVVpRLBqZ/xQccUT2b/3M0M+8IzDwxJnOdyT5C/Vz/M+dz3CP9UdbLezVGjodwpHM18f
	TuJTq6jbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXN04-0008NP-Ai; Tue, 27 Oct 2020 11:18:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXN00-0008MP-V9; Tue, 27 Oct 2020 11:18:46 +0000
X-UUID: e3cb440b43204e49a89b5141d98c995d-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CX9QvQnyne8Hpt4VfAuu4sA7J/V8CvxMVl7RhxE/DMU=; 
 b=SxaYmaE49XuilnmphaNEB71Dw/oBm2b7ZYqo6E1yITGPA0p7w9N/qomU53DfViooGIicj1kbYvyGHjBBG6HROr/CAph4DIPSXH16qvFNglsI8BQwKVtOM/70fcohhqIoEXJMGMipSrsj3iR9wFWixT4XRzqUM/3CgM2fAecpJV8=;
X-UUID: e3cb440b43204e49a89b5141d98c995d-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 865214672; Tue, 27 Oct 2020 03:18:40 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 04:18:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 19:18:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 19:18:36 +0800
Message-ID: <1603797517.25228.3.camel@mtksdaap41>
Subject: Re: [PATCH v3 15/16] soc: mediatek: pm-domains: Add default power
 off flag
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>
Date: Tue, 27 Oct 2020 19:18:37 +0800
In-Reply-To: <05be2a94-d6e6-36e5-2c14-6d971e4a7677@gmail.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-16-enric.balletbo@collabora.com>
 <05be2a94-d6e6-36e5-2c14-6d971e4a7677@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ED58C28063F2386AC2BAD60DEE964D3B242838AD98D89E15AEA1582974FEA3202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_071845_272489_B829DBC1 
X-CRM114-Status: GOOD (  26.14  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-27 at 11:53 +0100, Matthias Brugger wrote:
> 
> On 26/10/2020 18:55, Enric Balletbo i Serra wrote:
> > From: Weiyi Lu <weiyi.lu@mediatek.com>
> > 
> > For some power domain, like conn on MT8192, it should be default OFF.
> > Because the power on/off control relies the function of connectivity chip
> > and its firmware. And if project choose other chip vendor solution,
> > those necessary connectivity functions will not provided.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> > 
> > Changes in v3: None
> > Changes in v2: None
> > 
> >   drivers/soc/mediatek/mtk-pm-domains.c | 23 +++++++++++++++++------
> >   drivers/soc/mediatek/mtk-pm-domains.h |  1 +
> >   2 files changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 63993076a544..fe0e955076a0 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -378,10 +378,16 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
> >   	 * software.  The unused domains will be switched off during
> >   	 * late_init time.
> >   	 */
> > -	ret = scpsys_power_on(&pd->genpd);
> > -	if (ret < 0) {
> > -		dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> > -		goto err_unprepare_clocks;
> > +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
> > +		if (scpsys_domain_is_on(pd))
> > +			dev_warn(scpsys->dev,
> > +				 "%pOF: A default off power domain has been ON\n", node);
> > +	} else {
> > +		ret = scpsys_power_on(&pd->genpd);
> > +		if (ret < 0) {
> > +			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> > +			goto err_unprepare_clocks;
> > +		}
> >   	}
> >   
> >   	if (scpsys->domains[id]) {
> > @@ -395,7 +401,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
> >   	pd->genpd.power_off = scpsys_power_off;
> >   	pd->genpd.power_on = scpsys_power_on;
> >   
> > -	pm_genpd_init(&pd->genpd, NULL, false);
> > +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> > +		pm_genpd_init(&pd->genpd, NULL, true);
> > +	else
> > +		pm_genpd_init(&pd->genpd, NULL, false);
> > +
> >   	scpsys->domains[id] = &pd->genpd;
> >   
> >   	return scpsys->pd_data.domains[id];
> > @@ -478,7 +488,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
> >   			"failed to remove domain '%s' : %d - state may be inconsistent\n",
> >   			pd->genpd.name, ret);
> >   
> > -	scpsys_power_off(&pd->genpd);
> > +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> > +		scpsys_power_off(&pd->genpd);
> 
> OK, so you merged Weiyi's patches in this series :)
> 
> So same comment here: Does it really hurt if we turn-off a already turned-off 
> power domain? Or can we get rid of this check?
> 

We do need this check here. If you try to turn-off this power domain,
you might make the clock or regulator reference count unbalanced.

> Regards,
> Matthias
> 
> >   
> >   	clk_bulk_unprepare(pd->num_clks, pd->clks);
> >   	clk_bulk_put(pd->num_clks, pd->clks);
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> > index 2ad213be84a5..0fa6a938b40c 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -6,6 +6,7 @@
> >   #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
> >   #define MTK_SCPD_FWAIT_SRAM		BIT(1)
> >   #define MTK_SCPD_SRAM_ISO		BIT(2)
> > +#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
> >   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
> >   
> >   #define SPM_VDE_PWR_CON			0x0210
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
