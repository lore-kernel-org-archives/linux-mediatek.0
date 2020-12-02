Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFDBC64E8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 11:17:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BEC2223C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 11:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BEC2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e7jwlLtSxWINS011B1E9XHkoik+LX4AdKb7R6AzIdLM=; b=wV1VXdJ4Hs5DqXanOekfv4JOY
	scA7BEn1QFxzxPyP3clr9r2Ryn8FfdVn8shFxZx6kIDvsMS0Ufzvk/Ym2Xs0sAxAuCf++CrFu6J1b
	QzO99N6Geh1m46lC82yzSqAaqMkp6aEGH/aM9Gw8XVi8iq+OFssGYsTcRTVc/gY/7f3+ac6nwg8gl
	s1GmhMBf5ji602rQlnZwrTF00tTKlqT9WNxRf2mN1P5u/CTvZSY+XOGGgxe4BxHBdZc+hrYZTOmVS
	QfoNtoaN2I7a3qBJDq8hEAPPCAomNsMqueaUTG61jTWoFBr+qrgH1YIipH7oXHtPgHcOJHMrRbp4/
	kI8cywb7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkQ8Z-0003YJ-3t; Wed, 02 Dec 2020 11:17:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkQ8U-0003XB-P9; Wed, 02 Dec 2020 11:17:28 +0000
X-UUID: 30259bd58a5c4c0ca8886ebb07696519-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=760UWcQjn2gcgFpRL7UilO2rZNCmADv37JpOgMvIh4Y=; 
 b=rh/upvV2O4pXoF3EAQfOfa23iCqIJa/hWBP+Mf5WIF22nVXhd0ftJaoVGpPlSLdNjlGJNeF2fYGN6ddXIXKrJ46VZ1IFJMJke9taw0MIT9bnOBAqKKaL9byIXnoz3J8AD2SIeryMabdmvIAJa7w3ZjSw3yTIJ9rpHrD4915VECo=;
X-UUID: 30259bd58a5c4c0ca8886ebb07696519-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 171763711; Wed, 02 Dec 2020 03:17:15 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 03:07:15 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Dec 2020 19:06:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Dec 2020 19:06:40 +0800
Message-ID: <1606907202.14806.65.camel@mhfsdcap03>
Subject: Re: [v6, 3/3] reset-controller: ti: force the write operation when
 assert or deassert
From: Crystal Guo <crystal.guo@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 2 Dec 2020 19:06:42 +0800
In-Reply-To: <20201130111340.GA3042402@chromium.org>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-4-crystal.guo@mediatek.com>
 <20201130111340.GA3042402@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 30A9654AF1CD9EA4FBA4BE9BFA52EA70554F9FC4BBB7FB01E220F307C0ED74462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_061727_283198_79374E37 
X-CRM114-Status: GOOD (  22.93  )
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

On Mon, 2020-11-30 at 19:13 +0800, Ikjoon Jang wrote:
> On Wed, Sep 30, 2020 at 10:21:59AM +0800, Crystal Guo wrote:
> > Force the write operation in case the read already happens
> > to return the correct value.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  drivers/reset/reset-ti-syscon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > index 5d1f8306cd4f..c34394f1e9e2 100644
> > --- a/drivers/reset/reset-ti-syscon.c
> > +++ b/drivers/reset/reset-ti-syscon.c
> > @@ -97,7 +97,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->assert_bit);
> >  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> >  }
> 
> I don't think there are no reset controllers with cached regmap,
> thus I don't think this is needed.
> Are there any specific reasons behind this, what I've missed here?
> 
> We need to be sure that all other devices using this driver
> should have no side effects on write.
> 
> I can think of a weird controller doing unwanted things internally
> on every write disregarding the current state. (or is this overly
> paranoid?)
> 
The specific reason is that, the clear bit may keep the same value with
the set bit, but the clear operation can be only be completed by writing
1 to the clear bit, not just with the current fake state "1".

> >  
> >  /**
> > @@ -128,7 +128,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->deassert_bit);
> >  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> >  }
> >  
> >  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
