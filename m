Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D1AC56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 17:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803BE20639
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 17:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtOURTis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803BE20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h86K3EZoQ/EAwfARSx8VP8kIox67WuLLD6Ax63F5Xyg=; b=AtOURTistD9YEajmAMZlze3ea
	+oNUPzQJLLXZwpBvKRKdgrHLuiPzfqedRtSx9iC4KQhXtuVEV+t2V0qM8kYCAqj8T+COR+DG2uyXu
	hLFvIQQx2zQ5fFeJ+o0YtDpHzSZfg28PwmtGsj17itc7XOAEPtiNezM3IgcSrWDicmbzirQSHseQQ
	mJ6TmIEKZ1j7MBB1DjTdXB432051uFRgTgqMV2qW8kIGkGsbs5ZAtoj3Eu44F4WOyWB6BhDwkf3ZV
	B3ZtQDwcQ8U0KFprKSmAtS9rdrcSpCRXBJgartMHBMxGyVNS6JkVcrxETdY6TadsKFUM8LStbg6Kw
	6o6XLSu+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnV7-00020T-FZ; Thu, 19 Nov 2020 17:13:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnUz-0001yW-Dx; Thu, 19 Nov 2020 17:13:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016C61396;
 Thu, 19 Nov 2020 09:13:31 -0800 (PST)
Received: from bogus (unknown [10.57.54.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 465353F718;
 Thu, 19 Nov 2020 09:13:28 -0800 (PST)
Date: Thu, 19 Nov 2020 17:13:22 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v8 2/3] dt-bindings: arm: cpus: Document
 'mediatek,freq-domain' property
Message-ID: <20201119171322.2gxrv5h7sqwllgsv@bogus>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
 <1603700349-5922-3-git-send-email-hector.yuan@mediatek.com>
 <20201028150858.GA4029348@bogus>
 <65a4e167-9d2c-7fcb-5373-33af5e002333@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65a4e167-9d2c-7fcb-5373-33af5e002333@arm.com>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_121333_582606_EA3F912F 
X-CRM114-Status: GOOD (  23.31  )
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
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 Dave Gerlach <d-gerlach@ti.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Hector Yuan <hector.yuan@mediatek.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 03:23:20PM +0000, Lukasz Luba wrote:
> 
> 
> On 10/28/20 3:08 PM, Rob Herring wrote:
> > On Mon, Oct 26, 2020 at 04:19:08PM +0800, Hector Yuan wrote:
> > > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > > 
> > > Add devicetree documentation for 'mediatek,freq-domain' property specific
> > > to Mediatek CPUs. This property is used to reference the CPUFREQ node
> > > along with the domain id.
> > > 
> > > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > index 1222bf1..e995b26 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -255,6 +255,12 @@ properties:
> > >         where voltage is in V, frequency is in MHz.
> > > +  mediatek,freq-domain:
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > +    description:
> > > +      CPUs supporting freq-domain must set their "mediatek,freq-domain" property
> > > +      with phandle to a cpufreq_hw node followed by the domain id.
> > 
> > This needs to be a common binding shared with SCMI domains.
> 
> Would it be accurate to create a new binding file:
> Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.txt
> ?
>

Nope, Rob already asked to unify all such bindings and generalise it.
Here is my attempt[1] and this must just use it or help to enhance that
in order to make use of that binding.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
