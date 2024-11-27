Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0D7D6D242
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 22:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s3O0Triyg4fMXsTTwqCuP7GwgGD1z4BRBo9kFTI3MM=; b=f7JRBOMfvv7yOl6ZuCq4EqgN0/
	wFyLJpHjrRgcm4gWDFiqY6rNjY+e2y50x86Zzv5wuF6MQBBgA9BmbzhUcSa3MGXBnBwSObRnW8soj
	MnfAb0GEmfW/uL740YZCq4v1+6XMHFAdI5bEhW50D2bhkskMUEvbveYXmA1B3m9LmOTam+81i+tXJ
	rSAndbq0gdv+XZ34+o2m41Tpe3rqnq6qgpiHNhecQFEwP5ssTP3uI+2Mr0n5mnRW7GIu/E6EqeszS
	HQ14wPnp9i0gvwNQ8krN3ziJ4tJ6obaTq3w4Hz8jolzt7ZHfcBrL/fBz+cBWGIHuz3/m4kCvH5JvD
	Dou5/FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQA8-0000000EAVk-3aCZ;
	Wed, 27 Nov 2024 22:05:32 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQA5-0000000EAUn-3QON
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 22:05:31 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 70A211140132;
	Wed, 27 Nov 2024 17:05:26 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-05.internal (MEProxy); Wed, 27 Nov 2024 17:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1732745126; x=1732831526; bh=5s3O0Triyg
	4fMXsTTwqCuP7GwgGD1z4BRBo9kFTI3MM=; b=cWRCY25Eqd8MUTNHy8ybtDWMmq
	ERCj51shWQMbJRWtwkIOMNWhZ5wK72/IqtzQmwnoiqFMeqHuq2Z0PXc1X02iNzVg
	MO6G9bstLHWMbJ06uWMhoc5W1SdconSATX7DfVGDjDjVH/dtkfmsRGf9U93Laufm
	kNhI4HWsfKTS+mAKU2rGmv8ev4oUvnJVvRMyUxvGw6BZZXdzwpZ8G3yjqI3TRx+S
	vRzX2AB2wmnN6ZlCXA3ZQGCu0HUcNFnZXfzt3/ye5yug2SXbyaNNStNwhxDS7O53
	mf6r58Nb2mg4tUwBDL+Sa+0ET69BqybZzfEvzsXGvQOBMquMLorjPTixZc+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732745126; x=1732831526; bh=5s3O0Triyg4fMXsTTwqCuP7GwgGD1z4BRBo
	9kFTI3MM=; b=QY5LmKoN3EGTRu6SuonOuB3eZwWZoyhKgPCf5QCzRqS7wRpr59I
	LrQYmlIK8wGuxIP6o9cJmL3gUbsaqc2uCYn9FHqQaCRl4KW2AYzHEMkSepq+LsYI
	C3vzGkID/b7iFUnyzdkN7tOXUy0os8M/j4DcFcxcKtnVmHKkJbNBstFX1pDx+yuQ
	slnzkMdWE4rUW1uARNXmOpMYj3gPZ+umQwtZrHoyxpnKR/WVr9Yeza/fyDXngCAX
	iG7RYMPQk7nIBpKoA5ZL3R1xzRFP4zfI83Q9V4CiULzs5ya3TYG9sjvk1nCqSIYI
	VXccINxpj8xdU/mHjGyzJ/L8/9NynETaytQ==
X-ME-Sender: <xms:ppdHZwm_kvh37Tl-dUIs8QikZyVpjuNpn5bups4vY1IQFm4DaOQT5Q>
    <xme:ppdHZ_2IX-DxoxKztKL50lH1CwpimxydUcBSqWcXDfCJuyx7ZOWYotA7mhlag9GLB
    rB_eSqRAPUDH1nYj3s>
X-ME-Received: <xmr:ppdHZ-r5XASJ6K2yit5RCajKu_3bpyIv2gikraIIsJyase-LUnMwjc0Ues6W8pAJ2lBjBDIAysEklhIaNxAc2FFBWpq6K4V6-UYubuMzbsZvYFpN_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeekveelgeetveekleegkeelffevleefledvleejudfg
    kefgheffffeifeelfffgtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhitghosehflhhu
    gihnihgtrdhnvghtpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegrsggrihhlohhnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehr
    rghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitg
    grnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgv
    kheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hpmhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ppdHZ8kQuvjiw9sbtC1IUoJo8spikKT1h0fv2_ukjiEZPIYFyjkLnA>
    <xmx:ppdHZ-1_3RVUS3-UA0GLcREDd-vCpA8byASlGYvg9gOjFJPZ6kvVWg>
    <xmx:ppdHZzsCoUXfMO9mFqHA7c4NePMdtZL2IDtgU_1R1M8kUTx-OucpCw>
    <xmx:ppdHZ6WGkPhDCmHqyFzKqKcA2lH3fKJDlPwxzuQWHeRcEyxmj1nPiw>
    <xmx:ppdHZ3lMYZwLPvwVIX7xGP0jK1Jv6Iir_XkcSrjYg99fBgiztTAZykTM>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Nov 2024 17:05:25 -0500 (EST)
Received: from xanadu (unknown [IPv6:fd17:d3d3:663b:0:9696:df8a:e3:af35])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 441EEF0AAAB;
	Wed, 27 Nov 2024 17:05:25 -0500 (EST)
Date: Wed, 27 Nov 2024 17:05:25 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
cc: linux-kernel@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 0/5] thermal: multi-sensor aggregation support
In-Reply-To: <20241112052211.3087348-1-nico@fluxnic.net>
Message-ID: <s120q967-4r69-pps2-1qo3-9952r9173125@syhkavp.arg>
References: <20241112052211.3087348-1-nico@fluxnic.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_140530_129489_D2F99FD7 
X-CRM114-Status: GOOD (  10.61  )
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

Gentle ping, feedback appreciated.


On Tue, 12 Nov 2024, Nicolas Pitre wrote:

> This series provides support for thermal aggregation of multiple sensors.
> The "one sensor per zone" model is preserved for all its advantages.
> Aggregation is performed via the creation of a special zone whose purpose
> consists in aggregating its associated primary zones using a weighted
> average.
> 
> Motivation for this work stems from use cases where multiple sensors are
> contained within the same performance domain. In such case it is preferable
> to apply thermal mitigation while considering all such sensors as a whole.
> 
> Previous incarnation by Alexandre Bailon can be found here:
> https://patchwork.kernel.org/project/linux-pm/cover/20240613132410.161663-1-abailon@baylibre.com/
> 
> diffstat:
>  .../bindings/thermal/thermal-zones.yaml       |   5 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 210 +-----
>  drivers/thermal/Kconfig                       |  27 +
>  drivers/thermal/thermal_core.c                | 643 ++++++++++++++++++
>  drivers/thermal/thermal_core.h                |  14 +
>  drivers/thermal/thermal_of.c                  |  86 ++-
>  6 files changed, 780 insertions(+), 205 deletions(-)
> 

