Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6D464E1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6D464E1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LNQ+liov1Kj9Cuy/Le4z9Uqj+QO10jTRv7yGv++WP/0=; b=SRzCcBr13ZUdPXKKF4nMCb6xu
	VcVkWDVl77/C9CDw1GCt5jSYurqrFOcR41q3NbP5OOtLFP3+a8+3sraej44TGFxViHq5fd/5fOgl/
	7NJPk9y8mxbkxuUj1Q5PCJ/pzStkC19rPjnHO1miN2S1itz3Z+cwsWWGTgGVgiJbtpnUDbhRpJO51
	kayoNd1g3M7SHn+RrGQ8CXOZFGMQVg5l/st6VqIl9g1S5rfgdIhpjuBCeQo8oP9f5HAWecS73EqZA
	jtE1/ADYoUBcPM9hYBwJWKgSxjIOWcqC/g/OCli/QKq0+uDz2kEQMhu8sJ7L4gu0zEYOqOxuleEBx
	OqBuVF3qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6A40-0004cB-B0; Sun, 31 Jan 2021 10:34:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6A3q-0004b3-Sh; Sun, 31 Jan 2021 10:34:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id f16so10152427wmq.5;
 Sun, 31 Jan 2021 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W9CKV72LQw4/n8DHvLlfFWWqWP3t9mTNcTVq9zgFDBI=;
 b=ml8PKnnmBVwUtJhYLrAps2xa09WZPf+AXeAAXBnX2G3emw7Vy1EEUdoJaQrdVgaG1r
 9mezcZR0R+t+DnxSH8YPChK16hDbrqz1tr0GfLDx2lGbNbfAHV7cjlTWV2UG4b/kVHzL
 i7/HURt8gH3+WkwoP5l//hg4TjAzrZSWrbmAUG0KyVaDrK8OKr+GKvChOykALEPlgLUZ
 dVZLalDzCfDlP1Fiisl28ZP8dH4XVahGOMF0epO+eCMkiBrw0QySknwCco2CpRkGObdD
 yfk9dIbJUVsfqd9cZgOTxHalWseyCADX9lZouQpB+CSFS4DTZXJzxsTPZXrb/MCVV9Me
 0SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W9CKV72LQw4/n8DHvLlfFWWqWP3t9mTNcTVq9zgFDBI=;
 b=p6n45UrDmilOBOrExbhUYKkPmAebtvWle3ZQs5wPETNA6vCKnkdNC1HYwAaKaeDCgz
 yMgmo91/lLsw5280ut4FGRrqera+iiiELWyBoAMmNgI2Z/BEWg4rbmpRS3BToWOk64tS
 Zu+db9UCJ90oypyN2Np1gz582PqyGYVorUrX+kKexEvMPGAwUD/ndgP5OzRb7AE7J17r
 42KR9oI+l9SD1ZI18c9Q0sLGf2cIHZtVcUyDdoeTJy1l+Hf4FBUUERxtd/zYS+X1LyLu
 tq1CJ8YihMAmmSD2GER58D8I92bhS+qxWekONeVVdGNhah3NcUDuHmaI+GCqfX64Zhny
 jM3w==
X-Gm-Message-State: AOAM530+VEsbGakCmNmtT8qMnpKN/ZZBOCNCyrXs12k0JsqM9O8Uhb4k
 4xmwJrG4wP1zagxdLu+svJCtm2Bx1RCfYA==
X-Google-Smtp-Source: ABdhPJwPTJI1CsqFftboMFqkzFWZVTHNIT+DTDdAe3T0tcfqcLxYyFtEaR4/kluCLCarlg8Hk4ZwdQ==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr2504113wmb.0.1612089269557; 
 Sun, 31 Jan 2021 02:34:29 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d17sm13134357wma.2.2021.01.31.02.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 02:34:28 -0800 (PST)
Subject: Re: [PATCH v10] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
To: Hector Yuan <hector.yuan@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <49f4400f-c803-f044-4974-f4e8703876e7@gmail.com>
Date: Sun, 31 Jan 2021 11:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_053430_986333_FE1556B8 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/12/2020 07:17, Hector Yuan wrote:
> The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> The driver implements the cpufreq driver interface for this hardware engine. 
> This patch depends on MT6779 DTS patchset[1] submitted by Hanks Chen.

This dependency got resolved, the patch is mainline since v5.11. Please delete
it in further revisions of the patch set to minimize confusion.

Thanks!

> 
> From v8 to v9, there are three more modifications.
> 1. Based on patchset[2], align binding with scmi for performance domain.
> 2. Add the CPUFREQ fast switch function support and define DVFS latency.
> 3. Based on patchser[3], add energy model API parameter for mW.
> 
> From v7 to v8, there are three more patches based on patchset v8[4].
> This patchset is about to register power table to Energy model for EAS and thermal usage.
> 1. EM CPU power table
> - Register energy model table for EAS and thermal cooling device usage.
> - Read the coresponding LUT for power table.
> 2. SVS initialization
> - The SVS(Smart Voltage Scaling) engine is a hardware which is
>   used to calculate optimized voltage values for CPU power domain.
>   DVFS driver could apply those optimized voltage values to reduce power consumption.
> - Driver will polling if HW engine is done for SVS initialization.
>   After that, driver will read power table and register it to EAS.
> - CPUs must be in power on state when doing SVS. Use pm_qos to block cpu-idle state for SVS initializing.
> 3. Cooling device flag
> - Add cooling device flag for thermal
> 
> [1]  https://lkml.org/lkml/2020/8/4/1094
> [2]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
> [3]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
> [4]  https://lkml.org/lkml/2020/9/23/384
> 
> 
> Hector.Yuan (2):
>   cpufreq: mediatek-hw: Add support for CPUFREQ HW
>   dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
> 
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  116 ++++++
>  drivers/cpufreq/Kconfig.arm                        |   12 +
>  drivers/cpufreq/Makefile                           |    1 +
>  drivers/cpufreq/mediatek-cpufreq-hw.c              |  370 ++++++++++++++++++++
>  4 files changed, 499 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
>  create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
