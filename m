Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE134C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B37F62063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vc7fnoEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B37F62063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QxPQfd9B3cZuqUIaSQFMn38EaNe6O2g0rcevr3L317g=; b=Vc7fnoEayDPO68hWO/UFtTgdz
	7cbneGaNyHSeP3uxfPd9rDloyXJggNSFKgl3Ti5RZCL9xdyTyXnu6ra02dGdR612Ghkguux6VfRHF
	1jX4arb+wnBHZSclyBFFD5ve7pEYuPHTdR71S+L8yrtLc+/USZw6uDMTXXwFsSLT67EkoWkmgGTEO
	iftMd/gl9YuHbBGjOeJDJXvTLl3kae8Bg6TWdnE3lW5c2GFZ6Q+CdpgwjKdn22+0lVg1BvrSUPqUm
	0qky4+RmPx1A7zxnLcAsu4EnCLOCniWY7t3cl4OXSmJMLPLk5bMn1VLP2UtFoHi+bFK+x+vpM8V/Z
	6YZRsVNfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyRR-0004Dh-SU; Fri, 24 Jul 2020 14:12:53 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyRM-0004BR-M0; Fri, 24 Jul 2020 14:12:49 +0000
Received: by mail-wr1-f65.google.com with SMTP id f2so8447333wrp.7;
 Fri, 24 Jul 2020 07:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cc+wwSkekWOme10xVBGF0aXqqYrHUB/C10pgM4XtzPc=;
 b=bTvp1V2m3jfT80tRLA0Vw3DzYx2UhCIKeGRicONm4f0askZxzj/cU7gcSxU8WlEsL3
 hC/ppIgURlY0gG0S10A/6A/a5G2d7YXdLGqKxGo3AS4V/pSOZd4FTHpj6Z0Z1/88XdNa
 9bAjfesyWc+osUJOYE1X6kwSaeDObYGulzPIDfT1WWVqm7P3t12zxPdd7AMD6Tg7mTTh
 WH+11BvXX+2ukWOPQKrIKiFtD9dwqVDV1KqYd0nGrXZZs297/BZEVIm7wNhUgqRB2G59
 Kvz3/cbPDLLCuW3BJVLPzoxi6YRi62i8Vf/AQiRGDTFulN0/SOl3DcN00G0+Oa30VHck
 peQg==
X-Gm-Message-State: AOAM532LfYuy5lqfBxmNC5zXOR2R1+hm5Kiz2+t9UGT/clb8ZAQbkX2R
 mT4iCsmfGe8FIF9cA2HQlak=
X-Google-Smtp-Source: ABdhPJzb92ZFgrzcOvTIpMmOj/fOviym2KrJ1TSCcCS6V5gmnV3tVzH55kWuJOcw1qCs0CDJUM1AZw==
X-Received: by 2002:adf:e486:: with SMTP id i6mr8653949wrm.258.1595599967200; 
 Fri, 24 Jul 2020 07:12:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id a22sm7569527wmj.9.2020.07.24.07.12.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:12:46 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:12:43 +0200
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
Subject: Re: [PATCH v2 15/29] memory: ti-emif-pm: Fix cast to iomem pointer
Message-ID: <20200724141243.GG14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-16-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-16-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101248_758134_B6178E3C 
X-CRM114-Status: GOOD (  13.39  )
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

On Fri, Jul 24, 2020 at 09:40:24AM +0200, Krzysztof Kozlowski wrote:
> Cast pointer to iomem memory properly to fix sparse warning:
> 
>     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
>     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
>     drivers/memory/ti-emif-pm.c:251:38:    got void *
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-emif-pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
