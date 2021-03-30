Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C69C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:23:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B78619AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B78619AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4JuyWMV7gfSgNgAqewDOdt2q+/sNqMqsW+vfTyiHmww=; b=XIUxDwsSR5lFohZyvtnsVCrbD
	uKLFKhsuNfoG4dVg3X54uw+9qdjL/FfALH1Ou9HTdl5SvKFGPO2EO4Mzt/cwwK8m65gsOMpfdZMLl
	lE/wKi8z8T8tgI7kXgURbMbYzHG5WtWAg1ug6cBv3K1NSTIRq09NWh0nS1j91qdFgauzPJy0+mdK1
	Qf/ae1Z//iyBjg+Vf05rIWVSgT1lJpdn8ecR8N2w7ZEd8K7GurS1l6S5gY3BpkergiYFFoTvT+4tb
	cJTKtmVvrJed44DoAqGI0E7o6k4o+PtJFEJni36PwMGCpSeq5hah5LSSBN4aKR78ZfyQrB8MNV1xe
	9BIwNgUuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBWb-003OK0-Ss; Tue, 30 Mar 2021 10:23:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBWR-003OIj-JB; Tue, 30 Mar 2021 10:22:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9802ED1;
 Tue, 30 Mar 2021 03:22:53 -0700 (PDT)
Received: from bogus (unknown [10.57.57.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288FC3F792;
 Tue, 30 Mar 2021 03:22:52 -0700 (PDT)
Date: Tue, 30 Mar 2021 11:22:44 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep.Holla@arm.com,
 Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH v11 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20210330102244.7dkzemtgrm7epmpv@bogus>
References: <1615549235-27700-1-git-send-email-hector.yuan@mediatek.com>
 <1615549235-27700-3-git-send-email-hector.yuan@mediatek.com>
 <20210324160750.GA3154702@robh.at.kernel.org>
 <20210330025643.mbeb7oqumv75o3y5@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330025643.mbeb7oqumv75o3y5@vireshk-i7>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_112255_968929_57F08834 
X-CRM114-Status: GOOD (  25.71  )
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

On Tue, Mar 30, 2021 at 08:26:43AM +0530, Viresh Kumar wrote:
> On 24-03-21, 10:07, Rob Herring wrote:
> > On Fri, Mar 12, 2021 at 07:40:35PM +0800, Hector Yuan wrote:
> > > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > > 
> > > Add devicetree bindings for MediaTek HW driver.
> > > 
> > > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > > ---
> > >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  127 ++++++++++++++++++++
> > >  1 file changed, 127 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > > new file mode 100644
> > > index 0000000..0f3ad47
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > > @@ -0,0 +1,127 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek's CPUFREQ Bindings
> > > +
> > > +maintainers:
> > > +  - Hector Yuan <hector.yuan@mediatek.com>
> > > +
> > > +description:
> > > +  CPUFREQ HW is a hardware engine used by MediaTek
> > > +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> > > +  for multiple clusters.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,cpufreq-hw
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    description: |
> > > +      Addresses and sizes for the memory of the
> > > +      HW bases in each frequency domain.
> > > +
> > > +  "#performance-domain-cells":
> > 
> > A common binding schema for this and 'performance-domains' needs to land 
> > first.
> 
> Sudeep, what happened to the series you had on this ? This patchset
> has been blocked for a long time now, can we get that merged soonish
> somehow ?

Sorry, it slipped through the cracks. I posted this as a fix for SCMI which
we fixed it later. This got de-prioritised in my todo list. Sorry for that.
I think main problem I had is to write a proper select statement in YAML
scheme to check the DT nodes when it is present. I couldn't get anything
similar for reference from clocks.

I had "select: false" which I knew was not acceptable as it can't go throw
dt_bindings_check. I am happy if someone wants to pick up and work on that
to push the change or provide suggestions that I can try out. I am unable
to spend more time trying to understand whole YAML schema ATM.

-- 
Regards,
Sudeep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
