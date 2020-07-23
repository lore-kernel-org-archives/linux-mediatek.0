Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C2CC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC042065E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvZZpxIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC042065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tEezzaYR188iKPKuRkm5J8yDPCiL1L6kGVnklUxU+90=; b=AvZZpxILMVIst5FBTE82ssc+j
	m9k3QatoLRjhTPdjX7knRkaQUnYNzo7zJFyqyGmvFo9qKCYfGSTO9cW2jWisny57MRE0raY11QOF6
	r+JIUQ9rkASA6DORBWH6uu1v0PqtIxT1hO9KJfbARpv6TQX/+NLTStPRfSSffemAVq4gyoE3w/H4H
	PnwivjJoDHOzxujpy80w78Oni8Kg9vC7ou1OwbQIAK4ZmOeqcxghBs++biDUn3I7LwR5tQnM67+Rb
	YGNC4wf6X73fv3THbI7asgvVGoeTH40g0ggKKC5nbJAjVMSibrhDquX8xPOxzUeb1Tvi6nC4lMSJG
	4oxImXJrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyY9G-0003tF-AW; Thu, 23 Jul 2020 10:08:22 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyY9C-0003s7-4H; Thu, 23 Jul 2020 10:08:18 +0000
Received: by mail-ej1-f68.google.com with SMTP id gg18so2360859ejb.6;
 Thu, 23 Jul 2020 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XDRXKhZ8bECB/0hKnCNux0bgmgLiM0R8AAOfy3Lf7I4=;
 b=ZkFRbMEkuqkEfgCub061K1wXwuyd1u5nXqK9LO7UlXZ1oyWg8HR3ssomuztvxZ3NjN
 j0CTAwuPL9IIyOcC+t0ocGE0LA5Uob0MZ2P6ECLtD7SGqZq20NoGuPC0K+d62h+a6vu1
 /zaWFwFXDbMBZ/22vZ+5xWw64f/g6tLCwK5UORee9zcLDgt/5dBfbggCs4YdrGbh4jG4
 9k4gniw7ihFn00IDRWUY5tfZptDIErsjwX2Uaxwp0d0ug6N5c10KY1PHdkNvDxG3J0I5
 OOsYp9qxCrhvdHvbidWW7uIqVojLfIbJdRUgm+MWBSCRD3aKm9njrdHVZVf5Tn6lD0Gl
 YfTQ==
X-Gm-Message-State: AOAM531lUkBp2zrsUZMfAbaBEAkmYMp0GQDS6qZ1vKCf2CONtAvuMtmQ
 CfnwHE4lJ09DKlVzcjYzNkE=
X-Google-Smtp-Source: ABdhPJzgAgG+vnt1QaigoG55Zk1ZcSQLRHkD+NArOZpeGKQIdaJNSffWJFnJuyD3vyPvmz52dwBm7A==
X-Received: by 2002:a17:906:6852:: with SMTP id
 a18mr3546617ejs.348.1595498897021; 
 Thu, 23 Jul 2020 03:08:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id d19sm1693779ejk.47.2020.07.23.03.08.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 03:08:16 -0700 (PDT)
Date: Thu, 23 Jul 2020 12:08:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 20/23] memory: omap-gpmc: Fix whitespace issue
Message-ID: <20200723100812.GC30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-21-krzk@kernel.org>
 <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_060818_192214_874B36D5 
X-CRM114-Status: GOOD (  16.74  )
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

On Thu, Jul 23, 2020 at 11:11:08AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > @@ -1756,7 +1756,7 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
> >  /* TODO: remove this function once all peripherals are confirmed to
> >   * work with generic timing. Simultaneously gpmc_cs_set_timings()
> >   * has to be modified to handle timings in ps instead of ns
> > -*/
> > + */
> 
> This still doesn't follow the normal coding style for multi-line comments.
> 
> I don't think it's worth fixing, but if you think it should be changed, then
> make it
> 
>      /*
>       * mult-line comment
>       * ...
>       */

Sure, thanks for feedback.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
