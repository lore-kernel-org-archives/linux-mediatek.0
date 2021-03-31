Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F187C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 07:53:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D05B61582
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 07:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D05B61582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9rEC33+H2vXYNHtg/JX+A2VVBjagqcDJ9gRDbQmKbOw=; b=DS5BuB6Ifwgj3GDGGBNRFTq3m
	3NTMdAkyuXueioo6zk0Ys/iLesV4wjIBDraTDbNcjZ79jMpiYKBeldf+ve5tyQceZi/HHbUDR36c+
	RgLY36kei5GkWxt6nZRc24Wkkg8GkgzzO+sM37nZ22P14gDIWCf2LYs/ZU2UFhJFY2QhI8wrHH7x/
	2XWP4l3if4cSvg324sHO/PuL4CSsCDz/sjZd5m07JUMWUTI7CrrZfZpymB6/Wg47+eXSOmIlJu89D
	40RDehEzVlrsqQHZ2up1tbfWVhJn5cOKMOdK8eu61IN1pIstd5ACNornBxxhrzdt89P3WFZqrSHMI
	DQ0+D+NjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRVfd-005ray-75; Wed, 31 Mar 2021 07:53:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRVfT-005rYn-P6; Wed, 31 Mar 2021 07:53:38 +0000
X-UUID: b1a452d5b618417398820b4e95e6cc9b-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KzbJJ1Ta9lbpfgXvFcfFoyPIpURFpSf7aU3hafYGSns=; 
 b=CRGnvhjHnrWLnNY5Re6332ZtoO1s8xMODIe/0vc+0c85wZgqmwvGd2OB0zNQ0V2xnERTlR0vVskR0+bQyfJIeCTJNLqU+8rvM6fxySPgwulwtp7xSVi08kGJzIMc4en+ycUyjGebS0FIeE5j0m145J/SOnqI0QfSJdNfXCjWR/I=;
X-UUID: b1a452d5b618417398820b4e95e6cc9b-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1321624304; Wed, 31 Mar 2021 00:53:30 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 00:53:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 15:53:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 15:53:26 +0800
Message-ID: <1617177207.13332.9.camel@mtksdaap41>
Subject: Re: [PATCH V8 7/8] devfreq: mediatek: cci devfreq register opp
 notification for SVS support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Wed, 31 Mar 2021 15:53:27 +0800
In-Reply-To: <6f1f7bf5-54b0-d3e2-e93c-fa4a837c9222@samsung.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <CGME20210323113413epcas1p1d3acc9ac2539da96b0757a0159bdcfc7@epcas1p1.samsung.com>
 <1616499241-4906-8-git-send-email-andrew-sh.cheng@mediatek.com>
 <6f1f7bf5-54b0-d3e2-e93c-fa4a837c9222@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_085336_605333_D5399134 
X-CRM114-Status: GOOD (  34.30  )
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

On Thu, 2021-03-25 at 17:11 +0900, Chanwoo Choi wrote:
> Hi,
> 
> I think that you can squash this patch to patch4.

> On 3/23/21 8:34 PM, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > SVS will change the voltage of opp item.
> 
> What it the full name of SVS?

Due to the content of this patch is for SVS, so I separate it from
patch4.
SVS is Smart-Voltage-Scaling.
It will check the IC quality, and then modify the voltage field of opp
table.
The required voltage will smaller than original signed-off voltage in
opp table.
This voltage will change when temperature is changed.
cci devfreq need to raise voltage when the required voltage raise.

> 
> > CCI devfreq need to react to change frequency.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/devfreq/mt8183-cci-devfreq.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
> > index 018543db7bae..6942a48f3f4f 100644
> > --- a/drivers/devfreq/mt8183-cci-devfreq.c
> > +++ b/drivers/devfreq/mt8183-cci-devfreq.c
> > @@ -21,6 +21,7 @@ struct cci_devfreq {
> >  	struct clk *cci_clk;
> >  	int old_vproc;
> >  	unsigned long old_freq;
> > +	struct notifier_block opp_nb;
> >  };
> >  
> >  static int mtk_cci_set_voltage(struct cci_devfreq *cci_df, int vproc)
> > @@ -89,6 +90,26 @@ static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
> >  	return 0;
> >  }
> >  
> > +static int ccidevfreq_opp_notifier(struct notifier_block *nb,
> 
> I think that you better to change the function name as following:
> ccidevfreq_opp_notifier -> mtk_cci_devfreq_opp_notifier
I will change it on next patch

> 
> > +				   unsigned long event, void *data)
> > +{
> > +	struct dev_pm_opp *opp = data;
> > +	struct cci_devfreq *cci_df = container_of(nb, struct cci_devfreq,
> > +						  opp_nb);
> > +	unsigned long	freq, volt;
> > +
> > +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> > +		freq = dev_pm_opp_get_freq(opp);
> > +		/* current opp item is changed */
> > +		if (freq == cci_df->old_freq) {
> > +			volt = dev_pm_opp_get_voltage(opp);
> > +			mtk_cci_set_voltage(cci_df, volt);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static struct devfreq_dev_profile cci_devfreq_profile = {
> >  	.target = mtk_cci_devfreq_target,
> >  };
> > @@ -98,12 +119,15 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
> >  	struct device *cci_dev = &pdev->dev;
> >  	struct cci_devfreq *cci_df;
> >  	struct devfreq_passive_data *passive_data;
> > +	struct notifier_block *opp_nb;
> >  	int ret;
> >  
> >  	cci_df = devm_kzalloc(cci_dev, sizeof(*cci_df), GFP_KERNEL);
> >  	if (!cci_df)
> >  		return -ENOMEM;
> >  
> > +	opp_nb = &cci_df->opp_nb;
> 
> Just move this code at the neighborhood of 'opp_nb->notifier_call' init code.
I will modify it on next patch

> 
> > +
> >  	cci_df->cci_clk = devm_clk_get(cci_dev, "cci_clock");
> >  	ret = PTR_ERR_OR_ZERO(cci_df->cci_clk);
> >  	if (ret) {
> > @@ -152,6 +176,9 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
> >  		goto err_opp;
> >  	}
> >  
> > +	opp_nb->notifier_call = ccidevfreq_opp_notifier;
> > +	dev_pm_opp_register_notifier(cci_dev, opp_nb);
> 
> Need to check whether return value is valid or not.
I will add the check for next patch


> 
> > +
> >  	return 0;
> >  
> >  err_opp:
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
