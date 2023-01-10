Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A700C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 04:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Coka7hAOYzARe/xcghtsc60l2UEKbV33rmZ4o8eYoM=; b=1zQDrZSXgSGKpZrKQANew8ZIkk
	G2uC0yblJQn/DaFnnbjaJmtKKb6JxGCVZmdMb7SCnlUEL0Y5fIREdsQb4FlV3+tmHMeohO9xnGyfp
	AYZi78c5MwtjbSGToYsvDxXtt2MdY1RgqOoBrFSYQEje8rstNkoROCO10MR5r7q7OhJXwP1p29G/R
	vam3TVmWauR65Rk8K6xYMQ7lDv9jq18LD0H1q+o1byKYFB0mISwRfNrzyWxpkQNV1S/0vYzTcDcd1
	bPkuYKUAnczYSacm/UGD/DOV/99f0d/FH3aK7yZ4MQhiVi3gZuS1lsVCzmM7vfKc8yMi+GxHGPbu9
	22muErbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF5qd-0059OT-8O; Tue, 10 Jan 2023 04:02:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF5qS-0059LU-Fr
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 04:02:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id bj3so7758844pjb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jan 2023 20:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Coka7hAOYzARe/xcghtsc60l2UEKbV33rmZ4o8eYoM=;
        b=JiLRLa2a7kAmcgWy8jhB2AmEifcjgFrHTsh6bx0X6F/l32+W8hFjU3Qr/RkmIc6Qco
         z/MaQLfEl8aX4I/db8Ocgw0fvLmpg9RhUKV23TPXaDjQdmCrJhQ3G9PBSZWW0qfVzwHc
         trc36HvaCZVNdbjlqvoSlUUeCX5ygigezg1twjVFLINICSeMNesUKjCAvKW6gR0RmDfp
         a4gfkgN9Yl2ffkvhtWWRBEYY1YKH4kjGGGEwy/4iiGmBHXffEMEPvQsBT5vkzFPkSAof
         WAwXx2wjETK9OsIqP5O0u7cfEL0AReSm7cBYzATPQ4zZLCvUBJgu+ie5NOuQvpKggVkz
         LpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Coka7hAOYzARe/xcghtsc60l2UEKbV33rmZ4o8eYoM=;
        b=snZj4powwiqWK2A8+ow7DF6GtpTE0MR+zXVO9xUf886S/jXrFt7/3oObFjguMMe2ie
         BEs6/J8ELacDBCMNtWJOVYobi3sfyrPb2goDaerFrRvhFCtwuvuNqu1H9Y7ynlEabzDb
         qMXxNSB5wMqW3Y5xJsHZQ2leaXsU+ewMacKMjCrSBAmBhRtELeb8RJ+9A6dcej7cVRuF
         y6r479bwrD/3S7lsulOUfh6gw0E2/zXF6zhjnQAg8hQuMeL/SOQAmG8+iIjmVIv53w6s
         EaxZpir/trbUZ0H3XPT44DpFNt8khXaQRdfUIHGmaoH1craxol06RL2gJ9ZhaDqiHL0O
         Vp5w==
X-Gm-Message-State: AFqh2kp1leP8nK1csy0eGjmHWAOrXSoGxysg/KjPDjhaqdgWA/i1aG7o
	/vsOSZIAWvVNJDbUMZ0u/6B7cQ==
X-Google-Smtp-Source: AMrXdXs1xjzrEaB+nt4ps7YBC4mvRJDyu5uxWxiV2DXp/xxfR5X++ZGtkijDXSTFJWPjIaCxJAjM8w==
X-Received: by 2002:a17:902:b493:b0:189:cb73:75f0 with SMTP id y19-20020a170902b49300b00189cb7375f0mr61280351plr.8.1673323356576;
        Mon, 09 Jan 2023 20:02:36 -0800 (PST)
Received: from localhost ([122.172.82.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902ce0700b001929827731esm6861059plg.201.2023.01.09.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 20:02:35 -0800 (PST)
Date: Tue, 10 Jan 2023 09:32:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: armada-37xx: stop using 0 as NULL pointer
Message-ID: <20230110040233.dm6ldb5qgl2ksiht@vireshk-i7>
References: <20230110031252.5014-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110031252.5014-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_200240_602425_55442EB4 
X-CRM114-Status: GOOD (  16.04  )
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

On 10-01-23, 11:12, Miles Chen wrote:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/cpufreq/armada-37xx-cpufreq.c:448:32: sparse: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
> index c10fc33b29b1..b74289a95a17 100644
> --- a/drivers/cpufreq/armada-37xx-cpufreq.c
> +++ b/drivers/cpufreq/armada-37xx-cpufreq.c
> @@ -445,7 +445,7 @@ static int __init armada37xx_cpufreq_driver_init(void)
>  		return -ENODEV;
>  	}
>  
> -	clk = clk_get(cpu_dev, 0);
> +	clk = clk_get(cpu_dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(cpu_dev, "Cannot get clock for CPU0\n");
>  		return PTR_ERR(clk);

Applied. Thanks.

-- 
viresh

