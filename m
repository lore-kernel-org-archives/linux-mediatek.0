Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CE6C2D0C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 02:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA7E206CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 02:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkO6cbt6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="jjjPD5VZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBA7E206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mmcjlJYUkuaMwFDwMAIQbinVkhf3sUeushptEu1A9rY=; b=dkO6cbt6bsXuRSyMEkZr1Oh0R
	D/EacTK9b2gxGkwEzedNEzlk33xFBgPnPahmXcuZ0WNohtESqwxZ+r1ELLCzhhexcceC9ajpmwr8Q
	LqFMbLykeNYPCebo8W2AFt6QQTjeP3YBgFimVYBa5q4TzIeRLOZOuriwAluXWr5tH8XZkd0g0NW8w
	RZZeqrSBT/qdTC9eUW1dP1p1nDrpl5UNfMFSn4rTMAWuzDyk8vbNTdGCaeCu4dw1FSsiA7NmMJHz4
	AcBA12ua+EITa9j1FXUyq3X9RjNSCQ6pak7hyrVxhcrS3460q7tMmN2yi2hMdi6pFvpkrXMpY7dcq
	m4pFI/BRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1im72T-0001fg-Rq; Tue, 31 Dec 2019 02:13:41 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1im72Q-0001ej-Kh
 for linux-mediatek@lists.infradead.org; Tue, 31 Dec 2019 02:13:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577758419; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Jhy+WJImFEcoO6HBDQ7TVinBKkDR7LQeAKpQxrPTrnQ=;
 b=jjjPD5VZXd7EJ18o8Bi4UnZklngqTtIc1fak+bulYfetc8M0lrb0n0XDAtEyFEl9AQtns5rh
 /UbErl0mjlOe1m3fOCgEDu03i6j+ey+Ma8R84wRk73lpJEr840fdZZDW4EPnDSIj6KUPu88R
 IK1AaP81qrEJuFAxX8KrGsJsMVI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0aaec9.7f5cdbd8e0a0-smtp-out-n03;
 Tue, 31 Dec 2019 02:13:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54736C4479F; Tue, 31 Dec 2019 02:13:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 900A1C43383;
 Tue, 31 Dec 2019 02:13:27 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 31 Dec 2019 10:13:27 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power mode
 during initialization only
In-Reply-To: <1577754469.13164.5.camel@mtkswgap22>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
Message-ID: <836772092daffd8283a97d633e59fc34@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_181339_297309_C91AF0B3 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: linux-scsi-owner@vger.kernel.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, subhashj@codeaurora.org, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, andy.teng@mediatek.com, matthias.bgg@gmail.com,
 beanhuo@micron.com, pedrom.sousa@synopsys.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-31 09:07, Stanley Chu wrote:
> Hi Asutosh,
> 
> 
>> I see that there's a get_sync done before.
>> So, how would the suspend be triggered in that case?
>> 
> 
> Would you mean pm_runtime_get_sync() in ufshcd_init()?
> If yes, it will only happen during initialization.
> 
> The runtime resume path may go through ufshcd_probe_hba() without
> ufshcd_init() invoked before, for example,
> 
> ufshcd_probe_hba+0xe10/0x1874
> ufshcd_host_reset_and_restore+0x114/0x1a4
> ufshcd_resume+0x1d0/0x480
> ufshcd_runtime_resume+0x40/0x188
> ufshcd_pltfrm_runtime_resume+0x10/0x18
> pm_generic_runtime_resume+0x24/0x44
> __rpm_callback+0x100/0x250
> rpm_resume+0x548/0x7c8
> rpm_resume+0x2b4/0x7c8
> rpm_resume+0x2b4/0x7c8
> rpm_resume+0x2b4/0x7c8
> pm_runtime_work+0x9c/0xa0
> process_one_work+0x210/0x4e0
> worker_thread+0x390/0x520
> kthread+0x154/0x18c
> ret_from_fork+0x10/0x18
> 
> This case happens if link is in "off" state while resume.
> 
> Thanks,
> Stanley

Hi Stanley,

I see skipping ufshcd_set_ufs_dev_active() in ufshcd_probe_hba()
if it is called from ufshcd_resume() path is the purpose here.

If so, then ufshcd_set_dev_pwr_mode() would be called, meaning
SSU command will be sent. Why is this SSU command needed to be
sent after a full host reset and restore? Is ufshcd_probe_hba()
not enough to make UFS device fully functional?

<snip>
         } else if (ufshcd_is_link_off(hba)) {
                 ret = ufshcd_host_reset_and_restore(hba);
                 /*
                  * ufshcd_host_reset_and_restore() should have already
                  * set the link state as active
                  */
                 if (ret || !ufshcd_is_link_active(hba))
                         goto vendor_suspend;
         }

         if (!ufshcd_is_ufs_dev_active(hba)) {
                 ret = ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE);
                 if (ret)
                         goto set_old_link_state;
         }
<snip>

Thanks,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
