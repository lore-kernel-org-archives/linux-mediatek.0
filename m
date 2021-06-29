Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721CCC11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 05:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AFD61D54
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 05:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AFD61D54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYcP74X2bSoQdgd1oypxL8V1BQr5ugivW8pTOtRfI5I=; b=SwygmWFse/QlDtstNbaVWpcDIe
	/P9Xvrsj2nuXhnW+acaUl5GagOKdqNpgcNqLQq68L9buTP0SIsg81bH3sJRWeIemQ4gFOqmypqQH8
	lpjPf0AS0oxiGYL7F4MmLRGxBXJldz7mq17wn4xYNb+BtLBAgIDG5oamrOR6jLj5U7+f5WtM737Js
	7mOSOTuHCibyLgy4T/VHHeaeY21T1PMxIFRqL4ANFAQkaEptbwk89XR4wtqsjS217ch07gplM8TfF
	ZWhcEGO/bo+vbXjtlo+ZUtW3iSZo2SOVJU52vSI0TlSiqMJ4iggBwsWzO+A9KXps1wzRM+/9QzQXK
	xcoLIaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly6Vo-009qfi-9r; Tue, 29 Jun 2021 05:42:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly6Vj-009qf0-MV
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 05:42:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624945337; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=o4+eZM2Dx3GnLj8Xg6wXr6QB6hTOedtc94/YUj4qaP8=;
 b=bE3Tj3/dBNTVupdcsCuPaG/qM/wgEUZbVzRwWqCgLuKfq7q1JCx1X9PAYhMUdSuyauCxxp8T
 hR0xgGAP6pdHvTpvBiHxxnk6NxtIY+79I1eSAPTTNMJxrDkZna/fNWiX12c6RcOF7gFvZH23
 2aU7L9n5o6zxMPP5rUyqDtKOZg4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60dab2a3ec0b18a74564d23c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 05:41:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86F23C43460; Tue, 29 Jun 2021 05:41:54 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AFE8C433D3;
 Tue, 29 Jun 2021 05:41:53 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 29 Jun 2021 13:41:53 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, Stanley Chu
 <stanley.chu@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
In-Reply-To: <c31185f5-e816-937d-25ac-1657b6111ff8@acm.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <c31185f5-e816-937d-25ac-1657b6111ff8@acm.org>
Message-ID: <464097469b09752ce4ebb38c08f1a94a@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_224217_506487_CE2DED2F 
X-CRM114-Status: GOOD (  16.81  )
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

On 2021-06-29 06:58, Bart Van Assche wrote:
> On 5/24/21 1:36 AM, Can Guo wrote:
>> Current UFS IRQ handler is completely wrapped by host lock, and 
>> because
>> ufshcd_send_command() is also protected by host lock, when IRQ handler
>> fires, not only the CPU running the IRQ handler cannot send new 
>> requests,
>> the rest CPUs can neither. Move the host lock wrapping the IRQ handler 
>> into
>> specific branches, i.e., ufshcd_uic_cmd_compl(), 
>> ufshcd_check_errors(),
>> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to 
>> further
>> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host 
>> lock is
>> no longer required to call __ufshcd_transfer_req_compl(). As per test, 
>> the
>> optimization can bring considerable gain to random read/write 
>> performance.
> 
> Hi Can,
> 
> Since this patch has been applied on the AOSP kernel we see 100%
> reproducible lockups appearing on multiple test setups. Examples of 
> call
> traces:
> 
> blk_execute_rq()
> __scsi_execute()
> sd_sync_cache()
> sd_suspend_common()
> sd_suspend_system()
> scsi_bus_suspend()
> __device_suspend()
> 
> blk_execute_rq()
> __scsi_execute()
> ufshcd_clear_ua_wlun()
> ufshcd_err_handling_unprepare()
> ufshcd_err_handler()
> process_one_work()
> 
> Reverting this patch and the next patch from this series solved the
> lockups. Do you prefer to revert this patch or do you perhaps want us 
> to
> test a potential fix?
> 

Hi Bart,

I am waiting for more infos/logs/dumps on Buganizor to look into it.
With above calltrace snippet, it is hard to figure out what is 
happening.
Besides, we've tested this series before go upstream and we didn't
see such problem.

Thanks,

Can Guo.

> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
