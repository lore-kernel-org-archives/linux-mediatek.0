Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CE1C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0A02053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="16gjnur5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0A02053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mo8LMMEYu4ORfEuKoLMyIAvLbEcGLaNi01ti6f9NfG8=; b=16gjnur5c7M+ombYxXCoX7F5o
	LZElWtbmoMygqJbyqJZB9GxV3cuixAw6/XjmDlr2erOv/76fkoklSQZORrc4deDLYPn/tzTmjWcKU
	/od9LjJwjvpp8UG4CsI5k+3GTZtO4t+9dX1jNGr2GvtRcG/fku2ggnCMhST4SUzHNJOcgkQyrCEIB
	KAsBr52diiEEw1h+4fDpbgYAeZYgZNjoI2QKMNXIUvtFrwx7kEuvMCAmulnS7lITPOAWo6Bwd+ip/
	vSUNr2zpN2uLLWaZ4OqOF3k3n6n7wu29EqZNfeR18t6vJmUfP4bhRGnET6AbavLYoHmcEFeHrxshx
	D7ND7euag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jwg-0007PQ-DV; Mon, 17 Aug 2020 18:33:22 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jwb-0007Nf-NL; Mon, 17 Aug 2020 18:33:18 +0000
Received: by mail-ed1-f42.google.com with SMTP id i6so13109884edy.5;
 Mon, 17 Aug 2020 11:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QmO3uvT88Y7xfBE4lz9MHma2PYoQCTd+wB0capezBv0=;
 b=uBWOrzQagWJ5HOF1sLp2yZvIuakY2eoQZlE5TNJie3YEfHvSec0h0HIdWX8Rv2Umwz
 /QrY6pOYI8No7VFYXpegJ/OLZ/pw4g79mAUfILDc6lEvzZ6EhzmIlACOfmCqLU0/uEyk
 Pp8zD+fNZ2eqaE/sp9lddEnmX4hm8M4FLikIw4DVKp9k1WSHt2dbeR4n74XXh2Ien4uD
 KdyqSfYLpSnG8DB/pt0EoJmzTM2V+p/gqgvQlVumjviPlTRdLrxFwJ50xjhU58Ibkles
 z4e+n6FocBRMXrnUw6fSORGiO7IMZ6WopqMfh0ZUnhcRZXIGWpl7MNQ6wt0QNJJ91v8p
 4TyQ==
X-Gm-Message-State: AOAM531RPaA7kR+pkj6thoTuT/+4kFX1QNn8z6Z6bmLuEa24pHMnZrsP
 BqOLStjUshvGekGdiPwA7KI=
X-Google-Smtp-Source: ABdhPJy9rEqsu6PSHPwz3o6/BMqL4DsRfpZPR18TKNyG7qnCp4CpeI0lXFtkg/vTNx/LD9TOaQYajw==
X-Received: by 2002:a05:6402:1606:: with SMTP id
 f6mr15585384edv.328.1597689195066; 
 Mon, 17 Aug 2020 11:33:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id g11sm14060406edv.95.2020.08.17.11.33.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:33:14 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:33:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFT v2 21/29] memory: omap-gpmc: Remove GPMC_SET_ONE_CD_MAX
 macro for safety
Message-ID: <20200817183311.GD3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-22-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-22-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_143317_776952_571A96DB 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 09:40:30AM +0200, Krzysztof Kozlowski wrote:
> The GPMC_SET_ONE_CD_MAX macro uses return statement and variable 'cs'
> coming from called scope.  This is not a good practice.  Also
> checkpatch complained:
> 
>     WARNING: Macros with flow control statements should be avoided
>     ERROR: Macros starting with if should be enclosed by a do - while
>         loop to avoid possible if/else logic defects
> 
> Since GPMC_SET_ONE_CD_MAX macro just calls one function, it can be open
> coded.  The difference with original code is that function will exit on
> error not after every register set, but after a group of sets.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 

Applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
