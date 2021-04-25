Return-Path: <SRS0=cpQ6=JW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2DFC433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 12:21:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F34C61208
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 12:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F34C61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Za/+RM3YEMqYv6bhI1h9LYVnX3tqrHBeXnAxJ8wH04E=; b=VvAQCnr777/qJQNJM3BP7v74n
	zXvrQx+mdIii0efvRpeIhyn8FMl0W6iuYPOUmkSB9iNuyUJHBYzLE8r87x6AUgn2Ew/14dQJ9pCp2
	cTGntLJKFouJcunOjbq8tIsZndZEL1q0HnX31IM06REjJIn5uVVFYF60EhI2uU8wmkhhnpgR4aW38
	Ll12cOlvnJv0mrw/KkiWA2mkf+HG8pgvvQMwGeKfy/qfL9NMVAurYyjjLqfNmr01yYhXzfjiNy774
	YHt2vGFt7Ci5qXdrSncxI5ZqwcE1wvM9tPU/8D8dP+fmwn3dnjsA18wsWrLo575oVrJKk+F/+nLtM
	kpPmizBag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ladkh-005bLZ-Me; Sun, 25 Apr 2021 12:20:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ladkU-005bKY-7s; Sun, 25 Apr 2021 12:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=xlK2+AWpamZn1qEwMzVZhBhVvPSDM/5wJkpyingt7C4=; b=nOBjxRVoun2p2oUdrs4TVgI4Jn
 xkXYmo/Bq9qftCCzUWKT1iVPJOh/Us4teXOZ5fYqqDVNj8apKEcLjClm62ASFy1PQjWf31qC3+SQ+
 37OtU6XqEH97XMdlkGb6IuGuijjtLT80JqhHatQHQXhTv+vzBcww7IZBzBkIIGcGzfhjPY/fbH4OY
 WEgr90WsOS4JOcx/rww9Emit9Mqg+vDUNjRHB0vWFVxnmD01wdP7JReVNMKZjPKQRgBwa6jd3W8Iu
 XYl8+kc6K1u0SZouZpSgu048/CnLU+kF1lmjZ9gsFWCwptrF5q1oXPgzSlK9m0OuUwBaBAkRZnCfu
 zv3PWCww==;
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ladkM-00FQrm-KZ; Sun, 25 Apr 2021 12:20:27 +0000
IronPort-SDR: EtfT2jJmn/+ed7OSSRmo7Whc1uauRwP/UjCE03L2c7Q/d0UzHK7hMwfvFIdYQA7JCzdI+E5QEY
 r8rAPjHdtA+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9964"; a="193044830"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; d="scan'208";a="193044830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2021 05:20:15 -0700
IronPort-SDR: GxK5WXx/z622EJjt1X62nNHOczMp0htXHT9ESudgp9qLN//i2ptdHbhzT+AjYbgA8YexELGMTf
 p+sz0c6acvZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; d="scan'208";a="422296359"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2021 05:20:06 -0700
Subject: Re: [PATCH v21 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
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
 Bart van Assche <bvanassche@acm.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1619223249.git.asutoshd@codeaurora.org>
 <4662c462e79e3e7f541f54f88f8993f421026d83.1619223249.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9e0655c3-42cf-d090-8aa5-2cb644b2e93c@intel.com>
Date: Sun, 25 Apr 2021 15:20:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4662c462e79e3e7f541f54f88f8993f421026d83.1619223249.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_052022_727742_E4C369B7 
X-CRM114-Status: GOOD (  18.50  )
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

On 24/04/21 3:20 am, Asutosh Das wrote:
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
> hba resumes. This also registers a new scsi driver for rpmb wlun.
> This new driver is mostly used to clear rpmb uac.
> 
> Fixed smatch warnings:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Co-developed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

Note we don't use regulators, clocks, clock scaling or gating.
Although those things do look OK.
Notwithstanding that:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
