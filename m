Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3F4C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05AYT9WzrcgpxTEGkWOq5ICd5qBQiyqX9M6zxOAiPYs=; b=L8N5i6S1M/I+Xnve1QxDwt3czP
	m4NkC4sekdfQuYgCkBY3wF0k4dFAiDRr4sIz3ZSlEmjMq+pb4CvFYJGqYi1QspkwDvuShpzhFseg4
	TKy+wvPjORgtANH8+Bwj8Y420cnpNdx/9S9lfCnSpTxKAh6EDzRjaAPrWst/yNKSP8BGS7pjzi7jj
	CqMWVLRKn1tPKuasbzfmlEzorcnAAzpb5iLSAM+hx8q+cWiWFoyn3hIWS0nJe++gi2sVYsTqnbYkm
	hfIcgx30dBjZgOt7C+/v4PXxAd71/YuTKSA42qMZRyJFHwk4W2HnzSzOmd4Y2zkLgu7WvNY9E60O1
	A/G9Ptkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ3a-006GEW-Ou; Wed, 15 Feb 2023 14:46:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ3O-006GB3-Hj; Wed, 15 Feb 2023 14:46:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A1A1042;
	Wed, 15 Feb 2023 06:47:17 -0800 (PST)
Received: from bogus (unknown [10.57.10.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 282553F703;
	Wed, 15 Feb 2023 06:46:30 -0800 (PST)
Date: Wed, 15 Feb 2023 14:46:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Message-ID: <20230215144627.ddjc7x365qdnhymi@bogus>
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <20230214222021.k3tsfwezhnh7tdlx@bogus>
 <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
 <20230215131849.mcgz53jf24atialp@bogus>
 <53f0e612-b5cc-262e-df98-add1e8a06573@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f0e612-b5cc-262e-df98-add1e8a06573@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_064638_658640_914B48D4 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, Feb 15, 2023 at 02:30:51PM +0100, AngeloGioacchino Del Regno wrote:
> 
> Both. I mean that these platforms do have architected timers, but they are stopped
> before the bootloader jumps to the kernel, or they are never started at all.
> 
> Please refer to:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/clocksource/timer-mediatek.c?h=next-20230215&id=327e93cf9a59b0d04eb3a31a7fdbf0f11cf13ecb
> 
> For a nice explanation.
> 

Thanks for that. Well then I see no point in making these modules if you
can't have generic Image that boots on all the platform. I now tend to think
that these are made modules just because GKI demands and it *might* work
on one or 2 platforms. One we move this as modules, how will be know the
Image without these timers or with them built as modules will boot or not
on a given mediatek platform. Sorry, I initially saw some point in making
these timers as modules but if they are required for boot on some systems
then I see no point. So if that is the case, NACK for these as it just
creates more confusion after these are merged as why some Images or
even why defconfig image(if we push the config change as well) is not
booting on these platforms.

It is no longer just for system timer useful in low power CPU idle states
as I initial thought.

-- 
Regards,
Sudeep

