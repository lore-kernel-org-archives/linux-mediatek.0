Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54102C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2439120714
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nd42UQut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2439120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AUcFHRpY9vjdI4CTZBCSc0QqUdshwM3xQciwDjox71I=; b=Nd42UQutyJPIGbUGKrWCMc6qa
	F/B70oHlO/OK9CVJKvdecAIeobCZMuMHotnmUECJKPfQO1dDqFjj3jdqPz7axRm/iSax2+SOlOEbG
	+mWxjgWIIv3mu0EXpsNAonkOQ98iuc6fFrzBRFVaUL19avAnJHAu5CfVvLnhFQR7cd+ALOfwBsvxc
	5i0KLBVSxotTx+ozVGQGUlagILgd7LzqxQb0bd9VihmYxOVC4VOxbZRtanK5lTfmW+e6lx0XzO+AN
	1HF5g9e1i21LXC4VqCLqFuWBTDC3m+RU1LoKKIuXtqrvkqun0plGDLgWjmx3vFeuNRmdeg/ytUOjR
	sERKmpyzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyPM-0003Ht-M0; Fri, 24 Jul 2020 14:10:44 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyPE-0003Ek-Pm; Fri, 24 Jul 2020 14:10:37 +0000
Received: by mail-wm1-f68.google.com with SMTP id p14so7722792wmg.1;
 Fri, 24 Jul 2020 07:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=276139G/CdcXhZVD9Y4DWugGrS0aG9By0pl1cf1Sa6c=;
 b=YiD0WkAlBPDP/vf/D5Bh+vpsZVpout4VgfVC7x8RXx8V4mGzFJXnH7xMieM8+LNijU
 j2L3weMzIkPDmM6FVWfXOEbglUx9JjmikoZrN6aG3Ui7vukea8Ht84w+yVomGGIV/FAP
 05WJ4br1IWb8mKaN8JQsVh5h312DmXGUPtJoFm3eFTIALknZm3q408U8Q017DW3TddFA
 /ZvdxvDAKkrzdfL+59t/mXyr3KtkdDvFgtovYYsV5JhXh/rs6Ix96r/VnFZE/8SO1Eo/
 pqOoKG4BCTyjsBRXZjK4BVw81NKjgz+4IQFhCG65/rNXSkQMVk5iyuYeG9b8ksknaKGB
 cU4g==
X-Gm-Message-State: AOAM532WUS0XMdv9sW4Pdyc2cbDVC5SbMdV4rXLvv6f+VopGG12i6VU/
 4q4VbpxQutJy3RYk+k+Rw0A=
X-Google-Smtp-Source: ABdhPJyH6358VvC3N2HtFylVixHPf6jUG/wGoHSCH2ncpHt80BXLb7dYgFVpDFw9/9ogV3TbmOaSSQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr8750342wmf.103.1595599835312; 
 Fri, 24 Jul 2020 07:10:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id 78sm7674001wma.31.2020.07.24.07.10.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:10:34 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:10:30 +0200
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
Subject: Re: [PATCH v2 11/29] memory: emif-asm-offsets: Add GPLv2 SPDX
 license header
Message-ID: <20200724141030.GC14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-12-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-12-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101036_900006_88E1BCC3 
X-CRM114-Status: GOOD (  13.31  )
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

On Fri, Jul 24, 2020 at 09:40:20AM +0200, Krzysztof Kozlowski wrote:
> Add GPLv2 license header and remove GPL boiler plate text.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use "GPL-2.0" instead of "GPL-2.0-only". It's shorter.
> ---
>  drivers/memory/emif-asm-offsets.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
