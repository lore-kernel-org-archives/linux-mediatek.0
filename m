Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09E1C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:11:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD46822CB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhKwnJzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD46822CB3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rm5QbdbonrBRQh5AyLoO+Saja6SKBuwCDw518adCXVQ=; b=YhKwnJzU79qCo5Qb/cvFz8TQ/
	xmRz6CqA6NAKpKVBxZNNJyaIvk8VsAuOk+rktL9vVQx9ST6hhMqgUgf+LoCjWh8J0OBVu1qY6uUwc
	m+mT/D1d66HS15DLSZvR93nC0aMIcooPmoGNNy+UW2l8VBWHtOu5oMgwYZK8eNX3No6X9q6Uu8zDz
	xYBcTTBKUc1UMFJfx0wwvYbHiBts9RPOE9jsnI+q1IVqg5yEM7w9VJWGJhJO4oJoJizV/bJldhPNN
	bMgXmzGSz3ZU3I4v6STQUT+NXeQdw681F0xApFPHH2R6vyzhxcOnxRqBjP6DbvaydFR7Zhl0e+cDW
	Ufrm3yZBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXGG-00040f-7g; Thu, 23 Jul 2020 09:11:32 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXGD-0003yq-BM; Thu, 23 Jul 2020 09:11:30 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N4vFE-1kzKZt3pXo-010uTN; Thu, 23 Jul 2020 11:11:26 +0200
Received: by mail-qk1-f181.google.com with SMTP id u64so4633101qka.12;
 Thu, 23 Jul 2020 02:11:25 -0700 (PDT)
X-Gm-Message-State: AOAM531lkl/8q8++WaYnS/6sPXySbYLsm6Vg+Y7I2TFZoOAId/Ufupgw
 EjZFuYjTLqd5OC5Pf2E5upuapeGrrgTv5rMNf3Q=
X-Google-Smtp-Source: ABdhPJxStLH4bkEByDAb/z44/3h8H0El0YO8LxmjELnMmVnMZT+ySbMYTCQvSxd/U4jvrltWM2ImxEZLkkbzi6dufOs=
X-Received: by 2002:a37:b484:: with SMTP id d126mr4090550qkf.394.1595495484736; 
 Thu, 23 Jul 2020 02:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-21-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-21-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 11:11:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
Message-ID: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
Subject: Re: [PATCH 20/23] memory: omap-gpmc: Fix whitespace issue
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:lEv0heqnHlguOH0m4q17aOifRMULWtdtmQUx7iY995vup9hR0Lx
 NZZMU6bO8y80wwGZheo7kDYbxtnoDXXrTrunCT/ck0u59HmDdYn3a8Pql7JVnflSdiVgtVi
 lEclJEwgFQaYswS+cmuLmwLNGQITQbsBMP/so8OSlSbRtGLXu+4SkSUMLj3Amg3oqfb/j9Y
 Y5x7fQkbW6Jfj1Tz4iWBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:asrgimbp7cQ=:qmsh1ZmW2VJgLS3APyQmuQ
 rmiuT8AdMOeUTEZNY5enBAP5gnurx5VmynQ8wYakbuUBVhfRmDkkkYonHqSCFUCfASX2NT/hj
 slJgHp4thfzSP/G32/kKSTLPIX+88V718PnBcI02c4VplMjOWtvichIw+aROkTZl+hFj9OJhE
 rgGP92FnnVlhRIi7kcS8jRaa8lZ9cCoCLEKA9GkkEPyrwKZ1SjI7bOIS2NoOxDLhXugXjQMbg
 LMIB3D5Z1ey5hUS4hVahgmW1EQSBxLT8QRvXPghczhHJF7N396kaPoWIBHTQNTgu5yGOTw0Ln
 9Mh0g6amTSSb7xD9UJSU6+4IX70ucR9pcy8pI75Vy/WD0gRh7c5rQ062yKDiIwRvZB3SifgAU
 4rXAHhftY37G2W2PhCGRh8fFqdYKnJezscXYeEbA9nqjblRQ5z8HFuCCh8E6WnNSsOa3SkvwY
 eximP5hK8WmPMAENyqw0h02Qr37sBHOtRkmZiXaJ2eAiDHTNI1CRc+RqXTSRYQGVQmAhtuSqz
 2ZGuvbTDhNMYW8zH8Ws3hECqP02ldEUImKRs98vjZxPVE0k8c8MZknLUP/pz5z6k9vCCECBqD
 +auI0vM9R5miTbUjJC5TbFiFJN/DEHcf9Sp4Nvob6BT7q3wNqhfUT7ldkJx7LvE/qcYK3Ou8L
 Z/bNfDSMsGjXUF1kqUbJV274RyVq7zXLxiT/ke0TM/ZmMWEA/EumVi1XwrX6SR0aysbq6Qqzs
 KWdiVcDIK7TqohT3Tsjt5PEQThkx1tESXtfmdr4y34PKpHykrpCCSQv5c3+8n3UB3GjpCHoTD
 cYcK1kvSINChum3C+4q+SPxwwriFzMhz9BH5MZlk+VnD0faXdby9V8BBO6+tjOmz9WNaEebs9
 CAGa37RAbzKuZtYWSJCtx6QjbqXDXJ6PKiA4Sp9D8vHmR1XYeOL/4ZYrPq+WeoN2of32LvQ2a
 81pQK4BFRsp2ynqLxOI8fAq0LXzqjjRu7Uamm4Nez4NiuBWpfpwGh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_051129_653863_FA7B804C 
X-CRM114-Status: GOOD (  13.49  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> @@ -1756,7 +1756,7 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
>  /* TODO: remove this function once all peripherals are confirmed to
>   * work with generic timing. Simultaneously gpmc_cs_set_timings()
>   * has to be modified to handle timings in ps instead of ns
> -*/
> + */

This still doesn't follow the normal coding style for multi-line comments.

I don't think it's worth fixing, but if you think it should be changed, then
make it

     /*
      * mult-line comment
      * ...
      */

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
