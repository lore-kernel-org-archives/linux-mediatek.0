Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167D2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:16:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D649722B40
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzpJXsnX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dolJcB5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D649722B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZbWWRPNCT3iB/hQfJ/jZuTHqyXjh8aAmHCvVBzaf6s=; b=VzpJXsnXmcUf8ErlSfiVU1Hf/
	zitnhQk3BHIFpwjTTIx4dfibYjNtkJlVifUCmcWlG1mMs5jzTN2+enzfh4mV64H57goQ2OnW98dau
	7+j/3yoK8rmGnbuuNkkC6zJ34prmT0OuII6wcAO5afo63tWbbtc2uRO4aGZnBrJ7gKrnqpXH4/EIx
	FRMkhsT/gzA/uBGtopovRlB8TXNi9iW4qryG4BwCxNEC+/u5VYXTbYb657oBjCdpMR52WbREKB3hl
	lu6fevIWuiWkO83Qy/a3s+TxdBImkKcxJwoo14KXQi2iUiZ9T2ggGfdabq2tgHE8D3xOESKCfI47n
	kUhFdAzdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1R9D-0006pj-DF; Fri, 31 Jul 2020 09:16:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1PzY-0007ul-4S
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 08:02:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596182535; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MKSQY5RVrXIwpdJw6RKFSgNCGEE7ar+hIe83C8B0HxA=;
 b=dolJcB5haWeD4QZ/vbBgo8ah8WvMxvBj4Lb4ESZ/7NNsTgUUsm/HaF8TmTqtfqv8MIFhLR/f
 aCnb2jQ6quRKV6UzRROmUbRdDzhbSaI+iYkrVOYWY9kGn7HCqALQfTlEtQynVmPfuAvLe4K4
 yTmPX89XJbRDj5CMddyEVS1KGfU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f23cf9ff89b692ba2ca826f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 08:00:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0295FC433B1; Fri, 31 Jul 2020 08:00:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 881C9C4339C;
 Fri, 31 Jul 2020 08:00:28 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 31 Jul 2020 16:00:28 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
In-Reply-To: <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
Message-ID: <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_040215_716760_1926D939 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, Avri Altman <Avri.Altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On 2020-07-31 12:06, Bart Van Assche wrote:
> On 2020-07-30 18:30, Stanley Chu wrote:
>> On Mon, 2020-07-27 at 11:18 +0000, Avri Altman wrote:
>>> Looks good to me.
>>> But better wait and see if Bart have any further reservations.
>> 
>> Would you have any further suggestions?
> 
> Today is the first time that I took a look at ufshcd_abort(). The
> approach of that function looks wrong to me. This is how I think that a
> SCSI LLD abort handler should work:
> (1) Serialize against the completion path
> (__ufshcd_transfer_req_compl()) such that it cannot happen that the
> abort handler and the regular completion path both call
> cmd->scsi_done(cmd) at the same time. I'm not sure whether an existing
> synchronization object can be used for this purpose or whether a new
> synchronization object has to be introduced to serialize scsi_done()
> calls from __ufshcd_transfer_req_compl() and ufshcd_abort().
> (2) While holding that synchronization object, check whether the SCSI
> command is still outstanding. If so, submit a SCSI abort TMR to the 
> device.
> (3) If the command has been aborted, call scsi_done() and return
> SUCCESS. If aborting failed and the command is still in progress, 
> return
> FAILED.
> 
> An example is available in srp_abort() in
> drivers/infiniband/ulp/srp/ib_srp.c.
> 
> Bart.


AFAIK, sychronization of scsi_done is not a problem here, because scsi 
layer
use the atomic state, namely SCMD_STATE_COMPLETE, of a scsi cmd to 
prevent
the concurrency of abort and real completion of it.

Check func scsi_times_out(), hope it helps.

enum blk_eh_timer_return scsi_times_out(struct request *req)
{
...
         if (rtn == BLK_EH_DONE) {
                 /*
                  * Set the command to complete first in order to prevent 
a real
                  * completion from releasing the command while error 
handling
                  * is using it. If the command was already completed, 
then the
                  * lower level driver beat the timeout handler, and it 
is safe
                  * to return without escalating error recovery.
                  *
                  * If timeout handling lost the race to a real 
completion, the
                  * block layer may ignore that due to a fake timeout 
injection,
                  * so return RESET_TIMER to allow error handling another 
shot
                  * at this command.
                  */
                 if (test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state))
                         return BLK_EH_RESET_TIMER;
                 if (scsi_abort_command(scmd) != SUCCESS) {
                         set_host_byte(scmd, DID_TIME_OUT);
                         scsi_eh_scmd_add(scmd);
                 }
         }
}

Thanks,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
