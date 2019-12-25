Return-Path: <SRS0=B1Xv=2P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8DEC2D0D2
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 04:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75B4206CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 04:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdOF35rz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KJdu55EY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75B4206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3a55UuQ6Numv/g6yaN8L1q+aF4d6QPavCojNT+GSMM=; b=jdOF35rzJN8Y4e
	1MlDb53MVoV9V/J2X9apPLFKEJ0Y1L5ANy86f2uczf45lphdaGHfG6Pa2bgxgXWHSql1HWkr2PBgM
	Fo9Q0NpVBecGLLiNV4dfNHlydTUYrnGTCMnEgU/jN+3kM+O6BMJijD5LgyeGXl/MghpDwefDuDo2y
	JRA0UeQNg3c8HZDHIuzENi5aU79EOwLqlQwLl8x7flPKJhM1x73LlKczxSYsWGmvqha4bleyK4q7Q
	pXPxxPk3Esu2rbZ4ah5JITYvpZe2qiHmEaxblM6wI9qok9Sw1U9/4umPA8dWUmzihKDQ1kpuw78zZ
	GfbfzL/gKIvKonYYlDAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijxxt-0007WT-63; Wed, 25 Dec 2019 04:08:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijxxh-0007Pm-J6; Wed, 25 Dec 2019 04:07:56 +0000
X-UUID: 19f56466645b48839fe89ca042e80b1d-20191224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NIJENyJKlWoqwgHXAL2hevvVed09oj9yO9raXuRmiUo=; 
 b=KJdu55EYy+80qNsVPMOL7NDDG08LDp+O6eYTpnlPC/V+GNUmBvd1jF8+epGwtUDgMsDwmKIWFO1q1vB4vpCNTFlgpuYQHpVWBl0Qkqf4NMqnQJdoROo7h+I/tIMexNOQSwixTQYo9VcC6b6XAWN9zXKUoZTkCDGpsPixO5zHb+g=;
X-UUID: 19f56466645b48839fe89ca042e80b1d-20191224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 539590126; Tue, 24 Dec 2019 20:07:47 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 20:08:21 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Dec 2019 12:07:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 25 Dec 2019 12:07:21 +0800
Message-ID: <1577246863.13056.48.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] scsi: ufs: unify scsi_block_requests usage
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Wed, 25 Dec 2019 12:07:43 +0800
In-Reply-To: <e9a8fbc0-5f08-75f5-b23b-2bbaa28a6222@acm.org>
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
 <1577192466-20762-2-git-send-email-stanley.chu@mediatek.com>
 <e9a8fbc0-5f08-75f5-b23b-2bbaa28a6222@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9E8AC75994A9931C91CCCF1ABA221DC9F8391A441FA39B78CDE8538966CF3BFE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_200753_642769_F05214F8 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
 pedrom.sousa@synopsys.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,


> Hi Stanley,
> 
> From the SCSI core:
> 
> void scsi_block_requests(struct Scsi_Host *shost)
> {
> 	shost->host_self_blocked = 1;
> }
> 
> In other words, neither scsi_block_requests() nor
> ufshcd_scsi_block_requests() wait for ongoing ufshcd_queuecommand()
> calls to finish. Is it required to wait for these calls to finish before
> exceptions are handled? If not, can the scsi_block_requests() and
> scsi_unblock_requests() calls be left out? If it is required to wait for
> ongoing ufshcd_queuecommand() calls to finish then I think the
> scsi_block_requests() and scsi_unblock_requests() will have to be
> changed into something else.

ASFAIK, ufshcd_exception_event_handler() is not required to wait for
ongoing ufshcd_queuecommand() calls to finish.

The scsi_block_requests() call here is trying to increase successful
rate of requests sent by ufshcd_exception_event_handler() because
timeout may happen if device is too busy to handle those requests.
Blocking any future incoming requests can help.

As time goes by, actually current UFS driver allows more waiting time by
below changes for ufshcd_exception_event_handler(), and thus the
successful rate shall be raised much nowadays.

- Enlarge QUERY_REQ_TIMEOUT time from 100 ms to 1.5 seconds
- Allow retry if query requests are timed out

Therefore, the scsi_block_requests() call is actually a "helper" to help
ufshcd_exception_event_handler() successful. I think it could be better
kept to make UFS device recover its performance as soon as possible.

> 
> Thanks,
> 
> Bart.

Thanks,
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
