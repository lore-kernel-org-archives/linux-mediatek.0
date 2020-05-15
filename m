Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67499C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4F820727
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XT3rnUAw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r90k8Xic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4F820727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BzQjJY+G6jMx6oTUzOG3lQl2AIuvWTVMQl8sgHc2cU=; b=XT3rnUAwMPHsd7
	ay0Bo3oWWAVkq/IC8P86Vi6Yl1oDl/rQ8CbYXc9Bm64MmHbfGhNLyA5760ZETE4sDB9SzYdJghgL/
	e+EqbtY4yC1Cw4RBVyeT3CvmPQXEJV8PP7m4azkhYqR+BTpafQUsUuX+Y90jU334GIV7FyIifde3q
	B1fgG0BvBJNrsVqhB77HBLY2kwha4qWu6tGb3Nlot8fP0YdDQk/4RJ+aiQx91TOI4nmrjHtrYzA9o
	Wew5RBL+UAfV7lssLVjyKulQZ8hVuXfBqzhHLBLqUBgl5o3W/qCQz0Uxt7cGt/6gBcNhJCnQQmFEJ
	/Uh3OCxeGJ1ydUtkGOQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZOu6-0005sq-Cm; Fri, 15 May 2020 01:12:46 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZOu4-0005sR-16; Fri, 15 May 2020 01:12:45 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04F13BU9130944;
 Fri, 15 May 2020 01:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=iP+CAPe6xqTX3quF8Qdp4lFGocslpJ7Wa4UEt8Vsb1s=;
 b=r90k8XicwuZ0No3D35nhmnkNtqZpNxETjbkZn5qi0U7X2YRGMAYlTTLbi4HrdIT8Qelp
 i4fqXUzs3LMU3hDjYPGf6vcdjmD0eF87TWjmxn0s7HkP5nvCCONDqjAqh6PKBRWA/mnq
 QqQ71C5lvIzk9+1XMy9cGivk6eAY7gOucgp5ukcMrsXQEEeVe1bfAJ06NQ/SWx9oAANp
 /rbL7BSuVVRSE6/yDRGnWr3lYDoN4Fb/xrufw4NoHs/ELOPx0JYZivRdl4VQPMxF94cF
 TikeuAAvg6XbgtchKg9YM2auwvcWNqMdnxtpnPVreke05yn4GxiM3J158YYNM0xA7hoa Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 3100xwxqbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 May 2020 01:12:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04F1474T014928;
 Fri, 15 May 2020 01:10:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 3100yds35r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 01:10:38 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04F1AaQO014050;
 Fri, 15 May 2020 01:10:36 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 May 2020 18:10:36 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: jejb@linux.ibm.com, linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
 Stanley Chu <stanley.chu@mediatek.com>, asutoshd@codeaurora.org,
 avri.altman@wdc.com
Subject: Re: [PATCH v2 0/4] scsi: ufs: allow customizable WriteBooster flush
 policy
Date: Thu, 14 May 2020 21:10:29 -0400
Message-Id: <158950485295.8169.36549719949053326.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200509093716.21010-1-stanley.chu@mediatek.com>
References: <20200509093716.21010-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150007
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 cotscore=-2147483648 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005150007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_181244_155855_6D95633B 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: bvanassche@acm.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 9 May 2020 17:37:12 +0800, Stanley Chu wrote:

> This patch set tries to allow vendors to modify the WriteBooster flush policy.
> 
> In the same time, collect all customizable parameters to an unified structure to make UFS driver more clean.
> 
> v1 -> v2:
>   - Squash patch [3] and [4]
>   - Remove a dummy "new line" in patch [3]
>   - Fix commit message in patch [3]
> 
> [...]

Applied to 5.8/scsi-queue, thanks!

I had to combine patches 1 and 2. Otherwise you'd get compile
failures due to the fields moving inside the struct.

[1/4] scsi: ufs: Introduce ufs_hba_variant_params to group customizable parameters
      https://git.kernel.org/mkp/scsi/c/90b8491c0033
[3/4] scsi: ufs: Customize flush threshold for WriteBooster
      https://git.kernel.org/mkp/scsi/c/d14734ae3ae7
[4/4] scsi: ufs-mediatek: Customize WriteBooster flush policy
      https://git.kernel.org/mkp/scsi/c/f48b285ae658

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
