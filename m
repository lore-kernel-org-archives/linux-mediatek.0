Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557C7C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 07:40:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2070C204EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 07:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LsUDEDXn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hvtXVquv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2070C204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tcOewCjhLnvZiFvEneEe/q0FzwWEuBwvWsf9Im/9V/w=; b=LsUDEDXnO8kXHDuS3x7gp4Fsp
	Oq2rZHatMYxNMiIg6+NBg7im48GcshbXNjXJz6YR7XF/54A9NDsTLcmx82eeUlD4hmczncUwBkEB1
	dWV2O2vIdJtViP3ES1rxQo/VzHWKt4Hi/MiDGP26a3AHghgthEovhIcZP1LyryDtVogUK6GGwawdS
	GAvMb3GtZ9tpdbgw14WDS/3LhNvGhLbR2rtKJus2CPEsb9UpUYg8/ppkAtUb+ANMjKpa0rMY9ribY
	cOxqp7S0mfL0wFEnHfne9cSLvoY2+2NxZi5NAPuesZ/IzYwienzNFNxptj2vRVzp0EJxifub+aICi
	7aPADfdiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0u9-000463-JK; Tue, 01 Sep 2020 07:40:33 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0u6-000449-6y
 for linux-mediatek@lists.infradead.org; Tue, 01 Sep 2020 07:40:31 +0000
Received: by mail-pl1-x642.google.com with SMTP id t11so127675plr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2020 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=HrTNTnzYlJWc8QMdeuowXVVQbp83FxMJ6iVsuIcfESc=;
 b=hvtXVquvhA/GoE98IxLUgReUmcgb915AgNVs7gjR2O5Axk6d/QYQmBxHztGO8lZbEe
 FmkKnyik/Ndug+P8VC/lWO/UqtOQOxoSouNQYqnlTKYdUjsPIjPytir7VSKPdLNclAPw
 iBn+Cn/OeMpKvveuHBhkjIb8mDHikWC/QJxn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=HrTNTnzYlJWc8QMdeuowXVVQbp83FxMJ6iVsuIcfESc=;
 b=BJdqQyM/BA/RRyd85PHa/CMGB77iaZcfZNayNPWiVihtD9GGzl3HkVdYj55mRnxxAY
 CAD2BGVRDdqrjfs7vqC+eBGbBbUufWX/7G7gSxOzvvbXP+6P9uVti06imc7DcwujbInp
 TdLBQEWgPGiowYY6xdQFHc+ib6r+msDYAxAMbcgCyxgKA87eYnn1KuhJ/JgvDbK8YLqv
 0axhCydE1aNRw7oaNu/WHroR5cuyAv9fxrhNMOMJsltJq+5x+Y3J37LEnGqA1Whxmsyb
 /8zSz8G3mcylwbg45vwKUklcYVaqAlIet2pOUJUaOFuqH/bE3yOVOKy7fZ30ARY49ubT
 v8DQ==
X-Gm-Message-State: AOAM530KxZ7D5vZwZkEp74R8RlrYR7EhdG4BpnMaW+XzfPFYOyrKTQ4d
 C03vuK4UzSTOFbIFRhiiSp6LBg==
X-Google-Smtp-Source: ABdhPJxmPfvpiUU6KIyvMENDZIWJ6CJ/UdnEm4JMty1jxPA0YKKhxAi+eARlirg1MUe7lpb6XB0VEg==
X-Received: by 2002:a17:902:7689:: with SMTP id
 m9mr284172pll.240.1598946025201; 
 Tue, 01 Sep 2020 00:40:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id f21sm530383pjj.48.2020.09.01.00.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:40:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1598943859-21857-2-git-send-email-claude.yen@mediatek.com>
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
 <1598943859-21857-2-git-send-email-claude.yen@mediatek.com>
Subject: Re: [PATCH 1/1] PM: s2idle: Introduce syscore callbacks in s2idle flow
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Claude Yen <claude.yen@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rafael J. Wysocki <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 01 Sep 2020 00:40:23 -0700
Message-ID: <159894602346.334488.4470501636825871587@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_034030_283571_3D63BBD6 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 "claude.yen" <claude.yen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Claude Yen (2020-09-01 00:04:19)
> From: "claude.yen" <claude.yen@mediatek.com>
> 
> Adding syscore callbacks to s2idle makes the behavior of s2idle become
> more similar to Suspend-to-Ram (S2R) and reduces potential porting
> effort.
> 
> tick_freeze() in s2idle flow calls sched_clock_suspend() and
> timekeeping_suspend(), which both functions are also registered as
> syscore callback. sched_clock_suspend() introduced in
> commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
> wrap caused by tick_freeze()") is added due to clock wrap issue.
> By adding syscore callbacks in s2idle, if there is any syscore callbacks
> also required in s2idle, additional porting effort could be saved.
> 
> Besides, in both S2R and s2idle, before the system entering low power
> state, there is a state when only one cpu alive with interrupt-disabled,
> which is syscore callback designed for. Adding syscore callbacks in
> s2idle is feasible option.
> 
> Scenarios to call syscore callback:
> S2R: one cpu alive when nonboot cpus are hotplug-ed off
> s2idle: one cpu alive when other cpus have enter idle state
> 

Do you have syscore ops that can't be converted to something else like
CPU_PM notifier? At this point most syscore code that is important has
been converted so I don't see much benefit for this patch. If anything,
it will prevent conversions to code that works for both cases.

> 
> Signed-off-by: claude.yen <claude.yen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
