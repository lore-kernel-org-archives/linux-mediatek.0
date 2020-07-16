Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140BBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 11:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76FD20775
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 11:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLG1Pw2F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WbE30BBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D76FD20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LkUOEKg+PCsidEDypBuqvcn20lxTWDtEG3s08PH3GZo=; b=oLG1Pw2FBK3lBvXLiSvFZsSbj
	8JOMhu+gZ15bgKBNboRwrAKaIODMTEFXXhrjmU69/B77P/uaf8sMbQOarYVOb1fgI+YTXD7le/m2q
	ccVndk/tLxcYsFJS0E7+xA9zn4JVtAkHor2TnHyVjOoW/kZoARiJ5/1Jcb+7qOVnc1Z+x9+owOpE8
	tlEho9UnXdqI+Ae6owOozEj9+qfUQv40Z3DMNz5fMawxU46w3/EhUwvj6gGsLkzN7y2tzol8J9+Pz
	73gferwdlj5Ljpv3zYrOLu67wkqY33kmEnQX+2jBtOBMzuB2M3kcf3vICSna6lZ7xXiwrd2XAy2m3
	HA9hPrdUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw2AC-0003vL-1O; Thu, 16 Jul 2020 11:34:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw2A8-0003u3-Uw; Thu, 16 Jul 2020 11:34:54 +0000
X-UUID: 7cc7c3778d36477eaac6226fd9b56fca-20200716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cbuFoOK1wdtgBC8AfChxwbCs51YmLA5T5sOhw1KMA48=; 
 b=WbE30BBuXwSb5t+TiEwEzJHQKr3zIg3JqGJWpA57o0wo+RdVdhnsFHeKKmD7dgZUi+d+Dl3Qa6o8zRM46hcZ9uiJ+Ob7HukuTpA4iV0BJHwD5408NfGoT4aNsXUovHPZACs2mKakkpKWBkNaZoI0SSp/Xj7ZGNe3SJVeYPiMAe8=;
X-UUID: 7cc7c3778d36477eaac6226fd9b56fca-20200716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2137058911; Thu, 16 Jul 2020 03:34:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 04:28:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 19:28:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jul 2020 19:28:51 +0800
Message-ID: <1594898934.15138.1.camel@mtksdaap41>
Subject: Re: [PATCH v7 5/8] opp: Modify opp API, dev_pm_opp_get_freq(), find
 freq in opp, even it is disabled
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 16 Jul 2020 19:28:54 +0800
In-Reply-To: <20200713094245.ktx3oj3i225r74qh@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-6-git-send-email-andrew-sh.cheng@mediatek.com>
 <20200713094245.ktx3oj3i225r74qh@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_073453_197963_2C2E4E79 
X-CRM114-Status: GOOD (  20.05  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 15:12 +0530, Viresh Kumar wrote:
> On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > Modify dev_pm_opp_get_freq() to return freqeuncy
> > even this opp item is not available.
> > So that we can get the information of disable opp items.
> > 
> > Change-Id: I54dacf13050397f5080ccdb8b07d6220e7461e4e
> > CR-Id:
> > Feature:
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/opp/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index eed42d6b2e6b..5213e0462382 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -118,7 +118,7 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_voltage);
> >   */
> >  unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
> >  {
> > -	if (IS_ERR_OR_NULL(opp) || !opp->available) {
> > +	if (IS_ERR_OR_NULL(opp)) {
> >  		pr_err("%s: Invalid parameters\n", __func__);
> >  		return 0;
> >  	}
> 
> Please cleanup this patch for all the extra stuff that isn't required mainline
> and send it again to me separately from this series.

Hi Viresh~
I just resend this single patch to
--to="Viresh Kumar <viresh.kumar@linaro.org>"
--cc=srv_heupstream@mediatek.com
Please help check.
Thank you.

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
