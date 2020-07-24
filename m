Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754B5C433EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:16:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425DA2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xk41ThOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425DA2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S+Cc8XgDaJrDfic11xHiR7dUT4CnSQ9kuVJeiLLRqdk=; b=Xk41ThOLgoLYOAzW6eQHn6H7p
	5wZmGTeuWJlfOnF48NwLPt12cnHMz+M24IAQbtlZi6Py99g6935tGvq0+31Fpo0l4Il9yv+abL4Yr
	133KRiCDODGxi+zTQHFbN6gRUUaio1SAYvCzioVnils1neP18LPTWa1I16sFLvSX2omIk6swuf7qN
	KT9ye8hOaYwz4hk28EBN0z0vs4uAU577XAPAM+bB0H2ZEDCmSjcvqs6kKLbfOukAHsXcLXsX8Uxnv
	gk5wT6u54xkOUis4qCAamt67ZRVZ2eHmJFVjEBdddylTP8BX9Yu3S5VkCSlJbWuoedOamXFWW0Sqj
	aSujb+zAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyUM-0005Q1-Ey; Fri, 24 Jul 2020 14:15:54 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyUF-0005NP-Or; Fri, 24 Jul 2020 14:15:49 +0000
Received: by mail-ej1-f65.google.com with SMTP id l4so10093443ejd.13;
 Fri, 24 Jul 2020 07:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y4s5NYs8Ph6jpkFhoIuh6xR0vXzxCRPsGUFORhwz1zU=;
 b=PLdyQeW7LeytjZXMh07XixOpQfXoXuibA7Xt3PDDQwIrvPIJf7QtZqUlayJ7jeoubd
 dsV0zZwPIJGqPYRBKhJmnw0AeegbB6i2fdWX+ycTZsgedIrAG+NHJhX9m/Tg0GzqNHTc
 kVKmUWktWP8ZqyI3meNxQZ5e/MH4iGYf3NOjs04lT1mWZYKNWDLT/PekIYp2LOVu1bDV
 HF1tU3tq+NQd45F1xdVP+NTP0lx25l4Rd0N59a8NVS382bxyKnM6keCYiJGuxmku0iT4
 uyHkNnF9jWSE4RttI9fYTkGu57NP1cv+29W/2ozxViYWkj+xxpu651oaya0omhFAP86c
 3zJg==
X-Gm-Message-State: AOAM5322Umt/mxLN4+FLVcvp2/p+N+za382uhVkMWX0mkf5DZT2stPyB
 8S4jQe8Brp1h9MCpxNZQepY=
X-Google-Smtp-Source: ABdhPJwu3EjA1YdWx+QFyiPcMnNuaujpfyOQ6rYY7C5/5mqX7nNv1mV0KGv6svxTy1tkMVz1WmKngg==
X-Received: by 2002:a17:906:7115:: with SMTP id
 x21mr9160281ejj.86.1595600146276; 
 Fri, 24 Jul 2020 07:15:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id i2sm848994edk.30.2020.07.24.07.15.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:15:45 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:15:42 +0200
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
Subject: Re: [PATCH v2 26/29] memory: fsl_ifc: Fix whitespace issues
Message-ID: <20200724141542.GB10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-27-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-27-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101548_369172_3B2A2925 
X-CRM114-Status: GOOD (  12.46  )
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

On Fri, Jul 24, 2020 at 09:40:35AM +0200, Krzysztof Kozlowski wrote:
> Fix minor whitespace and comment issues.  Do not break message strings.
> No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  drivers/memory/fsl_ifc.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
