Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B210C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:17:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AB5206D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Eiw6hOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AB5206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q4DENp4IlSmnd/4I1GzvDOvHn9YmE2sMcyDvBpziROk=; b=0Eiw6hOtS9cEZtcmbmPGlWUG7
	CsqCD6j3RlN/HGF4chVS6C/sK3YKIKoJE7vXjz5Hn2tkwwHpkcoDmzjydLHqE5eZMRBzUCmuTdAwe
	uvwPo87DOsmd0Ra57S3mzb8mdIbpqZybXArJ5xwMMTJ7A7U/PY1LwBJO7Qltwjd6bdsMPOJzeoLYc
	Dk5ceYgT4qqtkH7KtifJvD2D2cUreMvE/feKsg9ws6L3QYm3l3NwfefN79zBooxp3e7YKDc4tjrk1
	gEeJmoStCCK71XHl5lHZtr0uyYLyla6yzPD9l5dsNUU18AOTvL2B5rsohvIYdcJWR+xzWQbY9twkY
	oBQYWN2gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyVl-00061s-P0; Fri, 24 Jul 2020 14:17:21 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyV5-0005kM-Kt; Fri, 24 Jul 2020 14:16:40 +0000
Received: by mail-ed1-f67.google.com with SMTP id h28so7157961edz.0;
 Fri, 24 Jul 2020 07:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0sb81io14/iZEElRAIKtQbO/0LNyji9cw16nJ0jDSPU=;
 b=pap59+MaYtktcX0KizvRk299VAXqZcL4M6vXdGicKHcXi9hFlsuRnGELxRkNtBs+5u
 j7tdHhYnguQjD7+pKQHm1ns0E+6UfRb1mw7UWxH06i5CqiDpA8WSRg0hU1iTSiF4Ly/H
 f815XxzJ64V0Jgg+MerEvq3bGxdpZPvfKX+1nQjBoOceVvDEPQ57Ry2AQCIIs9FSwGq4
 xOSUo8eYCw3v0TjHo5QqhnPckRCZPVnYlwTArPxt2eee47MFHc67SGABhmxqmXFOvTE+
 0GLlAf+Lsc40ykkHNxeZPFM0JH2hrVAZSfsHcuO8yYQpXuPqbYX/2znOJmkqt+I8bVsL
 5Q7g==
X-Gm-Message-State: AOAM532IpXBd3UpQPrVURFEoKUEwZi7u1REtAH+cXmn3s4aiIJSxDyqA
 gAxDneRJIhD0iWHjBVVo2pY=
X-Google-Smtp-Source: ABdhPJxZz5FjCvbGUaml5g0kUTy9tq4Ud3q1Jr1TK7yBGK4mPmuoJK+Z/MVfq8HjdZ2+i6JCiMoMWQ==
X-Received: by 2002:a05:6402:2064:: with SMTP id
 bd4mr9018052edb.180.1595600198137; 
 Fri, 24 Jul 2020 07:16:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id v24sm773066eds.71.2020.07.24.07.16.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:16:37 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:16:34 +0200
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
Subject: Re: [PATCH v2 22/29] memory: omap-gpmc: Fix whitespace issue
Message-ID: <20200724141634.GD10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-23-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-23-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101639_834302_BC04B1D1 
X-CRM114-Status: GOOD (  10.34  )
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

On Fri, Jul 24, 2020 at 09:40:31AM +0200, Krzysztof Kozlowski wrote:
> Fix minor whitespace and comment issues.  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Applied (and part of pull request to arm-soc).

For the other omap-gpmc testing is welcomed.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
