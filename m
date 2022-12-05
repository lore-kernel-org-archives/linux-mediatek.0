Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ACFC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 04:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GCEA+SSJQob9uLrpSyNUMykzy3VL+SnBP5yRlvK1eo=; b=MP21Ad1Ef2EHay0etT2EZaVm+3
	IIZgRJNonBFscV3EU3Jinryq+jFEhLyE4mdXVHj/q9JcILyKaAMedaLbLFDKgPNvp5aO5F4vy8V9B
	Ss1g6tRrjG4EYNmXuasB0wT00kQL7KsC5e1DkLhTMI51DD6wqCgARq9nVm7xQi2T+zezu/A4tpiaP
	MYrkRoWhD8Dnfkho7rDqeHRpIEp/IIkdVQuWaNQ0HQ1URQQUk8QADKJ3ioHGmJEehSd/fJX+N3veN
	skRzmWVi0WsoefqCd62w1s0E7Vv9KQ/hP+l7nDz5bVw8Vl5DCuRPF4vep1I8IOXeOX0F9ilVmYD8k
	4L3ZZlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2389-00DSU9-Fk; Mon, 05 Dec 2022 04:31:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p237y-00DSMu-1b
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 04:30:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id s196so9462434pgs.3
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 20:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GCEA+SSJQob9uLrpSyNUMykzy3VL+SnBP5yRlvK1eo=;
        b=WdEG7G34TfSohxVW9Q+va8i1yUPOGQf/M6WmLtC9heVeKK2gExscC77yAx6CqPfdHi
         cRvSxc1m65yCLFHrzSLTwLaRHOhfsRz/5V19R8mGii4xaLLmVumM1Et3q3FiV11JeVCd
         zmj2LR9JBNZU9ZZ8UAEPZ37+2z97MiQbL1aR+BUlFXSO8t1GAUMq8WEpEvmtDJpac83a
         YF63+Fe7kpGPw1Cg/OFqe0F3s0XAUNqBwvaoDCTIOkO2OLp0XSoiMzZjlRntBEVAKdmq
         lqVAqDOxqyP6Ci1Gvk2rRQ1l7a9UnMXmzm4Gn4+CPct8bNpEs+xNdc9pvwGizWj/l0Yu
         FONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GCEA+SSJQob9uLrpSyNUMykzy3VL+SnBP5yRlvK1eo=;
        b=NyTIwPZw2rnL0do6cudOm11U8l5irQTyGnN9cz5rlkxu3e/S8XNKvNsw9U/m8aNrda
         np880Y9uuWIEWnQCwOjdwrISzfMvmHFh9nzuMyAI3A1ZPcQSyxv/fOkDR57QQ0cswN2j
         Z/fuhP5lwQQ72F9aCxmeNp6jyTHxbL83UTAdz+kpplL92bJ8hWOpmQwxJuvWmrEgO7Fj
         LGl0SEj6Bu6Azyk/dLH1GSG/0zXp1U3suli4Ho/JDqiEHSSY3LCWe5iKFFXYkj8YVJ15
         rZIHPUh9VdMu0J7ELqQ34L5EZ+f/HOvtolfokufhjHQ7WZZhOzszHZ65gUr/GlJYrH0p
         6V2A==
X-Gm-Message-State: ANoB5pkGRK1St4yKad9lamjxF8Kl0hyjEH36WnokbX40SYHwYcBsKG+0
	hGP1lgRncGjn5EXfiweAtSDToQ==
X-Google-Smtp-Source: AA0mqf6rJI2yAAtTzCc5R8ix0sglB93D7T4rOHrW51DOxVwN6cVLQy/R1rzvudeCKEm6YcqArp3EnQ==
X-Received: by 2002:aa7:810e:0:b0:56b:f23a:7854 with SMTP id b14-20020aa7810e000000b0056bf23a7854mr68378113pfi.66.1670214647512;
        Sun, 04 Dec 2022 20:30:47 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id m1-20020a17090a5a4100b00219396d795esm8236199pji.15.2022.12.04.20.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 20:30:46 -0800 (PST)
Date: Mon, 5 Dec 2022 10:00:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	regressions@leemhuis.info, daniel@makrotopia.org,
	thomas.huehn@hs-nordhausen.de, "v5 . 19+" <stable@vger.kernel.org>,
	Nick <vincent@systemli.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Revert "cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()"
Message-ID: <20221205043044.bgecubnw7d3xlyi5@vireshk-i7>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <18947e09733a17935af9a123ccf9b6e92faeaf9b.1669958641.git.viresh.kumar@linaro.org>
 <CAJZ5v0ixHocQbu6-zs3dMDsiw8vdPyv=8Re7N4kUckeGkLhUzg@mail.gmail.com>
 <CAJZ5v0hc8CsvqLKxi5iRq7iR0bkt25dRnLBd23mx-zdi2Sjgsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hc8CsvqLKxi5iRq7iR0bkt25dRnLBd23mx-zdi2Sjgsw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_203050_147903_50365776 
X-CRM114-Status: GOOD (  11.52  )
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

On 02-12-22, 20:46, Rafael J. Wysocki wrote:
> On Fri, Dec 2, 2022 at 1:17 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Fri, Dec 2, 2022 at 6:26 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > This reverts commit 6a17b3876bc8303612d7ad59ecf7cbc0db418bcd.
> > >
> > > This commit caused regression on Banana Pi R64 (MT7622), revert until
> > > the problem is identified and fixed properly.
> > >
> > > Link: https://lore.kernel.org/all/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/
> > > Cc: v5.19+ <stable@vger.kernel.org> # v5.19+
> > > Reported-by: Nick <vincent@systemli.org>
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Do you want me to push this revert for -rc8?

No, I was planning to make it part of my pull request.

> After all, I've decided to queue it up for 6.2, thanks!

Can you please drop that ? AngeloGioacchino already reported that
Reverting the proposed commit will make MT8183 unstable.

So the right thing to do now is apply the fix, which is on the list
and getting tested.

-- 
viresh

