Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EEAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:55:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0152B64EE9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0152B64EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A4nxIk/hnUi75O+WZwpFZimjBWU/rTJ8xpYRDtkg7Wg=; b=nPOQiZQyPcxzAB23/14O3lfRW
	iKW05/AM6vBYXWVZLPnHVkz4suxg3h7fHDCPAL7CBkuUrAztXBD9mCkZFcYy1fb52QGJXuEVGsLo8
	I2YQmah2iLzlH01EoZVpSyAcSEwYIwNubovZbr+Km9a2yMG7AkWUJ+7l4DCrgiQJay2v3jNCj6xZq
	JwrWbDdo4IbvrnA2P6iIzEUOiofLaTAYpwgVbmua+nSwTne2nGB83ab7+WXyc2bxq0hmmqcq5Scn3
	yJ2PPDHk+Lafms/eJv+OKW2dt8om3p/BaKY1ZTa0DeTl8DZ/tcgrmo/bsxt6JNMAFqTu+pg/u8o8V
	mWxljeFbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHViF-005tqc-MK; Wed, 03 Mar 2021 17:55:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSwx-005FxW-Lc; Wed, 03 Mar 2021 14:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uafthGO0eBeU1ZJtN8FFliWS6JCZkjYq6BkJ5HY1omI=; b=WZBYssyF3e3Mk2rNC5Lffdxbh4
 yXpgOdvScnMho9EheUwNPViTkukT+UEJVScQ98nuGmW48l1YB95P3gLVvNzhOCDTzZ06KBHEH8N11
 B3V3WA7g1VJQToWwNe/zZw0S5bLdqBjH59vTn9ushae4rB8MAbpBOo0uAUKP3Zx2hNJGL2jU5APlH
 c2rQdbtXEMXdS3VWXSau5UJeDc8xr//dbRcxHwRkw+G9OEmMv4wFqfLN2JOm25+b9pcJ2QkgFlWRQ
 GrMf9/25j7yDeOa808B0H6FdQfX03ktPVDhZ5vLq/zFqs3F3TWLlrGXB1jHAqKjGGQFrrc7g9DS4I
 dZhc0nBQ==;
Received: from mga17.intel.com ([192.55.52.151])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH5oB-00HFNc-5p; Tue, 02 Mar 2021 14:15:39 +0000
IronPort-SDR: b79136Hwb3FZoem3qkW3K50wa4awRJ8TR5PaNaj1tU1Vchr3nrpie513wsK8yE2av4ZelmsDlr
 TtPZakZWXtIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166702921"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="166702921"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 06:14:19 -0800
IronPort-SDR: XsTTl1bvinkrhr7HkvJW8Mx35RMJU4Z9LNHPZV1ptjWnpLJg2E517DX3NDo03/LbzpRIqg94RZ
 tEFORZFpH4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="399037378"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76])
 ([10.237.72.76])
 by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2021 06:14:10 -0800
Subject: Re: [PATCH v9 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Bean Huo <beanhuo@micron.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1614655058.git.asutoshd@codeaurora.org>
 <b291bb65fadc9c828cbcb4ffb81cfa1ee47b82be.1614655058.git.asutoshd@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d17e52e0-cb50-50ee-accb-458b318014e5@intel.com>
Date: Tue, 2 Mar 2021 16:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b291bb65fadc9c828cbcb4ffb81cfa1ee47b82be.1614655058.git.asutoshd@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_141539_778586_1423E50A 
X-CRM114-Status: GOOD (  13.53  )
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

On 2/03/21 5:21 am, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU to wlun during its runtime-suspend.
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

Now we need either to move the suspend/resume vops from
ufshcd_suspend/resume to __ufshcd_wl_suspend/resume, assuming that
would work for existing implementations of those callbacks,
or otherwise create new vops ->wl_suspend() / ->wl_resume(), and
then split the existing implementations of those callbacks.

ufs_intel_resume() now needs to be invoked from __ufshcd_wl_resume().
I am not sure about the others:

	exynos_ufs_suspend()
	exynos_ufs_resume()
	ufs_hisi_suspend()
	ufs_hisi_resume()
	ufs_mtk_suspend()
	ufs_mtk_resume()
	ufs_qcom_suspend()
	ufs_qcom_resume()

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
