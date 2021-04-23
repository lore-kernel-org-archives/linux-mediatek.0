Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E9C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 23:45:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A64BE61425
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 23:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64BE61425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3k9Xb0u/LC0eoNuthuwgHMNAsE42cQoxci0zagxcU18=; b=GGnQ0c0m1V4FwKA7aJW3LhIVC
	tiMwfZ8VhmF99cRRpkE7Ahz+5JzlDO1J+UF6fS9pnAWGkhx3eL7svWjcPUI4hrg/nwFwzQ+0JC8dG
	xW64IKiy0uV3nBBxeFJKExEhwxBDgNpHr2DmiSTBLZuypujLX+QOpNnoMyTvkzzO08EW1ZGfu6QII
	zCd+85I+7x6iUyzijAJc8VhAnPz2QzmAzJndQynCWCB7Nl2pHZE812O8Fchp/oPaJpAFPUntqw8L4
	/oO6GgAhc+4A/8gPIDLLHz9G8GEWqfUPqYsFV4H0ugTldh4BB00bY3KTxkHm67PgmJDOGaaLuUl82
	CBDXXrlCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la5Tk-002bXi-4m; Fri, 23 Apr 2021 23:44:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5Ti-002bXY-E6
 for linux-mediatek@desiato.infradead.org; Fri, 23 Apr 2021 23:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1rAl4/SGpigHk/EP46KWRcz1cpKU6hDAhQ42+J5NZgM=; b=Rm872Kxb3f+RWNTR1e/7Zh4NzZ
 mcKHxKf7djAN58OcytwKxQoHNZJl1E0KeAksv16qGMdX4+Kj9FRhrqS25Afl54oNzaV3LL3F7ySOX
 y/+M0dFU2peys6dtkuzXTr8yqaMXciLm/8ha7AY35uOdIca5E+Nt3Rc91Dp+BKMep4kNNLNekUVQk
 7bbh72d9VKu2Y7OVEQZiE+ElhpM+7DbMFbVxTTzFQkQEYDmEjXCRonRJ6fn8J8GbZScJaTbBHSKXx
 xgiVZpZoKVnlNA38WiwITAjmG8rnf/YknfNJDPoEw7uaaxEQu7tWAvFlkQjtlR8kr4w7i/r85mbHF
 XH8FDkQw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5Tb-00Em07-A3
 for linux-mediatek@lists.infradead.org; Fri, 23 Apr 2021 23:44:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619221490; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1rAl4/SGpigHk/EP46KWRcz1cpKU6hDAhQ42+J5NZgM=;
 b=mFpHJj/0/wdhE+Lm1dDbsS0XqnG28U6BNi1mvz5Va3qvc/3iDIs9R/uuxKhoOac2t3YJyrIT
 1XueoEzfG/aJAIkjg6xwMJ3wgBvJcw9PJQb2RV7HTqnWggSNqYE+CnGcGZXdHywfUUH3zu3p
 5O2uu8iyFqLJColNrXkMKrDdZ/w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60835bdf2cbba88980e7d5bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 23:44:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39F9EC43151; Fri, 23 Apr 2021 23:44:30 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 40434C433D3;
 Fri, 23 Apr 2021 23:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40434C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Yue Hu <huyue2@yulong.com>,
 Bart van Assche <bvanassche@acm.org>,
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
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
 <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
 <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
 <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
 <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
 <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
 <efe71230-5b6a-22a8-1aef-f1cae046df22@intel.com>
 <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
 <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <a71d6ac3-0dc6-4fa8-3643-6d3473d08797@codeaurora.org>
Date: Fri, 23 Apr 2021 16:44:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_164450_327847_2A98D6F0 
X-CRM114-Status: GOOD (  26.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/23/2021 1:01 AM, Adrian Hunter wrote:
>>
>>
> 

Hi Adrian,
Thanks for the help.
I made the changes and tried to reproduce it.
My setup becomes non-responsive and resets.
I don't think it's related to this issue though.

I hadn't set rpm_lvl and spm_lvl to 0 while testing the other day.
Setting those to 0, it proceeds further and now it becomes unresponsive. 
So I still don't clearly see the issue that you're seeing. However, I'd 
make the suggested changes and push it in next version.

> I think we also need to runtime resume RPMB WLUN before system suspend.
> e.g.
> 
> +static int ufshcd_rpmb_rpm_get_sync(struct ufs_hba *hba)
> +{
> +	return pm_runtime_get_sync(&hba->sdev_rpmb->sdev_gendev);
> +}
> +
> +static int ufshcd_rpmb_rpm_put(struct ufs_hba *hba)
> +{
> +	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
> +}
> +
>   void ufshcd_resume_complete(struct device *dev)
>   {
>   	struct ufs_hba *hba = dev_get_drvdata(dev);
>   
> +	if (hba->rpmb_complete_put) {
> +		hba->rpmb_complete_put = false;
> +		ufshcd_rpmb_rpm_put(hba);
> +	}
>   	if (hba->complete_put) {
>   		hba->complete_put = false;
>   		ufshcd_rpm_put(hba);
> @@ -9611,6 +9625,11 @@ int ufshcd_suspend_prepare(struct device *dev)
>   		return ret;
>   	}
>   	hba->complete_put = true;
> +
> +	if (hba->sdev_rpmb) {
> +		ufshcd_rpmb_rpm_get_sync(hba);
> +		hba->rpmb_complete_put = true;
> +	}
>   	return 0;
>   }
> 
> That also avoids another issue: if RPMB WLUN is runtime suspended at system resume, we have to skip clearing UAC, but SCSI PM will force the runtime status to RPM_ACTIVE after system resume, so the UAC never gets cleared in that case.
> 
> Furthermore, it seems better not to report errors from RPMB resume and instead let the error handler sort it out.
> So, with the above change, we can simplify a bit:
> 
> -static int ufshcd_rpmb_runtime_resume(struct device *dev)
> -{
> -	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> -
> -	if (hba->sdev_rpmb)
> -		return ufshcd_clear_rpmb_uac(hba);
> -	return 0;
> -}
> -
>   static int ufshcd_rpmb_resume(struct device *dev)
>   {
>   	struct ufs_hba *hba = wlun_dev_to_hba(dev);
>   
> -	if (hba->sdev_rpmb && !pm_runtime_suspended(dev))
> -		return ufshcd_clear_rpmb_uac(hba);
> +	if (hba->sdev_rpmb)
> +		ufshcd_clear_rpmb_uac(hba);
>   	return 0;
>   }
>   
>   static const struct dev_pm_ops ufs_rpmb_pm_ops = {
> -	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_runtime_resume, NULL)
> +	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_resume, NULL)
>   	SET_SYSTEM_SLEEP_PM_OPS(NULL, ufshcd_rpmb_resume)
>   };
> 
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
