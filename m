Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794D1C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478F120674
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrwNkHEI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478F120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zoXa3gaVzYZVnrRywf6XMd30YtDAjffqQkTgRboKjZ8=; b=lrwNkHEIz6ilBh64YW4kC+XQQ
	hZdedfBUwIiZNtrC5DCmJQXtymMl31dEPK3ub4QhFgcUhuwAwJck6tzE3dTHZfsWe3mQPlKtnLQ5p
	gI1yQopcQRjtadbd/ilqBMwcn7lc4fEncDWoKnJcHucnvynZBwoF3WDWNa5jreCMoSaebG9uhUnJF
	Yd/7T+nsa1r47UwQikEn412S5e5enzeUTF/h+3xWd5UGs9/LNax/lMV3zQs5YZ31RvZtfzMbbz2yZ
	UQHIW2Ul+4Kkx1LNxe4tb1uDyJTlKo9ELhtp1LXY3QJpn6xnP7RyRHuD3rNY1JLZWA+/6307HpC+f
	IUKlYzYZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyUA-0005LV-3Z; Fri, 24 Jul 2020 14:15:42 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyU2-0005Ho-PN; Fri, 24 Jul 2020 14:15:35 +0000
Received: by mail-ed1-f67.google.com with SMTP id q4so3917380edv.13;
 Fri, 24 Jul 2020 07:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nOZ2EhtWCBrjRorAHCZte7RSZh4Nr/XFu5pAPPeshAs=;
 b=GeMN2mQ85W7yne12xsmYjxWtJ56SpAOj0g5rvepEQeb6YauKZVLg2H0t2h2AaRoUMB
 udMBpL9diWrUSwt+3i6Fn+WKfO9aoyjM/+lebK1ATS0pfDjgsmpLa1UXv4/+icVXNlT2
 fNC/nCTrTufUcuUuYHY/lBISFQrn5pdyQCVVdBjEIi6eS+1HMReHrPxvMg96cww25myA
 f77eq3xqMZkK0c8a3MW8XEvV7yy/3VZN3PEy0nJZMWoZnTCjX6FllfvkloHPtjyjGsfv
 cYTeoznYy/mDYc4NUa8miIOz3J+OW6vESv4UkHVSMYMqh4jXXhSC/MnrVDWG3mNfPHYi
 k6KQ==
X-Gm-Message-State: AOAM531F5iLuhfnHKKfrP7y/QwZM8+RKPANCaYVW/UQUP9Avo/VkpJeg
 69qjpyK0NxUvuyAS1xOnihw=
X-Google-Smtp-Source: ABdhPJwCnDwptUWPu+G+TpiJFfaUazAFE2hqpzKtAB4ZIpyBPFN1p7VAzZ9uPmDfPJ7y8jaLzjbtqQ==
X-Received: by 2002:a50:852a:: with SMTP id 39mr8845473edr.107.1595600132842; 
 Fri, 24 Jul 2020 07:15:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id v19sm821828eda.70.2020.07.24.07.15.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:15:32 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:15:28 +0200
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
Subject: Re: [PATCH v2 27/29] memory: da8xx-ddrctl: Remove unused 'node'
 variable
Message-ID: <20200724141528.GA10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-28-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-28-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101534_840368_270B2AE9 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Jul 24, 2020 at 09:40:36AM +0200, Krzysztof Kozlowski wrote:
> The variable 'node' is not used.  Remove it to silence compile warning:
> 
>     drivers/memory/da8xx-ddrctl.c: In function 'da8xx_ddrctl_probe':
>     drivers/memory/da8xx-ddrctl.c:105:22: warning: variable 'node' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  drivers/memory/da8xx-ddrctl.c | 2 --
>  1 file changed, 2 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
