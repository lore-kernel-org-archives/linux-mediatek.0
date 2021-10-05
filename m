Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B35C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 04:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6179361184
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 04:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6179361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGIRlNVEnXt7Zu293L0ol2v06UaT7ndDrTxH2fxVFAY=; b=rWlm0NDfxj6//v
	BzYSra7Mzd8jnhCxkpe2A7QM8i8GC4KrqjJD/CxomYz6GHB2AH//AhicYB/TmEenJtOQ9ixnTp29a
	BIeJw21KT/0ebl34lay85woTYJMr6s5d7S9kdvLNVNmfy6hmr7Dc2+QhP2tk0jN83gewDZZn5IGgX
	I3SoMehzIY8d/kqR1z1vs76GwGK2GGojb/oUHlbzsOExButmR+ahfQPwegDXXET7LkLfxJOCqBGbL
	ch8QezsykbWgfTHFfhFXNvFG5vw7xnG3fM45iBA5WswB+v6DpffPAilRhH9k/IMvPWIIonwSI1MYq
	OuVwDv+Vd8GhrD8raPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXbxc-008rif-Mb; Tue, 05 Oct 2021 04:21:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXbxO-008rgf-Jl
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 04:21:36 +0000
Received: by mail-pf1-x432.google.com with SMTP id m5so3538352pfk.7
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Oct 2021 21:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6XYDK2OrMAt5LQifO3ckjgLogx91TVAqE/NRbe8lTiQ=;
 b=OTAbVKDf+Y5TJO2+i6nYPeY7DmH4WHagakuuacBBKky/xgnsEYkv/LFLRKp2COqYK3
 HpkL9pE/qVkT+PwDnmR/JM79VN/scw7j+BmjqjKLaKz/kaBajfo8Za+QZyewmGke/tFu
 Ciis62LC9esLcwoQzZzfai94lRDyFuWeOKZ7LYn2U7U4vbHyMwgrFJrpYoeucOtQhVVd
 Nb4ZxCfEKIMcpG4HPQ2/2gox7Wlm0F+j+BDkIOnFiuTv7qYqNWsvdhFtMKXpOeER9jCj
 FN4Eup/Y8niobob0RrwRPTYrk6Oe8EW2PM1jDelUgkKzpaux/pevszCtQANfHi42gcMV
 6/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6XYDK2OrMAt5LQifO3ckjgLogx91TVAqE/NRbe8lTiQ=;
 b=Q4wRGQu++0G7B9cEArsQ7BWQwutnYeItCfYY9jXIGXe7qQLGsaQFVk/FODrekqaAio
 ufWgtHgISeTqBUl7b6uqWMxzDUdjZ5NgGwZX0+VXsGm50HlLXO/mvZRbBCC2ejLdCqpP
 /CAoJJ47mW+8adt/TdrU2Wk/dbZ3xuMEwLwqPRQ7VhmKlrzuBcg3/tCpguRzO6+3hDGO
 SVnqdxddIP0sYqf/ljV6OsAwhZk7RT9qsyVRQ1filJ6MYR5zMLEm1ZEybXP38s94zWaQ
 mGJG7hD/GYbmK6nmOi+WuJn5QQ7wI471XkX5m2rx8DGLWrDeaV6i4sfBv3oEveLgIzQW
 wl5w==
X-Gm-Message-State: AOAM533nRHgzAcE4/XVNZ7b31FYxgC+gSrGA7qcFBwGUncE2QdidzPrt
 LQWyerZGj8psBOCUBQH4R/xIqw==
X-Google-Smtp-Source: ABdhPJxIDkexXupjkm7UaofuJsbybc7Bj6eXwQj/5/OMNDUKaVWNtmseeaTTDNbzm6h65LNitJJVyg==
X-Received: by 2002:a63:d456:: with SMTP id i22mr13954080pgj.421.1633407693629; 
 Mon, 04 Oct 2021 21:21:33 -0700 (PDT)
Received: from localhost ([122.171.247.18])
 by smtp.gmail.com with ESMTPSA id g23sm16313352pfu.71.2021.10.04.21.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 21:21:32 -0700 (PDT)
Date: Tue, 5 Oct 2021 09:51:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v1 1/1] cpufreq:Fix parameter in parse_perf_domain
Message-ID: <20211005042128.o47qximtibgak33q@vireshk-i7>
References: <1633358553-2842-1-git-send-email-hector.yuan@mediatek.com>
 <1633358553-2842-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1633358553-2842-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_212134_738683_40B64748 
X-CRM114-Status: GOOD (  14.18  )
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

On 04-10-21, 22:42, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Should pass per-cpu id to map perf_domain for related_cpus
> rather than map policy_cpu several times.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  include/linux/cpufreq.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index ff88bb3..66a1f49 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1041,7 +1041,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
>  		if (cpu == pcpu)
>  			continue;
>  
> -		ret = parse_perf_domain(pcpu, list_name, cell_name);
> +		ret = parse_perf_domain(cpu, list_name, cell_name);
>  		if (ret < 0)
>  			continue;

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
