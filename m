Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAF0C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:43:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC5020795
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o77fL8IZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQK7Mlcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC5020795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZF3kIUXBVVj2eS7Ah7cuP4nmMrX1XCSByINnvOYNJE8=; b=o77fL8IZEcn8SjDiDs4SZNqdg
	0cUAqstBVR1+BtbxqlfxwCjNpRuITNszCFnvUwl6rvSVCgtPriGryjEFhRjDDzpCkBKkof98Nc3s6
	+ZcH1hTnxDsu9EwbM/7un79bI/iQtMAJUhOdbw8cpHbzbpOucgxW8D+vrU8VVe+YX7TqM+B4Nmxaw
	cplG9zoAfSDG1xWT+m25eA6d5NvFii/sYMhgpJoN3YfuH81Ecb/Ekle1zsK8EqK70uYE/AvpgSnyb
	nWMPwsMoPLnsyYP+4lbkQHUfFe7T3z6ZBmt5LDETW6CZmdF8wnyyOhbGKxKMo9XK6jvlBA0kFsNpQ
	2W156dF3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDUH-0006xY-03; Thu, 10 Sep 2020 03:43:05 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDUE-0006wu-GB
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 03:43:03 +0000
Received: by mail-pj1-x1041.google.com with SMTP id jw11so2371141pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 20:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZmS2T2jFD4Mhxd1SucoAel5AcWUGDJSMEH/6aOpQ3E4=;
 b=xQK7MlcvpwgA7zVon4fYwgsjjBXLD1QDVQO0Y/wxK4TpVqAOuOsyHTfnz61IDHZ2n5
 TGXB9Ozsm5y9yYIWBSZihicx99cw8Tqy45Kzki86JArCPtrddKx8cx77jJLwOpYMGaGK
 M7L2/yKx7qk6TgLvU71F2gSNpHGQNerD4WBLdX/GKAstcJMfIlHlelhbu9G4XmmlB47K
 vvZ5OFuqcsxwTb0J/ulV+DTtR8GWtu+++Va24XqlOa+K3nMYat+XJPH7FLd09HLwP1TH
 083BY7CAp5HdCGyDtmJmOb0fZYTgNC3uZZhOlqvGsm/C6UlMfNwTL7XcG7+LYgwmCgj3
 O5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZmS2T2jFD4Mhxd1SucoAel5AcWUGDJSMEH/6aOpQ3E4=;
 b=SDGKm0AfrCAcL8KygxHGWlMlotXUK/0ci4ItFvIOh5460dWPEF1IIwPzms4tf854rP
 b5rRkjae5MNNRjUGYbbS4ZR3ATrnjIxX29O0e2IHwEF7yrrJvgGfyIQ6juAqR7RnCp1C
 A6v6OO0Dx9S17KEWKqaAQAxW+ty0484IVpkguB6Fn2ICsdBEcdKXEGR9t4BZwcs7ux0b
 zH1z3mZX4N8t5h2/c5nvfQ3JaaPI+osj/qNOwku8lvVdWnF/u5D+A5LaqIKuTuYyXhmp
 0LzJbtcaoRipVY01uRpteS/Ttr9CLh9yh1b896cORohP8EvqJihRyImhmcCpkxq8Na7y
 32ZQ==
X-Gm-Message-State: AOAM530wVGkTdEdObNw3krkFRbmvBZgUj/s8gc5y7/LAH+xh95jGnKng
 0EXjdeOD+Cq9386BH9rKP6v/6SjN0TLnFg==
X-Google-Smtp-Source: ABdhPJxRgu58IL1rniuVlRLSIpomG8nzd42RuHvTf3NVD6MC0hy7wZ/evpSgjCdMunvXwKBg/3c4Tg==
X-Received: by 2002:a17:902:10f:: with SMTP id
 15mr3733723plb.121.1599709379966; 
 Wed, 09 Sep 2020 20:42:59 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id z129sm3423532pgb.84.2020.09.09.20.42.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 20:42:58 -0700 (PDT)
Date: Thu, 10 Sep 2020 09:12:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v6 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200910034245.eqya625p7la33dkc@vireshk-i7>
References: <1599658476-16562-1-git-send-email-hector.yuan@mediatek.com>
 <1599658476-16562-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599658476-16562-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_234302_894327_76BD5E6E 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09-09-20, 21:34, Hector Yuan wrote:
> +static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
> +{
> +	struct cpufreq_mtk *c;
> +	struct cpufreq_policy *policy;
> +	unsigned int index;
> +
> +	policy = cpufreq_cpu_get_raw(cpu);
> +	if (!policy)
> +		return 0;

Why didn't you drop policy as we discussed in previous version ?

> +	c = mtk_freq_domain_map[cpu];
> +
> +	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
> +	index = min(index, LUT_MAX_ENTRIES - 1);
> +
> +	return policy->freq_table[index].frequency;

policy->freq_table and c->table are same, isn't it ?

> +}
> +
> +static struct platform_driver mtk_cpufreq_hw_driver = {
> +	.probe = mtk_cpufreq_hw_driver_probe,
> +	.remove = mtk_cpufreq_hw_driver_remove,
> +	.driver = {
> +		.name = "mtk-cpufreq-hw",
> +		.of_match_table = mtk_cpufreq_hw_match,
> +	},
> +};
> +

Remove this blank line.

> +module_platform_driver(mtk_cpufreq_hw_driver);
> +
> +MODULE_DESCRIPTION("mtk CPUFREQ HW Driver");

Maybe write this is "Mediatek cpufreq-hw driver" ?

> +MODULE_LICENSE("GPL v2");
> -- 
> 1.7.9.5

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
