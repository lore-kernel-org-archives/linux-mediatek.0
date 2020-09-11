Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D73C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:50:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED582078B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mn1KAH82";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lON8JTY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED582078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjGWPhN73R7dYrgf4nYdmy/lrcEttu3cwkG1+7PepjI=; b=Mn1KAH82iAYjVAk594ful2bRM
	JYIF6b9NclJrH1DySHfzl5NagOQhDR62CqP3JhqqlDDxjCpX4Wlg2LzqiOUdfoL3aCfWb9Z8KlDF+
	jfzECmiGUXkRZC7pnd4WIX2k8LY2/KR3WN+iEf0FKUWRZRhUx/6lT+SJVbY9Ozu7FhPkdjOfZ6N3y
	Q5rq7qBciHe+UvLXsxbcKQclX5+HtLbm9UVESr9oD/3DO87RhUiiBhEtynkTyvW4YULwdKD8nKkg7
	HPEHB42VRQyk6ri5fs0Q9cnYwE2ZeSDh5tOBMnf8PXKKdLeWBBgYIG0sSgR8ZfSpSyvbUGMEh/BOl
	CzDGWcoLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGZ8H-0000f0-UH; Fri, 11 Sep 2020 02:49:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGZ8A-0000az-Rq; Fri, 11 Sep 2020 02:49:44 +0000
X-UUID: d25347540e194a3fb8d43ee803d5da84-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iAPpf/+IfeWNrnv4nT68Qa9EWJFrb9ALmYG700BS52w=; 
 b=lON8JTY2G3UpcWRMvKMJ5usICJPOsp6ElqmPDZ9LTYhU/UF8GkWsuz4zbdUDiLYfnWOh+cUC1HGyRCwGR308cViVb+/qC7nzhgPZl7EBqLbVR4dR4Wpi4e+rIB32FcZI1YYqby0Ky0ENOOP0PkvT8Xops2KMf9CjZSaMhzpgA9c=;
X-UUID: d25347540e194a3fb8d43ee803d5da84-20200910
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1773258839; Thu, 10 Sep 2020 18:44:21 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 19:44:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 10:44:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 10:44:12 +0800
Message-ID: <1599792140.14806.22.camel@mhfsdcap03>
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
From: Crystal Guo <crystal.guo@mediatek.com>
To: Suman Anna <s-anna@ti.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Date: Fri, 11 Sep 2020 10:42:20 +0800
In-Reply-To: <096362e9-dee8-4e7a-2518-47328068c2fd@ti.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
 <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
 <1599620279.14806.18.camel@mhfsdcap03>
 <096362e9-dee8-4e7a-2518-47328068c2fd@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8500C517F22303B208341FCB4C1D5E487D29F35B29BB79172D43D9C13348FC582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_224943_173940_F48662A6 
X-CRM114-Status: GOOD (  33.04  )
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-09 at 23:39 +0800, Suman Anna wrote:
> On 9/8/20 9:57 PM, Crystal Guo wrote:
> > On Thu, 2020-09-03 at 07:40 +0800, Suman Anna wrote:
> >> Hi Crystal,
> >>
> >> On 8/16/20 10:03 PM, Crystal Guo wrote:
> >>> Introduce ti_syscon_reset() to integrate assert and deassert together.
> >>> If some modules need do serialized assert and deassert operations
> >>> to reset itself, reset_control_reset can be called for convenience.
> >>
> >> There are multiple changes in this same patch. I think you should split this
> >> functionality away from the change for the regmap_update_bits() to
> >> regmap_write_bits(), similar to what you have done in your v2 Patch 4.
> >>
> > 
> > Thanks for your suggestion.
> > I will split this patch in the next version.
> > 
> >>>
> >>> Such as reset-qcom-aoss.c, it integrates assert and deassert together
> >>> by 'reset' method. MTK Socs also need this method to perform reset.
> >>>
> >>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> >>> ---
> >>>  drivers/reset/reset-ti-syscon.c | 26 ++++++++++++++++++++++++--
> >>>  1 file changed, 24 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> >>> index a2635c21db7f..08289342f9af 100644
> >>> --- a/drivers/reset/reset-ti-syscon.c
> >>> +++ b/drivers/reset/reset-ti-syscon.c
> >>> @@ -15,6 +15,7 @@
> >>>   * GNU General Public License for more details.
> >>>   */
> >>>  
> >>> +#include <linux/delay.h>
> >>>  #include <linux/mfd/syscon.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/of.h>
> >>> @@ -56,6 +57,7 @@ struct ti_syscon_reset_data {
> >>>  	struct regmap *regmap;
> >>>  	struct ti_syscon_reset_control *controls;
> >>>  	unsigned int nr_controls;
> >>> +	unsigned int reset_duration_us;
> >>>  };
> >>>  
> >>>  #define to_ti_syscon_reset_data(rcdev)	\
> >>> @@ -89,7 +91,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> >>>  	mask = BIT(control->assert_bit);
> >>>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> >>>  
> >>> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> >>> +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> >>>  }
> >>>  
> >>>  /**
> >>> @@ -120,7 +122,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> >>>  	mask = BIT(control->deassert_bit);
> >>>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> >>>  
> >>> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> >>> +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> >>>  }
> >>>  
> >>>  /**
> >>> @@ -158,9 +160,26 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> >>>  		!(control->flags & STATUS_SET);
> >>>  }
> >>>  
> >>> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> >>> +				  unsigned long id)
> >>> +{
> >>> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> >>> +	int ret;
> >>> +
> >>> +	ret = ti_syscon_reset_assert(rcdev, id);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	if (data->reset_duration_us)
> >>> +		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
> >>> +
> >>> +	return ti_syscon_reset_deassert(rcdev, id);
> >>
> >> I echo Philipp's comments [1] from your original v1 series about this. We don't
> >> need a property to distinguish this, but you could add a flag using match data
> >> and Mediatek compatible, and use that within this function, or optionally set
> >> this ops based on compatible (whatever is preferred by Philipp).
> >>
> >> regards
> >> Suman
> >>
> >> [1] https://patchwork.kernel.org/comment/23519193/
> >>
> > Hi Suman, Philipp
> > 
> > Which method would you recommend more?
> > 1. like v2 patch, but assign the flag "data->assert_deassert_together"
> > directly (maybe rename "assert_deassert_together" to
> > "reset_op_available")
> > 
> > 2. use Mediatek compatible to decide the reset handler available or not.
> 
> I would go with this option. Anyway, I think you might have to add the reset SoC
> data as well, based on Rob's comment on the binding.
> 
> regards
> Suman


Thanks for your suggestions
I will add the following changes in the next version, 
please correct me if there is any misunderstanding.
1). revert ti-syscon-reset.txt add a new mediatek reset binding doc.
2). split the patch [v4,3/4] with the change for the
regmap_update_bits() to regmap_write_bits() and the change to integrate
assert and deassert together.
3). add the reset SoC data, which contains the flag "reset_op_available"
to decide the reset handler available or not.
4). separate the dts patch from this patch sets

> > 
> > Thanks
> > Crystal
> > 
> >>> +}
> >>> +
> >>>  static const struct reset_control_ops ti_syscon_reset_ops = {
> >>>  	.assert		= ti_syscon_reset_assert,
> >>>  	.deassert	= ti_syscon_reset_deassert,
> >>> +	.reset		= ti_syscon_reset,
> >>>  	.status		= ti_syscon_reset_status,
> >>>  };
> >>>  
> >>> @@ -204,6 +223,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
> >>>  		controls[i].flags = be32_to_cpup(list++);
> >>>  	}
> >>>  
> >>> +	of_property_read_u32(pdev->dev.of_node,	"reset-duration-us",
> >>> +				&data->reset_duration_us);
> >>> +
> >>>  	data->rcdev.ops = &ti_syscon_reset_ops;
> >>>  	data->rcdev.owner = THIS_MODULE;
> >>>  	data->rcdev.of_node = np;
> >>>
> >>
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
