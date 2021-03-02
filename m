Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A936BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:29:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238A464EF9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238A464EF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PmDeD4mo99DvBA4cAoJeoMcuwjVqGs+9jTASj71Nf88=; b=AVTIgdSmwy9chyao66tL2ePXX
	dy3+c/VqjpyMqGzd1s8is8dUHhmfRho0sMCNdYSmJ5kE6jPLuJ0QvsM/wUboKub0t5Lisa+48W0Jf
	Ukaj2f4ZhYi+FUSdMw9k07oMgWbwNlA+OwSZsEwYNQzphcTjZ9WjzdAItUiVC9dxCDOdCkBdFYKGq
	A4/tMwQnVW3UFap5swJEGWYPls5VDKK8E9W056FXtZBgRkVJ6nzGTimL0YiGe/epPSgxzBAQSljlY
	d3t/jjImgvGuWTj126oz734nUqKDBB1hUKLF2+0YtCmB/14cjR/qF+3gMz34wfYSfNKtmjpqCJr4B
	TqWgZ9g2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHY7H-006Q0e-6d; Wed, 03 Mar 2021 20:29:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT5b-005Io8-C9
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i6HWitAvfuibUOrEhE9hWqjcYM7rHuJywCh3nQMG6cA=; b=kosF7gDUsaAkJQ05UgvwYFdZ3f
 fZnF63eV28IND4AyH8wXqp3B1brnsMJDCz6O8mxuKIa3XT1v+F6iO5Oic3yM2ex2OWCpbZ6FzCg2w
 FpwolsLaucmuMn8rTKY2y8oi0u+JRGKndhINnmK/RzdbzZVp9rrPy3xU0YG+4rUmF9h7bfc+T07zR
 Q1jec9V9ryvopdrm+QE463XAjVsSU/V/AJ7oILLV8bvfQjfVaVchCgTEp36e8r7JW3Ux4hwhvdTlv
 d3yVgYSWl0l1lhgZKOe5SsrcqoHiyILftBALdm3igjYs/uMDBaCHLORgMM2aVcuACjOSdXwZnHttR
 2dabm+tQ==;
Received: from z11.mailgun.us ([104.130.96.11])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7lD-00HQhu-BG
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 16:20:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614702034; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=i6HWitAvfuibUOrEhE9hWqjcYM7rHuJywCh3nQMG6cA=;
 b=ptBGa4sEvB5xiEYbGc+yXwSidYVdeoe1cKJ16AcF5D3JLJuAxSqT5iLuVLasMta6Cqb9eBKG
 y7yQhm+eNw395CsNVQEw6jUcbbKKCa2e8OIHGOcF33TigiVjuZlfPEHPmy0LO8BRnq9FF+Aj
 IF1aGmZFMXK2UhVZFSbHe64DmVw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 603e65bf4fd7814d5f8c73de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 16:20:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9EE7AC433CA; Tue,  2 Mar 2021 16:20:14 +0000 (UTC)
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E9ACC433C6;
 Tue,  2 Mar 2021 16:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E9ACC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date: Tue, 2 Mar 2021 08:20:10 -0800
From: Asutosh Das <asutoshd@codeaurora.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: cang@codeaurora.org, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Bean Huo <beanhuo@micron.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v9 1/2] scsi: ufs: Enable power management for wlun
Message-ID: <20210302162010.GH12147@stor-presley.qualcomm.com>
References: <cover.1614655058.git.asutoshd@codeaurora.org>
 <b291bb65fadc9c828cbcb4ffb81cfa1ee47b82be.1614655058.git.asutoshd@codeaurora.org>
 <d17e52e0-cb50-50ee-accb-458b318014e5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d17e52e0-cb50-50ee-accb-458b318014e5@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_162044_740794_8858E6C9 
X-CRM114-Status: GOOD (  14.11  )
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

On Tue, Mar 02 2021 at 06:14 -0800, Adrian Hunter wrote:
>On 2/03/21 5:21 am, Asutosh Das wrote:
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU to wlun during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
>>
>> Call trace:
>>  __switch_to+0x174/0x2c4
>>  __schedule+0x478/0x764
>>  schedule+0x9c/0xe0
>>  blk_queue_enter+0x158/0x228
>>  blk_mq_alloc_request+0x40/0xa4
>>  blk_get_request+0x2c/0x70
>>  __scsi_execute+0x60/0x1c4
>>  ufshcd_set_dev_pwr_mode+0x124/0x1e4
>>  ufshcd_suspend+0x208/0x83c
>>  ufshcd_runtime_suspend+0x40/0x154
>>  ufshcd_pltfrm_runtime_suspend+0x14/0x20
>>  pm_generic_runtime_suspend+0x28/0x3c
>>  __rpm_callback+0x80/0x2a4
>>  rpm_suspend+0x308/0x614
>>  rpm_idle+0x158/0x228
>>  pm_runtime_work+0x84/0xac
>>  process_one_work+0x1f0/0x470
>>  worker_thread+0x26c/0x4c8
>>  kthread+0x13c/0x320
>>  ret_from_fork+0x10/0x18
>>
>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
>>
>> Co-developed-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
>
>Now we need either to move the suspend/resume vops from
>ufshcd_suspend/resume to __ufshcd_wl_suspend/resume, assuming that
>would work for existing implementations of those callbacks,
>or otherwise create new vops ->wl_suspend() / ->wl_resume(), and
>then split the existing implementations of those callbacks.
>
>ufs_intel_resume() now needs to be invoked from __ufshcd_wl_resume().
>I am not sure about the others:
>
>	exynos_ufs_suspend()
>	exynos_ufs_resume()
>	ufs_hisi_suspend()
>	ufs_hisi_resume()
>	ufs_mtk_suspend()
>	ufs_mtk_resume()
>	ufs_qcom_suspend()
>	ufs_qcom_resume()
>

Thanks. I'll change this in the next version.

-asd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
