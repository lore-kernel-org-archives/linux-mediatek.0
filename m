Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABC3C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCxZcYJN9rkKZCIis3ewORAEM/I+F6Y2IS/7dkOJB6o=; b=flfRyOmnAJScbYJhZX16RzLRiP
	EbZ50k/6GP2J7Yy7Uhg0ppjsCFDVhIurw1mQXLnkrEseETuA+UosZ99DObhofkA4gKMIFc6ZdPdH3
	Z+6B4jq8CrDM3XE+3ybpEcBTm6sck8VHMR/iYvjuj4YG/9Sco9k2msSOKQcN13zM9PpIJdctIE6i0
	p1gKqdcl+1f+wycaWtUEMnK8ViwkslRtPPAtD0DYPqsrwYHhMi91NjfhbU7Mtlf0cLwLup73D3ATm
	z8UtOhjWwPB9I9MkKdd1MWk1ozYomqePsc6L/XtenJyuu9duE4ChMAGFCTA3vBDvmVY8inSAv/HfZ
	mEby+OZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJK3A-008sPc-64; Wed, 03 Aug 2022 19:29:00 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJK37-008sMc-ES
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 19:28:58 +0000
Received: by mail-pj1-f52.google.com with SMTP id pm17so11864584pjb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Aug 2022 12:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RCxZcYJN9rkKZCIis3ewORAEM/I+F6Y2IS/7dkOJB6o=;
        b=AY3KHNHzx58KwohAj3umZK00BJsjv+lpLrWqkpu8fWR4lEYShkl1HMVR+Jf7IMrbnv
         HmN5h2M+RZRTl2OCKhxeZEZ0XzeBtMz5+wFupT58elk0iatVIAIp3Gacti2XBhuT5Oiy
         PmecHLfD8Gz81MWd8CTcg3rGhbWBzJdfEyorzSchv0IYSfHmyOC6M87SwIQQu0P3CxM5
         hbX56WdceR3gCleqfV3iO6nxBl7D7tjoOlkAPN0KtkKgWs9nkx6gJL0rgzfZ9U1G2HIv
         q5tvMLwtGyccmNIJSx/Drt37BOHNNzFxVjHq5ynvqkW3dAo30bdqi2ptpaisV1C/MPnb
         3MxQ==
X-Gm-Message-State: ACgBeo3whZFUA9LiNkH8nE5JFGqhsb4xcnygTW/pQhGiSHcXXoq+rlFZ
	TA5NGH76cySPqJT8Fn7Z+sAbqKKCKf4=
X-Google-Smtp-Source: AA6agR5JPTv9cCZgg/k8OdPdC5xEIL2jgCN9700hcZo/9c1ZtDwXDp1PvaN7CtUksCOK77lA0OXfhw==
X-Received: by 2002:a17:902:694c:b0:16d:cc5a:8485 with SMTP id k12-20020a170902694c00b0016dcc5a8485mr27650119plt.90.1659554923341;
        Wed, 03 Aug 2022 12:28:43 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:db71:edb7:462a:44af? ([2620:15c:211:201:db71:edb7:462a:44af])
        by smtp.gmail.com with ESMTPSA id v66-20020a626145000000b0052e6854e665sm80107pfb.109.2022.08.03.12.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 12:28:42 -0700 (PDT)
Message-ID: <2070dd08-371b-a660-388e-ec2481781db9@acm.org>
Date: Wed, 3 Aug 2022 12:28:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] ufs: allow host driver disable wb toggle druing clock
 scaling
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220803030329.5897-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220803030329.5897-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_122857_519004_E97CDDF8 
X-CRM114-Status: GOOD (  17.01  )
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

On 8/2/22 20:03, peter.wang@mediatek.com wrote:
> 

disable -> to disable?

toggle -> toggling?

druing -> during?

> diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
> index 0a088b47d557..7f41f2a69b04 100644
> --- a/drivers/ufs/core/ufs-sysfs.c
> +++ b/drivers/ufs/core/ufs-sysfs.c
> @@ -225,7 +225,8 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
>   	unsigned int wb_enable;
>   	ssize_t res;
>   
> -	if (!ufshcd_is_wb_allowed(hba) || ufshcd_is_clkscaling_supported(hba)) {
> +	if (!ufshcd_is_wb_allowed(hba) || (ufshcd_is_clkscaling_supported(hba)
> +		&& ufshcd_enable_wb_if_scaling_up(hba))) {

The "&&" is misplaced - it should occur at the end of the previous line. 
Isn't this something that checkpatch complains about?

>   	/* Enable Write Booster if we have scaled up else disable it */
> -	downgrade_write(&hba->clk_scaling_lock);
> -	is_writelock = false;
> -	ufshcd_wb_toggle(hba, scale_up);
> +	if (ufshcd_enable_wb_if_scaling_up(hba)) {
> +		downgrade_write(&hba->clk_scaling_lock);
> +		is_writelock = false;
> +		ufshcd_wb_toggle(hba, scale_up);
> +	}

Since this code is being modified, please move the "/* Enable" comment 
to where it should occur (just above the ufshcd_wb_toggle() call).

> @@ -1004,6 +1010,10 @@ static inline bool ufshcd_is_wb_allowed(struct ufs_hba *hba)
>   {
>   	return hba->caps & UFSHCD_CAP_WB_EN;
>   }
> +static inline bool ufshcd_enable_wb_if_scaling_up(struct ufs_hba *hba)
> +{
> +	return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
> +}

It seems like a blank line is missing above the new function definition?

Otherwise this patch looks good to me.

Thanks,

Bart.

