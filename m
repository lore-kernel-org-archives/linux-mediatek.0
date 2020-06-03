Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA1CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 02:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C6D2077D
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 02:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9SrdC5o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kcVvjWPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C6D2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Stm0MWP2/gZVE6jZBXdMcbmDFFBj0DCFRE2XMrZ8NE=; b=a9SrdC5oZuFKzq
	EBa9vSrVqW54HXpQDmNStS4deTUqUWAlNCY/6Z0i+1Lpwok6M69f/EXE9/PeGfgMge8RJ8LlbnCrw
	VzxBs5YqW/34N6kUgY+C5ZzhGSgv5SnbQ0zBRTJYAn7lVeblxutUd39mYePcoauwgLjSxqqN/Pkf6
	peq+HHWVLcswvUeStHAT5L259BCofzd3ouM6V4IasEo5ayu3vNMQj/cqFdRSz0GFvgZJN0kifjTug
	yxG2z6635SmJ+BVzx6Y7X1CuCLBzYAU9+v6TnCARbneR9cBQYHMNvJWyy6isqdIDjC7dqfDAL3wYm
	ALTqxansmUgfVtuqCirQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgJCW-0003Hx-Hk; Wed, 03 Jun 2020 02:32:20 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgJCT-0003GR-WF; Wed, 03 Jun 2020 02:32:19 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0532QVmr187569;
 Wed, 3 Jun 2020 02:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=cJZJ6Aemad1d2VN1fwzQIoXZHDszWIODTXRnH8VAsQo=;
 b=kcVvjWPAJ4lmtKEbJXD+WlDXIVCFMMHnjWMAO6LbG0h+AsBi+iHosXwow+Ac7fWNgRtH
 LGIDm/tsI3QaGrU+s1pTAZ5BS52SdYDAKtefH2iULK7Y6p/fRRLlhN3KVXiPutLHHbJB
 NxYz37iXvjvQM3qQj90k86lHeKRjQfzdxhm5Zk60uoYZDAFPmoeqpImzq7yXEVarbRI3
 k5/fm4mDP5Am47EXUpBwRh6djaRHjPyf4VxodjkqRbFHOUzQj4sPScyDR+iiPXHFHcWm
 x6L25QNWabEyMA7weqqS/gbiehUR3nyK0F1QBy8wE1sel0BCHaLG3eucBAIXcUylBjUv 0Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 31bfem6s9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 03 Jun 2020 02:31:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0532TQZP164353;
 Wed, 3 Jun 2020 02:31:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 31c12q5cuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jun 2020 02:31:50 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0532Vlbq032618;
 Wed, 3 Jun 2020 02:31:47 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 19:31:46 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: avri.altman@wdc.com, linux-scsi@vger.kernel.org,
 Stanley Chu <stanley.chu@mediatek.com>, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Subject: Re: [PATCH] scsi: ufs: Remove redundant urgent_bkop_lvl initialization
Date: Tue,  2 Jun 2020 22:31:36 -0400
Message-Id: <159114947917.26776.10217919465331125285.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530141200.4616-1-stanley.chu@mediatek.com>
References: <20200530141200.4616-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030018
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_193218_126036_CDF7ECBE 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: bvanassche@acm.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, peter.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, chaotian.jing@mediatek.com,
 matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 30 May 2020 22:12:00 +0800, Stanley Chu wrote:

> In ufshcd_probe_hba(), all BKOP SW tracking variables can be reset
> together in ufshcd_force_reset_auto_bkops(), thus urgent_bkop_lvl
> initialization in the beginning of ufshcd_probe_hba() can be merged
> into ufshcd_force_reset_auto_bkops().

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: ufs: Remove redundant urgent_bkop_lvl initialization
      https://git.kernel.org/mkp/scsi/c/7b6668d8b806

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
