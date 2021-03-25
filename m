Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C339CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 11:59:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A24F61A0A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 11:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A24F61A0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6p5rZg/EXf2OLbBWjKG1/HTfYXhvd+LyXEpo99JvSg4=; b=BfUdaPz1PMRN1sMXmjDqlVmNr
	a0rUJGnfpgSL+d8KuIoWAOB4uRBcvTnH7LUiM6INMmXrzxvrsx/V4Iw+wgHFX4+EyYB84LoNR/YQF
	fFQ10St3Zq+euQMmMyPaBiVGbg0zDLWXn72pSUfN7CtiDtHKntnVSFW7ZKYlDPRNfuvB6zGl3gmaD
	+HHiHJd0YVeZ6+ibNy03tskwL/ovlf+AI5oifmXkoq4E/SoJRssfKFbS0UFT2LLumZg/rxO/FYvKf
	b2ZVGMTAkFk/7SlXu0ZInsHNBkdOoSdf9jVwHyQ79EjpSkUGEX8SHggM8kEkoeawTdgmTGnO4sT3y
	qS5GcR3dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPOe2-001L6r-AL; Thu, 25 Mar 2021 11:59:22 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPOdx-001L66-3G
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 11:59:19 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lPOdw-0007up-3r
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 11:59:16 +0000
Received: by mail-wr1-f71.google.com with SMTP id o11so2543833wrc.4
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Mar 2021 04:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfiLBHztHE4rXP9YTfO8+HSekNR/3pABhRdVX34TR+A=;
 b=sgv9BO93I7hgIYOKBcN5dY74yOPBWGCbFgWFr7A9JlGKUlmq3JRiBFgtSzbLzfJtZQ
 jbhdTvoa2Fc/OQCfIu+mCJlUXU4qTPudYFzHKK6nBKvptbAVDka2ODfJZ9DITLy5bbQB
 ZXoJA6Hjsu6XbA/rq9s+JeZ6fKobdRDlL54PdLY4lWhwFFDjJ5hsrJnnoQ3BTRotDHbI
 vRN7PXkTAnkkuhB2bUOPwE56vggGad+6u1t/vEqSrc3+j0p5fl5t0iHS4RfpfGk1ovoI
 zWP0AkATkLubn1HUIXKaTdvtAbIKHM4lLalEFVdFaZeZvoxANBD8Dq2YPheZBFG/Quii
 v0DA==
X-Gm-Message-State: AOAM531PceStNnzpNqesYVhHTKN9ap702BMihsVCdA8ksSEwTvVyszw0
 rMk74guPZDpT73yQCoXOXpcclu1+W2GA/8S0847GnSGPmidYbSp1lvf/rmWR/gwzMmXe/jph+iI
 5ZfjfLTfEeJnknUH7lqij6d9kc08hdU3mXZN/wy2kF2Vz6RCLdg==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr7340332wmb.173.1616673555713; 
 Thu, 25 Mar 2021 04:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVSjSgCphFJsd4YHNWcAP1j5EjsqiQU9p4nuTKndG2SXF8I2/J+tpPUwLhskg+gbiQC5L4iA==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr7340312wmb.173.1616673555490; 
 Thu, 25 Mar 2021 04:59:15 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id r1sm7996635wrj.63.2021.03.25.04.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 04:59:15 -0700 (PDT)
Subject: Re: [PATCH] regulator: Use IRQF_ONESHOT
To: Jian Dong <dj0227@163.com>, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
References: <1616501538-120724-1-git-send-email-dj0227@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
Date: Thu, 25 Mar 2021 12:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616501538-120724-1-git-send-email-dj0227@163.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_115917_396860_57D6D934 
X-CRM114-Status: GOOD (  19.74  )
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

On 23/03/2021 13:12, Jian Dong wrote:
> From: Jian Dong <dongjian@yulong.com>
> 
> Fixes coccicheck error:
> 
> drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
> drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
> drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
> drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
> Threaded IRQ with no primary handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Jian Dong <dongjian@yulong.com>
> ---
>  drivers/regulator/mt6360-regulator.c      | 4 ++--
>  drivers/regulator/pca9450-regulator.c     | 2 +-
>  drivers/regulator/qcom-labibb-regulator.c | 3 ++-
>  drivers/regulator/slg51000-regulator.c    | 4 ++--
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
> index 15308ee..947350d 100644
> --- a/drivers/regulator/mt6360-regulator.c
> +++ b/drivers/regulator/mt6360-regulator.c
> @@ -385,8 +385,8 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
>  			return irq;
>  		}
>  
> -		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler, 0,
> -						irq_desc->name, rdev);
> +		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler,
> +					IRQF_ONESHOT, irq_desc->name, rdev);

This does not look like trivial rename/replace fix. This should be
tested but it looks that you just did what coccinelle asked for, without
testing.

>  		if (ret) {
>  			dev_err(&pdev->dev, "Fail to request %s irq\n", irq_desc->name);
>  			return ret;
> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
> index 2f7ee21..d4bc1c3 100644
> --- a/drivers/regulator/pca9450-regulator.c
> +++ b/drivers/regulator/pca9450-regulator.c
> @@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c,
>  
>  	ret = devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
>  					pca9450_irq_handler,
> -					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

How this is related to the missing IRQF_ONESHOT?

>  					"pca9450-irq", pca9450);
>  	if (ret != 0) {
>  		dev_err(pca9450->dev, "Failed to request IRQ: %d\n",
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index de25e32..cac5fd5 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -362,7 +362,8 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
>  		return ret;
>  
>  	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
> -					 qcom_labibb_ocp_isr, irq_flags,
> +					 qcom_labibb_ocp_isr,
> +					 irq_flags | IRQF_ONESHOT,
>  					 ocp_irq_name, vreg);
>  }
>  
> diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/slg51000-regulator.c
> index 75a941f..3f310ab 100644
> --- a/drivers/regulator/slg51000-regulator.c
> +++ b/drivers/regulator/slg51000-regulator.c
> @@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct i2c_client *client)
>  	if (chip->chip_irq) {
>  		ret = devm_request_threaded_irq(dev, chip->chip_irq, NULL,
>  						slg51000_irq_handler,
> -						(IRQF_TRIGGER_HIGH |
> -						IRQF_ONESHOT),
> +						IRQF_TRIGGER_HIGH |
> +						IRQF_ONESHOT,
>  						"slg51000-irq", chip);

How this is related to the missing IRQF_ONESHOT?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
