Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C461C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:32:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756F42053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqZ0tu4Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756F42053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=odJH0Yav2Q8GSdQFBr5n8TJTZLUHnq8d3G+8nth+o2A=; b=BqZ0tu4Q5PSMjESOzD5il48si
	xWxJ87O6UwzXtb2tukx9C7nCzTdYfkbCNEPYLQQMg5yO9ROl2wnlSnmYt8I97mbkag3UfWBXo8RAs
	FJNt2x0qGBMG7EFNJwyEUxNNhqbkqJP92Pc9fXeUEZMGYdfkQQA67LeauGbO8yq13dSOv7G0OW3kJ
	n+Mg0rzy51P5MeOW0oQeKL91SOkn8ImUgD7XmNXGjAbWnH7KaqdaU1Q7CXObLlk/f6Vy0gStxpDSn
	QAH2icSdDJt/YMOht0uR95V4HVDEyxg3FIyLzPBBY3GC2dbT1PF3nOZ0gDgzy2yMEMcKTRHbnXKSL
	ER7/sXbqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jvt-0007Dl-Bk; Mon, 17 Aug 2020 18:32:33 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jvm-0007CI-V3; Mon, 17 Aug 2020 18:32:27 +0000
Received: by mail-ed1-f66.google.com with SMTP id i26so13118945edv.4;
 Mon, 17 Aug 2020 11:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RjGzQA0sj9LgMuBKGfdljJoHuJrThb6OxdJKZW4mtwQ=;
 b=c5BFeuCTEx8cqOCC7FcUrsndd0075E9pQcNKI5z90ifIHVpxFfIbqtOD8+QbmHUeWn
 D95uIJbmJ+JMOyYqVwEu/ke9mGiNDZPWw2fg3pPrarVQRplRWWvyNIZPrVIrIgDG5WbP
 /YfcyD/ZqXi/rP+h1XgFMPRyw6MOlDt7DTjbTkofQDX3sfWKtkGYfm0CucDGiLLMbUpA
 Bhq+m43icHQgdzcM15wmhn/exJhuw+Md+j27z2t35xAq9x5ChVECnG47a0EoTIeDAKHs
 djp+/GXo49jYtOu8xLnBSqbs8jt7f/WEoW/M1S9hqCL6swmy2WcvdtT13OeFfHfdtLUM
 DxdQ==
X-Gm-Message-State: AOAM532+s+glb6qVuQMO/3frlFDwEo0aDg26PIKt99JhmDWa7CmSkqRc
 4Wxu/L/gd1xeoWz0QX8BeVk=
X-Google-Smtp-Source: ABdhPJx9SUZGr2fbcqQFiUQhvkRu1lcumoJycjlLpHc32PzeyqMQGfQ7Wto1oEAieJGVwl6Ll2Ot+Q==
X-Received: by 2002:aa7:c382:: with SMTP id k2mr15730132edq.249.1597689144539; 
 Mon, 17 Aug 2020 11:32:24 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id q11sm14191537edn.12.2020.08.17.11.32.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:32:23 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:32:21 +0200
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
Subject: Re: [RFT v2 20/29] memory: omap-gpmc: Return meaningful error codes
 in gpmc_cs_set_timings()
Message-ID: <20200817183221.GC3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-21-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-21-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_143227_093561_5EA1997F 
X-CRM114-Status: GOOD (  14.33  )
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

On Fri, Jul 24, 2020 at 09:40:29AM +0200, Krzysztof Kozlowski wrote:
> The callers of gpmc_cs_set_timings() expect to receive -ERRNO on errors
> and they pass further what they have received.
> 
> However gpmc_cs_set_timings() was returning -1 (equal to -EPERM) which
> does not make sense in this context.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Applied to drivers/memory tree.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
