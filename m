Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B66C4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 06:08:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE902245B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 06:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncha9VbI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAW/Rjf4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE902245B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zQmWBaTb2B+v19QIDIbVMPGIbxI1LyEHxAoAH9iI9I=; b=ncha9VbIHYt0A+qAjzYVL0oKt
	DbcLbk3qSVzIMkAlHSXYECpBtswnKlbMLwUV9T01HqqZcjlI2S3eVKrb/IYAxtbjTzXThIeXQ2psX
	pKlju9igDk1n5BmvJpnrKdS9H88rEqi40be0Tbn9AAdVcwDLxbZ0hvxgd9IIn3FRTRvZiWOmRHFye
	3qMgMAi8h8ElipGVkAPqxpBuiJ1sJxUkWExWbRRGrCI22vakt5zn1pgl/rPAqKLUGvyKUfp75W5z3
	WH0N/QBMwqGkjKe8bP7nxW/ceRCaOFpawkTvdobz0xFXJR7Qv42jX5lHlx0/5fM6deE/+Dni/Hcho
	G3hlt53BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXede-00050N-3Q; Wed, 28 Oct 2020 06:08:50 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXedb-0004w4-Kw
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 06:08:48 +0000
Received: by mail-pf1-x441.google.com with SMTP id 10so2310874pfp.5
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 23:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HOLVJZragnogI83AL7H7xsw1FRW50J26vaXwlw6VSvU=;
 b=wAW/Rjf4En10sBEiY4jdkSvsj0xci8ukot36BnsZw/HtdrZJfLGQq3I/1tEqnlGtLy
 YCjdYHuEa9i/IDF7Wh1+XVhCwxwMr4sMHTL5yMsgzJV+0eDJ6pWYVLH20Yr5xX4AlLzM
 bClcW1MTKolJaQ15A2uPD9zA2SJo+dG7lB3+SMeX3F/l0Aephv7jEf7L+ghfWCyAgEWI
 Kt3GqycLa+0BxJIcTG8ZYvJEOZpjhuqWLzKLlLhkTbSrXOjX/XIy1Nhb8RiVDSYx2den
 CqKsxAZeGekYMWnCfZjR6DX6i7h0xzalwXjYfOkdKBrkTvlvWF3D/IjW4ENfA1t9JpcY
 Yctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HOLVJZragnogI83AL7H7xsw1FRW50J26vaXwlw6VSvU=;
 b=toanX14wLqpZfByZUnKKjtLMSEZFWU0KVg/seG2TyQL1yEKZnpxCVxUBQd9RpEC1B6
 hGImXpRYoemqDwg+EF15zcjz/IbrbFNac3P/vTtN3QmdOGb6sHTlCRwQrAEooYuxMaG5
 XWkl7GRGUEhyc030LnQaW+DWpTeRpltO7l7fdA4AcQMuRCYhe0sa2bFZCipULyqe2b01
 4rdwpp388338AzMs8I94gy1Pt/fb3hKoo/lxKYYJxExOU8FS4Sdy0YwzXBmRVv/b8Eqb
 fYJ9sWyjaLcN7wpnkRv89Lq4XqBWupopMuoRz+885QEeABBaRNGIZouuDzTnHQo2kNN1
 YUiQ==
X-Gm-Message-State: AOAM530G37MkX6ot7gnB8l3rYx5G2xvwhpQUtW4Bd++30o/1m1bJfeq7
 vUL97/HlH5amVacP+FQ91u+8JB5vYile8g==
X-Google-Smtp-Source: ABdhPJx2eljw7UcU0BCI0KQNkHipnmVzz2C1K9PAWVmK+t/4Y9zrp3nrvO1yv7RFXzMNRpax0Rcj1A==
X-Received: by 2002:a63:4086:: with SMTP id n128mr4829611pga.387.1603865325897; 
 Tue, 27 Oct 2020 23:08:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id ge6sm3868281pjb.29.2020.10.27.23.08.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:08:45 -0700 (PDT)
Date: Wed, 28 Oct 2020 11:38:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] cpufreq: mediatek: Add support for mt8167
Message-ID: <20201028060843.wlfjuyk5nnou7pfb@vireshk-i7>
References: <20201013092709.3336709-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013092709.3336709-1-fparent@baylibre.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_020847_707650_38843FD5 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13-10-20, 11:27, Fabien Parent wrote:
> Add compatible string for mediatek mt8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/mediatek-cpufreq.c   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 7d01df7bfa6c..b8d48ed37156 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -119,6 +119,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "mediatek,mt2712", },
>  	{ .compatible = "mediatek,mt7622", },
>  	{ .compatible = "mediatek,mt7623", },
> +	{ .compatible = "mediatek,mt8167", },
>  	{ .compatible = "mediatek,mt817x", },
>  	{ .compatible = "mediatek,mt8173", },
>  	{ .compatible = "mediatek,mt8176", },
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 7d1212c9b7c8..c09bff86bb9b 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -532,6 +532,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>  	{ .compatible = "mediatek,mt2712", },
>  	{ .compatible = "mediatek,mt7622", },
>  	{ .compatible = "mediatek,mt7623", },
> +	{ .compatible = "mediatek,mt8167", },
>  	{ .compatible = "mediatek,mt817x", },
>  	{ .compatible = "mediatek,mt8173", },
>  	{ .compatible = "mediatek,mt8176", },

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
