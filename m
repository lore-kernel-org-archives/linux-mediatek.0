Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCDBC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:13:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9766961029
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9766961029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fyNXST+R2CROBN/FLSYeMhj9HJHDAiJbfWgXKNOfEak=; b=CttDOLRRZSTJw8UccgFCWIBL0d
	GabTQHYsNhiQWiyts7DjoqXEYCP45K5Kqq3YH5wNH/n5KEVYX3f6TzJpAc1M6iOg0n1qBBEyHKkfO
	p9UWF48VECmMUoBDRBIG9lajWAhg2t6Bjw8MLuv2IuezITaXF4qoUFvlPMlGMH6xKuVkzmbUQ43/2
	Sx3qjLGvjmaCveNUCDU5UWv/Us14SWCDUh1+LOfWGV0VIlGhn2SJodgK6S7U5R5El9huK0FKH36Km
	Bnj/3SzxDUut+w7+gCdZ0iDi1K/yotZkZ9EwAp5Fz1Fh6I/NVGp/ZDQQXDIkGqdn9iPkWnxviVe/i
	RWxwFEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKSA-006snw-Hk; Wed, 04 Aug 2021 17:13:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKS8-006slE-B6; Wed, 04 Aug 2021 17:13:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id d8so3059156wrm.4;
 Wed, 04 Aug 2021 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wqLm8EfM5SnlCMGedDjfLb4X4DuYoCJtVPMlQgV2X1o=;
 b=sCWLSZhPyyln0hjThAJeHOhOHy8a6RC00Bq/oMZe5m93kzlDcsrqg/G4H92gS3D97B
 T/PsmF5I3atptlop4Wm26nhRqEAywJlyjKVN+TMzzq6v7eMn6LfrcUwQ+T9VoJBc4eWE
 q/+Xgig6ssBx/KqllcgCCOEjkvAgda6IzYengQqxNedQi5BikeA+h0prXQJDXaAEp9ZU
 J9NPe7/yMBNQodFfyy1+ZwDwy/WmZ+j4Tw23Y2JAWOeX/SVdNU/kjX7SFv69cDuSE+20
 8cWld46NjsQvAB2OSJ4F4VLzId9NdDVBXGvnXcNxKbQ7LaiJqzqdapt1lkCxaQOQ36+w
 fMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wqLm8EfM5SnlCMGedDjfLb4X4DuYoCJtVPMlQgV2X1o=;
 b=uG42fASn2a4XQOKQvHVz5RydyCFjH8Ohp6VB6YkSzpPBXAKwHpAaPG+50KPVbiXQ7D
 eidW7E8j13F/JUXiwaFMVgtmDNsRMUcjNrJ5t0CePiTp0d6qPHvjOWYfcXpwL5o/TW4K
 Fox8pus9ouUun5qZNaSrVmUSrcsMP1VYsemr143LtlxXY4fHFvx5hADTDrCkVoTmmXii
 N4lDbrojivq7QMYoyF3X6DF3tRe+MgakLzDakxEYFnTeZae/Qm7W8N0h5+vv5QxaBFj0
 QU+gujbjSWy/SWf+/8z3NkrN7ShcI0AyG5jlpzzuubXnz5Ci5SEd/JvOwFrcj964tQ/E
 6EcA==
X-Gm-Message-State: AOAM530VYyor8A/HUHrRPbLq1AGKYfQBB9AAow2R7Z0BPUVlu7NLI06s
 vet5UDD5q95sJ+BG+OLWJIU=
X-Google-Smtp-Source: ABdhPJxxDI3VKUUUZ99T3bf6+3VsvDiJd6y55gmL4NRjzXdT/gModQr8wE9WiovQVUjYZngMsrXvCA==
X-Received: by 2002:adf:f302:: with SMTP id i2mr424571wro.186.1628097164373;
 Wed, 04 Aug 2021 10:12:44 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id j140sm2962191wmj.37.2021.08.04.10.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 10:12:44 -0700 (PDT)
Subject: Re: [PATCH v6 2/5] pwm: mtk_disp: fix force reg to working reg.
To: Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, ck.hu@mediatek.com, stonea168@163.com,
 huijuan.xie@mediatek.com, shuijing.li@mediatek.com
References: <20210724081849.182108-1-jitao.shi@mediatek.com>
 <20210724081849.182108-3-jitao.shi@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <925e1dcb-1f6b-1762-8342-b102d5e928e8@gmail.com>
Date: Wed, 4 Aug 2021 19:12:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210724081849.182108-3-jitao.shi@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_101312_438535_3DA43BC2 
X-CRM114-Status: GOOD (  19.95  )
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



On 24/07/2021 10:18, Jitao Shi wrote:
> Disable reg double buffer before writing register.

The commit message does not explain why you move this from probe to pwm_config.
Can you please explain exactly why you need to do that.

Regards,
Matthias

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 3ade525adcc3..1070d78d4940 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -128,6 +128,17 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
>  		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
>  					 mdp->data->commit_mask,
>  					 0x0);
> +	} else {
> +	/*
> +	 * For MT2701, disable double buffer before writing register
> +	 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
> +	 */
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> +					 mdp->data->bls_debug_mask,
> +					 mdp->data->bls_debug_mask);
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> +					 mdp->data->con0_sel,
> +					 mdp->data->con0_sel);
>  	}
>  
>  	clk_disable_unprepare(mdp->clk_mm);
> @@ -213,19 +224,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, mdp);
>  
> -	/*
> -	 * For MT2701, disable double buffer before writing register
> -	 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
> -	 */
> -	if (!mdp->data->has_commit) {
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> -					 mdp->data->bls_debug_mask,
> -					 mdp->data->bls_debug_mask);
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> -					 mdp->data->con0_sel,
> -					 mdp->data->con0_sel);
> -	}
> -
>  	return 0;
>  }
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
