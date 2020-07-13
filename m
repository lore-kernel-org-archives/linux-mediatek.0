Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FDAC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 02:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBB9206B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 02:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mxydwOgX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f/TDqbf7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBB9206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KVmVGckpSOKBEbiKcNmAL+1X1iTXOW2kOHz60Z4WxTY=; b=mxydwOgXfk1TnbUVzeqedLBo5
	XJLIZr+3AAiGU6qbuOdc2Uws1x3ME29Q4pXuCnqWROovqpWva2LX6hnD1KC6oUpK9e8pPz2dX1cpO
	FAPPFGMeeJABiOZetJmcP5gKLMFB1ywjSqCVtezm484Rh5Wcqeqtf1cKYuk3ieDdoj6oe+m146r7/
	Tn41f1PPfkItfCkfniBctBc1Zc4+YhYQW7/H8VDwIi3s8dbIdOfC3FHyU3dJw8IahcrswGkamMgxb
	oks9g+yVLZw4wOPlMLFQ9ZQpI9CyCkRoByydjPSmlb32Q3av+mzuq6E4NQbzqF0gd4g68ZGW6TAET
	1HQmlfTOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juoBv-00042p-Qs; Mon, 13 Jul 2020 02:27:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juoBs-00041f-5U; Mon, 13 Jul 2020 02:27:37 +0000
X-UUID: 278e9e934fa44e05b096afc311f79438-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vdpX6QOZNKEgVnpAN4JmKDJp7I0M4aDpvfzDjmiNtpI=; 
 b=f/TDqbf7PfrTMQRadRomIUVqOt1l3uynOLQsPGuTdTmvEiR+7CJP8yl5VeroAMqR28i8GqNUfLSEsO/3MjDu9aS3HzH+ms9Ktl72wHReX1eFkn6k8x0YdyMqvJ4WMY+sbDh8hhKBeVr2l5f+bbbAH63a4qgVz1HR+xR4fOBgpLg=;
X-UUID: 278e9e934fa44e05b096afc311f79438-20200712
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 180011289; Sun, 12 Jul 2020 18:27:25 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 19:27:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 10:27:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 10:27:24 +0800
Message-ID: <1594607245.22878.8.camel@mtkswgap22>
Subject: Re: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Mon, 13 Jul 2020 10:27:25 +0800
In-Reply-To: <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 69731E3067A72BEFA2FBAE86A43C91635FEE4B1E3E5A14E4DECC1E66CD00A30D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_222736_347958_8B344129 
X-CRM114-Status: GOOD (  17.44  )
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart and Avri,

On Sun, 2020-07-12 at 18:39 -0700, Bart Van Assche wrote:
> On 2020-07-06 06:21, Stanley Chu wrote:
> > If somehow no interrupt notification is raised for a completed request
> > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > its outstanding bit in ufshcd_abort().
> 
> How is it possible that no interrupt notification is raised for a completed
> request? Is this the result of a hardware shortcoming or rather the result
> of how the UFS driver works? In the latter case, is this patch perhaps a
> workaround? If so, has it been considered to fix the root cause instead of
> implementing a workaround?

Actually this fail is triggered by "error injection" to produce a
command timeout event for checking if anything can be improved or fixed.

I agree that "no interrupt notification" may be something wrong in
hardware and the root cause shall be fixed in the highest priority.
However from this injection, we found ufshcd_abort() indeed has a defect
flow for a corner case, so we are looking for the solution to fix the
"hole".

What would you think if Linux driver shall consider this case? If this
is not necessary, I would drop this patch : )

Thanks a lot,
Stanley Chu

> 
> In section 7.2.3 of the UFS specification I found the following about how
> to process request completions: "Software determines if new TRs have
> completed since step #2, by repeating one of the two methods described in
> step #2. If new TRs have completed, software repeats the sequence from step
> #3." Is such a loop perhaps missing from the Linux UFS driver?
> 
> Thanks,
> 
> Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
