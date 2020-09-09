Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FA1C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:00:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E85D20EDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGoRRl4z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sl4zEzkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E85D20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N6yf2WXBdu8SrVtOA55n1fYhTA6/LPExamVLwLvgVJ8=; b=LGoRRl4ziZ9f2bSrBCa+MJrCA
	nPub3svHarGUDKoJF+wmFkbgbUGlP09WJ7qualbJBsHOjmBnaWD+4K3icMcvdneWe6h9ONE+jenJ8
	D2fDLpTIjYY/YPXBzfikbqhyGUG0d3Dt+WK9XHYYGBu3Eg9eaPhrSIpH4sAsuQ0dKcc4kMzLQDaQT
	DOy88ZX5ZlVv0hMtj0uhtOBR6s3k0YcJZxOILgaEyJcGHDYcZwl2PPqSEw/REk9WpAv0FBOfqpcdt
	NuZ7OxP0RHRoR1Vd5VHO4ulCzdEIWiIGJIJYtVjoO4g7S+cp84YFUpnl9hwGsdGs0DRaa2attGqNf
	0T9cOp/mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqL5-0001Ha-Nl; Wed, 09 Sep 2020 03:00:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqL1-0001GC-HS; Wed, 09 Sep 2020 03:00:00 +0000
X-UUID: e7a3530e2aba44ecb6e5912dbb1f9e0f-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CoD/azwfliGei22WWvULFvB+ftOMVB//DhdbZ0hZnHU=; 
 b=sl4zEzktFiutz5nvkbSsH4pFpxV/fd1d8o8y4PAkqoq/RMjXJ8KnsB4Nma1cL9Fs9YZyyD58vyklStV/C0fVHA/ehJuf6JdpVnQSrd5/Cg8fdZE7EL5JvNabnGPzi0GtE2SyQyMmordu3clIHHRQ/AFMVi9WVetesqocamck/6Q=;
X-UUID: e7a3530e2aba44ecb6e5912dbb1f9e0f-20200908
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 185339199; Tue, 08 Sep 2020 18:59:56 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 19:59:54 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Sep 2020 10:59:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 10:59:51 +0800
Message-ID: <1599620279.14806.18.camel@mhfsdcap03>
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
From: Crystal Guo <crystal.guo@mediatek.com>
To: Suman Anna <s-anna@ti.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>
Date: Wed, 9 Sep 2020 10:57:59 +0800
In-Reply-To: <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
 <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8FF367AE59B7085B86EBAFD42EA9607EE2343874A68663AA8489A4A9C3D323D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_225959_775018_7CD941BD 
X-CRM114-Status: GOOD (  28.80  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Thu, 2020-09-03 at 07:40 +0800, Suman Anna wrote:
> Hi Crystal,
> 
> On 8/16/20 10:03 PM, Crystal Guo wrote:
> > Introduce ti_syscon_reset() to integrate assert and deassert together.
> > If some modules need do serialized assert and deassert operations
> > to reset itself, reset_control_reset can be called for convenience.
> 
> There are multiple changes in this same patch. I think you should split this
> functionality away from the change for the regmap_update_bits() to
> regmap_write_bits(), similar to what you have done in your v2 Patch 4.
> 

Thanks for your suggestion.
I will split this patch in the next version.

> > 
> > Such as reset-qcom-aoss.c, it integrates assert and deassert together
> > by 'reset' method. MTK Socs also need this method to perform reset.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  drivers/reset/reset-ti-syscon.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > index a2635c21db7f..08289342f9af 100644
> > --- a/drivers/reset/reset-ti-syscon.c
> > +++ b/drivers/reset/reset-ti-syscon.c
> > @@ -15,6 +15,7 @@
> >   * GNU General Public License for more details.
> >   */
> >  
> > +#include <linux/delay.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -56,6 +57,7 @@ struct ti_syscon_reset_data {
> >  	struct regmap *regmap;
> >  	struct ti_syscon_reset_control *controls;
> >  	unsigned int nr_controls;
> > +	unsigned int reset_duration_us;
> >  };
> >  
> >  #define to_ti_syscon_reset_data(rcdev)	\
> > @@ -89,7 +91,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->assert_bit);
> >  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> >  }
> >  
> >  /**
> > @@ -120,7 +122,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> >  	mask = BIT(control->deassert_bit);
> >  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> >  
> > -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> >  }
> >  
> >  /**
> > @@ -158,9 +160,26 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> >  		!(control->flags & STATUS_SET);
> >  }
> >  
> > +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> > +				  unsigned long id)
> > +{
> > +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> > +	int ret;
> > +
> > +	ret = ti_syscon_reset_assert(rcdev, id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (data->reset_duration_us)
> > +		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
> > +
> > +	return ti_syscon_reset_deassert(rcdev, id);
> 
> I echo Philipp's comments [1] from your original v1 series about this. We don't
> need a property to distinguish this, but you could add a flag using match data
> and Mediatek compatible, and use that within this function, or optionally set
> this ops based on compatible (whatever is preferred by Philipp).
> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/comment/23519193/
> 
Hi Suman, Philipp

Which method would you recommend more?
1. like v2 patch, but assign the flag "data->assert_deassert_together"
directly (maybe rename "assert_deassert_together" to
"reset_op_available")

2. use Mediatek compatible to decide the reset handler available or not.

Thanks
Crystal

> > +}
> > +
> >  static const struct reset_control_ops ti_syscon_reset_ops = {
> >  	.assert		= ti_syscon_reset_assert,
> >  	.deassert	= ti_syscon_reset_deassert,
> > +	.reset		= ti_syscon_reset,
> >  	.status		= ti_syscon_reset_status,
> >  };
> >  
> > @@ -204,6 +223,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
> >  		controls[i].flags = be32_to_cpup(list++);
> >  	}
> >  
> > +	of_property_read_u32(pdev->dev.of_node,	"reset-duration-us",
> > +				&data->reset_duration_us);
> > +
> >  	data->rcdev.ops = &ti_syscon_reset_ops;
> >  	data->rcdev.owner = THIS_MODULE;
> >  	data->rcdev.of_node = np;
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
