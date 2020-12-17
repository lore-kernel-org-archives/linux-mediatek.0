Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDEAC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 16:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21EB23382
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 16:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E21EB23382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RSeyNKocGywKC6oN33anBlzhWh9F+t0NkvVdzydmBvQ=; b=qM+GtPWCFrHcBCaJdY6vsBrx8
	2J5ZhvUpW8VlVMVyaez892Rv8+Chm/L9kSfop9FZzE9G7VhIl0Dcxf+KL6idaJ0D0VPLVp+P62abi
	9cZnImBSIMFEw5ZuUmuNPC9GzdMS8JSFu6Y0UTfeavCKvMUNlhMahLpm8SJ/swTg/aniMx+jFAqrM
	9LZq1J83DnFdEOf9fpmKt66vO+eVJJFRuHPA0Dm5hJn1MTogJJvhKHZNdN9DsVCszPuaXLCz52ePB
	rQVx1zkkCnSEtR98fmFDkkbKeyFs7j/kjNAAo1Nb3CvrvCwUVXW4M3DZ5zoms7YmAiHlfXAIq/Jc3
	rYBCGFczQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpwSu-0003KM-2d; Thu, 17 Dec 2020 16:49:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpwSq-0003Jb-7D; Thu, 17 Dec 2020 16:49:17 +0000
Date: Thu, 17 Dec 2020 16:49:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Message-ID: <20201217164911.GB20278@gaia>
References: <20201216155820.GH2511@gaia>
 <20201216164147.9854-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216164147.9854-1-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_114916_325780_5D56B1C1 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 12:41:47AM +0800, Lecopzer Chen wrote:
> so there is two points
> 1. out-of-tree function can't be approved
>     I totally agree with this :) so we may have a driver upstream in the future.

It may not be upstreamable if it relies on the old APM interface ;).

> 2. APM not make sense on arm64
> Could you please let me konw the reason why APM on ARM64 doesn't make sense?

It's a very old interface, even on x86 it is disabled in the distro
kernels. There are more modern alternatives and you should update your
driver and user space to use them (e.g. /sys/power/).

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
