Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EC2C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29B0206D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyrCKG4y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mRHGFzuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29B0206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1mymk99rzYjz4PMVe47WrtZJe1Yh5Ca6T01+oO4KxM=; b=KyrCKG4ysamAMpBCl8vIvjJUT
	SRPKgjyIkJqIDWzSJNwwLq2JoZoTvaZt92hf1MzORrkb89cup5utrKKEq3hiBOGI4f8VKysxdAYFO
	/shUoyksJcL3uKpkfX1n6U843ieskx5WKqAHWI49Cq0PSulvhkff8Iq6+8ONNgaEWSuXvdsODsqyv
	VbJjHs1WQzlvFcRvsKNT+wOeFYC1ee6YqeAo0pFPC6SAAyv82sux6vf8R91HtpTA+1Ck8ZUTHSAJk
	vIGN1lkFKzOqpG6JQb6WE5B6CZT4V4v0UeF5AsgM5VCQAj8dAh7ChoyfzjMQWTXLze5k6zx06mVbf
	uKRO5xMPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyBfA-0003vE-Pu; Wed, 22 Jul 2020 10:07:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyBf6-0003uT-9c; Wed, 22 Jul 2020 10:07:45 +0000
X-UUID: ff93e59bf6cc464fb30e288ad042ce6d-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hpw2HAjj+VZcqiXE9JCKu3K69kU6aLIL+g4N7qmAH6w=; 
 b=mRHGFzuKX9VZw96ff4c5f+9dfqcbnhKnypVjEdvx0T5KV1k4oP6RFw4kVncj2pVoQda4IKsJ4OtFALdk1eJSyo3oHZuseqxJn9ceDA0E8IyOvEUUdbneUyiDDTuvxZkOJm8pOuqHExboSGjjCc+KLfEUz+uKS4Or1vsw62KCgvU=;
X-UUID: ff93e59bf6cc464fb30e288ad042ce6d-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1776867086; Wed, 22 Jul 2020 02:07:37 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 03:07:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 18:07:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 18:07:36 +0800
Message-ID: <1595412457.27178.36.camel@mtkswgap22>
Subject: Re: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Wed, 22 Jul 2020 18:07:37 +0800
In-Reply-To: <912623e8-5915-8380-f39a-fac7b5868a6d@acm.org>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
 <1594607245.22878.8.camel@mtkswgap22>
 <SN6PR04MB46409838AE9D4BD63797E26DFC600@SN6PR04MB4640.namprd04.prod.outlook.com>
 <912623e8-5915-8380-f39a-fac7b5868a6d@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_060744_627568_C91E8F87 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Avri Altman <Avri.Altman@wdc.com>, "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart, Avri,

On Tue, 2020-07-14 at 21:00 -0700, Bart Van Assche wrote:
> On 2020-07-13 01:10, Avri Altman wrote:
> > Artificially injecting errors is a very common validation mechanism,
> > Provided that you are not breaking anything of the upper-layers,
> > Which I don't think you are doing.
> 

As the concerns of below questions,

"scsi timeout is 30sec - do you expect an interrupt to arrive after
that?"

Actually in my test scenario, the flow works well without re-checking
"outstanding_reqs" in "cleanup" section in ufshcd_abort(), so I would
remove this checking first and resend this fix (with refined commit
message according to blk-mq, not legacy blk). Please let me know if you
have any suggestions.

> Hi Avri,
> 
> My concern is that the code that is being added in the abort handler
> sooner or later will evolve into a duplicate of the regular completion
> path. Wouldn't it be better to poll for completions from the timeout
> handler by calling ufshcd_transfer_req_compl() instead of duplicating
> that function?
> 

The duplicated calls of cleanup job would be as below,

scsi_dma_unmap(cmd);
hba->lrb[tag].cmd = NULL;
ufshcd_outstanding_req_clear(hba, tag);

As your suggestions, above calls could be re-factored but the third call
in __ufshcd_transfer_req_compl() would be more efficient by

hba->outstanding_reqs ^= completed_reqs;

for all handled requests in interrupt handler.


Here we could not directly use "ufshcd_transfer_req_compl()" or its
inner function "__ufshcd_transfer_req_compl()" since at least
scsi_done() is not required in ufshcd_abort() because the completion
flow will be handled by SCSI error handler, not ufshcd_abort() itself.

> >>> In section 7.2.3 of the UFS specification I found the following about how
> >>> to process request completions: "Software determines if new TRs have
> >>> completed since step #2, by repeating one of the two methods described in
> >>> step #2. If new TRs have completed, software repeats the sequence from
> >>> step #3." Is such a loop perhaps missing from the Linux UFS driver?
> >
> > Could not find that citation.
> > What version of the spec are you using?
> 
> That quote comes from the following document: "Universal Flash Storage
> Host Controller Interface (UFSHCI); Version 2.1; JESD223C; (Revision of
> JESD223B, September 2013); MARCH 2016".

Above description has already be implemented in ufshcd_intr() and
ufshcd_transfer_req_compl(). But this loop cannot save "missing
interrupt" just like this injected error case.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
