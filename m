Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1549C433F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 04:59:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCB12193E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 04:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XgAZPuS1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kh+BkuEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCB12193E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EMmhuEW0afOFWp8vWoCy5XPr13RfZYCvtKQ1heCA6UA=; b=XgAZPuS1bQvwt6eWtJe6wsoE4
	o6yExv9ZUVgk3foj3ZUrOOoDnXURLCA6B/hQsAothH89zS7jjhSbgYHpCGy4Z+zP3Cb3HEAFkQB33
	AiZI+x/hFQ9CpuSxRDEN665EIrRF33xx0ELr/hxKANPrkaMR2p5QcF6L/Kh2q/V2Kq/VoZ61Vlt2s
	arxupsnL7Q8BL2a8VpG6gwre+rSGCUU7pveaxgecDtGOYpiSvMuoVolpPZtpteeHgVjNz9ZuD52fU
	qbHCLBkJlmT4NSMdDdiipIA+z8wrlW9kx4QSg8Y2tGLFHFD3Cxn4uqhXSaUAduhm71IdQUi4TkYfY
	e4UB9XmkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvD2C-0002MV-NL; Tue, 14 Jul 2020 04:59:16 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvD28-0002L5-W6; Tue, 14 Jul 2020 04:59:14 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4w6QE100069;
 Tue, 14 Jul 2020 04:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=MvOmzb2T3obRz6dBo34iF/6Oj5vZJrC530Im1gp2ULU=;
 b=Kh+BkuEjb2vJW0gHyGGrskHfrX6zuWBHG3VkLd+9U2PFlvlBaRJr4QeJbQxmcni18Lod
 Om9/T43fQA2bKlP8kjHvx9UpOFu/PyJ4mmAs9clXYhvm3dk5btCSNA2u09lLXTRs3cf2
 T983dbJ9wFAvsZY86aqa6hrpdCdvMVsIXxOrccdKDfoR7BNnGCcfgfA0wKtJhcaoff1W
 +4Dtz7KI5IDLpm/HvdVB6P1dwYNGhy/qMZyPXRYJOrJiZQE5yYxkkgVxTtU/C8zOYA0B
 8g0XVqpQi2MGhuy2vVCiniMpiOFH1cHaiJVOFonbi4B9iPSrOPVTTPbAXR2uauTFdZUT ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3274ur2yqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 04:59:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4vXHY173971;
 Tue, 14 Jul 2020 04:59:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 327qb2nusf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 04:58:59 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06E4wtx6025063;
 Tue, 14 Jul 2020 04:58:56 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jul 2020 21:58:55 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, bvanassche@acm.org, avri.altman@wdc.com,
 jejb@linux.ibm.com, Stanley Chu <stanley.chu@mediatek.com>,
 alim.akhtar@samsung.com
Subject: Re: [PATCH v1 0/2] scsi: ufs: Fix and simplify setup_xfer_req vop and
 request's completion timestamp
Date: Tue, 14 Jul 2020 00:58:44 -0400
Message-Id: <159470266467.11195.12121628699301180933.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706060707.32608-1-stanley.chu@mediatek.com>
References: <20200706060707.32608-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_005913_206101_66CF78C3 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, asutoshd@codeaurora.org, chaotian.jing@mediatek.com,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2020 14:07:05 +0800, Stanley Chu wrote:

> This small series fixes and simplifies setup_xfer_req vop and request's completion timestamp.
> 
> Stanley Chu (2):
>   scsi: ufs: Simplify completion timestamp for SCSI and query commands
>   scsi: ufs: Fix and simplify setup_xfer_req variant operation
> 
>  drivers/scsi/ufs/ufshcd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to 5.9/scsi-queue, thanks!

[1/2] scsi: ufs: Simplify completion timestamp for SCSI and query commands
      https://git.kernel.org/mkp/scsi/c/a3170376f7db
[2/2] scsi: ufs: Fix and simplify setup_xfer_req variant operation
      https://git.kernel.org/mkp/scsi/c/6edfdcfe285e

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
