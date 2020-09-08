Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670AEC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 05:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1E362166E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 05:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQGn4toy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIOIN0M1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1E362166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i+idiaVodrA/Gy0rVom4rp9GXGXwlUZS3VmvDxWVc0g=; b=IQGn4toy8OPBLuD5U8WUxWBtS
	1Ou7ioPMg6fKCxSn2obysC080vhMmTcSQBJPeV/5hYzglsv0EHpUKFcV13xrO6IME+Cs0f94hkoNt
	JqJXHxCnzXPpqpFozsqbwBNXye0t0GdEXrwoXE9J4n6f/2L7KB4RW7P3IIf4hSK5nwNb9ww8V6GGK
	9z9EZHLo4dOuZHro9ydddpzDLqdC4ZNC/pD6U/dWTSTH3p9YapNA1xPjxyaYzgjDpzP//Jh+1o8Uf
	JEWY1Kzj902xdzAPUz4tgYoqWm15fLwHo3xko1KEWtjLuyXvBfRBkRKFmikN1GGwyRrdSJQZTTtsN
	BXFd8JM/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFVxd-0004NU-LJ; Tue, 08 Sep 2020 05:14:29 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFVxa-0004MH-Nk
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 05:14:28 +0000
Received: by mail-pf1-x443.google.com with SMTP id k15so9952350pfc.12
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 22:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GA6Q87SXfiiRyiEUrF3DVxzLNnyqW4kCZ2nOXPNCBoQ=;
 b=DIOIN0M1CLSFoy3Yo1MnXH3JBVqUEH7u6JJ0/EiwRGGfsRI00a9ga2LT4axQ/CALQv
 4Ub6I31zTflE9byo89GvmfPf/c4i7I4de8x0k3md3AKKIvFZVCvSVP45i9tyPIFw+e1J
 /C1tMAWwISPgMBH4Tc3wtONeO3qmoP/tYp4IjSdecTUEsqWoMURL3NkhMvzAf4UNa9CK
 8aNw5bQptDUfmGLd7yhTS5lrMPwhHB0JC6abRCSno2tFBG/uxnuG+GA55fAFS4pY4EUJ
 vSJQJ/s521x04RQVJ5cQSiQtVIP1iqVz5/CzBsumLd2vwaB2aKXtg2FBd6cnb7Sb7umZ
 Ti8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GA6Q87SXfiiRyiEUrF3DVxzLNnyqW4kCZ2nOXPNCBoQ=;
 b=FBpkd66zld+HSknXKF6+mjajZ98qEX7OKfqd8gqNf0UEGQQu/6q2bqyjqKr/xsN/m1
 mWzV/nHqICepgsmdDivIdUMrhmL0ohZIrWMKdgm9bTcQeLXyeBEm1WWiYM7Yv5/UmCrC
 mqmUBWgCJyscijWF2qLP+IXD5WQqCOcGH/l/XyrsMgQ+HI17WyXYeO6r+fRNWNMy9s8H
 27xPGgVD9BvVQMlieo30tEiBXV0ND3xcr6sjT0vvcpTmi952BJWuiKpuL5dcE2z/LHxr
 2T3zHUFKqCTilHJEnuIJUTIoia9OVq+M0/vlEFIDEvOxuUKiFuwKuLpyZvyTMGlrS3R9
 mPnw==
X-Gm-Message-State: AOAM530KuUH1FB0vntnVwNP4vA52AdWAH1CtWUkE8HpJ8HxBRpmuxiMX
 w+JM2XDRGB68nf7jgTtw8bkTwQ==
X-Google-Smtp-Source: ABdhPJzWWdFvxTcgmvwbeZhhaPBEwqOapZp0KsHGc4JYEcxUmmMfC+nTLqvQJ5QjGzfo38RFeoHqqg==
X-Received: by 2002:a62:1592:: with SMTP id 140mr3940470pfv.215.1599542063985; 
 Mon, 07 Sep 2020 22:14:23 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id c3sm16708857pfo.120.2020.09.07.22.14.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 22:14:23 -0700 (PDT)
Date: Tue, 8 Sep 2020 10:44:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v3] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200908051416.na567g3mr7zbyr6h@vireshk-i7>
References: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
 <1599532510.17707.4.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599532510.17707.4.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_011426_885748_A635D3B8 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, wsd_upstream@mediatek.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Olof Johansson <olof@lixom.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Li Yang <leoyang.li@nxp.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-09-20, 10:35, Hector Yuan wrote:
> Hi, Sirs:
> 
> Please kindly let me know your review thoughts of this patch.
> Appreciated.

Please don't send new patchsets in hurry, it isn't going to help any
of us. V3 doesn't address all the review comments you received in V2
and so there is no point reviewing it.

Please send a new version which addresses all the comments you got.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
