Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB983C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 09:39:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D482075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 09:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jz1ydTOI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh9Pm9P9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D482075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpdwdN5u2+HrCnD++mW65fEYNznmrniNZm1s0S4jqYk=; b=Jz1ydTOIK4N2wjkedq34nYWhp
	f4N8pHUVD2mi43DVXshoKXe0AN+j/nTK+LHeg9EOCd6GP2BE/MQXum4pjXjQM1Rda//Nu00fXwo4L
	+fxWkOQhIu63wiSNoFiT20R1ptplmu6bZlXogPjmaMCiKxfq05uIJVP3w32YpGLsec3k+alHSflFS
	gJnQJ2EJTJ5Z1efQMYpuidqDM9hF22+Q9QVAOUz0BuHFcJlFkfOroHbldU2XkRN/lGwsx5+nm+mkU
	pbMbvz6IH6OhnZCkGYQhsCtGUDYmw6VYZPZLfCQFm32DiLhWrXrulvIwkBPMt4rQu8f/ltFRmJZ9Z
	mgzLYHXaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuvf-00010n-Ot; Mon, 13 Jul 2020 09:39:19 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juuvc-0000zF-Uu
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 09:39:17 +0000
Received: by mail-pf1-x443.google.com with SMTP id 1so5755722pfn.9
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=skXD+wsQgKq4LXd9xCnrPvK7KZqTAPrAbDnvMV4BILs=;
 b=yh9Pm9P9Gp+QKQfxeQtuY1E1Hp14L5t3EfCVWNCaO52OM6gUUeJFFQTyK8rEyutk0H
 BMoHaR7zBcRyTShlru8V/TjqVRzrZV4+B5MeBPC/AGQ5A+jfZAy8UEt43EkfDOpZu4V9
 01nPZo5Akte8gAWlUJLgaa0gem1j28CIN8cD49/resMQr46y6OMYdUiK3whKdoa5Uvy5
 +y3ZSH/GpTj9Dn49PXWKm4+8ovC5Z15loSyOKMRDKhb71xCepwG0+P+RLVfWt5RjYGZr
 eyLaucHvluqtxjaz0JZV9dp8AXvH8VzJNZTRd03H+RiGwVDyP5C9sdB0gGbOaJ4/YDFw
 iing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=skXD+wsQgKq4LXd9xCnrPvK7KZqTAPrAbDnvMV4BILs=;
 b=GDx3uiWn0xrC9ubUn8Dcs141IC87eNzygY0PHWAPuRWpU/e4A1YLzXLC2W2E53nIyk
 W3dJUxVCaaxsAQNBREaWXE6DGqkqIc9CQ+pvoR8fZHg/eWfrWeXUe8dFgtIn8MMiWLkO
 1OjidQY286W2gTQZ0drbP+C6WXyt1mFxr94WkyElc7AEolALA95ONdg0AbbK+IFlefY+
 /gsVaDDuZ4Chs85zqz/MQq2Nhg6P/m8lpLON2YH5aEhR84y7sqbkBkPOL9K2Zb1N1DME
 5FcVoQQLZiowtiQmJmP1z9awxJlR6hlb7d9YaBjT3IdinvGIlYuJ22dyLJ1ptdb562ks
 C6bw==
X-Gm-Message-State: AOAM532SEBa64XLcW/8feWBvzMpvZf2J9z1ZuokMZJWdyefTzqqLboHa
 y8kOAC5qp78uBAwRZRuMegT1+g==
X-Google-Smtp-Source: ABdhPJyl0zjLReOR/+Xr6FqTuxKWo4RJ4CVE+9dKiMkEDH87gGW8e4TOm3obgjWYwEX/7dZWcfxkkA==
X-Received: by 2002:a63:3d01:: with SMTP id k1mr65845600pga.71.1594633152842; 
 Mon, 13 Jul 2020 02:39:12 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id i13sm14062787pjd.33.2020.07.13.02.39.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 02:39:11 -0700 (PDT)
Date: Mon, 13 Jul 2020 15:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v7 2/8] cpufreq: mediatek: Enable clock and regulator
Message-ID: <20200713093909.676v7wxjzsz4vbxv@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_053917_041254_6D820F5B 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Need to enable regulator,
> so that the max/min requested value will be recorded
> even it is not applied right away.
> 
> Intermediate clock is not always enabled by ccf in different projects,
> so cpufreq should enable it by itself.
> 
> Change-Id: I9f4c8b1ea793794f5f9cdc65427daad1393f5df8

You are on V7 right now, these should have been gone long back.

> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 0c98dd08273d..4b479c110cc9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -350,6 +350,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  		ret = PTR_ERR(proc_reg);
>  		goto out_free_resources;
>  	}
> +	ret = regulator_enable(proc_reg);
> +	if (ret) {
> +		pr_warn("enable vproc for cpu%d fail\n", cpu);
> +		goto out_free_resources;
> +	}

This is already done by the OPP core now.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
