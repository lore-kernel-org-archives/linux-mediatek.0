Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB70C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39i8zOY9yw3eKEvv6Yah+PoN4cZ/Xng63jWU3O+DJZY=; b=kRBXa8d5bQbBzT
	5tl3eWbENJdMvNifQJ0j6IwuDUqp3bL2MAN0jZSA61TOIh2B12NliEsuYSUbwU8n0ysIc0IfSZ37T
	qF1I8tgbsHt1l/+AeioNxuS6aar9F2s6pQHAos8KrbbLIcsvP62eCZ0XUtjLOZhxl8k3Wu9If0uy2
	e5O85m9IRmVUwDZn+JCOHcHzzDVahl3OySaIIlXXMK/t0migRDSBhzPO3eWlzduCCdJpyFsaSmphO
	EoQel62sQif/c9ByN2eMM08URAdFutk9c5RCsPK3loS9bZwGqUODlwTcXsnU/qZ5hTBi0ZpWYpTRx
	GzqhMxBxSIbAzkjnM0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXyg-00F53g-Lx; Thu, 05 May 2022 09:40:54 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXyU-00F4xu-U0
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 09:40:44 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7d621d1caso42070307b3.11
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mIXApjkzHf008Qogv/wyqEj1PJzEdOobETAHN9U7xwk=;
 b=a8NoptyXEyno9fbhzXc6CEcSoGjIx2hTiwvjhOsKDAkAUSdgm6+7ct0gg6MC9SC3Rz
 mHjYPPb75DiewFPudKKtAzLIBzPGrZ1YDFSV8YC68BDCmFdakdGk/GIQNTrkHVDpQiQL
 IinJhz6XLeQA6fTCuQwwLdglzx7yOeNNepQIDSUi7YZ8eQnXr6ThAYXXyuvaczW70PRX
 0pa28Bqw0MKwDTvbV72yRbaBAXMZSN3pFcEZMAH+r3VIf1fHsUW9wGSZT5/0Uu2IlpGB
 z2Sp7gAhAxVhTQFFLuaOMYzPXZL+CSgVhgbYbkXc57bofm3l0EsUvdidt2dWigspO0Vx
 1dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mIXApjkzHf008Qogv/wyqEj1PJzEdOobETAHN9U7xwk=;
 b=jVIMkmkoAdwFngbbFW6SwWwNWm0UvDDTBmH4UM1KPsmYyJhxxj8neYNK+ouDZK+Fm5
 jRoEkrajnZ4rajKTyTd5sk0+WBivtFFc4pwogfCZsQFBGEAA5/qAFxYd9cAgEwurf6N4
 wxM+Jkci5p7fzCRwMr44UfqMCS7Ev+nEhHrEMhpZ0uHYvx3arcTVlWfwf+ae7rGYdREW
 AUj9qm/Q1t7Owf2On5T+aqfwmtehBTLtVZtRpsKOF3Ii+QCSSkrU8nHP1OMIYqrZI6C5
 idyIG5T4b43iHo+72iRJpc4YkKT9PlOk3hQ3pF+60lCWWev0O7Rf2nikjwMrZFU4b6gm
 rqug==
X-Gm-Message-State: AOAM530/rSN5Rg6U1zIRuOlePAekNkKuaBdJn6r9ujxBPWdIFQLfH6aI
 mPKbPrwyjIuNIGpXzLhATOFhfkE/ioSeJ8SYQxwNUg==
X-Google-Smtp-Source: ABdhPJx+QYX6dWCjUFTsqC3gplkBfaJD1W/ZwsxtBNAq6AT/1JZV9LVyHsZwqSZwJtWASOytKBs0XB2BD/Sr1Oim6i8=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr23716879ywe.359.1651743639508; Thu, 05
 May 2022 02:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
 <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
 <CAKfTPtCuJGsrsBJ2jACr_YeKN3RXNVMkgRgo+cw9t7CAyGwHWQ@mail.gmail.com>
 <20220505082801.oks7ko2sbqazyenn@vireshk-i7>
In-Reply-To: <20220505082801.oks7ko2sbqazyenn@vireshk-i7>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 5 May 2022 11:40:28 +0200
Message-ID: <CAKfTPtCfKBiQkghY6gw+sSYYOXFRWMZNXsr64Vn5G-Oo1HF8ew@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_024043_008270_2961FD9B 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, 5 May 2022 at 10:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-05-22, 10:21, Vincent Guittot wrote:
> > Part of your problem is that cpufreq use khz whereas clock uses hz
>
> Not in this case at least as the value mentioned in OPP table DT is in
> Hz.

But dev_pm_opp_init_cpufreq_table make it kHz anyway

>
> > Would it be better to do something like below in cpufreq_generic_get
> >
> > (clk_get_rate(policy->clk) + 500) / 1000
> >
> > so you round to closest instead of always floor rounding
>
> That would be a fine thing to do anyway, though I am not sure if it
> will fix the problem at hand.
>
> If the hardware returns 499,999,499 Hz, we will still have the
> problem.

But in this case, cpufreq table should use 499,999Khz IMO. We already
have OPP/cpufreq table being updated at boot with actual value.

>
> --
> viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
