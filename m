Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61793C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 17:55:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DDC60F9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 17:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3DDC60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDEYvWUNIxXOqfPX9Rl1kGOf9kJhQ+auV2UEikrSHS0=; b=WQY3U6ZWeunrTF
	npsnDmCg3bb8V6nlX8TQBNkYgNPkZPC4UYdJVR3WfLmhP5uBfZDzmSktN80GqlH08PH1/29U1PJ+n
	PJ0JRafbjFdEe4WLz9TRJmctZceocKJbr0shS/gAmWJxAvDnxB/9gIPXU+VFRYvs5NzE43TaOWBi5
	Y35PwWEaLoHcd/hIgDRaUzkQ28YYZ0QMsxwLl8+RA4VSWUGTMaavlk3R+RotHw9Ve1xPu2KyrNky9
	CavkA4QeL+9ni/GuZgiUgswr3WHAubqLClue0xPCe+gyX156wk1iJMohHJvdk4rHVBPyaeldrCUlN
	qfIsg+Cquois9thQX9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRPy-008Mnf-BG; Fri, 15 Oct 2021 17:54:54 +0000
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRPl-008MmE-AR; Fri, 15 Oct 2021 17:54:42 +0000
Received: by mail-pg1-f170.google.com with SMTP id c4so2199622pgv.11;
 Fri, 15 Oct 2021 10:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uR9uz/OLZele/hv90GFPXJReAhLyZUOecNTgoswKJTo=;
 b=5sw0fwJ0oTW0jLGgvU6oUrs7+o4KVbj7BnhSo1IQ3XkW49CYyaKfPVEWKnNTRwXxhI
 utu1KLiocIopGWhmyLSw+3Ca+lUAhNcps6QyTfcYGSOt+Igs/N74oQ1tCrVFmtQzCbwr
 rOhHPwsDFjT56IoKeQ4mLOSH5XRVRr8/aLJ6ygOCrzJcqDK6c+jqVL1KUQ7umP4hmZ0V
 /1k2/Cw8i/z+MusfKWB5n4FLWu8D/RthlGeRMFXffbkuAEy8pmuCxaU1ShNubUNBn/JJ
 Kn0r3Yr+y+e3zTugMFDzZWCLZGrWlgS4GZwgktdXyhthexQeZCCJxYMG8V5KpVTCvZB/
 lX/g==
X-Gm-Message-State: AOAM5339BJy5KNGFMDzLZdehDVycmoQHQ9pJtJmB3iJo0TlkEGE7vPWM
 gHBC3g5pq4+D3Wa8p6t72wg=
X-Google-Smtp-Source: ABdhPJzl6ayTJdtiiPH0GTkLc6dA9jF/TVYxeu3wirUyYx4iT6g+5fgvZVrqzcyBQ9mdvRXCJ71mSA==
X-Received: by 2002:a63:fc65:: with SMTP id r37mr10273633pgk.28.1634320479541; 
 Fri, 15 Oct 2021 10:54:39 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:cbb9:9363:2c17:8891?
 ([2601:647:4000:d7:cbb9:9363:2c17:8891])
 by smtp.gmail.com with ESMTPSA id u193sm5116561pgc.34.2021.10.15.10.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 10:54:38 -0700 (PDT)
Message-ID: <fe7bacf4-aa9a-6742-8382-a7c9b31236a7@acm.org>
Date: Fri, 15 Oct 2021 10:54:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Martin Kepplinger <martink@posteo.de>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
References: <20211015074654.19615-1-miles.chen@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211015074654.19615-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_105441_400172_45EB964C 
X-CRM114-Status: GOOD (  20.61  )
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

On 10/15/21 00:46, Miles Chen wrote:
> Crash:
> [    4.695171][  T151] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [    4.710577][  T151] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [    4.856708][  T151]  die+0x16c/0x59c
> [    4.857191][  T151]  __do_kernel_fault+0x1e8/0x210
> [    4.857833][  T151]  do_page_fault+0xa4/0x654
> [    4.858418][  T151]  do_translation_fault+0x6c/0x1b0
> [    4.859083][  T151]  do_mem_abort+0x68/0x10c
> [    4.859655][  T151]  el1_abort+0x40/0x64
> [    4.860182][  T151]  el1h_64_sync_handler+0x54/0x88
> [    4.860834][  T151]  el1h_64_sync+0x7c/0x80
> [    4.861395][  T151]  sd_resume_runtime+0x20/0x14c
> [    4.862025][  T151]  scsi_runtime_resume+0x84/0xe4
> [    4.862667][  T151]  __rpm_callback+0x1f4/0x8cc
> [    4.863275][  T151]  rpm_resume+0x7e8/0xaa4
> [    4.863836][  T151]  __pm_runtime_resume+0xa0/0x110
> [    4.864489][  T151]  sd_probe+0x30/0x428
> [    4.865016][  T151]  really_probe+0x14c/0x500
> [    4.865602][  T151]  __driver_probe_device+0xb4/0x18c
> [    4.866278][  T151]  driver_probe_device+0x60/0x2c4
> [    4.866931][  T151]  __device_attach_driver+0x228/0x2bc
> [    4.867630][  T151]  __device_attach_async_helper+0x154/0x21c
> [    4.868398][  T151]  async_run_entry_fn+0x5c/0x1c4
> [    4.869038][  T151]  process_one_work+0x3ac/0x590
> [    4.869670][  T151]  worker_thread+0x320/0x758
> [    4.870265][  T151]  kthread+0x2e8/0x35c
> [    4.870792][  T151]  ret_from_fork+0x10/0x20
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Fixes: ed4246d37f3b ("scsi: sd: REQUEST SENSE for BLIST_IGN_MEDIA_CHANGE devices in runtime_resume()")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   drivers/scsi/sd.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 523bf2fdc253..fce63335084e 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3683,7 +3683,12 @@ static int sd_resume(struct device *dev)
>   static int sd_resume_runtime(struct device *dev)
>   {
>   	struct scsi_disk *sdkp = dev_get_drvdata(dev);
> -	struct scsi_device *sdp = sdkp->device;
> +	struct scsi_device *sdp;
> +
> +	if (!sdkp)	/* E.g.: runtime resume at the start of sd_probe() */
> +		return 0;
> +
> +	sdp = sdkp->device;
>   
>   	if (sdp->ignore_media_change) {
>   		/* clear the device's sense data */

Fixing this crash by adding a check inside sd_resume_runtime() seems 
wrong to me. sd_probe() namely calls dev_set_drvdata(dev, sdkp) before 
sd_probe() has finished so even with the above patch applied sd_resume() 
can be called before sd_probe() has finished.

With which kernel version has this crash been encountered? The 
scsi_autopm_get_device() / scsi_autopm_put_device() pair added by commit 
6fe8c1dbefd6 ("scsi: balance out autopm get/put calls in 
scsi_sysfs_add_sdev()"; kernel v3.18) should be sufficient to prevent 
the reported crash.

Thanks,

Bart.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
