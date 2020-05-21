Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D569C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFB520748
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P5R99cSE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ThZVrXEX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFB520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYcJIgz+MKRhQ4F99pCw6JuMhvD9pBLXLRPfw6xMJLI=; b=P5R99cSEhKzGi2
	6f+YVZXMkKurpeGd/8213fWe4kx5OrUoPlKigYW3oSUt1aqE/URTMyuYV+dqDFX4G4Kfk55vrRjxR
	xHl0exZAfXDJ+7hnmJALsKZq7jELAd5dN60fvoNgQZ/OWtM8j0CsSdi4TM+FCRIS3pqH11ypjzom7
	EqvYIZ59A8meBkyXRGJEwODodCh+eeUo3lJFj1zHa+FpfqxFMi0wD/KkB7SYm6n5gi8Oy1qT1VZdl
	JHk5Vniiu1hYJvz4LvsdAc7ZmdQSyPTJWWBM2GHyeYqKMiBxsh22/w8guX7KkKQdbGOB4CmI+axOC
	mGxTMLc+qJxHKEGxVpMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbaM7-0007kS-4m; Thu, 21 May 2020 01:50:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbaLw-0007c1-0H; Thu, 21 May 2020 01:50:33 +0000
X-UUID: 2a7d3d6f708242ef832624eae674aa38-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iA3rm6tm1TCbtJYi3Z4bsuX93wDGi5lZZQ8BBM1TLr4=; 
 b=ThZVrXEX0fa53G2rS34K2Fa8DaXcIoQB6srBKTr+lR1DkRftl73LO5tTQk3QHEXIaGAtbjw3KHPI8CsflqErN+jz+WAg4wNPTQW5swfh/TI3P5pLeROi3NwBh8SODirjd0Q8ktGR/hpJUOIHREnPA/CoMYzhivgxUgOlaNyl3eQ=;
X-UUID: 2a7d3d6f708242ef832624eae674aa38-20200520
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 423449908; Wed, 20 May 2020 17:50:30 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 18:50:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 May 2020 09:50:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 May 2020 09:50:27 +0800
Message-ID: <1590025827.17518.2.camel@mtksdaap41>
Subject: Re: [PATCH 01/12] OPP: Allow required-opps even if the device
 doesn't have power-domains
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 21 May 2020 09:50:27 +0800
In-Reply-To: <b667fff9-50ae-bff2-ae17-1cf0ca1a08a5@gmail.com>
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
 <20200520034307.20435-2-andrew-sh.cheng@mediatek.com>
 <b667fff9-50ae-bff2-ae17-1cf0ca1a08a5@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_185032_052795_DA19B040 
X-CRM114-Status: GOOD (  21.07  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Saravana
 Kannan <saravanak@google.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J
 . Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 16:54 +0200, Matthias Brugger wrote:
> 
> On 20/05/2020 05:42, Andrew-sh.Cheng wrote:
> > From: Saravana Kannan <saravanak@google.com>
> > 
> > A Device-A can have a (minimum) performance requirement on another
> > Device-B to be able to function correctly. This performance requirement
> > on Device-B can also change based on the current performance level of
> > Device-A.
> > 
> > The existing required-opps feature fits well to describe this need. So,
> > instead of limiting required-opps to point to only PM-domain devices,
> > allow it to point to any device.
> > 
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> 
> Please check all patches, they are missing your
> Signed-off-by
> 
> Regards,
> Matthias

Hi Matthias,

I modify patch [6/12] to meet kernel-5.7 data structure and add
signed-off.
For [1/12] to [5/12], I didn't modify them.
Should I also add signed-off ?

BR,
Andrew-sh.Cheng
> 
> > ---
> >  drivers/opp/core.c |  2 +-
> >  drivers/opp/of.c   | 11 -----------
> >  2 files changed, 1 insertion(+), 12 deletions(-)
> > 
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index ba43e6a3dc0a..51403c1f2481 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -755,7 +755,7 @@ static int _set_required_opps(struct device *dev,
> >  		return 0;
> >  
> >  	/* Single genpd case */
> > -	if (!genpd_virt_devs) {
> > +	if (!genpd_virt_devs && required_opp_tables[0]->is_genpd) {
> >  		pstate = likely(opp) ? opp->required_opps[0]->pstate : 0;
> >  		ret = dev_pm_genpd_set_performance_state(dev, pstate);
> >  		if (ret) {
> > diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> > index 9cd8f0adacae..6d33de668a7b 100644
> > --- a/drivers/opp/of.c
> > +++ b/drivers/opp/of.c
> > @@ -195,17 +195,6 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
> >  
> >  		if (IS_ERR(required_opp_tables[i]))
> >  			goto free_required_tables;
> > -
> > -		/*
> > -		 * We only support genpd's OPPs in the "required-opps" for now,
> > -		 * as we don't know how much about other cases. Error out if the
> > -		 * required OPP doesn't belong to a genpd.
> > -		 */
> > -		if (!required_opp_tables[i]->is_genpd) {
> > -			dev_err(dev, "required-opp doesn't belong to genpd: %pOF\n",
> > -				required_np);
> > -			goto free_required_tables;
> > -		}
> >  	}
> >  
> >  	goto put_np;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
