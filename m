Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484BDC433EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A2620674
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVPKI639"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A2620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6syEmQx8wWDpyyo3nRGa8PnwrbAljG7XAdDN8GCxpk=; b=mVPKI639DSf6lu2hT6ruQ7B9N
	JG2+EMKgu16L2/UIysOhD3vc3kD0FnPrCLPgZMa/mMtJruQFJ5oj2jiF5X+LrkBSLUcWTlV9S3UHH
	5XPdPz/cqRneYw+qZg+t6Bf3OtGCHnHOrWI5+kQS7Ddsf6VfhXt43lIEmghvWoy1Pi92lPikWc4PT
	iCKauocokOIlrcXMenz2rVY4H0Rrpg7PJ46qniQSMUdOwCvT4ArwDb7HukuiMc95RHYjA4MVJSc0h
	bNfi2QRjJhqybeYpAe8JlDJFu6EKVl/AGO4NcPvDGSfhi8CsmrjrNYIM//7x+YJv2Nzz3iQwwOt71
	taZk7JlpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyRj-0004Ka-0y; Fri, 24 Jul 2020 14:13:11 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyRc-0004He-OE; Fri, 24 Jul 2020 14:13:05 +0000
Received: by mail-wr1-f68.google.com with SMTP id y3so8453299wrl.4;
 Fri, 24 Jul 2020 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3L0op7xpXWeOGCgDLy+1Vtys3CtHGPDZtayka6xSb1s=;
 b=cFCIbsFz6pnuW+29JT6myMJItlS5DTm676BxfxjhqGXscCrV6swo42Lt2ntEn/1zhy
 pQtpa8rTJM7263RBRv8WP9KJYivNKeZ3fmZcRsNbJeRsTj7jcgpphfFGW7NgbbmHmykI
 j4fvo/tD1na3563czmSfyhjvjzg+sRVmeNpDQWB2yY1ZHUG3SnQkekMU1XxYZAiER+79
 hX9uhWBwWQzq+hcYvGzHWYIiYfygd/tec8IvhEyhVtkz2SLfe2kUdtoKMwCHB9qsN89f
 IxGa0pks85k4fNt+kCdMZmaaI7JHpePP1p+rwPmRFKwKS20+6G7fH9W/CKw4666smg2j
 PmEw==
X-Gm-Message-State: AOAM531C0m72sQRg2Jc2FadLUM75W9GkeHmehDMxQd/Z9q99UaZ/nQpo
 Xhp8NvqYyTssNg0fG8Ib7BE=
X-Google-Smtp-Source: ABdhPJz8wgSdW2xGByxv7mBpjzaqtbxdMjyIXh0/Ytmv+7BBMoNNvjogaz3koa/G7t3STMPiEd6EBA==
X-Received: by 2002:a5d:4c46:: with SMTP id n6mr9404640wrt.73.1595599983132;
 Fri, 24 Jul 2020 07:13:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id t11sm1393280wrs.66.2020.07.24.07.13.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:13:02 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:12:59 +0200
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
Subject: Re: [PATCH v2 17/29] memory: brcmstb_dpfe: Constify the contents of
 string
Message-ID: <20200724141259.GH14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-18-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-18-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101304_842398_A885B897 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Jul 24, 2020 at 09:40:26AM +0200, Krzysztof Kozlowski wrote:
> The string itself can be made const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  drivers/memory/brcmstb_dpfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
