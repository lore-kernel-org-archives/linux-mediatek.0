Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75893C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 11:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F07020767
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 11:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbw7oZk1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F07020767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DNVuDsH2ycCkiw68PD/rLIaqzel6hwIH9Vx+pcwdbJM=; b=hbw7oZk1hH1BkjgboxaCLWe8W
	0LXj+Nl9qGm9VuGa4G8LYanQqW/dwuIBMlGt1hrWLklpwuIpzho7n5OimuiLg5H0LnOROzkUSRIjW
	60cX7T915EszKAzlMghzzFrqeO72oCxfsKkW8eW5oj5/1y4B5BspQLsYPqoWU5mC6AuchISyPJxT1
	QGTBHrMiQQxNgZt04vm5klKjwReQJd8NFVGNsgl45Y9S45XoPLP1QgqtjEkMBH152ugHK/UJ7RE+d
	yTX2MSvuyAMKHaQmGw7Mz3HyzVK8ezhR48LqOYH1U5/xOd+0sUdCnKmIFBzsLyMu37kxLFRWTVI14
	CnwT1P2kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD4vA-0008Te-Tz; Tue, 01 Sep 2020 11:57:52 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD4v7-0008Sv-BP; Tue, 01 Sep 2020 11:57:50 +0000
Received: by mail-ot1-f68.google.com with SMTP id a65so891899otc.8;
 Tue, 01 Sep 2020 04:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bS1viyL8NjfwjcMbt5ItRCCKbfY+WgWbL+lmwBqbddk=;
 b=GP/mxQsZ6upFlFx0hr2NTXAcI8cMx2scS3k2ji4aIjOy25MZsFESIxMoiREvLs7KGz
 31K8d5UlDj/6t+SXVd8txExUmcARDsKQcn957RYuec3ksctgc3vXVoZGg5VbsSQgMCBB
 E00OdRvmzMUA8GARAtRq2p+w72c0roTVuGA4fnDELWifRKSKsnSy18N4NvrCybcG9Rni
 SO++sIiZpwLxzo4aHGQUGExEnWvLUEo/zUckeCjL8kVW0Er9s0TBYomrZf/4+AKM7boA
 IFmXtD1q3e5wKNmUqoUv3Bmdf4debjGmR5SxpFHWORYg8v1/GUqgE1CytD2bcqaI2B+v
 D3cQ==
X-Gm-Message-State: AOAM531dx84oQjs9BP8F8+8qMn5BbwiQyK2uCSz4A0LeJox42I1fghcN
 McfmLZcieNHUDKvWcS+lkJwh2RyZh4U5/luENIE=
X-Google-Smtp-Source: ABdhPJwOq6HEEjQ3xAjudQZKFJPfbYu1NdSQrGq3FL2K08dbGzeOdfoH+V2BBxV3R1Xz+2libeoWvf6J9F6bWaodlSI=
X-Received: by 2002:a9d:7e99:: with SMTP id m25mr1059559otp.118.1598961464586; 
 Tue, 01 Sep 2020 04:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
In-Reply-To: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 1 Sep 2020 13:57:33 +0200
Message-ID: <CAJZ5v0hOGEUamXw124q4CnL67o97qRHy9Vv9_F2AQqefDdu3vQ@mail.gmail.com>
Subject: Re: [PATCH] PM: s2idle: Introduce syscore callbacks in s2idle flow
To: Claude Yen <claude.yen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_075749_392980_72079ECB 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Linux PM <linux-pm@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 1, 2020 at 9:05 AM Claude Yen <claude.yen@mediatek.com> wrote:
>
> This series based on 5.9-rc1
> This patch makes s2idle call existing syscore callbacks. Currently,
> when s2idle is selected as system suspend method, callbacks hooked
> by register_syscore_ops() will not be triggered. This may induce
> unexpected results.

They are not executed by design.

> For example, sched_clock_suspend() was added to s2idle flow in
> commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
> wrap caused by tick_freeze()") to fix clock wrap problem. However,
> sched_clock_suspend() is originally registered in syscore callback.

I'm not sure why this matters here.

> With this patch, if another syscore callback is needed in s2idle,
> additional migration effort could be saved.

s2idle cannot execute syscore callbacks, because it doesn' take
non-boot CPUs offline and it won't do that.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
