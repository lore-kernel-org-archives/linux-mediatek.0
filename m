Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8818CCD98F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=; b=rkN5ZVSL2Z5plkmWug5RReTiPm
	0bT3Sk7lNwq7ft3lFVi7ka33Ua0yENSilagPcAOcG82fufbhenIEEChWYv/r7rUPeQK9kLISYogDg
	9RPbfz/7lko44TJwJ55berh9c6/Q0yLk2wnTTe9XRflutSBhcLUYO+UFaVYdaoxBT488NSpQ8zPMc
	W1jptHl/nL1iNT3ieJtGK2dWYMVBRSA0igogMZuKK4MTasc3lBw4SiyfpIOT+fCJs5+XlQvxyB6eW
	j9zN7OKJfgveTJjR9M6yfMWqkRD3Tsl1ugQQQQq56Tbd05Xa6UqNjHmNTonNXkhpSYTFWJxEd+DJM
	p736ZdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIP-00000002D0Y-1JuB;
	Fri, 19 Jun 2026 09:13:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIN-00000002Czn-1hqu
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 09:13:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1128727f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860429; x=1782465229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=WaWU+o/X2U0dvbQk5zTWKIcK8DLo5Ct9K9uA6ia7cd0O2z6UGs3DBT4qtIqfvHF6ci
         JCihyDv0020iohq0wzBxA7/lbiCXiSeK+86N4MfGG8PsqrBTuzPtbLXZs1bz3EFlwqmI
         ReV6qboGv9dbmvbrDTcyiNeT9mqeY3jUyKzXoR8MmCGlK+U6WMuBsv/7L1sWLSlcB0AC
         Bt1R6OBSVYxZyzaLz8Cz0qmr6+JllByDLyE/XcwRz6tbX2eSc2DUVNlbQXXBWV4tSDTX
         iFjjTq2gq0R2h9vXOCPz2tFOPwZ/qprccCNkoXu4sz291uQ4W9AMBssJyy4PKqz1jE70
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860429; x=1782465229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=lyZHxbNeJVxfvJbfLErPy354FsHQGSGIjnVrnEkvroFtVp1OwzobQTELpI+fpB512a
         sIxnvc6DTfeUvissfnZghb80VjGrdGtgbLF3JbpmzRZI06SXzVBQnpv1mAoQJr3gkpLx
         SefRgWTGlV5c+X7cx979O31BiYCak/sTR3sQKmzl5ewaNEDTTzTuAGag2mZQqc0RPiuK
         aGIksWsAOMNrMfOP26eefy6p9uZOU+LDE1LXniFREey1Qbk+0mwlVqrzw8yE0azpd765
         TiY8nTqrBNJ2Ff2IDEuGMQGS05M0TD2uzPRIPBxmpl+Y9Sbdq/ZJMJ6FTs/i7KWMZXu6
         WeZg==
X-Forwarded-Encrypted: i=1; AFNElJ+rU4s78NbtpKPVucYsy7ivL/Mt1JzZNBvxnaVhUbZZf0YKCAmdoWR9sOnrDYZC/t04GzatCAKeXKUBkfuXUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPFx9hG9nXFvfOqgHucxpOhCfQKW3jqGS9VgWTFVYRKFDhpX1C
	y/HN9AakL4vTaKOCZteU9hXHB+9bP9rkYT/sNvJCsAbTQAQSAUzM1PQL
X-Gm-Gg: AfdE7cmV/6HIXsvev+46AWLYdiIH4LBLqBIXFZvmBWcJvfIFXLzYFYFS8rX0Fsj53nw
	ycY+voXNqtDGIP+kETmB2k7O4xhUxuFN6zaj4ztRydFED0y2il/ewN6Y9KTMySjPobjVOxU+YXu
	xNcTVX6gsz6rmKefNaFuYcvFNI7GYO6JMFStDD3gadyO+VcnAVeVkuSOjnwSEo/wYSSLpzjaour
	4il0/Bd9X+eqFwRoe2OvxyH4XR7SRDmtYDo/96airbYk9UMxPvqPV2fSpX0ANRfwa/HwO7vV+LD
	GyQGFBp1MKzv1Ji6IwWbqiQc65gbmOonDO/wAwsC/pUU2wbYjFOUMfH8sGe/2Dr9UFyLIS+2KaZ
	qSWGows3jNgGrV8YpK92PKwQSRwwifIjurCtjriSLV2Onzm7k5Kh0DiX/gjwCdTEzZXZv6FlVLe
	+qsB/NDB7q1cXIQ8rt0uQXDTUNcSYxtz/Hxbx6877ogRPQD1UIoQ==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr5178308f8f.34.1781860429313;
        Fri, 19 Jun 2026 02:13:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm6387329f8f.27.2026.06.19.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:48 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:13:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>,
 Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260619101346.2ec49087@pumpkin>
In-Reply-To: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_021351_470572_DCE722D6 
X-CRM114-Status: GOOD (  24.98  )
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

On Fri, 19 Jun 2026 15:20:37 +0700
Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Charles, David,
> 
> Thanks for the review.
> 
> > >
> > > I believe you have to use scoped_guard here, as there is a return
> > > from the function above, if memory serves it attempts to release
> > > the mutex on that path despite it being above the guard.  
> >
> > Indeed.
> > I believe clang will complain.
> > That makes these mechanical conversions of existing code dangerous churn.
> >
> > While using guard() (etc) can make it easier to ensure the lock is released
> > when functions have multiple error exits, I'm not convinced it makes the
> > code any easier to read (other people may disagree).
> >  
> 
> I built the code with both GCC and Clang and didn't see any warnings.
> 
> My understanding was that the early return exits the function before
> the guard is instantiated, so it should not affect the guard's cleanup
> handling.
> 
> Could you explain what issue you are referring to? I may be missing
> something.

When a variable is defined (and initialised) part way down a block the
compiler moves the definition to the top of the block but doesn't initialise
it at all, the first assignment happens where the code contains the
definition.

However the destructor is always called at the end of the block.
So if you return from a function before the definition the destructor
is called with an uninitialised argument.

This has always been a problem with C++.
It usually happens when you define a variable inside a switch statement.

	David

> 
> Best regards,
> Phuc


