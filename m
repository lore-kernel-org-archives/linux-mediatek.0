Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9712C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 05:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0A32070A
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 05:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lHU5fU4g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3b7ywlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0A32070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N0yq4kqFkMNz9iMsv59S01dFsCe1D0qgAol/C6YTsM=; b=lHU5fU4gMeO4le
	cM+cMVuZnhg8rzPbhHoFB1rGg09jLtLMaE2HnBLp2RAHJaN/54vVnTCJvA7i870tpmhmPdCpJjVgP
	mE3NqsIoxyQPmmNIZxbrCh2pr4bIvGam+uccDxFfRwla1xUiR54eRoCpnOx/1pr4IG7D4lYutSl+k
	dk1fdAaDKYkIrNrdEPqKAuugb4lYl/iR3KiaDlBw4/Ytx3zh/TG7DVFkTcFP27/qC/E5KihRQKSQc
	opVUm+eL7M5bNgnVPyqXOTJPuI/x6gSf8IeD3IXxozZbPiywFKTqM0Ctm42fDxUoLWqIwbLWFhRlr
	uNDdQPCDL0ZcN0Ry7FzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaYbu-0002uk-EY; Mon, 18 May 2020 05:46:46 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaYbj-0002lA-5b
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 05:46:37 +0000
Received: by mail-lf1-x143.google.com with SMTP id v5so6869492lfp.13
 for <linux-mediatek@lists.infradead.org>; Sun, 17 May 2020 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygsoJcQzy2g2jI/Taob7j4UIGHvK7ly0RJpFdbU+Cb4=;
 b=G3b7ywljZcZCAX7nJXBHWye89fgIXWV1Y/Zi9/UIsGwtIZiAQx6o0HUfhuMVoDPo1w
 hLvGWKlDX+XuIqbe3zySiJ9YKptYVBEz7TNH6oKzYopJNoJY37POYt3GcdMgO8U647BS
 sEBMh9Qv3TmZ7Mps0cLu+9qi/HJniKyoE5IT/B1tEfEs9oKHXXAwf2KIN+WWwJwUQyRZ
 KCZakvpO8oHau4eSIUGwLM09uWOlVosi5UtGk/WAqYqOlqII3hyHZRvOFDzXPNdNX+nd
 UoEdzxlsRe9mhcxNjNtn81gNC8rPkwKMYMiPW5cMIMMQ2wdPlVYVDDZ+R7OvN0P2uE7f
 hqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygsoJcQzy2g2jI/Taob7j4UIGHvK7ly0RJpFdbU+Cb4=;
 b=r01kIrq5AHCjLSJeE+m6eXfG0QoehKEhcvgANKeCyhDynZXOaANRdHQsEimj0BRAjZ
 jx6Vw4rR5WcQRM8W5+dqd9b1nx9yhnIStH0B9z0y6/EMtXRD3VfjkMebmxcMPSY6MS3Z
 YGYpV37j4FSZd1tpii43TTnIFOxZM0xhKbZZRTp7sMyOXcul8koc6OIQyPaQaTQ0zV89
 r8Qi2kRzPrul554zaBzMrA0G0bPYmyHXejyttpFTb99jOUT0BluTV16ecuz02tZGC5pq
 H8T98/5o32pMQ9ZpqeDVoG+KZCwDtLe6nJo2fygENijcxYrNY8W0QSIDymgrXLrI5Q3B
 Z2YQ==
X-Gm-Message-State: AOAM532N57YRvkupFl6pe80aoPxf8qym1/BevXLN1Fgf+wtlG6OLaGg0
 hOZvr3x29CW4iDGqxilpKtemlR5ClT0tupM84pEM+g==
X-Google-Smtp-Source: ABdhPJyPLjwCY26rBdZ5XvQW0icPtULGRTn1trgI95j9zoosQIx4alkuPwcX0KcurhfvhDLJGNfimNIRIR5n3hOAMXM=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr10444777lfh.204.1589780791774; 
 Sun, 17 May 2020 22:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200516124857.75004-1-lecopzer@gmail.com>
In-Reply-To: <20200516124857.75004-1-lecopzer@gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 18 May 2020 11:16:20 +0530
Message-ID: <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
To: Lecopzer Chen <lecopzer@gmail.com>, julien.thierry.kdev@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_224635_215229_B73CBCD7 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, lecopzer.chen@mediatek.com,
 Will Deacon <will@kernel.org>, alexander.shishkin@linux.intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, yj.chiang@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, acme@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 namhyung@kernel.org, jolsa@redhat.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Julien

Hi Lecopzer,

On Sat, 16 May 2020 at 18:20, Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> These series implement Perf NMI funxtionality and depends on
> Pseudo NMI [1] which has been upstreamed.
>
> In arm64 with GICv3, Pseudo NMI was implemented for NMI-like interruts.
> That can be extended to Perf NMI which is the prerequisite for hard-lockup
> detector which had already a standard interface inside Linux.
>
> Thus the first step we need to implement perf NMI interface and make sure
> it works fine.
>

This is something that is already implemented via Julien's patch-set
[1]. Its v4 has been floating since July, 2019 and I couldn't find any
major blocking comments but not sure why things haven't progressed
further.

Maybe Julien or Arm maintainers can provide updates on existing
patch-set [1] and how we should proceed further with this interesting
feature.

And regarding hard-lockup detection, I have been able to enable it
based on perf NMI events using Julien's perf patch-set [1]. Have a
look at the patch here [2].

[1] https://patchwork.kernel.org/cover/11047407/
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-May/732227.html

-Sumit

> Perf NMI has been test by dd if=/dev/urandom of=/dev/null like the link [2]
> did.
>
> [1] https://lkml.org/lkml/2019/1/31/535
> [2] https://www.linaro.org/blog/debugging-arm-kernels-using-nmifiq
>
>
> Lecopzer Chen (3):
>   arm_pmu: Add support for perf NMI interrupts registration
>   arm64: perf: Support NMI context for perf event ISR
>   arm64: Kconfig: Add support for the Perf NMI
>
>  arch/arm64/Kconfig             | 10 +++++++
>  arch/arm64/kernel/perf_event.c | 36 ++++++++++++++++++------
>  drivers/perf/arm_pmu.c         | 51 ++++++++++++++++++++++++++++++----
>  include/linux/perf/arm_pmu.h   |  6 ++++
>  4 files changed, 88 insertions(+), 15 deletions(-)
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
