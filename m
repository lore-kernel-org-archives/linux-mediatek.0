Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B450C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FF2206B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9pxSE40";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CVnQ6MNd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FF2206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVISoBdVmKkWwR2UtNMkErd4hQgruMXR69Hq8WE/Cak=; b=A9pxSE40sI3rPM0xkFnB0HKyi
	U9FcZ08pEJ2FfqBuQk9UVhcyu8vwCN1YOkegySKLgv4eiGrSX2OPmgINUcbbeZmNLk21vJN2pWsuv
	RBLGcHypdX1ZnRL/4r4mCpu6VQNUNVUEIwc+cwqRScEvNVV9RASDEja4moSNcgr0XhakYlOgsFI7F
	+MQb4CUNvDEDQv6NqetI6V1/WgAi+++jckdzAmfSe/jsCaxW05PRaTlHHjeUNEG/CEnJfYr4R6rca
	Qfh+FWaDMc/AaOBGoMyjYl8/h1jwBy9fAjfompFkW64qV4VmrMkGHOcxcLnLLirROpmGEfySIHN1K
	1pyUWe9NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k51nb-0000L5-72; Mon, 10 Aug 2020 07:00:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k51nX-0000KJ-IK; Mon, 10 Aug 2020 07:00:44 +0000
X-UUID: 33cd942851fe48468ca4039c0b885527-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Xw9BjZ4pnzLPpecBByDNDqBMr0STEN5PIXp+ijmFw1o=; 
 b=CVnQ6MNdd+98Yf1QkoGZ1+qh6kLncmNYqDm6rNNlVR/CWrjaUMYFbhixEtjnukXhEsK1mJ60jLjZIuqfMEuSHAZpdmHWsY0WeLzO1LrFoc67e4nkYpq2KPLWrS8MOjuJuk9WrnIMUFezFE79wKvIn8JLEZzaGseggxiwlESZYro=;
X-UUID: 33cd942851fe48468ca4039c0b885527-20200809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 636002178; Sun, 09 Aug 2020 22:58:29 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Aug 2020 23:58:29 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Aug 2020 14:58:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 14:58:24 +0800
Message-ID: <1597042656.11360.39.camel@mhfsdcap03>
Subject: Re: [v2,5/6] reset-controller: ti: Introduce force-update method
From: Crystal Guo <crystal.guo@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 "Andrew F. Davis" <afd@ti.com>
Date: Mon, 10 Aug 2020 14:57:36 +0800
In-Reply-To: <3413ca889fcef11c6dafe1d6b135e1887d84a6e4.camel@pengutronix.de>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-6-crystal.guo@mediatek.com>
 <3413ca889fcef11c6dafe1d6b135e1887d84a6e4.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 51D951749A9B482193787EAABBD8C446E680275178669CECFC7FA62C607318CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_030043_753419_E137F90A 
X-CRM114-Status: GOOD (  22.90  )
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
Cc: Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>, Suman
 Anna <s-anna@ti.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Andrew F. Davis" <afd@ti.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
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

On Tue, 2020-08-04 at 15:03 +0800, Philipp Zabel wrote:
> Hi Crystal,
> 
> On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> > Introduce force-update method for assert and deassert interface,
> > which force the write operation in case the read already happens
> > to return the correct value.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> 
> Added Suman and Andrew for confirmation: I think writing unconditionally
> can't break any existing user. Just changing to regmap_write_bits()
> instead of adding the update-force property as in v1 should be fine.
> 
> regards
> Philipp
> 
Hi Suman, Andrew,

Can you help to give some suggestions about this change.
Is this can be changed to write unconditionally, or should I add a
update-force property to force the write operation.

Best regards
Crystal.

> > ---
> >  drivers/reset/reset-ti-syscon.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > index 1c74bcb9a6c3..f4baf78afd14 100644
> > --- a/drivers/reset/reset-ti-syscon.c
> > +++ b/drivers/reset/reset-ti-syscon.c
> > @@ -57,6 +57,7 @@ struct ti_syscon_reset_data {
> >  	struct ti_syscon_reset_control *controls;
> >  	unsigned int nr_controls;
> >  	bool assert_deassert_together;
> > +	bool update_force;
> >  };
> >  
> >  #define to_ti_syscon_reset_data(rcdev)	\
> > @@ -90,7 +91,10 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->assert_bit);
> >  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > +	if (data->update_force)
> > +		return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> > +	else
> > +		return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> >  }
> >  
> >  /**
> > @@ -121,7 +125,10 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->deassert_bit);
> >  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > +	if (data->update_force)
> > +		return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> > +	else
> > +		return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> >  }
> >  
> >  /**
> > @@ -223,6 +230,10 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
> >  		data->assert_deassert_together = true;
> >  	else
> >  		data->assert_deassert_together = false;
> > +	if (of_property_read_bool(np, "update-force"))
> > +		data->update_force = true;
> > +	else
> > +		data->update_force = false;
> >  
> >  	data->rcdev.ops = &ti_syscon_reset_ops;
> >  	data->rcdev.owner = THIS_MODULE;
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
