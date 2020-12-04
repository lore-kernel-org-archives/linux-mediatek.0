Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AB2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:34:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5F4222512
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 02:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5F4222512
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GLB7DxrvGqXNGxWXYKnn/ONjfDGCCaH7yLjz6E8n2gk=; b=iOiLnVEzC8AXXd+XKH3C3EO1q
	ajm/4XPpoaQXflMdlIup4lrAL78Lhcca+CiW7+Acewf6//afxHjxaMj17b7/enWOr/qLXoKErXbGE
	CvlqpD2f+n+iBF6+eZpaoEAUOvxDppNcEDmlCIwHU6QkW2+w8mzI8tkDn/S07AZHNKfHp10U3qIJO
	fnvJm2hOI0EB/5DVY5TF12sxXy/9W1pkDQw2xWZrux0USVPEDdNGb6gBlLYWOaeSOq4GlQg2bfkUl
	+6lA/8RL1GKabcechAy4YMuDqA8IVEPFTFyZJEi7PNYRPMnLK8KZw2459IDAHKDG7kbCo+RtoeSS6
	/yp44bP5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl0vi-0007yH-Gs; Fri, 04 Dec 2020 02:34:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl0ve-0007x1-39; Fri, 04 Dec 2020 02:34:39 +0000
X-UUID: 4d8d8d729fea4bfba3647750e198a2aa-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ks0giwSuTJtBdXjdEkWwvc1tFrljUySYf/NOC1MuX90=; 
 b=f1Gjgy+XFNvSTsfTww8P93GO6oaRbccsxZEQ8nXHtPyUirAn0JmFE8MAK1f6BmMnpamhB66qq2slCEqZRjJrk+UipuXpEB+AjT5Nw5Gie526VQdOGI7ovHRFHCZi29lgu5ntpNMTAFPd+iFepT+nWJu/qUwDtX1aaLHLCa4hlTc=;
X-UUID: 4d8d8d729fea4bfba3647750e198a2aa-20201203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1708143215; Thu, 03 Dec 2020 18:34:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 18:34:25 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Dec 2020 10:34:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:34:23 +0800
Message-ID: <1607049263.14806.69.camel@mhfsdcap03>
Subject: Re: [v6,2/3] reset-controller: ti: introduce a new reset handler
From: Crystal Guo <crystal.guo@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 4 Dec 2020 10:34:23 +0800
In-Reply-To: <20201130103505.GA3019533@chromium.org>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-3-crystal.guo@mediatek.com>
 <20201130103505.GA3019533@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 25E45A4316C76E3EED103E9DBA28B3BC44ABD9990A4FFD7D374985132BAF0C842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_213438_335450_FA52E48B 
X-CRM114-Status: GOOD (  26.73  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Yong Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 "s-anna@ti.com" <s-anna@ti.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-30 at 18:35 +0800, Ikjoon Jang wrote:
> On Wed, Sep 30, 2020 at 10:21:58AM +0800, Crystal Guo wrote:
> > Introduce ti_syscon_reset() to integrate assert and deassert together.
> > If some modules need do serialized assert and deassert operations
> > to reset itself, reset_control_reset can be called for convenience.
> > 
> > Such as reset-qcom-aoss.c, it integrates assert and deassert together
> > by 'reset' method. MTK Socs also need this method to perform reset.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> 
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
> 
> > ---
> >  drivers/reset/reset-ti-syscon.c | 40 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > index a2635c21db7f..5d1f8306cd4f 100644
> > --- a/drivers/reset/reset-ti-syscon.c
> > +++ b/drivers/reset/reset-ti-syscon.c
> > @@ -15,15 +15,22 @@
> >   * GNU General Public License for more details.
> >   */
> >  
> > +#include <linux/delay.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/reset-controller.h>
> >  
> >  #include <dt-bindings/reset/ti-syscon.h>
> >  
> > +struct mediatek_reset_data {
> > +	unsigned char *reset_bits;
> > +	unsigned int reset_duration_us;
> > +};
> > +
> >  /**
> >   * struct ti_syscon_reset_control - reset control structure
> >   * @assert_offset: reset assert control register offset from syscon base
> > @@ -56,6 +63,7 @@ struct ti_syscon_reset_data {
> >  	struct regmap *regmap;
> >  	struct ti_syscon_reset_control *controls;
> >  	unsigned int nr_controls;
> > +	const struct mediatek_reset_data *reset_data;
> >  };
> >  
> >  #define to_ti_syscon_reset_data(rcdev)	\
> > @@ -158,9 +166,29 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> >  		!(control->flags & STATUS_SET);
> >  }
> >  
> > +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> > +				  unsigned long id)
> > +{
> > +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> > +	int ret;
> > +
> > +	if (data->reset_data) {
> > +		ret = ti_syscon_reset_assert(rcdev, id);
> > +		if (ret)
> > +			return ret;
> > +		usleep_range(data->reset_data->reset_duration_us,
> > +			data->reset_data->reset_duration_us * 2);
> > +
> 
> There are many users using assert() and deassert() seperately
> without any delay between them.
> 
> If there's a timing requirement between assertion and deassertion,
> shouldn't there be a same amount of delay in assert?

The "reset_duration_us" is an optional configuration to make the reset
operation more generic, which was added based on Philipp's comment in
[v2,4/6].

Thanks,
Crystal
> 
> > +		return ti_syscon_reset_deassert(rcdev, id);
> > +	} else {
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> >  static const struct reset_control_ops ti_syscon_reset_ops = {
> >  	.assert		= ti_syscon_reset_assert,
> >  	.deassert	= ti_syscon_reset_deassert,
> > +	.reset		= ti_syscon_reset,
> >  	.status		= ti_syscon_reset_status,
> >  };
> >  
> > @@ -182,7 +210,11 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
> >  	if (IS_ERR(regmap))
> >  		return PTR_ERR(regmap);
> >  
> > -	list = of_get_property(np, "ti,reset-bits", &size);
> > +	data->reset_data = of_device_get_match_data(&pdev->dev);
> > +	if (data->reset_data)
> > +		list = of_get_property(np, data->reset_data->reset_bits, &size);
> > +	else
> > +		list = of_get_property(np, "ti,reset-bits", &size);
> >  	if (!list || (size / sizeof(*list)) % 7 != 0) {
> >  		dev_err(dev, "invalid DT reset description\n");
> >  		return -EINVAL;
> > @@ -217,8 +249,14 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
> >  	return devm_reset_controller_register(dev, &data->rcdev);
> >  }
> >  
> > +static const struct mediatek_reset_data mtk_reset_data = {
> > +	.reset_bits = "mediatek,reset-bits",
> > +	.reset_duration_us = 10,
> > +};
> > +
> >  static const struct of_device_id ti_syscon_reset_of_match[] = {
> >  	{ .compatible = "ti,syscon-reset", },
> > +	{ .compatible = "mediatek,syscon-reset", .data = &mtk_reset_data},
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, ti_syscon_reset_of_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
