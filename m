Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606ECFDEE31
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz3OwM6ZqtXTE234+rrZJXeoUNgJ9jOHjfV583YpF8Y=; b=Ii6o3KDb/gJJlya3i6WbcRWqDt
	wjWDS/FILb/ZNkAkVB4buZarzOonnf76W8BG+BWQ8XnoaZLjsnsbwGwu+5MYyIIw2cJkj4QqQ9c++
	vCYVD/UqtSekPzghJeVQirrexSTdrlAuwFr1GUFIUeKh0Wrey5zwY0r4+eyBPHgXb7O6wm9itPqSa
	L0xb75jeKAqC4/R00/x/Mk2yhi45uiPltj/P/6J61ADXA7T4UJFZizpapNwGyOotbaxUi3KgPt+KP
	j+31zHyPQUknW2Tsw95HHcq+JnLyYu0g1EIVZJXxYaopNtuVSgcdop2CIFvZKRTQqHGp9GGC0GREN
	XGXk238w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxwi-0000000C3lE-2aPn;
	Thu, 23 Apr 2026 17:34:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxwh-0000000C3l8-3SkR
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 17:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16C7961119
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 17:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA17CC2BCB4
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965674;
	bh=tz3OwM6ZqtXTE234+rrZJXeoUNgJ9jOHjfV583YpF8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NWnkHW7CQHMqiMxwIcbqflDGH0mDDXIkp94zC2grKfec1rr9KSC+KgU5DO4Xj3I/I
	 aWXFUdG9vMH9PDVLtufNMT7/yIBRPumliKni7QAsfwbCRQSLh01/XnhN+DQqyH1Xwi
	 FsDqWRY3WvjB17UoRrHCLfYgx9/dpVhz89xk3c/gqiKUafuiexeaYs3BVLKtJqFZHC
	 RpIqlRvIoXfsgzlYt6z3OGg3mIXNS9pUTP45cuezKBx50YmSbforkBCZ8F0h08Ebj4
	 1ykYlgYz9a5HDxl+6xzMuspzjD449yIDHpdYi1fZyMgjH3sCr4a+RiRvM7xcpyJkRE
	 yYaC0gGyHJjuw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40502e63bso6381998e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 10:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8vuoFZK9pWg8UFgjArPrc24DjQKRLpmmoGAYkM0MxoM1A4hA5AZ5761MvcVeKUAQwRiTa20f891AfbpoHOig==@lists.infradead.org
X-Gm-Message-State: AOJu0YygfdpGj09koBNeP2mkPlgY8FFPjPDP7gxtzX49QbB4BIoZ0A/m
	42MRdAwzGNWhSrTkC8k9xnGrr0UYwI/kLs2u09YfTwMEWdDmwBMZeuA4AYLUfZAkBvWkx5LvglW
	2RMXvfV4gFMC9RS/ulBhcKd997X2C4dQ=
X-Received: by 2002:a05:6512:2308:b0:5a4:2cf:601e with SMTP id
 2adb3069b0e04-5a4172c3f7fmr8750846e87.12.1776965672922; Thu, 23 Apr 2026
 10:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
In-Reply-To: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 23 Apr 2026 12:34:20 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzq2HKHCpzG=rXjvQa=aORPRYvpEjsUnqsc6jDvwNMtB7g@mail.gmail.com>
X-Gm-Features: AQROBzAlw-9F3viDRFk4zHZKcR0uIDtWqMO3nL-w00vYCJ1t3Wo4hMiO16cNv8c
Message-ID: <CAGp9Lzq2HKHCpzG=rXjvQa=aORPRYvpEjsUnqsc6jDvwNMtB7g@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7925 WiFi device
To: David Ruth <druth@chromium.org>
Cc: jb.tsai@mediatek.com, Leon Yen <Leon.Yen@mediatek.com>, ben@decadent.org.uk, 
	=?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>, 
	dwmw2@infradead.org, jwboyer@kernel.org, linux-firmware@kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, litien.chang@mediatek.com, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Quan Zhou <quan.zhou@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Merged
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1015

On Wed, Apr 22, 2026 at 5:22=E2=80=AFPM David Ruth <druth@chromium.org> wro=
te:
>
> Tested-by: David Ruth <druth@chromium.org>
>

