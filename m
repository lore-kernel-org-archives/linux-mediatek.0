Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E078C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 03:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E70861075
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 03:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E70861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ/nHaTPu9+6cD2OsudHa2p73Sb3SSgNUlyAxmiKsAA=; b=qZdvVgj5vChXDH
	Dvk2ACUUEa4hsylMUFHqbTyCfsQHPO9VA97ASsQ9JkAPnUGZAy1gbnHQJtHO79GcjtHppAwOnbA/5
	dHksqiQ6A657lHcB5+jcJSgfSugB0A4HmI4ezRLExIya1Ak83haY9OoEmQrZ0XsF2bOykOQUSoSFy
	GV+9RQkJ5JdFD+pOStjRnVY62jkDzlcVVag7nz/9UsbyYP5Hp4L+ORR5IZ+n1rpX5SsxtzJA7VsXD
	XtZ5/q6AsV4rc1rjaM9Xlrnnrf4JNxkhGiieoo7jLrAYXtdXHtr2qwV2n2FSwqPaQZ92AVPBJ0nJF
	hCRkxY4BJASxY09Edd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhkms-000Tic-NG; Tue, 02 Nov 2021 03:48:38 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhkmg-000ThB-0n
 for linux-mediatek@lists.infradead.org; Tue, 02 Nov 2021 03:48:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id a9so8461087pgg.7
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Nov 2021 20:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HL76J82mhEsYvpFLZR8zFqvMaADrPeiRze7TCUFwrMo=;
 b=IlI4UvrybrLWCM3Xa0O3S+Da0h0dCpoGRy/Bg1I/j8LcyR2g/nsY22hk0MXw0DEEAd
 pKb0NVDNg06K0zSKHGpLZexbw0tvAjkqDdhdAo5dbLOW0TLTuVR7E+qE/AGX40h5fOPd
 RYYUgsOxYviGtTGEPqv8xB25y1XqrgCTwLuVSvDlY7OceUf8GwZcW2hCPe2QQZVW9P9Z
 sMZa/LaR3dQFPQoQ1AFVPPY4MiEKIQyJWTJxna6nSjlYsQDtq96kLy70FBwR+xN0NAoz
 JXGXAGtKtAjgKIRVhPiNxnLGggGZ5ub3Ome7tzwVtaA72jz77cwu5HDCk8BW9iL7EN2n
 CwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HL76J82mhEsYvpFLZR8zFqvMaADrPeiRze7TCUFwrMo=;
 b=OB3SzBTpXxVfAEgQ/R29KJFPqcTzGA9NF5BRqJ1dCxQTO/usaNjUGY5sFBUUFKVvao
 gAri+zvcBoU0hzyN1z2zq7B9vXUGiWmso4WtFoSYiUkIcD3Nja9Ov7KBHi5c1wZCijwU
 BycTKuHpechLL8wORqCIf+Ct6is0fA0sTv3+qArdow6X1Ab1jwEK5Zin8NI9dh4Gehbl
 NzIV1pH1GoBNdI9h4zIAG/ZrVf/pxmi6UmkS4pXYER2xjLOx3DGD24TQh7G/Oo1uushF
 ckdh2UR9NHfB4owViLwS7i3WVFMpjWIB5ew8KXbwFhG4LIb9ckZG/q9xBxt6hSh4gXxZ
 jsSA==
X-Gm-Message-State: AOAM5329PsjMgkE9mBMLpfJ4mWvRTZ9aCdia8nHC3g8TVBOk2ww9fcNG
 A/uNMZ295UgyFyy37LwJL80/AQ==
X-Google-Smtp-Source: ABdhPJy52XEJHvzjoewrnya/QJ4mP74UN137kw4m4/t3XFFBGOH861VeugtexrGN0aCtmM3r1MSN2w==
X-Received: by 2002:a63:9844:: with SMTP id l4mr25617862pgo.271.1635824904845; 
 Mon, 01 Nov 2021 20:48:24 -0700 (PDT)
Received: from localhost ([106.201.113.61])
 by smtp.gmail.com with ESMTPSA id l4sm18602015pfc.121.2021.11.01.20.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 20:48:24 -0700 (PDT)
Date: Tue, 2 Nov 2021 09:18:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Fix double devm_remap in
 hotplug case
Message-ID: <20211102034822.diil2tgggpppf4ma@vireshk-i7>
References: <1635507743-17919-1-git-send-email-hector.yuan@mediatek.com>
 <1635507743-17919-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1635507743-17919-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_204826_095271_D5900803 
X-CRM114-Status: GOOD (  15.81  )
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

On 29-10-21, 19:42, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> When hotpluging policy cpu, cpu policy init will be called multiple times.
> Unplug CPU7 -> CPU6 -> CPU5 -> CPU4, then plug CPU4 again.
> In this case, devm_remap will double remap and resource allocate fail.
> So replace devm_remap to ioremap and release resources in cpu policy exit.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c |   33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 0cf18dd..25317d7 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -36,6 +36,8 @@ enum {
>  struct mtk_cpufreq_data {
>  	struct cpufreq_frequency_table *table;
>  	void __iomem *reg_bases[REG_ARRAY_SIZE];
> +	struct resource *res;
> +	void __iomem *base;
>  	int nr_opp;
>  };
>  
> @@ -156,6 +158,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,

pdev specific initializations shouldn't be done from policy->init(),
but instead do those only once from mtk_cpufreq_hw_driver_probe().

That way such bugs won't occur again.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
