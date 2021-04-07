Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA9CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 10:21:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B856139E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 10:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B856139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+vVrc9RtE9Qo5l1lkpy2fBQgCetei7rG2dq65vcsGs4=; b=L9iUFFfEMYQlDClQWpse0p8ij
	w+DS2aFiwGxVYwCpl+lflaq98U3qYIql69uqYK+EICd9Tgp9LTrw9w4yoZHh/V2ylHedNH4nagiCa
	+IiFiDhQU17xDOLcOkyAb1V07EqvmRMdGqg4Fhkkx3biXilkACx2JXebe2uJkNiMXI+fQF3KjvqV+
	qm/QZTjv98c5C27am/IJJMc4W/FuJaoHppfcrtm/BKAQpOkk8/UzkeZJ+OmEt2Nt/CI6GVpGjKzwH
	mImRWsYFGaPLvWWXs/JWZMU9IaVHIQh2NxDu24HpqtkLBdLLoLyyWL7ES6dm0sUCct2b6zpdIJghx
	ZIErvNXig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU5JS-004iIt-GW; Wed, 07 Apr 2021 10:21:30 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU5JF-004iFM-FS; Wed, 07 Apr 2021 10:21:20 +0000
IronPort-SDR: +v2YyuwdhTjA8BlapMywgVUEKhJwQ6O5nuGGlvfl4Fgy5bfXxgos69Mdf9KHRTspZYwdhb2LUW
 Dko2G6dmuouw==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="257263120"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="257263120"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 03:21:11 -0700
IronPort-SDR: vW8zGoqm/s2nTUAFKkQ/Ai2NnD8T0kZb0zK95O2/dghnkBIc9kqcKW3yAjkXysbybq8Nt731Sc
 DRKQlDIDhfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="441283571"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2021 03:21:05 -0700
Subject: Re: [PATCH v15 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Yue Hu <huyue2@yulong.com>,
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
References: <cover.1617731442.git.asutoshd@codeaurora.org>
 <5536f19fbbcfed1177a63458c6bd0b42ee6aa2e2.1617731442.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d1e694cb-e3ba-6066-d0c0-8c17120e7ba5@intel.com>
Date: Wed, 7 Apr 2021 13:21:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5536f19fbbcfed1177a63458c6bd0b42ee6aa2e2.1617731442.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_112118_102065_F19D6551 
X-CRM114-Status: GOOD (  18.69  )
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

On 6/04/21 8:52 pm, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU (START_STOP_UNIT) to wlun
> during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().
> 
> Call trace:
>  __switch_to+0x174/0x2c4
>  __schedule+0x478/0x764
>  schedule+0x9c/0xe0
>  blk_queue_enter+0x158/0x228
>  blk_mq_alloc_request+0x40/0xa4
>  blk_get_request+0x2c/0x70
>  __scsi_execute+0x60/0x1c4
>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>  ufshcd_suspend+0x208/0x83c
>  ufshcd_runtime_suspend+0x40/0x154
>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>  pm_generic_runtime_suspend+0x28/0x3c
>  __rpm_callback+0x80/0x2a4
>  rpm_suspend+0x308/0x614
>  rpm_idle+0x158/0x228
>  pm_runtime_work+0x84/0xac
>  process_one_work+0x1f0/0x470
>  worker_thread+0x26c/0x4c8
>  kthread+0x13c/0x320
>  ret_from_fork+0x10/0x18
> 
> Fix this by registering ufs device wlun as a scsi driver and
> registering it for block runtime-pm. Also make this as a
> supplier for all other luns. That way, this device wlun
> suspends after all the consumers and resumes after
> hba resumes.
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---

v15 seems to be missing the updates to ufs_debugfs_get/put_user_access
that were in v14:


@@ -60,14 +60,14 @@ __acquires(&hba->host_sem)
 		up(&hba->host_sem);
 		return -EBUSY;
 	}
-	pm_runtime_get_sync(hba->dev);
+	scsi_autopm_get_device(hba->sdev_ufs_device);
 	return 0;
 }
 
 static void ufs_debugfs_put_user_access(struct ufs_hba *hba)
 __releases(&hba->host_sem)
 {
-	pm_runtime_put_sync(hba->dev);
+	scsi_autopm_put_device(hba->sdev_ufs_device);
 	up(&hba->host_sem);
 }
 

Also from last comments, the issue below:

<SNIP>

> +#ifdef CONFIG_PM_SLEEP
> +static int ufshcd_wl_poweroff(struct device *dev)
> +{
> +	ufshcd_wl_shutdown(dev);

This turned out to be wrong.  This is a PM op and SCSI has already
quiesced the sdev's.  All that is needed is:

	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
