Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B89C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:24:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E643223A5A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E643223A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uk2dnaD7otIHIVYmBPjxVZ+hVXGvIuXe1pNb6Xp982I=; b=YKH0QuwnrhMKsPVmhWJ/Uu7Ck
	Z32tZF17iFUJ2Mg1oq+lZGnYWdd8raOq09WG2c/Gaos4amFVQW/3sxJdWs6erFcBLs6UywgS7Q99K
	oE9EAze8vYEnM7mIzYkTb88YYtwLaWXXmoLlQzZTch//9xSY94VGUKiq50pTIb456A4/ivjgFuKME
	mtV2We8tV9vZxOukMZFX8fkzOOgSAJ9zaFmgyq2bAUwtvr14PwwU05+T2WVcgPtD/eh9PxaH5eygC
	j/IZ+JIDuldCHY4R6BduwDV8M2eS5MtTfBgwWy+u3kya+rswVtLIouKmfl3Pwg8tM9y9041/aEC0H
	eS/w5SFxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn3CH-0007AM-D1; Wed, 09 Dec 2020 17:24:13 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn3CD-00079M-V7; Wed, 09 Dec 2020 17:24:11 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HJopo058999;
 Wed, 9 Dec 2020 17:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=yVP8hzy1AwhZc1OZLvSSH4nn+zlDgukvqxfFINAXqJQ=;
 b=lcVtKhEYV0zplaRRieiJeJHn65HOLozN1+17PYagI8Ill0wFhvipZoLG+APz5SSk+HLV
 Ego7OhRRAEADILIO5olx2nTnCAOqM8CK5xNe04dWJT/Y0Vc/AtO1McNzFcYTuUmAesIi
 y2SRO2LZr0y6J3y1JRGcj3uWVHFvsuq9H88HAbl7+Rm9TGQbA3R53z7VhLV/9K6dR4oF
 aZNX0FpKaVMW9156x8DjaEcQ+yjwTKq4L7zN6FUJ0iRVWJ3mPXrigzXmiBVLUxGqrfUW
 uajF8uWDJAhr19WY8rMKBktybQi0JzMyP3mQtYFTZfEeit0WZ9da0vReLTMmRNk7PXJW Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 357yqc1fp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:24:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HKrSL100140;
 Wed, 9 Dec 2020 17:24:03 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 358ksqdk7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:24:03 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HO2Ts014403;
 Wed, 9 Dec 2020 17:24:02 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:24:02 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com
Subject: Re: [PATCH v5 0/4] scsi: ufs: Refine error history and introduce
 event_notify vop
Date: Wed,  9 Dec 2020 12:23:23 -0500
Message-Id: <160753457754.14816.15980863701992917932.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205115901.26815-1-stanley.chu@mediatek.com>
References: <20201205115901.26815-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_122410_222243_0E7BBB90 
X-CRM114-Status: GOOD (  18.49  )
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
 huadian.liu@mediatek.com, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, alice.chao@mediatek.com,
 cang@codeaurora.org, linux-arm-kernel@lists.infradead.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 beanhuo@micron.com, peter.wang@mediatek.com, chaotian.jing@mediatek.com,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 5 Dec 2020 19:58:57 +0800, Stanley Chu wrote:

> This series refines error history functions and introduces a new event_notify vop to allow vendor to get notification of important events.
> 
> Changes since v4:
>   - Seperate patch sets according to Avri's suggestion
> 
> Changes since v3:
>   - Fix build warning in patch [8/8]
> 
> [...]

Applied to 5.11/scsi-queue, thanks!

[1/4] scsi: ufs: Add error history for abort event in UFS Device W-LUN
      https://git.kernel.org/mkp/scsi/c/eb3d2611df2e
[2/4] scsi: ufs: Refine error history functions
      https://git.kernel.org/mkp/scsi/c/e965e5e00b23
[3/4] scsi: ufs: Introduce event_notify variant function
      https://git.kernel.org/mkp/scsi/c/172614a9d0e8
[4/4] scsi: ufs-mediatek: Introduce event_notify implementation
      https://git.kernel.org/mkp/scsi/c/ca1bb061d644

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
