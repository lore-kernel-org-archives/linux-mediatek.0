Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD30C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 16:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0080207A5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 16:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0080207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1MN26qbmqcX96q6ZzaEoLIveNe+sboed2gYyED9mtA=; b=2JlVFESu6w1vI1+WcCp3MTDRL
	9ikMwXqUJy4xBWqL3+qfW28XHw2JMjqw202mdZiVX6Tf8PS/Lk4EeZLOjP9P31hMeZyfjL0lWDBtw
	aEIXtUdReEgJ8YZL38FqYgMA4J01/0icN+3Iwd8GQJOlXxcV7Sbs1GzYLr5OD8+n7FBoqAiRD3C+S
	BNV1ctrMRjCzgcMfseqoxZasLJdLpURBm5XK3fYkpTc9GsADIaBKnJZgSuEyVkqQ5HCE37JhTk6B1
	AVPX3j96iTx/9z622Cj7S4BqBlT929B0ZBCRo6UPs16mcQ1MW5VR+ZDAwcre6I+F/WKan+DzbyBC5
	Zzrm8R7Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkr4L-0003kv-CU; Thu, 03 Dec 2020 16:02:57 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkr4J-0003kD-9N
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 16:02:56 +0000
Received: by mail-io1-xd41.google.com with SMTP id n14so2545486iom.10
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U76MgfU/JgD+cwf4B5UzlaXPMYuwYvR1oC7emvGw4G8=;
 b=oiOjxTBbUfVKub7HvYBtz+H2+w6LVL57IVsxKMbQ8y3pY9WdOLNY0nlC/HZQXS8MSp
 X5PB4xWeCRmsU4l7XpLlARJuvr7yJRoDUg6ALpKP0VPddpFsvqsMwr4GOs9F4G359vBH
 B1KlD0zpJCI2tJl4nZ/q9WWRKtydLXnQQV5E7Afz5WvyoSIYSeTa1USd2ZxQgco2M1BW
 1RilXAHNwiOSza7z6K38ZScjfBzbOJIsPMJF/wesM8PghfOB4w1YK/o06gEAMP0IRp9l
 9B6hJfITG/ym87NwXH4SH+xSchQE9cM0y10W8iUxb/QtaURdkyV7NQkfhker7MWHvewB
 3WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U76MgfU/JgD+cwf4B5UzlaXPMYuwYvR1oC7emvGw4G8=;
 b=oNmYhU2kSCKG+sIeYnCQZbIOev3iadtAU97kzAnT0Em86MKObLu6hXv1Ba9qCqWrne
 V0xLEsLXaMa+Q1xu3Jw2NBUJNhL+qI96N932HE252F+L9Ma4Rn95Dt7YsztfQ6NwN2Cy
 L/ftgK+6jmpgL16JQVcQ2j5EaALIZO4krX7FEU9+hO+yxaHRrS06dyihdvMrOB4AYBwJ
 UkaKwSqWsjqElpi8KwDJ7nlK3cuR0zC7bcLgz7XwzkEKSdu4rDs3L3Tl5mhY99E4erf7
 wnc5RNruxQfK2qvqO4PPGcfX4BpD5Sxr+nVzSQ9VlP07GtEBtI14J2FROC/406/eW/hx
 QsWw==
X-Gm-Message-State: AOAM530u9cNcvG74vLEs7rlhEjP/StHQ4zUp/6nQ6630euIcUf/HAC15
 lNGQEnuR0K1XdYAGhzonHEt/Rl9oXkuhmKvomciMAA==
X-Google-Smtp-Source: ABdhPJxpiyo6lopYPhHWKXqqaUYjP85h1wZcdL5pGiR3z16pqaZljMXQRJDa9XEyQn3tfojsyydoTsREaslMDr2OBbs=
X-Received: by 2002:a6b:d006:: with SMTP id x6mr3631085ioa.53.1607011371369;
 Thu, 03 Dec 2020 08:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203030436.3583198-1-tzungbi@google.com>
 <20201203153338.GA1386676@xps15>
In-Reply-To: <20201203153338.GA1386676@xps15>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 4 Dec 2020 00:02:40 +0800
Message-ID: <CA+Px+wXmunYDT4LkPu8Kckc78brAZmxwmEWzoraf3yFp2M3nsA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_110255_405806_85911B55 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 11:33 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Dec 03, 2020 at 11:04:36AM +0800, Tzung-Bi Shih wrote:
> > Fixes the error handling to unprepare clk if scp_before_load fails.
> >
> > Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")
>
> https://elixir.bootlin.com/linux/v5.10-rc6/source/Documentation/process/submitting-patches.rst#L122

Fixed in v3[1], not sure what happened when copying the hash.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203155914.3844426-1-tzungbi@google.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
