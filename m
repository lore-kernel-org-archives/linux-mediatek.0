Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3848C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kfcqyUGbYrsiwKhhXXGg1sj/5ixvr1ey05IKwpANs4=; b=i+bjdWshmgCAB4
	T/0+hqBlGC1QjziDFVqRy60t/zzJEv6UOQVqIjFickoEC1pZjdtMXJUKJG19p32W9D5N9jSTsT1Ib
	z8TKOgHI0R3DQb7sKc4CTwKBPldOxwn4Q2O9HmgFTu0WC7xZWzSypM8WOIyj3flq19cZEgqBnHYDl
	3pse3n5m9d8qR+2OnXfzRkesO7TxibOAiRX2X/MxCddAZOcQ2jv8VsQTTCi2PRdRNFZWD4/i353mc
	dkeVIOyWAEXT+4ZTRE6869q56/eG8Xu9liqhT4WGIFDehLglIvwdTUskQGZaMZutUDHYwEtPeT0qW
	yDDHgGRTaV8cSqS5wVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nirPG-008NJQ-7a; Mon, 25 Apr 2022 05:37:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nirPC-008NGK-Kx
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:37:04 +0000
Received: by mail-pg1-x52b.google.com with SMTP id r83so12514874pgr.2
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jSOMoXepvL9Jzmn0TgEVp6Q/+RDInO3nOjN9P+fEr5U=;
 b=MjrOo6gnvWQ0KiRdrU6Nh/2NVJzRw7ov8XS4hxBysvBl6cNws1WvQM19tTZ4KGLDck
 bSRc+8Es5GlXRKZ80j3BtWAp1dm1HyRgQdgJTdavSkUykNna9Wu3bQlxejouzBrqe5E7
 2B9WhnPpRlXvfVWse2iTfmXK2BLMrIor4hEXRR//DaBgm18j/4U2GF5EYC8CXSzfekTo
 1IN8TMnhO7O9zgaBwHfJZxIRAG8nqWyEGy1pCZvMlQoteovNcplc+6Dm1gArbznmvX0/
 tU4qrPzbYmnP1FVBS8syW/MHI1iBGpTvPpLd03tXML7uUYc3EgdBsgE0evs1mo23f7lC
 gjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSOMoXepvL9Jzmn0TgEVp6Q/+RDInO3nOjN9P+fEr5U=;
 b=deqEzju/MyvRt3wUf4IQ8vHwQW1Lyz43YIQECTg8soFiqDCx3NUBe5xsl9AeZoVsGw
 gd6Dx5RJXHNveXf9wKWQBaX2f3cHAzKjgcUqI0Y+axyd8AEt8zLhTrByPdcLyUHo0ksK
 bMMuHcpaTGNRAQqlSwteU0ABiiKK5NmvAzZNbZ+6igSjLw4crEthdB38T3oppDKMc/hA
 OSYTkDKBlign16FIY+ciAdpatNI5gWnwTeXdSqCZcdG6W3E6PFcKWwXIgVgwKaDrzchx
 5gQpRxjpuwvGlT6RuzldiHutfq9jSOa40lA2zdHba8fF/MsaGLb3z/afYXGiOuBhtpdv
 IoFg==
X-Gm-Message-State: AOAM530Oblyn9DDoHcvuwIJ0Q/iiBRrzUHRZL/Z4usog04Z6t0UXFOYW
 yL34fHiteo3Pk4uZFYtqaA3KlQ==
X-Google-Smtp-Source: ABdhPJwyXdNuPFQBy486nkbr3dpvv19PJ2dYyl94Bx5xB85QCCgV+xHeMfE33UI5nisSl/FYAy4fIQ==
X-Received: by 2002:a05:6a00:228b:b0:50d:3c82:911a with SMTP id
 f11-20020a056a00228b00b0050d3c82911amr4417789pfe.16.1650865020707; 
 Sun, 24 Apr 2022 22:37:00 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm8393549pga.36.2022.04.24.22.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:37:00 -0700 (PDT)
Date: Mon, 25 Apr 2022 11:06:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 08/14] cpufreq: mediatek: Make sram regulator optional
Message-ID: <20220425053658.4by4i5hex4buxjza@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-9-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422075239.16437-9-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_223702_761407_8BD1E59B 
X-CRM114-Status: GOOD (  17.48  )
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
> For some MediaTek SoCs, like MT8186, it's possible that the sram regulator
> is shared between CPU and CCI.
> We hope regulator framework can return error for error handling rather
> than a dummy handler from regulator_get api.
> Therefore, we choose to use regulator_get_optional.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 0b2ca0c8eddc..97ce96421241 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -438,7 +438,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	}
>  
>  	/* Both presence and absence of sram regulator are valid cases. */
> -	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
> +	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
>  	if (IS_ERR(info->sram_reg))
>  		info->sram_reg = NULL;
>  	else {

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
