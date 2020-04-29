Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC2BC83003
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 10:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C7E2074A
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 10:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rC2L+3Y0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HTUH8yhN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C7E2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNxtbe801nZQ6VIv+3WkISWBvXgsRHenuOJqS1g5EbI=; b=rC2L+3Y0oKT6dZ
	C058g89v+Gw/j6UXGXiAohHXqaMQL2DGEObaF5Fhw7wYWkGeW5wQQyBYwGvFZMvXrgtSgAVsYdeUw
	SHSGuOEXPBfKXYB2ZNVRkx+OPrhkyj0NEEQWt25zD03wD6VLG5a7rTFkurdc/PRVixm+HDV9D897H
	vi0uGrU2LCnOSVx/qPgm1zcZ1ALEsTQBSrddOeVKhY0WZSuV9ZqBdTK7TSXydaMa8qzkPsAnfZzOj
	HNPud9FILUZmrQVol56mihKh6UT5U4wG7kItxUCVzGoZTRP5yIdsCXi8+PyF9m0LvLnpQErg01vyj
	ucJnwngnVVYo9fBZaWEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTk87-0004Sj-0r; Wed, 29 Apr 2020 10:39:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTk84-0004Qp-8g; Wed, 29 Apr 2020 10:39:49 +0000
X-UUID: 1f29d2e6862a4540a73b07d2e77ebd19-20200429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GttMsEeHxSRQEiWkFwaLHZKTBEqyMow0zfNFhprWC1Y=; 
 b=HTUH8yhNrLswapj/N2iLKmbj3hzYFopyPmqOgamo+lqZPbsX4MBelEy792673JqpnY5VEUmcmzoqL0B3BBV9qpkOAZ/K/bZOoaGB7ewMFN2iYkdXTCoXSQfFTf460ULxB2CViulk06q2R2fPFzGKbnK8NnFEseeby3VvjV87VFg=;
X-UUID: 1f29d2e6862a4540a73b07d2e77ebd19-20200429
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1851398877; Wed, 29 Apr 2020 02:40:19 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Apr 2020 03:39:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Apr 2020 18:39:34 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Apr 2020 18:39:34 +0800
Message-ID: <1588156776.3573.1.camel@mtksdccf07>
Subject: Re: [PATCH] thermal: power_allocate: add upper and lower limits
From: Michael Kao <michael.kao@mediatek.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Date: Wed, 29 Apr 2020 18:39:36 +0800
In-Reply-To: <accb83e0-ffbe-b6e3-6bf9-e7cc8b9fe19c@arm.com>
References: <20200424071601.2636-1-michael.kao@mediatek.com>
 <accb83e0-ffbe-b6e3-6bf9-e7cc8b9fe19c@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_033948_319027_18C63A3F 
X-CRM114-Status: GOOD (  24.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-04-24 at 10:22 +0100, Lukasz Luba wrote:
> Hi Michael,
> 
> On 4/24/20 8:16 AM, Michael Kao wrote:
> > The upper and lower limits of thermal throttle state in the
> > device tree do not apply to the power_allocate governor.
> > Add the upper and lower limits to the power_allocate governor.
> > 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > ---
> >   drivers/thermal/thermal_core.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> > index 9a321dc548c8..f6feed2265bd 100644
> > --- a/drivers/thermal/thermal_core.c
> > +++ b/drivers/thermal/thermal_core.c
> > @@ -598,7 +598,7 @@ int power_actor_set_power(struct thermal_cooling_device *cdev,
> >   	if (ret)
> >   		return ret;
> >   
> > -	instance->target = state;
> > +	instance->target = clamp_val(state, instance->lower, instance->upper);
> >   	mutex_lock(&cdev->lock);
> >   	cdev->updated = false;
> >   	mutex_unlock(&cdev->lock);
> > 
> 
> Thank you for the patch and having to look at it. I have some concerns
> with this approach. Let's analyze it further.
> 
> In default the cooling devices in the thermal zone which is used by IPA
> do not have this 'lower' and 'upper' limits. They are set to
> THERMAL_NO_LIMIT in DT to give full control to IPA over the states.
> 
> This the function 'power_actor_set_power' actually translates granted
> power to the state that device will run for the next period.
> The IPA algorithm has already split the power budget.
> Now what happen when the 'lower' value will change the state to a state
> which consumes more power than was calculated in the IPA alg... It will
> became unstable.
> 
> I would rather see a change which uses these 'lower' and 'upper' limits
> before the IPA do the calculation of the power budget. But this wasn't
> a requirement and we assumed that IPA has full control over the cooling
> device (which I described above with this DT THERMAL_NO_LIMIT).
> 
> Is there a problem with your platform that it has to provide some
> minimal performance, so you tried to introduce this clamping?
> 
> Regards,
> Lukasz


Hi Lukasz,

I refer to the documentation settings of the thermal device tree
(Documentation / devicetree / bindings / thermal / thermal.txt).

It shows that cooling-device is a mandatory property, so max/min cooling
state should be able to support in framework point of view.
Otherwise, the limitation should be added in binding document.

Different hardware mechanisms have different heat dissipation
capabilities.
Limiting the input heat source can slow down the heat accumulation and
temperature burst.
We want to reduce the accumulation of heat at high temperature by
limiting the minimum gear of thermal throttle.

Best Regards,
Michael
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
