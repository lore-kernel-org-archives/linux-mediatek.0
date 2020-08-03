Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B6DC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 968BC206DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G9Dlpihm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="e4LUQmh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 968BC206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r+LMy5v/ScxYfr0XF/0SW5dDCc38HwlA+F/9y30BjcU=; b=G9DlpihmE3SjsV+Zs4T5nJv6k
	6ioQFDVzcnM2JnnOrV7IikdsAyC726mv5iMTTSe6o3HnkH6Jgmk3QYlbEKeHYNtxtYgfbIEQifzci
	qEbM20k6M8bFZza3C4c44ccDTyjycwCxXttg1B5esoJvRaegXHRJ8uBdeXLGjLQZpSLa4Fw7M+IQh
	AqSXgCqoCsLh0LYPud/ks55DcGbN+c4j3/Z3YsVIrTvjC4CubA5KFZxHquz3A4bhrK9ed1PBFEJRf
	lC+AXUZLzRpQB781BJJzKyTTZ3xfhapA4s5c37vllJ96AI22HtgB4yz+pK0Tu1I2YpRdFZLQSvfE3
	jqA3IRQww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Snp-0002cG-Lw; Mon, 03 Aug 2020 05:14:25 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Sng-0002as-CK
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 05:14:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596431662; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2SttEpjWkPUzgGIFPGBOgS8vyJzXv+pt+lN3X+pHN84=;
 b=e4LUQmh5oqjGOFgfs41jyyp4EzrtHPs83+EzrmhKKiSdrSHFTcP3FLWX8sPqe65FO5Vo8lLQ
 F5mXNQHF/0RqdfhlAaiQKyPe3CG13Q7G5xNB7NEta0hk0GieDK72Tv9BdEY24iK2yWi5AC/u
 i2mI3inG0Zh0ESy4RDj4KXbFO34=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f279d1d2c24b37bbef22928 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Aug 2020 05:14:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DCE51C433CB; Mon,  3 Aug 2020 05:14:03 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01717C433C9;
 Mon,  3 Aug 2020 05:14:02 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 13:14:02 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
In-Reply-To: <1596423655.32283.7.camel@mtkswgap22>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
 <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
 <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
 <1596423655.32283.7.camel@mtkswgap22>
Message-ID: <3b144ed6897483d1ae3ced6de2dfc64c@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_011423_017318_AE6F969A 
X-CRM114-Status: GOOD (  29.09  )
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
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 Avri Altman <Avri.Altman@wdc.com>, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, martin.petersen@oracle.com,
 matthias.bgg@gmail.com, asutoshd@codeaurora.org, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley,

On 2020-08-03 11:00, Stanley Chu wrote:
> Hi Can,
> 
> On Sat, 2020-08-01 at 07:17 +0800, Can Guo wrote:
>> Hi Bart,
>> 
>> On 2020-08-01 00:51, Bart Van Assche wrote:
>> > On 2020-07-31 01:00, Can Guo wrote:
>> >> AFAIK, sychronization of scsi_done is not a problem here, because scsi
>> >> layer
>> >> use the atomic state, namely SCMD_STATE_COMPLETE, of a scsi cmd to
>> >> prevent
>> >> the concurrency of abort and real completion of it.
>> >>
>> >> Check func scsi_times_out(), hope it helps.
>> >>
>> >> enum blk_eh_timer_return scsi_times_out(struct request *req)
>> >> {
>> >> ...
>> >>         if (rtn == BLK_EH_DONE) {
>> >>                 /*
>> >>                  * Set the command to complete first in order to
>> >> prevent
>> >> a real
>> >>                  * completion from releasing the command while error
>> >> handling
>> >>                  * is using it. If the command was already completed,
>> >> then the
>> >>                  * lower level driver beat the timeout handler, and it
>> >> is safe
>> >>                  * to return without escalating error recovery.
>> >>                  *
>> >>                  * If timeout handling lost the race to a real
>> >> completion, the
>> >>                  * block layer may ignore that due to a fake timeout
>> >> injection,
>> >>                  * so return RESET_TIMER to allow error handling
>> >> another
>> >> shot
>> >>                  * at this command.
>> >>                  */
>> >>                 if (test_and_set_bit(SCMD_STATE_COMPLETE,
>> >> &scmd->state))
>> >>                         return BLK_EH_RESET_TIMER;
>> >>                 if (scsi_abort_command(scmd) != SUCCESS) {
>> >>                         set_host_byte(scmd, DID_TIME_OUT);
>> >>                         scsi_eh_scmd_add(scmd);
>> >>                 }
>> >>         }
>> >> }
>> >
>> > I am familiar with this mechanism. My concern is that both the regular
>> > completion path and the abort handler must call scsi_dma_unmap() before
>> > calling cmd->scsi_done(cmd). I don't see how
>> > test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state) could prevent that
>> > the regular completion path and the abort handler call scsi_dma_unmap()
>> > concurrently since both calls happen before the SCMD_STATE_COMPLETE bit
>> > is set?
>> >
>> > Thanks,
>> >
>> > Bart.
>> 
>> For scsi_dma_unmap() part, that is true - we should make it serialized
>> with
>> any other completion paths. I've found it during my fault injection
>> test, so
>> I've made a patch to fix it, but it only comes in my next error 
>> recovery
>> enhancement patch series. Please check the attachment.
>> 
> 
> Your patch looks good to me.
> 
> I have the same idea before but I found that calling scsi_done() (by
> __ufshcd_transfer_req_compl()) in ufshcd_abort() in old kernel (e.g.,
> 4.14) will cause issues but it has been resolved by introduced
> SCMD_STATE_COMPLETE flag in newer kernel. So your patch makes sense.
> 
> Would you mind sending out this draft patch as a formal patch together
> with my patch to fix issues in ufshcd_abort()? Our patches are aimed to
> fix cases that host/device reset eventually not being triggered by the
> result of ufshcd_abort(), for example, command is aborted successfully
> or command is not pending in device with its doorbell also cleared.
> 
> Thanks,
> Stanley Chu
> 

I don't quite actually follow your fix here and I didn't test the 
similar
fault injection scenario like you do here, so I am not sure if I should
just absorb your fix into mine. How about I put my fix in my current 
error
recovery patch series (maybe in next version of it) and you can give 
your
review. So you can still go with your fix as it is. Mine will be picked 
up
later by Martin. What do you think?

Thanks,

Can Guo.

>> Thanks,
>> 
>> Can Guo.
>> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
