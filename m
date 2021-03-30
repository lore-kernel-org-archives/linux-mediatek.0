Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B98FC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 04:37:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0364B61994
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 04:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0364B61994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EhTx/44ixbQcOGneD0ZJ8Ug9rp19cbOvdmIW6XljAEY=; b=p3NTX/6M30dLZCdbB93uxI5jg
	DCqcStY+f5kCKckkZ/ycFyYgp4/jBJJyTOmvYZkVy+gxy35Ylj4GBNL9jcN+AGjmycvINH/4lffwd
	XDsAsZn/TDkWVGoz72BQLXe7ejPY7iCS53O9cLz/xgZEGu5lVftZ1oKJHiTYuNHwShqBwvY/qqfhn
	sTLuJjUWoZRJ7QuIpxk5UXrkZS54BirfAnnt/rF+6LKFkGX1QpE5V95+uM2Gbs0BhKSGd8va0kBlP
	xwHsr7BZlRoLiY20xUOR8994G2XOC/dmaImzkFYG5WzkAn9aOmtgd907P0S/QdgtQ71ASVcM8gdDr
	vVBtI6JyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR67R-002hVp-Vh; Tue, 30 Mar 2021 04:36:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR67G-002hUJ-DV
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 04:36:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d8so5498745plh.11
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Mar 2021 21:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BvRbBZnASVdYfsaOe0CfduFdiRkLJ8niuBgOzm/MRro=;
 b=iECcxBCZLcHI2v1Czg8SPMUOeAdilEubHiugaH6gep3GwMFvqHzkAFlHfzV/6n5d5i
 LHAvlhvfTwVVKMtNq4F+NEC8QOj5ohxl0NWe0lCOWyOHIlCnZ5ekGlgBIiW9qHjqXwch
 P5A3H3ZJB18TMtjD1GjTi5lo3mKTEicYIFlZ+isPWC2MNNQqcv6gg37RgOoai3Ek1+GN
 TmGm60kgXb73h356o9Upw6ZgoPT0PcbFqGrPi5iYL6yvQ7XfLCH28QqGjvlSBm81dC3W
 9jjeu2dwfSOLqyf/ibNeSuPB0E66R4HvenL5m+Hzko5D3mmh4Ihgp8CD4HwptB5s78/D
 CLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BvRbBZnASVdYfsaOe0CfduFdiRkLJ8niuBgOzm/MRro=;
 b=j0JckkZ/P6O1lghHp8XkCtOt5MR2o4/y8C1hqcN5ggwiUuI9FsuLWNQBsOrYCidUNc
 O36AVzUnj7fd/i3vLX355c85Uq/gifCnztLXuJlBAytKfoLtB62VO4Bty3sb7NrQFdDl
 ICPzbRmTFwobBOwyXb5pPr++rb3jz3rZyB6Rfql4B2Cj/BiiKx6JHC0WKoihB98MN8AM
 t8VfQpVm3Cz0L/pLSvJ023kRbAWb5qSu6K8lhNPJbjAZEd+Y21Uzjbw7LQG1F/CkB1vZ
 I/p3OzdBnx9UxrW71BbmJeBBuj+oIsQtd8SBbyxI+OazqZE+48ee6mZmg8dCA74QLreI
 OQaQ==
X-Gm-Message-State: AOAM530QVmZgdR8xRf7p0v4psNxBOKnVSmBrfpIuXtFG82Nvq08lXoFg
 bqt5QTlx/FlBtWElFBRlZsUOmKS/HjPkjg==
X-Google-Smtp-Source: ABdhPJwshx2ncunskGbMt8kWnyEKe9h4R6stukSh3ZR36FNExYlVwD6kQZCJJns2C8g4gluFQJdAcw==
X-Received: by 2002:a17:90a:c588:: with SMTP id
 l8mr2432201pjt.120.1617078991995; 
 Mon, 29 Mar 2021 21:36:31 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id e6sm2638506pgh.17.2021.03.29.21.36.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 21:36:31 -0700 (PDT)
Date: Tue, 30 Mar 2021 10:06:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH V8 2/8] cpufreq: mediatek: Enable clock and regulator
Message-ID: <20210330043629.x62j2apv2nv4mw67@vireshk-i7>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1616499241-4906-3-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616499241-4906-3-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_053634_894511_0804807C 
X-CRM114-Status: GOOD (  19.64  )
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

On 23-03-21, 19:33, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Need to enable regulator,
> so that the max/min requested value will be recorded
> even it is not applied right away.
> 
> Intermediate clock is not always enabled by ccf in different projects,
> so cpufreq should enable it by itself.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f2e491b25b07..432368707ea6 100644
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

Regulators are enabled by OPP core as well now, you sure this is
required ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
