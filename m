Return-Path: <SRS0=D+wH=IE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037F7C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 16:16:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC4C64FAD
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 16:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC4C64FAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4knzu10g3IfeuGVpcLfU2eh2fgpvFjx3j9DsYA2DDTI=; b=TSkEFcH7VWk17e6mhnXxFQMt1
	beqpBgwrM5WliXgf0lV0OB8o3qNwBd9YF9QY532Zjhb9Mu3B69kS+o6BHSD4rWqWNUE5oKu2gUOkc
	DW5QbeAwg3Gt1BhU1dLachtLs4tK6avo97P46x6+9EJibFJTv03hsUegFhWrw78lQgsQelHf7t84z
	MICf5dC8JieY4hSY/SatSUwq2TKD5JOwit6RI2HL8Snqn50X15G+cDraRGvNDgQ/PrbT8bWcrV4QW
	oNOOC245qOf3VbSEV8DA8/AuKIZNhVmUCyeyC4FSzsdOaMuASsr42Zp51QxZ4WBHoZVskh5MttCFL
	9Mid/WgjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIZbW-003bYn-A1; Sat, 06 Mar 2021 16:16:36 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by desiato.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lIZbK-003bVN-Lf
 for linux-mediatek@lists.infradead.org; Sat, 06 Mar 2021 16:16:25 +0000
Received: (qmail 74844 invoked by uid 1000); 6 Mar 2021 11:16:16 -0500
Date: Sat, 6 Mar 2021 11:16:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Asutosh Das \(asd\)" <asutoshd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>, linux-arm-msm@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Bean Huo <beanhuo@micron.com>,
 Lee Jones <lee.jones@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, 
 Linux-PM mailing list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
Message-ID: <20210306161616.GC74411@rowland.harvard.edu>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <0576d6eae15486740c25767e2d8805f7e94eb79d.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_161623_029676_532E3897 
X-CRM114-Status: GOOD (  15.00  )
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

On Fri, Mar 05, 2021 at 06:54:24PM -0800, Asutosh Das (asd) wrote:

> Now during my testing I see a weird issue sometimes (1 in 7).
> Scenario - bootups
> 
> Issue:
> The supplier 'ufs_device_wlun 0:0:0:49488' goes into runtime suspend even
> when one/more of its consumers are in RPM_ACTIVE state.
> 
> *Log:
> [   10.056379][  T206] sd 0:0:0:1: [sdb] Synchronizing SCSI cache
> [   10.062497][  T113] sd 0:0:0:5: [sdf] Synchronizing SCSI cache
> [   10.356600][   T32] sd 0:0:0:7: [sdh] Synchronizing SCSI cache
> [   10.362944][  T174] sd 0:0:0:3: [sdd] Synchronizing SCSI cache
> [   10.696627][   T83] sd 0:0:0:2: [sdc] Synchronizing SCSI cache
> [   10.704562][  T170] sd 0:0:0:6: [sdg] Synchronizing SCSI cache
> [   10.980602][    T5] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> 
> /** Printing all the consumer nodes of supplier **/
> [   10.987327][    T5] ufs_device_wlun 0:0:0:49488: usage-count @ suspend: 0
> <-- this is the usage_count
> [   10.994440][    T5] ufs_rpmb_wlun 0:0:0:49476: PM state - 2
> [   11.000402][    T5] scsi 0:0:0:49456: PM state - 2
> [   11.005453][    T5] sd 0:0:0:0: PM state - 2
> [   11.009958][    T5] sd 0:0:0:1: PM state - 2
> [   11.014469][    T5] sd 0:0:0:2: PM state - 2
> [   11.019072][    T5] sd 0:0:0:3: PM state - 2
> [   11.023595][    T5] sd 0:0:0:4: PM state - 0 << RPM_ACTIVE
> [   11.353298][    T5] sd 0:0:0:5: PM state - 2
> [   11.357726][    T5] sd 0:0:0:6: PM state - 2
> [   11.362155][    T5] sd 0:0:0:7: PM state - 2
> [   11.366584][    T5] ufshcd-qcom 1d84000.ufshc: __ufshcd_wl_suspend - 8709
> [   11.374366][    T5] ufs_device_wlun 0:0:0:49488: __ufshcd_wl_suspend -
> (0) has rpm_active flags
> [   11.383376][    T5] ufs_device_wlun 0:0:0:49488:
> ufshcd_wl_runtime_suspend <-- Supplier suspends fine.
> [   12.977318][  T174] sd 0:0:0:4: [sde] Synchronizing SCSI cache
> 
> And the the suspend of sde is stuck now:
> schedule+0x9c/0xe0
> schedule_timeout+0x40/0x128
> io_schedule_timeout+0x44/0x68
> wait_for_common_io+0x7c/0x100
> wait_for_completion_io+0x14/0x20
> blk_execute_rq+0x90/0xcc
> __scsi_execute+0x104/0x1c4
> sd_sync_cache+0xf8/0x2a0
> sd_suspend_common+0x74/0x11c
> sd_suspend_runtime+0x14/0x20
> scsi_runtime_suspend+0x64/0x94
> __rpm_callback+0x80/0x2a4
> rpm_suspend+0x308/0x614
> pm_runtime_work+0x98/0xa8
> 
> I added 'DL_FLAG_RPM_ACTIVE' while creating links.
>       if (hba->sdev_ufs_device) {
>               link = device_link_add(&sdev->sdev_gendev,
>                                   &hba->sdev_ufs_device->sdev_gendev,
>                                  DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
> I didn't expect this to resolve the issue anyway and it didn't.
> 
> Another interesting point here is when I resume any of the above suspended
> consumers, it all goes back to normal, which is kind of expected. I tried
> resuming the consumer and the supplier is resumed and the supplier is
> suspended when all the consumers are suspended.
> 
> Any pointers on this issue please?
> 
> @Bart/@Alan - Do you've any pointers please?

It's very noticeable that although you seem to have isolated a bug in
the power management subsystem (supplier goes into runtime suspend
even when one of its consumers is still active), you did not CC the
power management maintainer or mailing list.

I have added the appropriate CC's.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
