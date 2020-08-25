Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82208C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:29:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA892068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIjXs7e/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X1WFpCdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA892068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wt1xdOlxkE8uaiqQ2l9Erx3JV5agqutDi7LFWpNsoXc=; b=MIjXs7e/pO6fu2BRQUgUXSGfE
	Vtcf4mW6DDQExu4n//Si31GZBS+8WbIDzHEO0cINFfmuCB/QVCIb8eEbUQ/3dTirxHWozfdMGAALf
	OiidRQy01nKne4cynF+XppCdlWKEBNu8pUXgTdg8QmYbcPlB5CGSl9E7UPMPLa/WI/trwSY2wzQh6
	qEQHz2fKXja4Oi/d2R4msQR+hK5WRVs/c5/0ZPZZrch3dKgrzMGhdhuy/AGm2QwPGwYisR7WpNpTR
	eZfQ4HpjTtfDni3asunJcim/LZyuvIkUJFz4DIJ/sAtIJwaN19Z4RCGe3q+0pYibeeLGtxe4mzqJ0
	SttCZMTmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVH4-0007Dr-Ma; Tue, 25 Aug 2020 09:29:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVH1-0007CS-Jl; Tue, 25 Aug 2020 09:29:48 +0000
X-UUID: 4b3470b95e7b48eea47cfa24ec3ad615-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pzm6RISn/tNeKbUICcBC7qg5/+/y+MTOUCaljQkJv5I=; 
 b=X1WFpCdFPhLglSEPU5udcphfqVjKmWlYpuFIsGeZk+sqai/gjUdMMPqu2sElPoKSxre/gqP1Z9sz9X1TOe7GMT0cU1zaMhrM2fqU9cwvpgBqeK8jhjIOiMDuu7plkKzGZQwA7mSKhl8/qfBaGI8yHMRAuJHvj+RneAYQ/Rxc9mA=;
X-UUID: 4b3470b95e7b48eea47cfa24ec3ad615-20200825
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 78170695; Tue, 25 Aug 2020 01:29:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 02:29:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 17:29:34 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 17:29:34 +0800
Message-ID: <1598347775.16267.0.camel@mtksdccf07>
Subject: Re: [PATCH] thermal: power_allocate: add upper and lower limits
From: Michael Kao <michael.kao@mediatek.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Date: Tue, 25 Aug 2020 17:29:35 +0800
In-Reply-To: <03286571-c110-7f5e-a911-24f8c3e4fd42@arm.com>
References: <20200424071601.2636-1-michael.kao@mediatek.com>
 <accb83e0-ffbe-b6e3-6bf9-e7cc8b9fe19c@arm.com>
 <1588156776.3573.1.camel@mtksdccf07>
 <03286571-c110-7f5e-a911-24f8c3e4fd42@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_052947_818989_355164E2 
X-CRM114-Status: GOOD (  36.73  )
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

On Wed, 2020-04-29 at 21:24 +0100, Lukasz Luba wrote:
> 
> On 4/29/20 11:39 AM, Michael Kao wrote:
> > On Fri, 2020-04-24 at 10:22 +0100, Lukasz Luba wrote:
> >> Hi Michael,
> >>
> >> On 4/24/20 8:16 AM, Michael Kao wrote:
> >>> The upper and lower limits of thermal throttle state in the
> >>> device tree do not apply to the power_allocate governor.
> >>> Add the upper and lower limits to the power_allocate governor.
> >>>
> >>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> >>> ---
> >>>    drivers/thermal/thermal_core.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> >>> index 9a321dc548c8..f6feed2265bd 100644
> >>> --- a/drivers/thermal/thermal_core.c
> >>> +++ b/drivers/thermal/thermal_core.c
> >>> @@ -598,7 +598,7 @@ int power_actor_set_power(struct thermal_cooling_device *cdev,
> >>>    	if (ret)
> >>>    		return ret;
> >>>    
> >>> -	instance->target = state;
> >>> +	instance->target = clamp_val(state, instance->lower, instance->upper);
> >>>    	mutex_lock(&cdev->lock);
> >>>    	cdev->updated = false;
> >>>    	mutex_unlock(&cdev->lock);
> >>>
> >>
> >> Thank you for the patch and having to look at it. I have some concerns
> >> with this approach. Let's analyze it further.
> >>
> >> In default the cooling devices in the thermal zone which is used by IPA
> >> do not have this 'lower' and 'upper' limits. They are set to
> >> THERMAL_NO_LIMIT in DT to give full control to IPA over the states.
> >>
> >> This the function 'power_actor_set_power' actually translates granted
> >> power to the state that device will run for the next period.
> >> The IPA algorithm has already split the power budget.
> >> Now what happen when the 'lower' value will change the state to a state
> >> which consumes more power than was calculated in the IPA alg... It will
> >> became unstable.
> >>
> >> I would rather see a change which uses these 'lower' and 'upper' limits
> >> before the IPA do the calculation of the power budget. But this wasn't
> >> a requirement and we assumed that IPA has full control over the cooling
> >> device (which I described above with this DT THERMAL_NO_LIMIT).
> >>
> >> Is there a problem with your platform that it has to provide some
> >> minimal performance, so you tried to introduce this clamping?
> >>
> >> Regards,
> >> Lukasz
> > 
> > 
> > Hi Lukasz,
> > 
> > I refer to the documentation settings of the thermal device tree
> > (Documentation / devicetree / bindings / thermal / thermal.txt).
> > 
> > It shows that cooling-device is a mandatory property, so max/min cooling
> > state should be able to support in framework point of view.
> > Otherwise, the limitation should be added in binding document.
> > 
> > Different hardware mechanisms have different heat dissipation
> > capabilities.
> > Limiting the input heat source can slow down the heat accumulation and
> > temperature burst.
> > We want to reduce the accumulation of heat at high temperature by
> > limiting the minimum gear of thermal throttle.
> 
> I agree that these 'lower' and 'upper' limits shouldn't be just
> ignored as is currently. This patch clamps the value at late stage,
> though.
> 
> Let me have a look how it could be taken into account in the early
> stage, before the power calculation and split are done. Maybe there
> is a clean way to inject this.
> 
> Regards,
> Lukasz
Hi Lukasz,

After the research, do you have any ideas or suggestions?

Best Regards,
Michael

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
