Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01119C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dklSpu1XUyf9/JcMQbcSlXLOoFioG1abNu2NICGf1RM=; b=q1nZ7wSNMRT2qLRxY0DjTw81wy
	fBztKzQPjxNly5b/HRvSY9S5fEfW6cA6FHWVbrtCep1y0sAo81EP9UrPtrVgHvWsbztITKDqV/PIc
	exT4zuqqcNP59fUHECtpGXQouWRVpNNxzcW7nSH8QpIQAAHChN/8OjrjgtXEUrf7plVl11EzcuNMu
	Ho2l3SEH4tt3WL6/z+5eRwTIgJjYUBSj86U0Ub9NoDNbXXXWbdgv+R1MoMn5OCkeNPv2WEVny2zlf
	0sFstyS27Y1En2UakBXVGGDWXyw+iELjSJadigP5hDYFfBhHMaW9upD6KxS8hOXY6I0G070MAyeir
	9PJPikAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYXe-008kIQ-3j; Mon, 27 Feb 2023 08:07:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYXb-008kHi-6b
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:07:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t15so5196030wrz.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dklSpu1XUyf9/JcMQbcSlXLOoFioG1abNu2NICGf1RM=;
        b=KMSXYtDRmePHruMcdHviIPRi4rH84DHoqFmVxQXyblqjOeeh+dH8a+p4Ud4FoKPeqL
         g6IUIPJtCO/lH53fBJqFcGVsHqB9OopoXUQndaBC3jF2pPm/GTIX/PzTrWqnpweVzWJ/
         bSSLYDTJSRMrkOZ3gFEHsF3PFfMRHwzwbMq4OrCqp86B8wPzhl4AyAUNzWIDi5Fv3gNU
         jApSReDzytekILfZsWMC9gu9H/zJ+/ZdognpoO2JZ8/B8o58GIRWq5H08RCfD/zITEhu
         EXvJbBbosSBDHsXWn47LLGFmPrggyK0Cbzu8tbuOaxCQxQZJBOmCxo2qYpGclOIlgJf7
         hzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dklSpu1XUyf9/JcMQbcSlXLOoFioG1abNu2NICGf1RM=;
        b=MyaSXuEP5FFmUVPZZPDXBjVspEFRgcsR9w4n+tRN08Q0WlIi2orvmag02ocd1/KdBl
         YV7M7y3gPeb9QUTkukr1wu9+55a6dztwp/XTymo9ZsCFnYS1WAABq8wFlrwprbtBfP7D
         PboqnEFdJqAo2OqIt03/TirLZHCbPNwH1/kM+C0Lsj3/iuGVcrkXNboGSNjvl7PRZxlz
         LYNhiLKcAqKq9JjdOs+7WMEhZhUWqVenr+3dRYdx08Oil4r8Rx+P1xldJ8LKyrJzdoNe
         QOvNSGOhoOTFQ7DQBJsH9yp3VEO9Yhc5fHFPDvLX7MqeZYKiBbZTxkqJMmkl41SR8l1o
         6ZtQ==
X-Gm-Message-State: AO0yUKVFFDbQp6GBmzIdfBm7vrJ2/643C/M5fBlAOXDqgEMXdebcCMls
	urecb3AWGt4N6SDdDRBf6Ng=
X-Google-Smtp-Source: AK7set+q2tzCJsLkkcr2W1ApsxYybNoms8gV/Cf14CQViGZd6uhzgwsbwtZOKPfDLL868MSCUfN2mw==
X-Received: by 2002:a05:6000:1205:b0:2c7:454:cee3 with SMTP id e5-20020a056000120500b002c70454cee3mr19189861wrx.7.1677485238865;
        Mon, 27 Feb 2023 00:07:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d6903000000b002c56af32e8csm6389997wru.35.2023.02.27.00.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 00:07:18 -0800 (PST)
Date: Mon, 27 Feb 2023 11:07:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: rex-bc.chen@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] cpufreq: mediatek: Link CCI device to CPU
Message-ID: <Y/xksGSXSefEJvyO@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_000723_264460_B501340C 
X-CRM114-Status: GOOD (  13.49  )
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

Hello Rex-BC Chen,

The patch 0daa47325bae: "cpufreq: mediatek: Link CCI device to CPU"
from May 5, 2022, leads to the following Smatch static checker
warning:

	drivers/cpufreq/mediatek-cpufreq.c:405 mtk_cpu_dvfs_info_init()
	warn: passing zero to 'PTR_ERR'

drivers/cpufreq/mediatek-cpufreq.c
    387 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
    388 {
    389         struct device *cpu_dev;
    390         struct dev_pm_opp *opp;
    391         unsigned long rate;
    392         int ret;
    393 
    394         cpu_dev = get_cpu_device(cpu);
    395         if (!cpu_dev) {
    396                 dev_err(cpu_dev, "failed to get cpu%d device\n", cpu);
    397                 return -ENODEV;
    398         }
    399         info->cpu_dev = cpu_dev;
    400 
    401         info->ccifreq_bound = false;
    402         if (info->soc_data->ccifreq_supported) {
    403                 info->cci_dev = of_get_cci(info->cpu_dev);
    404                 if (IS_ERR_OR_NULL(info->cci_dev)) {
--> 405                         ret = PTR_ERR(info->cci_dev);
    406                         dev_err(cpu_dev, "cpu%d: failed to get cci device\n", cpu);
    407                         return -ENODEV;

This code is "harmless" in terms of run time but it's also wrong.  Linus
once complained about this Smatch check that actually passing zero to
PTR_ERR() is allowed but I explained to him that in real life 95% or
19 times out of 20 then when people have this warning there is something
wrong.  Today I have seen many of these bugs and 1 non-bug.

[Btw, this code will also trigger another warning because the "ret = "
assignment is never used.]

This driver does a lot of checking for IS_ERR_OR_NULL() and in each case
the code is doing something wrong.  I have explained this in my blog:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

The existance of the IS_ERR_OR_NULL() function doesn't mean that we
don't have to care if the function returns NULL or if it returns error
pointers...

If a function returns NULL, then we have to check for NULL.  If a
function returns error pointers we have to check for error pointers.
If a function returns a mix of error pointers and NULL the *most* of the
time the errors need to be handled differently from the NULL returns.
For these functions a NULL is *not* an error but is instead a special
kind of success where the feature is not enabled.

Q: Give me the feature
A: The feature is disables so here is a NULL.  Success!

The driver then has to written to handle an optional feature which has
been disabled.  Do not print an error message.  Do not return an error
code.

    408                 }
    409         }

regards,
dan carpenter

