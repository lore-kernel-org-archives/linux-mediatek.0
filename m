Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCA9C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDFAA2054F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 05:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vi+t/xm3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t2K+txY5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDFAA2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NrlpAOErW/6RBdtgfwg3pnsYMDbb7mDB1Y6Zpoe4FP4=; b=Vi+t/xm38T0d9+2zbJhKEVsVs
	I1NFSQ68RglPB/g+wKijMECTPiEydOJ9kRntDc5ZHEc1jLonYRuxuY68pJ9jlQ7dVntWIRX8DbVW/
	02xmWFhcMzEci6cFIJvBJ8wdbqcH3GgD2pc1cuXytUig33nJI2RxYOlTQA5zu4kchkS+sFs5zuTTp
	kkuyi6oeZcTr8AIhvRZ5zNaRVBaR6x0eux4Z6NAGoah3aX3N7BMCK7J8PbwOKjFU/GOseKGhSXVEP
	G0jmhs3YDqFfrGIAIKktNsi88ChtzugHpU/fCbchzp+FsS2tcK10t5g6drb4vB+tfuwZDl5fkdJvH
	v7GmKxJzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2T17-0004tF-N3; Mon, 03 Aug 2020 05:28:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2T13-0004sD-H8; Mon, 03 Aug 2020 05:28:07 +0000
X-UUID: dcde5b08ede0428b893456c30f61f865-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/fOt/eF3xKfY11u6+UWB2DQ/mmoIvFrJMCVjHj8/gng=; 
 b=t2K+txY5P3G1IH6qQoJGIIUj6wkcj0lHh5vho9sQ53iMhrXyogWuQ91IsBaZNODDbTE/2XQgKXTWBlSES+/I7wciAgkWmV983UQQJak/u+JtCxTWKMUA28eIKVq0/pEpVRQp/thvEyCF072tPJrSBtVLoCG946HQ57EGz4aybSI=;
X-UUID: dcde5b08ede0428b893456c30f61f865-20200802
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2089911157; Sun, 02 Aug 2020 21:27:55 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 22:27:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 13:27:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 13:27:54 +0800
Message-ID: <1596432475.32283.10.camel@mtkswgap22>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 3 Aug 2020 13:27:55 +0800
In-Reply-To: <3b144ed6897483d1ae3ced6de2dfc64c@codeaurora.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
 <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
 <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
 <1596423655.32283.7.camel@mtkswgap22>
 <3b144ed6897483d1ae3ced6de2dfc64c@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_012806_276222_BA4C124B 
X-CRM114-Status: GOOD (  36.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Mon, 2020-08-03 at 13:14 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-08-03 11:00, Stanley Chu wrote:
> > Hi Can,
> > 
> > On Sat, 2020-08-01 at 07:17 +0800, Can Guo wrote:
> >> Hi Bart,
> >> 
> >> On 2020-08-01 00:51, Bart Van Assche wrote:
> >> > On 2020-07-31 01:00, Can Guo wrote:
> >> >> AFAIK, sychronization of scsi_done is not a problem here, because scsi
> >> >> layer
> >> >> use the atomic state, namely SCMD_STATE_COMPLETE, of a scsi cmd to
> >> >> prevent
> >> >> the concurrency of abort and real completion of it.
> >> >>
> >> >> Check func scsi_times_out(), hope it helps.
> >> >>
> >> >> enum blk_eh_timer_return scsi_times_out(struct request *req)
> >> >> {
> >> >> ...
> >> >>         if (rtn == BLK_EH_DONE) {
> >> >>                 /*
> >> >>                  * Set the command to complete first in order to
> >> >> prevent
> >> >> a real
> >> >>                  * completion from releasing the command while error
> >> >> handling
> >> >>                  * is using it. If the command was already completed,
> >> >> then the
> >> >>                  * lower level driver beat the timeout handler, and it
> >> >> is safe
> >> >>                  * to return without escalating error recovery.
> >> >>                  *
> >> >>                  * If timeout handling lost the race to a real
> >> >> completion, the
> >> >>                  * block layer may ignore that due to a fake timeout
> >> >> injection,
> >> >>                  * so return RESET_TIMER to allow error handling
> >> >> another
> >> >> shot
> >> >>                  * at this command.
> >> >>                  */
> >> >>                 if (test_and_set_bit(SCMD_STATE_COMPLETE,
> >> >> &scmd->state))
> >> >>                         return BLK_EH_RESET_TIMER;
> >> >>                 if (scsi_abort_command(scmd) != SUCCESS) {
> >> >>                         set_host_byte(scmd, DID_TIME_OUT);
> >> >>                         scsi_eh_scmd_add(scmd);
> >> >>                 }
> >> >>         }
> >> >> }
> >> >
> >> > I am familiar with this mechanism. My concern is that both the regular
> >> > completion path and the abort handler must call scsi_dma_unmap() before
> >> > calling cmd->scsi_done(cmd). I don't see how
> >> > test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state) could prevent that
> >> > the regular completion path and the abort handler call scsi_dma_unmap()
> >> > concurrently since both calls happen before the SCMD_STATE_COMPLETE bit
> >> > is set?
> >> >
> >> > Thanks,
> >> >
> >> > Bart.
> >> 
> >> For scsi_dma_unmap() part, that is true - we should make it serialized
> >> with
> >> any other completion paths. I've found it during my fault injection
> >> test, so
> >> I've made a patch to fix it, but it only comes in my next error 
> >> recovery
> >> enhancement patch series. Please check the attachment.
> >> 
> > 
> > Your patch looks good to me.
> > 
> > I have the same idea before but I found that calling scsi_done() (by
> > __ufshcd_transfer_req_compl()) in ufshcd_abort() in old kernel (e.g.,
> > 4.14) will cause issues but it has been resolved by introduced
> > SCMD_STATE_COMPLETE flag in newer kernel. So your patch makes sense.
> > 
> > Would you mind sending out this draft patch as a formal patch together
> > with my patch to fix issues in ufshcd_abort()? Our patches are aimed to
> > fix cases that host/device reset eventually not being triggered by the
> > result of ufshcd_abort(), for example, command is aborted successfully
> > or command is not pending in device with its doorbell also cleared.
> > 
> > Thanks,
> > Stanley Chu
> > 
> 
> I don't quite actually follow your fix here and I didn't test the 
> similar
> fault injection scenario like you do here, so I am not sure if I should
> just absorb your fix into mine. How about I put my fix in my current 
> error
> recovery patch series (maybe in next version of it) and you can give 
> your
> review. So you can still go with your fix as it is. Mine will be picked 
> up
> later by Martin. What do you think?
> 

Sure, that's good to me.

Thanks,

Stanley Chu

> Thanks,
> 
> Can Guo.
> 
> >> Thanks,
> >> 
> >> Can Guo.
> >> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
