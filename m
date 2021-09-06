Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B842C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD10B60F3A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD10B60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeucNZClL2qLIT3fbTKfYukgTbAHa0TAKdzpORYf0gg=; b=c8zb8zSpQ8jisp
	tBiZsChPcPrt1sYUhWi2twMK7jFkRA9vLB3zSqOv3H+BCFBVF6hhQAUq0KQMAdUbCn+tyTRp8+0d7
	HXeJbhhvc7XnfeNaOzn8Yy6aFBKqZ+q9RgvUE4u8tKw2vGIeIg1gVPDEdH4xzOCLtna04uttT5dRI
	6th7FzuUVcuiu++hpjD6QkjEO5K3A/6PhFSLgV2B6k2wZNzeBkPNNNu2KdyPBH9ORhpe5kvP63RK0
	WFFhiI0y9MKhCN1VkrnFDox8W9DWQ63/pScpkAA349wuWDIExtkiZGNvQeCBzMqbZ1EST31JF3AyG
	moT4yF4N3ji6KfBxXAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNBAy-000PM8-8W; Mon, 06 Sep 2021 09:44:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNBAk-000PIj-LB
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 09:44:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id x19so5229008pfu.4
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3fdCtbBYQ/PbhDaRGww8WvWvNG3K6421Ly2OyMudY+g=;
 b=nu6zVxvMTCUcU1kFqIrZtxEIa8LOtsEiLY8/fh67CoszQ/i5N3ehZ4nusDbBcELVoU
 G6d3N/kOC1p0CbFjXTppZQQVk/R7QxYekOi7ydCeLF5JBooZdtaIrC22+nVKZjTSS4EX
 c6fHHwZ8ziA2Cp5M/hzMGqyz1Zzc20DiP8WRn1+r0QNFiimWBQtQQ3Ibk7kx4I0h+ZFm
 Wrurc3mdZsBvUo4/svijHyrPuayLn6jJWoeFtZDXQZy/R8sjJTc7Pn22zILuhU/uZOiK
 WR0QB8xrAVzDJba5IRpF07K3Tkxp9Zui0Zf6EfX5d6d6qW0tWAwnHO7Ida93K+cuL/ab
 IxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3fdCtbBYQ/PbhDaRGww8WvWvNG3K6421Ly2OyMudY+g=;
 b=GC48uzuDt86tBXa3aZd8SiulidzmS45edxYIR/ZalTnFB5Agefa4MaEZUd8PiYlp9K
 sMM3p6rW9Vk/9TEjxiZT/KTlLjrxxLDjsWtXBvNgMVqS1kBsgNBU6FezscH03uX+n+pc
 GL34hjOnN1AMymUcDmxrbIHpoTMrJLhUMN0kp8dazHip9D3qhOae4VIXjfAKZmdJ05i/
 BjaGigeqRSwraltJgEi2rZAs+LNzGqi1IXtbn/5y3+/WsuYblKdIVoLSG5uM5xIzmKPa
 8SWcMtiGprIS7FoIU4jEOmPgGEU3pxCii4nf7rqNSKW3OeTHm7j/h2UNHVROfa8aaLEy
 h1TA==
X-Gm-Message-State: AOAM533HsZRFjWfOGSkaJ8WZvok2n5Dq5a2sJc2JQrYv5uBsJ6/FR5S0
 /39SXX2rrNRl8hkdsH0j7XIQ+jcUgbJ75g==
X-Google-Smtp-Source: ABdhPJwfXM4+jjhjXvhIy4LyWObIRTANV0ysLDQeZwmr3hjSYRCZBrmjzwR4mFPjdgmhAUPpJHAGLA==
X-Received: by 2002:a63:c045:: with SMTP id z5mr11460233pgi.374.1630921453591; 
 Mon, 06 Sep 2021 02:44:13 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id g11sm7527702pgn.41.2021.09.06.02.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:44:13 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:14:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v15 3/3] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210906094411.q55crm4cfcjpffau@vireshk-i7>
References: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
 <1630658364-6192-4-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630658364-6192-4-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_024414_747002_6421BFAD 
X-CRM114-Status: GOOD (  20.92  )
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

On 03-09-21, 16:39, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Introduce cpufreq HW driver which can support
> CPU frequency adjust in MT6779 platform.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  drivers/cpufreq/Kconfig.arm           |   12 ++
>  drivers/cpufreq/Makefile              |    1 +
>  drivers/cpufreq/mediatek-cpufreq-hw.c |  340 +++++++++++++++++++++++++++++++++
>  3 files changed, 353 insertions(+)
>  create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c

Here as well, I have added below diff to the original patch. Lemme
know if you don't like something.

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 9c6df1b00f3e..0cf18dd46b92 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -33,12 +33,6 @@ enum {
        REG_ARRAY_SIZE,
 };

-struct mtk_cpufreq_drv;
-
-struct mtk_cpufreq_drv {
-       const u16 *offsets;
-};
-
 struct mtk_cpufreq_data {
        struct cpufreq_frequency_table *table;
        void __iomem *reg_bases[REG_ARRAY_SIZE];
@@ -126,8 +120,8 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
                                     struct mtk_cpufreq_data *data)
 {
        struct device *dev = &pdev->dev;
-       void __iomem *base_table;
        u32 temp, i, freq, prev_freq = 0;
+       void __iomem *base_table;

        data->table = devm_kcalloc(dev, LUT_MAX_ENTRIES + 1,
                                   sizeof(*data->table), GFP_KERNEL);
@@ -198,15 +192,13 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
        struct platform_device *pdev = cpufreq_get_driver_data();
-       struct mtk_cpufreq_drv *drv = platform_get_drvdata(pdev);
        int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
        struct mtk_cpufreq_data *data;
-       struct device *cpu_dev;
        unsigned int latency;
        int ret;

        /* Get the bases of cpufreq for domains */
-       ret = mtk_cpu_resources_init(pdev, policy, drv->offsets);
+       ret = mtk_cpu_resources_init(pdev, policy, platform_get_drvdata(pdev));
        if (ret) {
                dev_info(&pdev->dev, "CPUFreq resource init failed\n");
                return ret;
@@ -218,9 +210,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
        if (!latency)
                latency = CPUFREQ_ETERNAL;

-       /* us convert to ns */
        policy->cpuinfo.transition_latency = latency;
-
        policy->fast_switch_possible = true;

        /* HW should be in enabled state to proceed now */
@@ -237,12 +227,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
                pr_info("SVS of CPU%d is not enabled\n", policy->cpu);
        }

-       cpu_dev = get_cpu_device(policy->cpu);
-       if (!cpu_dev) {
-               pr_info("failed to get cpu%d device\n", policy->cpu);
-               return -ENODEV;
-       }
-
        return 0;
 }

@@ -261,9 +245,6 @@ static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
        struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
        struct mtk_cpufreq_data *data = policy->driver_data;

-       if (!data->nr_opp)
-               return;
-
        em_dev_register_perf_domain(get_cpu_device(policy->cpu), data->nr_opp,
                                    &em_cb, policy->cpus, true);
 }
@@ -285,22 +266,14 @@ static struct cpufreq_driver cpufreq_mtk_hw_driver = {

 static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
-       struct mtk_cpufreq_drv *drv;
-       const u16 *offsets;
+       const void *data;
        int ret;

-       offsets = of_device_get_match_data(&pdev->dev);
-       if (!offsets)
+       data = of_device_get_match_data(&pdev->dev);
+       if (!data)
                return -EINVAL;

-       drv = kzalloc(sizeof(*drv), GFP_KERNEL);
-       if (!drv)
-               return -ENOMEM;
-
-       drv->offsets = offsets;
-
-       platform_set_drvdata(pdev, drv);
-
+       platform_set_drvdata(pdev, (void *) data);
        cpufreq_mtk_hw_driver.driver_data = pdev;

        ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
@@ -312,11 +285,6 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)

 static int mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
 {
-       struct mtk_cpufreq_drv *drv = platform_get_drvdata(pdev);
-
-       kfree(drv->offsets);
-       kfree(drv);
-
        return cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
 }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
