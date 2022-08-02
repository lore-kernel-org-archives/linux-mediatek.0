Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359BBC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBwOPQs1CzRtLk4HN0C9Pmc9BYea+vGTzRIRfwnFt70=; b=I0xNx2uPRpMWABWSiZl7YG6oin
	2U7+OgDZ1sPT3yQWKKgCVwe/Lnpp9jt12fzVINDuUIhL5b8M7aMVXHNQG9TurJL4RK5gTuqgya8r/
	eUeAmBSU18e/u3w8w1diJukejChxifLiPbFswZYWeVGiMtL9RN/qiQI+mgMW4iHnKesr5bAl1yswv
	+6XDR2fr3e5crlL+ZIVECr3blDEn4pzc/krKd4CTSnJ9pkXho6oalLC8iktmLWUnZo4AZog2A28do
	v9OpEmpMznog4EMAoAxFqivh8HCFg3oAgtwuUcs7WNSDpQUxhFgzkrYhx9FmjeFcx1251ufKxeDmz
	cVNrGtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIwuK-00Gd96-CY; Tue, 02 Aug 2022 18:46:20 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIwuH-00Gd72-VF
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 18:46:19 +0000
Received: by mail-pj1-f43.google.com with SMTP id a8so971176pjg.5
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 11:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MBwOPQs1CzRtLk4HN0C9Pmc9BYea+vGTzRIRfwnFt70=;
        b=jDafERIWseiwjbYDBQk9wTfFvbDluyzpq/xsoXbmk8wfHgCnvLw5XU2XFhaBKpmKHU
         DSHWDGAsiOINN4IDbkDCnRt3KMdsXOIj8oEqAqE1RgJxGgjv3l6cFkDhueVMrR64V0rE
         rRo4aIsG/zcyqDNCBYkzifGc6egAXWtWEjUC4i9im2/oCeVI3Pf2XmXW9L1eQF+xme0S
         fRJxeSdr+br1xffeSPhIutYDqn+wJEAK/sDAF7dYpnthn2id4Wrn2OlsV5Qmh+piljni
         ZW7icqkFL0+vEC3XOThqC0EqrvmAte1DmD3TnSgREZY9uledNyrwvAa60pYGlTuLpp6l
         v80w==
X-Gm-Message-State: ACgBeo3ObCwnI7a3gVXV6y1kIki+GluSv7v4hrWIgr4+z96uUROuhPl5
	Modo0VwpFAdBrp/f7C5FQm4=
X-Google-Smtp-Source: AA6agR7/aVEzG18zydnBcenmndozfbiF/e630iNJcHBapYnTwzteCDzo2tfVHpzB03knxO5qiEvRDw==
X-Received: by 2002:a17:902:e844:b0:16f:9d2:f4ff with SMTP id t4-20020a170902e84400b0016f09d2f4ffmr2889063plg.27.1659465975878;
        Tue, 02 Aug 2022 11:46:15 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5297:9162:3271:e5df? ([2620:15c:211:201:5297:9162:3271:e5df])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b0016d737bff00sm18275plg.220.2022.08.02.11.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 11:46:15 -0700 (PDT)
Message-ID: <517895b7-95ed-5e83-fb6d-98e155b896d4@acm.org>
Date: Tue, 2 Aug 2022 11:46:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] ufs: host: support wb toggle with clock scaling
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220802143223.1276-1-peter.wang@mediatek.com>
 <20220802143223.1276-3-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220802143223.1276-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_114618_040201_1C89B178 
X-CRM114-Status: GOOD (  16.81  )
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

On 8/2/22 07:32, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Set UFSHCD_CAP_WB_WITH_CLK_SCALING for qcom to compatible legacy design.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index f10d4668814c..f8c9a78e7776 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -869,7 +869,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>   
>   	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> -	hba->caps |= UFSHCD_CAP_CLK_SCALING;
> +	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
>   	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>   	hba->caps |= UFSHCD_CAP_WB_EN;
>   	hba->caps |= UFSHCD_CAP_CRYPTO;

A patch series should be bisectable. Without this patch the previous 
patch in this series introduces a regression for Qualcomm controllers. 
So I think that the two patches should be combined into a single patch.

Thanks,

Bart.

