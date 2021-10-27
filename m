Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 04:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE56610C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 04:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE56610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjIqfSSYV5PIwJzk4lEQhs845EKC42kApbqorj24RtQ=; b=kpVY6N4S+kdKrl
	fa0QD0EDweLh5w2FZ6Pu8kf3ecHxx0LwcdsjmklneawEWyH8eSTJu29tMaBg0/XIbO67qf6PH8BNx
	xliquowoxADzCFHWHEz1uBM8xckWd115hV53xQu4v3OjCyxsKzvCT4R8439X+w6aK7K4kUKtvZHPO
	zI2kHYU6Mq3SN+zOp22997ptTXmk5Mv+ywClxmNNc8xATVmD6KIubfdLL1VozJRz5o5YakOt2uxqS
	HM8D2wm4XCPRLqTEsxtlQXxwgT8Q9KOU9lBJMkPdFUqIscK2nAYCLvRauCtFHUHt9rwktbDhCo1ui
	PV2IbXOPtb+UAGH1obvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfa7G-003nal-Qg; Wed, 27 Oct 2021 04:00:42 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfa7E-003nYq-2B; Wed, 27 Oct 2021 04:00:41 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R0n0C0015474; 
 Wed, 27 Oct 2021 04:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=+4BgIZY4lR/vnCmrk0RUztBT8gXJqQuyjlRcNq3Iq/A=;
 b=ZKY4weGxKtTxJlztsUYMbvHGn5ahrKFmfYe5beyTkWs9G2Z6EXk8krTslC0xihftzaBW
 uu06Yfw8TJVu7ntgFnu9EgqAqFRy/r8dwN7cMheD34M1TK3/5pCnfobv2uzDWOEhcLSz
 wtz+xjOuj9J+zIbhRHRAakjseLsX/JmWTVxx+FJuqpwV2tCgoHb+nQvXGW84kqNAShQ9
 Bbcqu4UZY7A0vka2XMHwuFEyvkgVZ04jvho40z50Blv/A/ii5y6KEWWJzNysK17PdCiP
 Hc7wmYDOfF3DY7bSvUICVg+0RojewKQ5of6LRGIBvrET1CIgwQUnqenBqQel9CkrD//J kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj0tb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 04:00:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19R400wR068907;
 Wed, 27 Oct 2021 04:00:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3bx4gqcn9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 04:00:25 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19R40O5C070915;
 Wed, 27 Oct 2021 04:00:24 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3020.oracle.com with ESMTP id 3bx4gqcn88-1;
 Wed, 27 Oct 2021 04:00:24 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Arnd Bergmann <arnd@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: avoid sched_clock() misuse
Date: Wed, 27 Oct 2021 00:00:19 -0400
Message-Id: <163530706457.10775.2217918948361073974.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018132022.2281589-1-arnd@kernel.org>
References: <20211018132022.2281589-1-arnd@kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: IxSGowgx6TWOB-i5UsoImQPLxaD-JNJd
X-Proofpoint-GUID: IxSGowgx6TWOB-i5UsoImQPLxaD-JNJd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_210040_134091_558F7930 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 18 Oct 2021 15:20:01 +0200, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> sched_clock() is not meant to be used in portable driver code,
> and assuming a particular clock frequency is not how this is
> meant to be used. It also causes a build failure because of
> a missing header inclusion:
> 
> [...]

Applied to 5.16/scsi-queue, thanks!

[1/1] scsi: ufs: mediatek: avoid sched_clock() misuse
      https://git.kernel.org/mkp/scsi/c/bb4a8dcb4e94

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
