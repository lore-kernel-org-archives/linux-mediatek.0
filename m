Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AF8C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 05:02:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC72523A51
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 05:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC72523A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OSqLpHExvGkWpQu3qW29Xa1UaQoXEJPbBtX4HVKoLWQ=; b=ei2PUkgOLEHiOsCgII/gMuwAD
	WyEc6HoVCo0iXps92JJrA8YMsu8YNEQauurhj0XEb5p6EQ5DRaJxk3Ey+xn5HHzCUOrtgQXnl3XA8
	tTjCOfT3HLPnrVlmnufwyn7NSBKXwClufUr39B1d9Z0Ncf1Do8AoUI6MvEgNehwjA+9DSaKE6go0l
	Q7IFyNxIFUEfkH39gim4Baz3BuMU4m3ylAkGUAH7YOTBQRwaMOouidzf0XRSTQNuC48yBpI8ij6zu
	sn8A8wCSSiiM2z9fOmS/9cX7KEZSQAKn5xIa7iL7eGrgHYTTaHDaZQ5hBSUtSFGXC+p+RNKbeoht9
	YVxF7M9cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq7uY-0002nF-Ht; Fri, 18 Dec 2020 05:02:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq7uV-0002mh-Hs; Fri, 18 Dec 2020 05:02:37 +0000
X-UUID: a6ade618cacc41a687f35db1782c3be7-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1AwNI1scHAvM1iOKxsvQyPFoSIHgLYzbcE+9qXzxCEg=; 
 b=M+6xSjGD3Z9copRIY3SuyYn/mEXvUXsBTwRwvHUbw9KXM7ZbczWgs3pvTpGI+JpoykyJ6Q5m9GiX8ufJJpSILiU7v0/rwqW+m2e/EHSo7ckpO/ce8UISzY5y8MUaYuRpqiTOxtERV9kMdZ/QDiHx6hRV3rO62cxUMVeB5WjZVjU=;
X-UUID: a6ade618cacc41a687f35db1782c3be7-20201217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1645590853; Thu, 17 Dec 2020 21:02:23 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 21:02:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 13:02:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Dec 2020 13:02:19 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Date: Fri, 18 Dec 2020 13:02:20 +0800
Message-ID: <20201218050220.25803-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201217164911.GB20278@gaia>
References: <20201217164911.GB20278@gaia>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_000235_932385_CACC4EB1 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: mark.rutland@arm.com, lecopzer.chen@mediatek.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Catalin,
 
Thanks for your explanation.
 
> > so there is two points
> > 1. out-of-tree function can't be approved
> >     I totally agree with this :) so we may have a driver upstream in the future.
> 
> It may not be upstreamable if it relies on the old APM interface ;).
> 
> > 2. APM not make sense on arm64
> > Could you please let me konw the reason why APM on ARM64 doesn't make sense?
> 
> It's a very old interface, even on x86 it is disabled in the distro
> kernels. There are more modern alternatives and you should update your
> driver and user space to use them (e.g. /sys/power/).

Got it! I will disscuss with our internal team to update their drivers.

thanks a lot!

BRs,
Lecopzer
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
