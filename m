Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68438C7EE26
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vquRR2xg2mUWwJhSCSqfcs1YyVV7iN6bUPd5yrCcyxU=; b=bpKTqLVJd0o2oKfO+HBGk23muI
	YmpLlSwmCEOIehEGpwdpP9yACL/H9uvQlfo4qknyL97HLX2x1GELS44UylJVi3I9MOGpGGvwfW4o2
	ulhXXvNczdYKMno8ceBGXgXLXiVi2Wz2PccoB4massmUtgMrpZn1bZWapF/v7aDvJMzfEkwJEb9Ja
	ic0gO96AX7syomsg+c/rp/KtnkpNhr1B+BvHR2eAt/XUOSc1NAwskOYTJYzbvixBVOI21TTYUglp2
	Q9s8LGmfmjdSQ3HlVNtrDY0nbEFs1WEk8Qe2M8qI5siKyCRdw2SjO6zKkZ9YtLVfVud4gL7LgNPLm
	PfRTHgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV7t-001gxQ-33;
	Mon, 15 May 2023 10:08:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV7q-001gwO-21;
	Mon, 15 May 2023 10:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 765DB2F4;
	Mon, 15 May 2023 03:09:00 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFD0E3F67D;
	Mon, 15 May 2023 03:08:12 -0700 (PDT)
Date: Mon, 15 May 2023 11:08:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	konrad.dybcio@linaro.org, andersson@kernel.org,
	mazziesaccount@gmail.com, conor.dooley@microchip.com, j@jannau.net,
	mailingradian@gmail.com, me@iskren.info, lpieralisi@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: Need suggestions for smp related properties in cpus.yaml to
 support smpboot for cortex-r52 based platform
Message-ID: <20230515100810.ctebdbqlienbcf7t@bogus>
References: <c5ed90c7-7126-0757-a0e3-e3d1fcab2ecc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5ed90c7-7126-0757-a0e3-e3d1fcab2ecc@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_030818_711994_2985CD54 
X-CRM114-Status: GOOD (  24.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 11, 2023 at 10:35:37AM +0100, Ayan Kumar Halder wrote:
> Hi Device Tree engineers,
>
> Recently I have ported Xen on Cortex-R52 (AArch32-V8R processor) for our AMD
> platform.
>

I remember that there was some exploration on feasibility of using PSCI
here. What happened to that ? Any summary why that was dropped ?

> I was discussing with xen-devel community about how we can properly support
> smpboot when I was suggested that this might be the correct forum for
> discussion.
>
> Please refer
> https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00224.html
> and the follow-ups for context.
>
>
> The way smpboot works on our platform is as follows:-
>
> 1. core0 writes to register (say regA) the address of the secondary core
> initialization routine.
>
> 2. core0 writes to another register (say regB) the value "0x1" to put the
> secondary core in reset mode.
>
> 3. core0 writes to regB the value "0x0" to pull the secondary core out of
> reset mode.
>
> regA, regB will differ for core1, core2, core3 and so on.
>

Sounds OK but will you ever need to support power management on these cores ?
If so, just start with PSCI or provide reasons as why it doesn't fit well
before exploring and extending the existing spin table bindings.

>
> Currently, I am trying to bringup core1 only.
>
>
> I am thinking to use "enable-method=spin-table" in the cpu node for core1. 
> So that I can use "cpu-release-address" for regA.
>
> For regB, I am thinking of introducing a new property "amd-cpu-reset-addr"
> in the cpu node.
>
> Please let me know your thoughts on this approach. I am also open to any
> alternative suggestions.
>
>
> Also I see that in https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/devicetree/bindings/arm/cpus.yaml#L87
> , "arm,cortex-r52" is missing.
>

Yes that should be fine IMO.

> Can I submit a patch (a one line change) to add this ?
>

Of course, it makes it easy to accept or reject rather than this question
hidden as part of other discussion.

--
Regards,
Sudeep

