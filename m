Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E071C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 17:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC55611CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 17:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC55611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnEiZ6ewDk7mLH88cEsLt51izGykYBLhVi5oUYbo/1I=; b=WMvHI0osAy/lLfZfvBweYBRTMD
	5WIwqZHCllKOKRnQHhDwxgUU+wnpvUB14SNXhvDhodd/J7FbYUL00R+1KZSIE43SzhjYzeKWvtRuU
	CUGvHxZA95Zizl3aUo/qe/275Drpkdm4rzvaatf1MBUoNgNWFZ37LzflQ/tneKCB8gKesq+BR3LL1
	gve3CICbIRuqg/7+hFO3TaSATCaX1qzFBlKs/Q+cUeRPANGnn6nbzSXNb4Q5L31Vc9z2FTJzZJRm4
	ZUL77NNtJf7GP+2YVwcxjsxNJVtfJ1KRCZm6XkEAVHhML3R/rk6TjTO2z2NoPXkZ7ROug6TwpTsGB
	NmSliu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2znb-0084Eg-AI; Mon, 12 Jul 2021 17:32:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2znO-0084Be-HD; Mon, 12 Jul 2021 17:32:44 +0000
Received: from [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7] (unknown
 [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 36EE51F41E3C;
 Mon, 12 Jul 2021 18:32:40 +0100 (BST)
Subject: Re: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
To: Frank Wunderlich <frank-w@public-files.de>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich
 <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
Date: Mon, 12 Jul 2021 19:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_103242_749406_4D790C89 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 12.07.21 19:16, Frank Wunderlich wrote:
> Hi,
> 
> it turns out that problem is the read+or of the new value
> 
> i reverted my patch and changed
> 
> reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> writel_relaxed(reg, mmsys->regs + routes[i].addr);
> 
> to
> 
> writel_relaxed(routes[i].val, mmsys->regs + routes[i].addr);
> 
> and it works too, but maybe it breaks other platforms

Interesting, I can test if it fix that similar bug on mt8173 when resume from suspend.

Thanks,
Dafna

> 
> regards Frank
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
