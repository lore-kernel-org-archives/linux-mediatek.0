Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EDDC43460
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:12:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E81DC610FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81DC610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QJIBo66hhR9Z0xwmZMDvLeOu2YOJ+9t4Uif3RTOsbdU=; b=PtWpIf9vf2Z9XDtYeX4pvICPR
	nph6VjJhatsTGZalze5b5duJEP4X/kjb/dvD+ZjWg28iO0A1Hy7DU9EJjVEshaF5p+jZTMNz7ZN9R
	gvGduIBEo92MQbNWLHeQmvKx2Y/w4UjW+UArpicJtudXSFWSySJvPlSHUoC7YTsV/grtNbJH5kImT
	HBYgXQQo2dFwH2DjzPpYIsNAGTBbBVvGvsfbVB+c+9paRlAKQHLMqhlYkbdFPfCkQaRor+nom2QWM
	9rvBrnK1CdomziBQCk56TZBty5d6PH8TRXYiVqGbBdKD71dybx60rxc9cisp8yNZYBXpA3ZW4ftFA
	hRycyQPoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXB9P-0001ce-Dc; Thu, 15 Apr 2021 23:11:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB90-0001Wu-P1; Thu, 15 Apr 2021 23:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=rNjHSpqMp6OHOOifvMxrtpdA3iLbXLeekducnpNQE7w=; b=ZLkDUDuU0IJzJNHgG7r0O9Qu2R
 OJeBLWWbobEFRgWwsj8UxL69pZ4nqv7pUoSe6q/8BC0Pd8fB0ie++ps5J7phrHMity0h7JyuTqpYf
 AzPbmJF7HRhfTRVS+q8e/66hupM23vZKpildyQS5t6UeSN6hi2GbyPXU7rs4YvYXaVcFw/sJ4r+T4
 eMPZvFb17McEcCM7K8UBE7fXx3+TtyhKBQsUnJkcw3sAeCOkujvvI6t5Kh8eq3JFnR2tOpx7rmbj1
 RZtDLWV3XoxlXByfn4GfBSL4N4OhrUUS5NjObKSoqt8Opfjcj/3+CM0TtM1Lkjz8z3p7vBovPPeNl
 pA7maUlQ==;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB8x-008xi8-UX; Thu, 15 Apr 2021 23:11:29 +0000
Received: by mail-pf1-f169.google.com with SMTP id m11so17092684pfc.11;
 Thu, 15 Apr 2021 16:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNjHSpqMp6OHOOifvMxrtpdA3iLbXLeekducnpNQE7w=;
 b=s6R3jZY7AT1OfsbVUnXD3tMbn2t50WrOXeHxdjWiOWVxkm95iC4tbpBn1Tkq4HQXyI
 RMEFXgNVgDcnTwypjsw3OLJPDrahpwFik+iy/8hvhbkSVtQ45goR6bcIn269qcG1vZeh
 11NYwvlUE6sbwgxNzy9j3a5+brvPZBZYBqsWCMekYPx5X2I1a0/ctdUBOqXCQnLgr4AB
 DFV25wmfdsmblU57GKTqBuMzp6P57fAlfRSnGKlAxL1h8BdnK5pRXMQT7UBF77KTXgJJ
 ec/qF2oRxn7AtdEnUT3cU1eNdoEmIe6jueEPWjGtpu36+NFnvX0dBSEbv52oK6kgkH+U
 Zghg==
X-Gm-Message-State: AOAM531Nlt0eWOr/MBntXnrOj6d+9R7xEyXkWXGJLSvUWS3kKRlrBZNM
 tpVP75xNYriQzx4tYmhJu9UxOgeTRfH+Xw==
X-Google-Smtp-Source: ABdhPJy84p+UP8x2TOnFbzVUyWQ0RVl+Q/N1HMNE6piAjW8rXbWFlCGcJH7JyP2QKJDL0IWfjfed+w==
X-Received: by 2002:a63:7c59:: with SMTP id l25mr5632368pgn.224.1618528286855; 
 Thu, 15 Apr 2021 16:11:26 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:f031:1d3a:7e95:2876?
 ([2601:647:4000:d7:f031:1d3a:7e95:2876])
 by smtp.gmail.com with ESMTPSA id z23sm3375309pjh.45.2021.04.15.16.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 16:11:25 -0700 (PDT)
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
Date: Thu, 15 Apr 2021 16:11:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_161128_022617_7C35E2A9 
X-CRM114-Status: GOOD (  30.04  )
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

On 4/14/21 11:58 AM, Asutosh Das wrote:
> [ ... ]

Patches sent to the SCSI mailing list should not have a "scsi: " prefix
in the subject. That prefix is inserted before any SCSI patches go into
Martin's tree.

> diff --git a/drivers/scsi/ufs/cdns-pltfrm.c b/drivers/scsi/ufs/cdns-pltfrm.c
> index 13d9204..b9105e4 100644
> --- a/drivers/scsi/ufs/cdns-pltfrm.c
> +++ b/drivers/scsi/ufs/cdns-pltfrm.c
> @@ -323,6 +323,8 @@ static const struct dev_pm_ops cdns_ufs_dev_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver cdns_ufs_pltfrm_driver = {
> diff --git a/drivers/scsi/ufs/tc-dwc-g210-pci.c b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> index 67a6a61..b01db12 100644
> --- a/drivers/scsi/ufs/tc-dwc-g210-pci.c
> +++ b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> @@ -148,6 +148,8 @@ static const struct dev_pm_ops tc_dwc_g210_pci_pm_ops = {
>  	.runtime_suspend = tc_dwc_g210_pci_runtime_suspend,
>  	.runtime_resume  = tc_dwc_g210_pci_runtime_resume,
>  	.runtime_idle    = tc_dwc_g210_pci_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };

[ ... ]

> --- a/drivers/scsi/ufs/ufs-exynos.c
> +++ b/drivers/scsi/ufs/ufs-exynos.c
> @@ -1267,6 +1267,8 @@ static const struct dev_pm_ops exynos_ufs_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver exynos_ufs_pltform = {
> diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
> index 0aa5813..d463b44 100644
> --- a/drivers/scsi/ufs/ufs-hisi.c
> +++ b/drivers/scsi/ufs/ufs-hisi.c
> @@ -574,6 +574,8 @@ static const struct dev_pm_ops ufs_hisi_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };

A minor comment about source code formatting: please make sure that the
equality signs are aligned in struct dev_pm_ops definitions.

> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}
> +
> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}

The Linux kernel coding style requires not to surround expressions with
parentheses in return statements.

>  /**
> + * ufshcd_setup_links - associate link b/w device wlun and other luns
> + * @sdev: pointer to SCSI device
> + * @hba: pointer to ufs hba
> + */
> +static void ufshcd_setup_links(struct ufs_hba *hba, struct scsi_device *sdev)
> +{
> +	struct device_link *link;
> +
> +	/*
> +	 * device wlun is the supplier & rest of the luns are consumers
> +	 * This ensures that device wlun suspends after all other luns.
> +	 */
> +	if (hba->sdev_ufs_device) {
> +		link = device_link_add(&sdev->sdev_gendev,
> +				       &hba->sdev_ufs_device->sdev_gendev,
> +				       DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
> +		if (!link) {
> +			dev_err(&sdev->sdev_gendev, "Failed establishing link - %s\n",
> +				dev_name(&hba->sdev_ufs_device->sdev_gendev));
> +			return;
> +		}
> +		hba->luns_avail--;
> +		/* Ignore REPORT_LUN wlun probing */
> +		if (hba->luns_avail == 1) {
> +			ufshcd_rpm_put(hba);
> +			return;
> +		}
> +	} else {
> +		/* device wlun is probed */
> +		hba->luns_avail--;
> +	}
> +}

Please add a comment that explains that it is assumed that the WLUNs are
scanned before the other LUNs.

> @@ -4862,8 +4913,13 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
>  	if (hba->quirks & UFSHCD_QUIRK_ALIGN_SG_WITH_PAGE_SIZE)
>  		blk_queue_update_dma_alignment(q, PAGE_SIZE - 1);
> -
> -	if (ufshcd_is_rpm_autosuspend_allowed(hba))
> +	/*
> +	 * Block runtime-pm until all consumers are added.
> +	 * Refer ufshcd_setup_links().
> +	 */
> +	if (is_device_wlun(sdev))
> +		pm_runtime_get_noresume(&sdev->sdev_gendev);
> +	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
>  		sdev->rpm_autosuspend = 1;
>  
>  	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);

The following code is executed before ufshcd_async_scan() is called:

	dev = hba->dev;
	[ ... ]
	/* Hold auto suspend until async scan completes */
	pm_runtime_get_sync(dev);

and the following code occurs in ufshcd_add_lus():

	pm_runtime_put_sync(hba->dev);

Isn't that sufficient to postpone enabling of runtime PM until LUN
scanning has finished? Or in other words, is adding a
pm_runtime_get_noresume() call in ufshcd_slave_configure() really necessary?

> @@ -4979,15 +5035,9 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>  			 */
>  			if (!hba->pm_op_in_progress &&
>  			    !ufshcd_eh_in_progress(hba) &&
> -			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr) &&
> -			    schedule_work(&hba->eeh_work)) {
> -				/*
> -				 * Prevent suspend once eeh_work is scheduled
> -				 * to avoid deadlock between ufshcd_suspend
> -				 * and exception event handler.
> -				 */
> -				pm_runtime_get_noresume(hba->dev);
> -			}
> +			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
> +				/* Flushed in suspend */
> +				schedule_work(&hba->eeh_work);

What makes it safe to leave out the above pm_runtime_get_noresume() call?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
