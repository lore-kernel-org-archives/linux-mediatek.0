Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EACBC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lO1IN5mUh1vloEadkcNwvF4GBLG7iWbrFJZnQt1M4Vw=; b=trNBRdvySh8lh0
	M5iwO7Vd6rOyixfpmIHLjTHdnIRwmXRde+2WDOIo28sqWaXsPKEh56TmkfmDKLw44NiC4g+yGyNa+
	DsHjdJSbPSYwvcF3iOR+TkKwgGp/6p8IcoOyJuxf3VmgaefJPUf8jwogWYksHmNx2m3iTQwzOcweG
	g42j0+oPTqhJ9GLf/Wob2NDmRiKzYdxf13Db/qo4nCIp4Tx1AJDslTNosblYAa8DSbQzGV4WkXXYQ
	1CL+eUv4Js1esQCvwwOYVXUL9LR4MsHnx+4Id+yRHa7igycn4lZjiKOAZs6TBbmXnNpCpMTXbYWsf
	8DE1TabP8GMib7WxFG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nirO5-008LbW-TF; Mon, 25 Apr 2022 05:35:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nirO3-008LaH-Ke
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:35:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id s14so24538682plk.8
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T2oxad3crhUuqjbi9y9dJMMYmCSsVXY7Ev+0B50BV+0=;
 b=qDZG8k5tDIz4MvJx+OydJWKJelMxeRJN8ZN7/tavSk56FfCWp42xJTc/KSu57tV/mZ
 fQdDDY/W8fp3//v3jBXi+EzaeIh882MAvQjc/0XqLfj2HLHTZtv/toIofCQo0DwZJvn3
 gUyEmZBF+WiGVi2Wo1cwrDkw9jzGN6wgZoPmaip+7AESEsTdWwnuB/R9UZMFolm1bJxN
 qpTJpPhIsP6ZscFHpeY/314oVST+nmNBwwDHAwiXJQbBfWK/aHZGgFZJmLd+iYV1Fwng
 Yrh+1rzRBta+YycnMKuqiaaC2ddt7bzzYWAre8fH0Gf9NAOQkK39kzEGpHxJRZ5yIjJt
 nUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T2oxad3crhUuqjbi9y9dJMMYmCSsVXY7Ev+0B50BV+0=;
 b=nUv/XbL7XzHkVkJnqYqDDUTPbWo+xswbdqg3MIRYL/rBqAk3KjsutNd8NoIr8uvJZC
 /+7eX9Ca+Cx0TPQswb4DcbiGJvy7OyLJXTf/MyTlE5Tgh+4qxcAN8LqZ3BAfyFXZw/QT
 ZXGAZ1rCLstF+IHuWbVQzRudDUYIFSPSm7kwfywqsWeZF16MQfQlzfohKVIVjAwDINcq
 OL2OEVX+bFZlE+nZFESLxKqp+0GPOIZV833HXEl3z9BE8J+Os8BFNyf4UVnoQMRHh9TF
 PigACEvMlvnFVkYKztIZYQR5Ld9587rllFWYzH7L3f5h0E4jO4qH6DvO+ac3yQGx8EI3
 ZoKA==
X-Gm-Message-State: AOAM531EKE1SoZNC+hYUZZZpxtkZx5bMbCWw1kpIUFPa/lJUpfyVskBO
 gi2eHnSpLFrKCDu5fzbKLqY5JA==
X-Google-Smtp-Source: ABdhPJwnOiyciQSstf5JSoNHFmid7vkH7V23CkAvcMQLZ9tHebui2ItXK187LidqDcgz+iDQDT6d2Q==
X-Received: by 2002:a17:903:410b:b0:15c:fd57:aa34 with SMTP id
 r11-20020a170903410b00b0015cfd57aa34mr6247282pld.82.1650864950700; 
 Sun, 24 Apr 2022 22:35:50 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 d141-20020a621d93000000b00505aa1026f1sm9768440pfd.51.2022.04.24.22.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:35:50 -0700 (PDT)
Date: Mon, 25 Apr 2022 11:05:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Message-ID: <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422075239.16437-8-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_223551_719550_7EB626AD 
X-CRM114-Status: GOOD (  18.24  )
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

On 22-04-22, 15:52, Rex-BC Chen wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> We want to get opp frequency via opp table. Therefore, we add the function
> "mtk_cpufreq_get()" to do this.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index e070a2619bcb..0b2ca0c8eddc 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -71,6 +71,15 @@ static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
>  	return NULL;
>  }
>  
> +static unsigned int mtk_cpufreq_get(unsigned int cpu)
> +{
> +	struct mtk_cpu_dvfs_info *info;
> +
> +	info = mtk_cpu_dvfs_info_lookup(cpu);
> +
> +	return !info ? 0 : (info->opp_freq / 1000);
> +}
> +
>  static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>  					int new_vproc)
>  {
> @@ -588,7 +597,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
>  		 CPUFREQ_IS_COOLING_DEV,
>  	.verify = cpufreq_generic_frequency_table_verify,
>  	.target_index = mtk_cpufreq_set_target,
> -	.get = cpufreq_generic_get,
> +	.get = mtk_cpufreq_get,

The .get callback should read the real frequency from hardware instead of
fetching a cached freq value.

>  	.init = mtk_cpufreq_init,
>  	.exit = mtk_cpufreq_exit,
>  	.register_em = cpufreq_register_em_with_opp,
> -- 
> 2.18.0

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
