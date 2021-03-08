Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94335C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 17:18:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35484651AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35484651AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NNYq/8++lQfl9rUCRs6JcJuUp6NllR/DR5PEKsvmOSg=; b=S9fSoxsSpP4RgFeSwGnYaoZun
	Zzag9r76q/tzjSfEUBinEYu0Ywv4NWVS/p+iANWcJktTCpbLgPDep6YACcRIhh9DVDZ9sMxWNECb6
	IaffoYrQwFCkwnbqAzuizHQxfK2EE1ag+RHWsyNSK3zcN1cUNLXgFQpy8Mi3Fj7aCARGyddTTQY/H
	l3SVlbBxmwurbgsJd/OVFtwWEIZjezyATlNSKClwg+LF6CWkvmVJ/ZyPNU63Vfcdy3axANBPrmODh
	uDT7wz03Bvi8la+zhBIXyZ0ZsgyRZy55M0gruK/OfYw6Dyds15YLKJvGEaWOrfRSR7snIg0AuP9YV
	B3q4tsSdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJW5-001JNZ-IT; Mon, 08 Mar 2021 17:18:01 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJVu-001JJi-1A; Mon, 08 Mar 2021 17:17:52 +0000
Received: by mail-ot1-f51.google.com with SMTP id t16so9920799ott.3;
 Mon, 08 Mar 2021 09:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLAuJN9s4HTUz+X3eqpXsgn6nsnEDUj7ZWPMggJ9UkQ=;
 b=LcJvQf4KMN2YY5inogkm3bQJ9NipgcmRboF/ce/3anIxYoUaXw5w0ixbugbBUStDO0
 Y9D9TGCUtg6sioDe0mDLBwzRyJ6lij1PkbDZxRYTUjoDbJnkvS2aE+qYptl0U7TFC70r
 U6Yz1abAsUhO9u7ezqfaFOoNyIEw42Ku9QzWQSmCNikNjqj0jrI4uHN3dYWbxgknc4BT
 ixaoIvT1Jrzgdv73gcVlQcaQ9YgyUAOTu+ZR7Om+CEUxIOUUEoBxcKf4EL7iKQzil0Re
 oHJ0NopKHwpxaUcw+VKiffFj5cXGO2Q0u9tbO8pbw2ag5ZkTFyJuWtuKWW45RX9vynDo
 NMRQ==
X-Gm-Message-State: AOAM532VgnjK7R5DK4a6AWTBNrlLkOQ2BRququP13TB497CAFgXnn6u0
 62fB98Rpwo/wkrK6Jv+LuTUOeeW1HdlSprvZPmU=
X-Google-Smtp-Source: ABdhPJy3ixyulNXbgWmf58jGUR8/00MLlyH/pcH6DEyialh2MI6c5M/QGmRiA25J/arfLKcbGIBnHzQ42xcfMZe/12s=
X-Received: by 2002:a05:6830:1e03:: with SMTP id
 s3mr10129409otr.321.1615223867208; 
 Mon, 08 Mar 2021 09:17:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <0576d6eae15486740c25767e2d8805f7e94eb79d.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
 <20210306161616.GC74411@rowland.harvard.edu>
 <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
In-Reply-To: <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Mar 2021 18:17:35 +0100
Message-ID: <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
 Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Bean Huo <beanhuo@micron.com>, Lee Jones <lee.jones@linaro.org>, 
 Wei Yongjun <weiyongjun1@huawei.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>, 
 open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, 
 Linux-PM mailing list <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_171750_214316_7E8CF8E8 
X-CRM114-Status: GOOD (  26.06  )
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

On Mon, Mar 8, 2021 at 5:21 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, Mar 6, 2021 at 5:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, Mar 05, 2021 at 06:54:24PM -0800, Asutosh Das (asd) wrote:
> >
> > > Now during my testing I see a weird issue sometimes (1 in 7).
> > > Scenario - bootups
> > >
> > > Issue:
> > > The supplier 'ufs_device_wlun 0:0:0:49488' goes into runtime suspend even
> > > when one/more of its consumers are in RPM_ACTIVE state.
> > >
> > > *Log:
> > > [   10.056379][  T206] sd 0:0:0:1: [sdb] Synchronizing SCSI cache
> > > [   10.062497][  T113] sd 0:0:0:5: [sdf] Synchronizing SCSI cache
> > > [   10.356600][   T32] sd 0:0:0:7: [sdh] Synchronizing SCSI cache
> > > [   10.362944][  T174] sd 0:0:0:3: [sdd] Synchronizing SCSI cache
> > > [   10.696627][   T83] sd 0:0:0:2: [sdc] Synchronizing SCSI cache
> > > [   10.704562][  T170] sd 0:0:0:6: [sdg] Synchronizing SCSI cache
> > > [   10.980602][    T5] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > >
> > > /** Printing all the consumer nodes of supplier **/
> > > [   10.987327][    T5] ufs_device_wlun 0:0:0:49488: usage-count @ suspend: 0
> > > <-- this is the usage_count
> > > [   10.994440][    T5] ufs_rpmb_wlun 0:0:0:49476: PM state - 2
> > > [   11.000402][    T5] scsi 0:0:0:49456: PM state - 2
> > > [   11.005453][    T5] sd 0:0:0:0: PM state - 2
> > > [   11.009958][    T5] sd 0:0:0:1: PM state - 2
> > > [   11.014469][    T5] sd 0:0:0:2: PM state - 2
> > > [   11.019072][    T5] sd 0:0:0:3: PM state - 2
> > > [   11.023595][    T5] sd 0:0:0:4: PM state - 0 << RPM_ACTIVE
> > > [   11.353298][    T5] sd 0:0:0:5: PM state - 2
> > > [   11.357726][    T5] sd 0:0:0:6: PM state - 2
> > > [   11.362155][    T5] sd 0:0:0:7: PM state - 2
> > > [   11.366584][    T5] ufshcd-qcom 1d84000.ufshc: __ufshcd_wl_suspend - 8709
> > > [   11.374366][    T5] ufs_device_wlun 0:0:0:49488: __ufshcd_wl_suspend -
> > > (0) has rpm_active flags
>
> Do you mean that rpm_active of the link between the consumer and the
> supplier is greater than 0 at this point and the consumer is

I mean is rpm_active of the link greater than 1 (because 1 means "no
active references to the supplier")?

> RPM_ACTIVE, but the supplier suspends successfully nevertheless?
>
> > > [   11.383376][    T5] ufs_device_wlun 0:0:0:49488:
> > > ufshcd_wl_runtime_suspend <-- Supplier suspends fine.
> > > [   12.977318][  T174] sd 0:0:0:4: [sde] Synchronizing SCSI cache
> > >
> > > And the the suspend of sde is stuck now:
> > > schedule+0x9c/0xe0
> > > schedule_timeout+0x40/0x128
> > > io_schedule_timeout+0x44/0x68
> > > wait_for_common_io+0x7c/0x100
> > > wait_for_completion_io+0x14/0x20
> > > blk_execute_rq+0x90/0xcc
> > > __scsi_execute+0x104/0x1c4
> > > sd_sync_cache+0xf8/0x2a0
> > > sd_suspend_common+0x74/0x11c
> > > sd_suspend_runtime+0x14/0x20
> > > scsi_runtime_suspend+0x64/0x94
> > > __rpm_callback+0x80/0x2a4
> > > rpm_suspend+0x308/0x614
> > > pm_runtime_work+0x98/0xa8
> > >
> > > I added 'DL_FLAG_RPM_ACTIVE' while creating links.
> > >       if (hba->sdev_ufs_device) {
> > >               link = device_link_add(&sdev->sdev_gendev,
> > >                                   &hba->sdev_ufs_device->sdev_gendev,
> > >                                  DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
> > > I didn't expect this to resolve the issue anyway and it didn't.
> > >
> > > Another interesting point here is when I resume any of the above suspended
> > > consumers, it all goes back to normal, which is kind of expected. I tried
> > > resuming the consumer and the supplier is resumed and the supplier is
> > > suspended when all the consumers are suspended.
> > >
> > > Any pointers on this issue please?
> > >
> > > @Bart/@Alan - Do you've any pointers please?
> >
> > It's very noticeable that although you seem to have isolated a bug in
> > the power management subsystem (supplier goes into runtime suspend
> > even when one of its consumers is still active), you did not CC the
> > power management maintainer or mailing list.
> >
> > I have added the appropriate CC's.
>
> Thanks Alan!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
