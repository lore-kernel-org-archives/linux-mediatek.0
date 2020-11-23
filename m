Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9808BC56201
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:02:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275D120DD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1AFNsiq2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 275D120DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NT/aWS+Rmod5/Om9kZlUSeE023GrhJCawsEIlPDsD4o=; b=1AFNsiq2PXRbhOJCD5I3tbWwx
	gvvZCPktwFtDl0XlAx36aIMIBOwyhrQ/TM+mttA+ZU2Si+qxeadKqSNY01+CuyLTkbascCyRfH59w
	CpI5Afc3Jo3RhbGTkBjx6vVibHP0K7gclMgbujqE9j64wtqy+1ZZ0K6xKf8yPjDT3MJy+PYcLjuLj
	2t6BJ2AvzynKL0rdXgND6vwY4bNQDBCEhKwnTNTRA2dnwCbogOt5j02QWKKAs6c6ijOCVxFxzi7ps
	IUk0qrbsaiS2+votxFGjW7mGpYVkOx3kh9yYPld6UlcufcHylmzYkSwP4Wbvb1c/DL2HbJcq4OUtN
	h8GvzB3mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh27E-0006hn-Eg; Mon, 23 Nov 2020 03:02:08 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh27B-0006gj-SK
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 03:02:06 +0000
Received: (qmail 695174 invoked by uid 1000); 22 Nov 2020 22:02:02 -0500
Date: Sun, 22 Nov 2020 22:02:02 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Can Guo <cang@codeaurora.org>
Subject: Re: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone
 during system resume/thaw/restore
Message-ID: <20201123030202.GA694907@rowland.harvard.edu>
References: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
 <20201120163524.GB619708@rowland.harvard.edu>
 <ff2975f88cc452d134b8bf24c55bec09@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff2975f88cc452d134b8bf24c55bec09@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_220205_991382_4AE8D8C4 
X-CRM114-Status: GOOD (  28.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 09:23:53AM +0800, Can Guo wrote:
> Hi Alan,
> 
> On 2020-11-21 00:35, Alan Stern wrote:
> > On Fri, Nov 20, 2020 at 12:37:22AM -0800, Can Guo wrote:
> > > Runtime resume is handled by runtime PM framework, no need to forcibly
> > > set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.
> > 
> > Sorry, I don't understand this explanation at all.
> > 
> > Sure, runtime resume is handled by the runtime PM framework.  But this
> > patch changes the code for system resume, which is completely different.
> > 
> > Following a system resume, the hardware will be at full power.  We don't
> > want the kernel to think that the device is still in runtime suspend;
> > otherwise is would never put the device back into low-power mode.
> 
> How about adding below lines to the patch?
> 
> diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
> index 908f27f..7ebe582 100644
> --- a/drivers/scsi/scsi_pm.c
> +++ b/drivers/scsi/scsi_pm.c
> @@ -75,9 +75,11 @@ static int scsi_dev_type_resume(struct device *dev,
>         const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
>         int err = 0;
> 
> -       err = cb(dev, pm);
> -       scsi_device_resume(to_scsi_device(dev));
> -       dev_dbg(dev, "scsi resume: %d\n", err);
> +       if (pm_runtime_active(dev)) {
> +               err = cb(dev, pm);
> +               scsi_device_resume(to_scsi_device(dev));
> +               dev_dbg(dev, "scsi resume: %d\n", err);
> +       }
> 
>         return err;
>  }
> 
> Whenever a device is accessed, the issuer or somewhere in the path
> should do something like pm_runtime_get_sync (e.g. in sg_open()) or
> pm_runtime_resume() (e.g. in blk_queue_enter()), in either sync or
> async way. After the job (read/write/ioctl or whatever) is done,
> either a pm_runtime_put_sync() or auto runtime suspend puts the device
> back into runtime suspended/low-power mode. Since the func
> scsi_bus_suspend_common() does nothing if device is already in runtime
> suspended mode, scsi_dev_type_resume() should only resume the device
> if it is runtime active.

You're starting to think along the right lines, but you are ignoring all 
the other work that people have already done for handling these cases.

Please read Documentation/driver-api/pm/devices.rst very carefully, 
especially the parts about returning a positive value from the ->prepare 
callback (also known as "direct-complete" and related to the 
DPM_FLAG_NO_DIRECT_COMPLETE and DPM_FLAG_SMART_PREPARE flags) and the 
parts about the DPM_FLAG_SMART_SUSPEND and DPM_FLAG_MAY_SKIP_RESUME 
flags.  Then think about what you want to accomplish and write a patch 
that takes all this information into account.

Key point: At no time should any part of the kernel think that the 
device is in a low-power state when it is actually in a high-power 
state, or vice versa.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
