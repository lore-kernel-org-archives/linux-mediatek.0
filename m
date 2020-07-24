Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B10FC433FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA31F2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qixJ8IoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA31F2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q3wZ+aw3BzooOvSKnaCMNwiB843Qb0ICnCiMEWdANCc=; b=qixJ8IoT7Ig0vBWa0/KVIK5gB
	ml7ci4fl6hf9xSBpygeBdVcj+i/YW99ihriJQP5LxaLn3wCmtjMJe/qfVHLuYYck5RmPQZgo+lso6
	lot4/lYDQGtHULTTwe6Gb0ZwklIYGoCEJApSHvpx5oFhFSj2V7PuRo5W1Av+xYtZyEu6ajFC5SZum
	c4gVlpFHdD7rCFxo2Umj+dfl/bxYBamRltH2j5CZz1N/8Qc5TlbSqu7woNUKOUe3uipioKptZ/m1r
	cByzGNowNM8WErKY45CIDC4Pkp9Ou9zrkgGm76k1OF06KxV+mIY5qXur2gWmPyD92+vrjCbqjSSIZ
	iH44u+OLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyS4-0004TE-T4; Fri, 24 Jul 2020 14:13:33 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyRs-0004P5-W2; Fri, 24 Jul 2020 14:13:21 +0000
Received: by mail-wm1-f68.google.com with SMTP id f18so31267wmc.0;
 Fri, 24 Jul 2020 07:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lRR7zihfAPcF3BkRyL0Zid9zLwCKqRIandOIBJZScT8=;
 b=rrr8RXamLnqTHb7XH3/T254yKGu+To7C2zGLooGJzW2ketidLM/um0K7bLaMiGtj5U
 g/B+BX4m5wgEE1T2yvBjNhMBXt3kB33LtixfiTfPv2NY0dT231lbo3VmX1B1e4cjNGzJ
 7SQvQBawx0FJapSC18u7Wgelp9nAFLqYoAzWuzD2dY/JaR78EPmpxnAiW/gy+RqHcAt/
 lh5vpt6WeM38DOowa9LfLE+Ohv+mPkcVla512UVPsdDUT0efEis8i67Pf880R6w5Bn8d
 CwZL+rirTtqEGsBlE5LY2TooyMj8ehD3SwLE2Ag4WroofD1LTZmr3B0CSOGhbLzjrJuw
 sn2Q==
X-Gm-Message-State: AOAM531fxwzUHwfHh2HQfgnlAaj23EsMKHZddmWBUaKCRFcyiPYQyLUi
 gVu7lJ528wWCn7FYTJDn8Sk=
X-Google-Smtp-Source: ABdhPJwNei28bnjgISCwDv9tMLHh2SVTSriTtsDgwYvqcTiDeKj5wmxQxqltNmpJgPyq8t+kqT2nWQ==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
 x19mr9270136wmj.174.1595599999842; 
 Fri, 24 Jul 2020 07:13:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id f197sm7820726wme.33.2020.07.24.07.13.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:13:19 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:13:16 +0200
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
Subject: Re: [PATCH v2 18/29] memory: brcmstb_dpfe: Remove unneeded braces
Message-ID: <20200724141316.GI14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-19-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-19-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101321_261802_93CA8AD0 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Jul 24, 2020 at 09:40:27AM +0200, Krzysztof Kozlowski wrote:
> Single statement blocks don't need braces.  Fixes checkpatch warning:
> 
>     WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  drivers/memory/brcmstb_dpfe.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
