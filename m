Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42923C433FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5DF2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JsjJMbxP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5DF2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NKpN6kCEcJoUdQjQ8cVc2rIcvQnaJ+TQX05EmMs8nCQ=; b=JsjJMbxPisw+zDYMTIps89pZj
	tKwxQ32FTmfkCtoRxrrBomKn7JE0PcpQyNWGTbdbsqWkxfufbnrCb2TAz0yFv2hrT7SCERDfdg14G
	sr39F2ljI0wcLZv97oNjnUgmwH9kbwlPHiwv9L5vydsG7b0Tw+/o7XV8GI4bs5gkesfdW3JeNcxGL
	nx5K1JK4t58FMmwdFEEqZX+iQenxC9dJokUIMEph8Kf7zXt8V+b2BzNg/ACz5DFzWr5xeobD2BKz4
	TJWDiREPYmo9z79NjKaNVBVhAotrUgtGvAKLBU64oWYCMbTGK4+D81lVN0dLtPROnoYjPv3ttT/H8
	SXvXVXlmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyOu-00037T-76; Fri, 24 Jul 2020 14:10:16 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyOn-00035c-G2; Fri, 24 Jul 2020 14:10:10 +0000
Received: by mail-wm1-f65.google.com with SMTP id c80so8088186wme.0;
 Fri, 24 Jul 2020 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aPHm37IZRgA/amT3EPPehfRSaWXic6JYRk5gRysDkoc=;
 b=UTezp+D4O40m4NAY2scE7z4y2ZQoevax9aMej+ySto2q05qXgBxxt6PFgIHRxu1rP+
 T7KS9ll8pAstWI5z8zv7NNEwVZsNu9XI1jsj7WuRN8HG8LQl0qULqRGj+FSDy0fGmB88
 I+WZhjpwEB0/ftoYZ3McbtGd40jfeFIed61kbcvxhyB5uPrLRhIJoTO7U9er6dDPDQgn
 vOp3oDOSh04jHco9fot+f66YS4PeNCM7H1WiV+PMAnoIsV/OJhH/NWr5AvDL2O6ShN0+
 wugt3appB3CzgNMcat8XuXs2IrT+8s1BnaOnMaDGBzuDX7ip1lHsJ54+BkK9Fc+e8ziM
 6lxQ==
X-Gm-Message-State: AOAM530L8sDrTVsCz6VO4MXYvlW04FjfzJtZncNs9v6831EwXdd97wHD
 J2NVvWRBz1vNrozin1H2YLY=
X-Google-Smtp-Source: ABdhPJxfB0bPNVbscbBvv9JuuBbV8/5DemmExvuD4yLm15XS6dENBt0gY4DQecjXWS/RnEAQqovpFQ==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr8651192wmc.96.1595599807908;
 Fri, 24 Jul 2020 07:10:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id z15sm681061wrn.89.2020.07.24.07.10.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:10:07 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:10:04 +0200
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
Subject: Re: [PATCH v2 04/29] memory: ti-aemif: Rename SS to SSTROBE to avoid
 name conflicts
Message-ID: <20200724141004.GB14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-5-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101009_555260_DEA2A1CA 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, Jul 24, 2020 at 09:40:13AM +0200, Krzysztof Kozlowski wrote:
> SS conflicts with compile test build on i386:
> 
>     drivers/memory/ti-aemif.c:40:0: warning: "SS" redefined
>     In file included from arch/x86/include/uapi/asm/ptrace.h:6:0,
>                      from arch/x86/include/asm/ptrace.h:7,
>                      from arch/x86/include/asm/math_emu.h:5,
>                      from arch/x86/include/asm/processor.h:13,
>                      from include/linux/mutex.h:19,
>                      from include/linux/notifier.h:14,
>                      from include/linux/clk.h:14,
>                      from drivers/memory/ti-aemif.c:12:
>     arch/x86/include/uapi/asm/ptrace-abi.h:23:0: note: this is the location of the previous definition
>      #define SS   16
> 
> Use more descriptive name (SSTROBE) to avoid the conflict.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-aemif.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
