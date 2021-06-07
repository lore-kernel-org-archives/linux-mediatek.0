Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51E9C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 08:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDDC611C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 08:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDDC611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t43HDZKCXEzc190vHm/0UCAoeEX7MYJjQqs6AY4LHe8=; b=JC6Bx7iKUsPoh5
	mZJiJTD4Mnar3PnOMXNfYSDyNuc8iecWbY1namB6EHFKAdza65JETVXVy4fkHgU8UCX64tCvcyO/0
	p+fiP7I2ZPfUK+79kdZP9ypRYAwRDvz+wNCH3C2r/x01/VN9K2CTjYNSrGMKc0+51Qj8uQB9EBAnB
	SiGf0/5adpuvrM6K1BBKLiOzGhToLQYBBMNZPuxxWB0s+zNHbjnH7733bL3zeDllTtXhq/qqXDnT6
	owL8Nu+DczJchFuNPSYNLWcc/iH708rAjnoavmezZbydrPa2DJ6xdLn1V6GkzChhxIpEREmC0+i4v
	4PqRzYw97HLWAs9HM8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqAJU-002CRP-9L; Mon, 07 Jun 2021 08:08:48 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAJB-002CJ8-6R
 for linux-mediatek@lists.infradead.org; Mon, 07 Jun 2021 08:08:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id x14so6614084ljp.7
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Jun 2021 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJNQotdL7mBjqDK/i6BKdnazNCtCGN8zaF8D6zYRhMY=;
 b=weOnKpN4tS8axKHUOKJDGbKfJIvgNkD7dyFA9rrpOhtRoUBevjdNocug35o54J+Yk4
 epRxMipw0liSPdILI2EdIQ0hsjWRY1Zx6yg3qhw6HELLIx1gf7flXLH4s8BKhKhpLjT1
 B9vTmTpm2XUy1PMros3T3V+YOAoAxpflRTTAVL9NfZerwBxISRK3Ikg4JUJnFtuSlsst
 4Pckh7JeFB87sc26mg0fqoePqav/vujGI280ltgybRzU4kmjulSAYvEEthjFJOBEAQch
 US95MsMzTQai62+ASJsQUEy4JuLOljpt2k2ekhjrNgFgH5yLEo1BK7+xQ74TG1QDP7m2
 cpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJNQotdL7mBjqDK/i6BKdnazNCtCGN8zaF8D6zYRhMY=;
 b=Kg/rTGapF3IxVjA+faEAUZBQtHEH5uA8aKTPk2ocrxH8ghisHX6LPQwt4uRHXZOMS1
 g1JXOzQwzemxmzH0fLambLQTNrNgbj20823XEM6OstNQmGc4CGU3SklgHHC3BPjppprc
 N0g1Bbi2XtZGNpDI0mdEw+OsyH1nwdbpUzU1K0MFH4khVMqcSbzgAOrvHh+RX/ZaLSzS
 F7e7nPT/lYbyDoUiDpn9OpMRoSJrxgmW1O/tAUwsMWuAkVardFHh+BQEWLY2kutvfzBl
 xOmv0c1pQe5+EGcR6br+SZnntjw/4OKRp9ZHHNOSU+ciTW+63MOESoTVaT3QK+pRqsmG
 hmPw==
X-Gm-Message-State: AOAM533hb8T14zOFhvjyLayUnmxLK/3E7gDt4vaFPq0Rd2xzt3yKR7RC
 0yoS0HHb7w5s+uAn3OeJz8YFXBEh4F2z/fO4GvlQyA==
X-Google-Smtp-Source: ABdhPJxxdKZPAbxY1BAZW4RmsEigy3uml8wcXhbHWYHoD7+ocbk4ASZ97dVxgth1VMKfh3dEwFHkFYx1/foO/vZ+/2I=
X-Received: by 2002:a05:651c:1411:: with SMTP id
 u17mr3470827lje.438.1623053307601; 
 Mon, 07 Jun 2021 01:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210603140618.3044976-1-yukuai3@huawei.com>
In-Reply-To: <20210603140618.3044976-1-yukuai3@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Jun 2021 10:08:16 +0200
Message-ID: <CACRpkdZmn8YS7g=EYnc7EDs_sbzT2qM+00q7YL5R+d9OyBC2LA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix build error without
 CONFIG_PINCTRL_MTK
To: Yu Kuai <yukuai3@huawei.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, yi.zhang@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_010829_281483_FE1ED2A1 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 3, 2021 at 3:57 PM Yu Kuai <yukuai3@huawei.com> wrote:

> If CONFIG_PINCTRL_MT8365 is set without CONFIG_PINCTRL_MTK,
> following build errors will be triggered:

I made a similar patch, this patch is wrong because if you check the other
entries in the Kconfig you realized that we select the dependency for these
drivers.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
