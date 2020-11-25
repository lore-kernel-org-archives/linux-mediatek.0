Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B27C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:36:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B782063A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJuc/EOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B782063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S73mjbo6Ssa3vbCvW0vnOc/IESgK2HnxnosWJHT+c6E=; b=HJuc/EOsNcQLnHLSOhZEDYroF
	u/Txgupw2kSOh/HQhxJifR1GIi3GErhmEtauOvGIlbMR0YkHtpJCiW3KeS/Udc784nNMbMOgdNFna
	lQ/QR46mc+iAWkdVX1U1UU+c0O2zUa98kG+ONzmYHzwi9yAyNUDan7dDK/fTdPPuIX76mNoFDxe6w
	dql7a0Zg/mzx7GBA+gqefFITtLi1hAFsfM5xoEUltGRTEsZ5jL5tz8tKPnq45UShyKTH3hFaVxREF
	7je9PBxq3pNf1NFbjHHaAgpnr5TdX4z+I+ONzDRuxdYeqgzQeGnDZdbuDzDLOWZ8Ou00Yc5ey8m82
	36alUj0wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsAJ-00010k-6j; Wed, 25 Nov 2020 10:36:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsAE-0000zq-Rt; Wed, 25 Nov 2020 10:36:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39361106F;
 Wed, 25 Nov 2020 02:36:41 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4A923F70D;
 Wed, 25 Nov 2020 02:36:39 -0800 (PST)
Date: Wed, 25 Nov 2020 10:36:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Message-ID: <20201125103637.GC70906@C02TD0UTHF1T.local>
References: <20201124090131.27257-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124090131.27257-1-lecopzer.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_053642_995683_A32C78E2 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: catalin.marinas@arm.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 05:01:31PM +0800, Lecopzer Chen wrote:
> From: "Lecopzer Chen" <lecopzer.chen@mediatek.com>
> 
> Although most of modern devices use ACPI, there still has combination
> of APM + ARM64.
> 
> In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
> default is y if ACPI isn't configured.

I'm a bit confused why this should be enabled for !ACPI. Which DT
platforms need this, and how do they use it? Why should this only be
enabled for kernels without ACPI support, and not for kernels that
support both ACPI and DT?

Thanks,
Mark.

> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Suggested-by: YJ Chiang <yj.chiang@mediatek.com>
> ---
>  arch/arm64/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1515f6f153a0..5e9e3694015a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -260,6 +260,9 @@ config NO_IOPORT_MAP
>  config STACKTRACE_SUPPORT
>  	def_bool y
>  
> +config SYS_SUPPORTS_APM_EMULATION
> +	def_bool y if !ACPI
> +
>  config ILLEGAL_POINTER_VALUE
>  	hex
>  	default 0xdead000000000000
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
