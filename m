Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD629C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:16:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518B864F36
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518B864F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VlCMbi25MHBXf0PSmA67jP29shyo/f+/ZvLZiov2CYk=; b=aAuZggttQLvFzNeHZyLreAT4m
	XtcRZP9EZz9unmzzk5M/8ETC6ytou+cUrDs9e0nm3uYytzTXA3+gqESi0VV6GXrTepo4Lqquv7rX5
	ZDscK6/Wy22FAdt/O9ZIa+1LswM5K/FzdONuaAjhhEAZXRGfZ2XXw8MON9BQMYfOYlNvtALsrLNUE
	gXUGYr7KW8pI0aPPJtl08PBpup2DzW+wkiquIJsIbZTs5J8Z3p32H9dX9gXEU1N2YLfSBp2oPz2ka
	3uWD57koXJ73lJyqOY/NH32NtyUeYSohTR+EA5ud8Ce5i42CrtMx90LlgWFBhZK4+BhmKSFR0O5cc
	QAUXogfyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpJz-005tkZ-9z; Wed, 10 Mar 2021 03:16:10 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by desiato.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpJ8-005tda-3M
 for linux-mediatek@lists.infradead.org; Wed, 10 Mar 2021 03:14:52 +0000
Received: (qmail 203946 invoked by uid 1000); 9 Mar 2021 22:14:38 -0500
Date: Tue, 9 Mar 2021 22:14:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Asutosh Das \(asd\)" <asutoshd@codeaurora.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, cang@codeaurora.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
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
Message-ID: <20210310031438.GB203516@rowland.harvard.edu>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <0576d6eae15486740c25767e2d8805f7e94eb79d.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
 <20210306161616.GC74411@rowland.harvard.edu>
 <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
 <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
 <f1e9b21d-1722-d20b-4bae-df7e6ce50bbc@codeaurora.org>
 <2bd90336-18a9-9acd-5abb-5b52b27fc535@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2bd90336-18a9-9acd-5abb-5b52b27fc535@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_031451_120501_929A6329 
X-CRM114-Status: GOOD (  14.77  )
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

On Tue, Mar 09, 2021 at 07:04:34PM -0800, Asutosh Das (asd) wrote:
> Hello
> I & Can (thanks CanG) debugged this further:
> 
> Looks like this issue can occur if the sd probe is asynchronous.
> 
> Essentially, the sd_probe() is done asynchronously and driver_probe_device()
> invokes pm_runtime_get_suppliers() before invoking sd_probe().
> 
> But scsi_probe_and_add_lun() runs in a separate context.
> So the scsi_autopm_put_device() invoked from scsi_scan_host() context
> reduces the link->rpm_active to 1. And sd_probe() invokes
> scsi_autopm_put_device() and starts a timer. And then driver_probe_device()
> invoked from __device_attach_async_helper context reduces the
> link->rpm_active to 1 thus enabling the supplier to suspend before the
> consumer suspends.

> I don't see a way around this. Please let me know if you
> (@Alan/@Bart/@Adrian) have any thoughts on this.

How about changing the SCSI core so that it does a runtime_get before
starting an async probe, and the async probe routine does a
runtime_put when it is finished?  In other words, don't allow a device
to go into runtime suspend while it is waiting to be probed.

I don't think that would be too intrusive.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
