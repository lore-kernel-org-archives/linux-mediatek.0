Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329EDC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:12:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8E523135
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cbfubk/j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbFccKDJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E8E523135
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UdQysFt+fMVPMELLlaBJVczAGeenFac+5j8DT5HhekU=; b=cbfubk/jSRR59crlyZL6iCHUw
	z6nlC3wXnq4bpp+xg7TL7cNYL/SFXHmm5DSbp0mp59HBmIVMfNrtpONOXWE0rNo2F/kJjKaroxpyD
	kjKlettgBFBAQV7mPdRlbpO/KMwh23voSQVdx4tHjkw6XpJ7RnsbK7pjpv6RcdgEJWbY5WW2CPRA5
	TPwPGVB30Y56rJcNuVO7uikAO/jsdcXKde+LQHQVIIXsOEqAzVKqJ9rHFyLcU0/U2ip1z7GC7ddRo
	Qr2EAz7lLjQEG1D0TyUmS/3eW0etjhwsc+v2UHjYxaOjogrrtupExCQMsPjuM10KRhTFYUiS0IY8P
	RV46fe72A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3hZP-00007Y-65; Thu, 06 Aug 2020 15:12:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3hZL-00006s-Ka; Thu, 06 Aug 2020 15:12:36 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5FC523133;
 Thu,  6 Aug 2020 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596726754;
 bh=cUg8ko8OEiK/4qIbgfajwCnFYSLMbgT5cLNLiBOA0zc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AbFccKDJye+6TKEYkdO27Ltto8sfBzN9avARpUTzS2JIZOCnVJJvIiHQp6vOomQOC
 F8JNZCzIVobAp32SyKnSVXDA/lbtwWMtL78IWNpUC9RYHN0kLSqSvrU3xvklsMNxUQ
 acUSid/EZztAy2Hg3NFiZG8sWBd8qI54SF2roqnw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k3hZJ-000Iec-1O; Thu, 06 Aug 2020 16:12:33 +0100
MIME-Version: 1.0
Date: Thu, 06 Aug 2020 16:12:32 +0100
From: Marc Zyngier <maz@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
In-Reply-To: <CAFr9PXkFJJKnqVkPBXgh1kqL_serK4DmrmJ73xU+ZMA+NuF-bA@mail.gmail.com>
References: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
 <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
 <CAFr9PXkFJJKnqVkPBXgh1kqL_serK4DmrmJ73xU+ZMA+NuF-bA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <654a81dcefb3024d762ff338d4bd7f14@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: daniel@0x0f.com, mark-pk.tsai@mediatek.com,
 alix.wu@mediatek.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 tglx@linutronix.de, yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_111235_863970_1EC83D08 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 Jason Cooper <jason@lakedaemon.net>, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-06 15:58, Daniel Palmer wrote:
> Hi Mark-PK,
> 
> On Thu, 6 Aug 2020 at 23:08, Mark-PK Tsai <mark-pk.tsai@mediatek.com> 
> wrote:
>> > Do you know if it would be possible to confirm if they are
>> > the
>> > same thing? MediaTek bought MStar a few years ago so it seems likely
>> > but I have no hard information.
>> >
>> 
>> Yes, it's for the same interrupt controller IP.
> 
> That's good news. :)
> 
>> > If they are the same thing could we work on making one series that
>> > supports both use cases?
>> 
>> Sure, and I think the irq controller driver should support both use 
>> cases.
>> So how about keep the MTK version driver?
> 
> I'm fine with that. Maybe you can push the MTK version and I can send
> a small patch after that to add the small bits I need?

In the interest of being vendor agnostic, please rename the properties
such as mediatek,irqs-map-range to something less brand-specific.
The compatible string should be enough.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
