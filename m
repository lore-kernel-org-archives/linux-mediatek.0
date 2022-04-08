Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E011C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2K63obqofvd6ClGD1PHWumfbo5e3Xy40BBzUwbS8XcQ=; b=PVJx9NYX/f3HR9
	a9LaB4ZrUxLM3dmiTEJskYlzV034uVp33O8X8xeoc/xWKBXpAZpWxlF63B7Uav84ksLVmcx79R15P
	CjsZyeLl2JURX+Nq02iOEyWWIWf9k0gP9oNMG0Xh55dbXGhiwLA3Xcs+d6PgFaSmsNqVj1zPhsbxD
	WeD/6j/otIV6e5E0SAOaXfIpRnfX1hexmmv1QDLyZ1SOpeWHLgp+MRFVWx75yupHMaBBVjGTGgRCN
	CiizaRzr+Fu4I19Nun0wjmxFvkcxrRh0jG8JXGGeEpT0G2dfNUHi9o5vCk882HQXniTpZzWK9XVSd
	ivZ9Gws+dvhm51uGdJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvHw-001CRp-7C; Fri, 08 Apr 2022 20:33:00 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvHk-001CN5-U3
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 20:32:50 +0000
Received: by mail-pg1-x532.google.com with SMTP id 125so8699301pgc.11
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 13:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/KqnrdwGzlf8oEa0IfTyQSFrKPtPSsWbAmTKt3bSBaw=;
 b=bSYtEQV1SVOIaMYMd8qMkOclqEVBABfaNJlBzEMuOT07Jj6QOZBwk67GOGexYFR84m
 ndUhCgL1deArCVZGdwjeqJzf8sQTr8MRRwF2SOxL+hALaDyFAyDuBiF4MWTp4nPycDbo
 Ry1rpQkerNLg2JQQ3a9isIbV9drUt3IkbdStl9geLCm6aU84Z4GPBY/8gft5IL6+09EF
 KSvsrzYOc6JobpCyz/IEPAq3VVxQ6gpejTEgxSLKTbj7j5BGbXdirX9IhS3ShGW9sfG3
 SQrRtEXLmcbciHcoBkGvrJiR9/QGJpe6ByS0EoBU0s4fUG1bP5qw5+/GS/pw4oqE2k3/
 fvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/KqnrdwGzlf8oEa0IfTyQSFrKPtPSsWbAmTKt3bSBaw=;
 b=Yxt3GKoXPFGcMQ40jb/cJImKaa55y4OXZulliJwag1Cpo/6XXegSPWUpawwYJSl6ay
 halSzVB+cVG0uE7JA/+0KxUVF7+vCc4IV12BI2xKOvATjAkCXmlhjawVOBxLnXiT0zJk
 h5uZrVmAYp7bnU87mjZbxCPdEceS0AkRcwZ9tVfaT3AblqsU1z0JaraapVRIFM+SJ6S/
 F5ZpF+9V1/5wGvtFW8ujFrRNofDfXmnsWBuCiIvndT9VaRi7fPEHoeC7GZKG0LZUCdYU
 FDXWT5fbfONE5lNGnI+Nwft6FEk8t/zhfKhXLTrFlCRGNVN1eCHRHLaRU+nU3ru5UlWW
 jsMQ==
X-Gm-Message-State: AOAM532bcfrTxC//ImRFsmJ5bACit2jIl5WwMmV0vyv8zkc63oxPQYIZ
 UioP67cA+gLG6dQ2UJZproKuJA==
X-Google-Smtp-Source: ABdhPJw94bMJVltpaabJ4ZxqAt+yzYzf77Fd6sm1altDdMxSl7h9RT/pzr2JplWj0K9ai+ylxhumng==
X-Received: by 2002:a63:214c:0:b0:381:1a27:fe1 with SMTP id
 s12-20020a63214c000000b003811a270fe1mr16619582pgm.328.1649449965655; 
 Fri, 08 Apr 2022 13:32:45 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 k92-20020a17090a4ce500b001ca69b5c034sm12627141pjh.46.2022.04.08.13.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:32:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 10/15] cpufreq: mediatek: Make sram regulator optional
In-Reply-To: <20220408045908.21671-11-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-11-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 13:32:44 -0700
Message-ID: <7ho81b5n9v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_133249_024653_9A5A2EB5 
X-CRM114-Status: GOOD (  15.35  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>
> For some MediaTek SoCs, like MT8186, it's possible that the sram regulator
> is shared between CPU and CCI.
>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

nit: missing your sign-off.

> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 9e9bce0ff235..8f688d47e64b 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -435,7 +435,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	}
>  
>  	/* Both presence and absence of sram regulator are valid cases. */
> -	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
> +	info->sram_reg = regulator_get_optional(cpu_dev, "sram");

The changelog says that this regulator may be shared with CCI, so I
understand it's no longer exclusive.  But here you make it optional,
which should be explained in the changelog.  If it's not actually
optional, then it should just be normal "get".

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
