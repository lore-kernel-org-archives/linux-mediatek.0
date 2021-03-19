Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADA3C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:12:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0401A64EB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0401A64EB3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiAIONLd9/JUNdvXBcZiLSNpTjRWafME+gH4ffW1nOE=; b=MfYfVEN7du7kBfjwH56180SbQ
	Cohx10102HifI+PvM3Z4k9Gp52N+ShfTpeCP9irtO4B9VXCRu37Qf/ulXxtY4RZkM0qeyAT6quuof
	xQR3/sP1k0TZYavfzJWxaXv+DovnwvceCfLMR7Xa4Pl8YSzvJbgjFHgziVX3Llxr7La8OwsQDnldy
	+QNBahIjHruLDCWUoFxvBEjKbZhBZPbuJbnEwbXqxZyYIN+s3QswZvx3XOHa45pFc9yZmgg8gpbGI
	qwvd8pHuoSt0aLbbrzD2b1pW7/MF+VVLa3ONPBMhA82eKlkge/Zf4pmJ+5D/vXfg2QnVJLDgb5UUU
	LyfKziQsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN5Yu-006NpO-Jc; Fri, 19 Mar 2021 03:12:32 +0000
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN5Yp-006Nnf-IZ; Fri, 19 Mar 2021 03:12:29 +0000
Received: by mail-pg1-f181.google.com with SMTP id k24so2743998pgl.6;
 Thu, 18 Mar 2021 20:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QPnNt2Q5gwIGxq8YNJSmsWgPXb6d+RK8/YXCxxPJffM=;
 b=tAl6nhP1bAX+xHcFO4DIFDOqJn7laZmEzvI1u8XKmOPvPUbWm1MbYbmipwK1xg62/b
 UaVzQ6S9MQNyB8Yok5Dr9BfIA+BUsHb4LbHS77hejGn3oywKPEszdNChXH4I/VODv2s3
 PoIA7uzbcJDlNrGr0KplrzduzmYBAUFJmXctSlk7QZvhEhKsa6fCScINQQzVPH5SGL2p
 Zx+uNphzcGk2j8+LtiJC+ZS6o6mrWio2Gu9uwFanuLrtz4qiuHIgbRhWRr4tkJEbi24d
 NC/ANeSQgn31pf/X25Ub7AaIoyrPGxSGu/TurcscJlgG9crE0gojqsoBcZFzr8nkXw8g
 BCRg==
X-Gm-Message-State: AOAM533PWRQqsz30j0+VSFKhfaYcmGFFHRD38okQOfFfElF406Sc4wII
 A+ACH14wGfS1arwKV+TVzOKqB4rPkRO25Q==
X-Google-Smtp-Source: ABdhPJwfFHQEQwnjE1zKW9cAw1O9qK8JUiS4pOAOpm6vvbl1t/JC568LJtBSzb7hPf2kaVpgpisIZw==
X-Received: by 2002:aa7:96c9:0:b029:200:503d:19df with SMTP id
 h9-20020aa796c90000b0290200503d19dfmr7208817pfq.46.1616123544961; 
 Thu, 18 Mar 2021 20:12:24 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:14ae:768b:f663:b4db?
 ([2601:647:4000:d7:14ae:768b:f663:b4db])
 by smtp.gmail.com with ESMTPSA id s194sm3752836pfs.57.2021.03.18.20.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 20:12:24 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
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
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <e9dc046d-3a88-9802-df58-60209ea8484f@acm.org>
Date: Thu, 18 Mar 2021 20:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_031227_795470_04447420 
X-CRM114-Status: GOOD (  29.11  )
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

On 3/18/21 5:35 PM, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU to wlun during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().

What is the role of the WLUN during runtime suspend and why does a
command need to be sent to the WLUN during runtime suspend? Although it
is possible to derive this from the source code, please explain this in
the patch description.

What does the acronym SSU stand for? This doesn't seem like a commonly
used kernel acronym to me so please expand that acronym.

> Fix this by registering ufs device wlun as a scsi driver and
> registering it for block runtime-pm. Also make this as a
> supplier for all other luns. That way, this device wlun
> suspends after all the consumers and resumes after
> hba resumes.

That's an interesting solution.

> -void __exit ufs_debugfs_exit(void)
> +void ufs_debugfs_exit(void)

Is the above change related to the rest of this patch?

>  static struct platform_driver ufs_qcom_pltform = {
> diff --git a/drivers/scsi/ufs/ufs_bsg.c b/drivers/scsi/ufs/ufs_bsg.c
> index 5b2bc1a..cbb5a90 100644
> --- a/drivers/scsi/ufs/ufs_bsg.c
> +++ b/drivers/scsi/ufs/ufs_bsg.c
> @@ -97,7 +97,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>  
>  	bsg_reply->reply_payload_rcv_len = 0;
>  
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);

Can the pm_runtime_get_sync() to scsi_autopm_get_device() changes be
moved into a separate patch?

> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}

Has this patch been verified with checkpatch? Checkpatch should have
reported the following for the above code:

	return is not a function, parentheses are not required

> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}

Same comment here.

>  		/*
> -		 * Don't assume anything of pm_runtime_get_sync(), if
> +		 * Don't assume anything of resume, if
>  		 * resume fails, irq and clocks can be OFF, and powers
>  		 * can be OFF or in LPM.
>  		 */

Please make better use of the horizontal space in the above comment by
making comment lines longer.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
