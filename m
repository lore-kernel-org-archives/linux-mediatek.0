Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E09C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:24:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E7723A5A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E7723A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2sYacirV/plLJr5Pg1BDISAaURdd1gA5VKOhYEr0yyg=; b=FdibpmPBz/pC3vJnypVqBeLJd
	SfWl0GmWixS7CiTwblxeD4lXvLknswK8cZddH88kFH8FLqmDvBwpSgxoYfsw/F/k0bwkK/fd7BcRc
	0Oq2QCA/p7ou3G/+YPbAmq1EmrQu47osyQ4em/4gC5q3+vSJki8QIdCpBNLrEKn5rc5HAB0Sa+ruD
	66sZaUYZQ0S9LiN75aoLUYLAxLYpeFpir+2tvsLNHuOMvR8ReMnoM7INMqfarrDgribkaiZjtw1CS
	qmOqumGQ7+r5z/iK4wvYXRh/9rJsJ2ukx46VDsMPP4h8Qhjjf74fsjiYACpHxYYFbm6TZJ3yRbwQ9
	ampP8c8oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn3CD-00079L-8R; Wed, 09 Dec 2020 17:24:09 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn3CA-00078r-RW; Wed, 09 Dec 2020 17:24:07 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HJjBu111648;
 Wed, 9 Dec 2020 17:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Krnm1gBj032vtaGUPm7ProEmQ8tj5X6aneGdqw5G3cc=;
 b=n7M15kqn82ZJG8iDK3zj7Q1jQ89Z/bIBV2Ymtzp7PYGGQ0SrjGc1DzCsqR6NdNa0Zr6t
 tWfChNHXG79lHtiNcMgDmQ2s9vY2tS4FFHH8rzM/FiIB9ZtJ6Z07+R/VYP256kae5CNV
 9fSKiVk217edJEvTIfgMc3s0aOyS1lWG1JjC+lr/zeUzQhR+SKdVsNs/zl1PwdwsWvbk
 cFt5LjNsyj32Vc1h2vkw0XHG2a+VcMXU03t2jQ5BHwnkrT6BYShK0ivEQd2D3ADUmCCQ
 apJ27b1eZ87kuzuQp7HPMUJOcxTgn908KaYEMTwO02YT//PhrKpjnJqXzOlnJRRupbsl Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35825m9cv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:24:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HJlCx075705;
 Wed, 9 Dec 2020 17:24:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 358m50wh3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:24:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B9HNwd6017969;
 Wed, 9 Dec 2020 17:23:58 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:23:58 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com
Subject: Re: [PATCH v1 0/4] scsi: ufs: Cleanup phy_initialization vop
Date: Wed,  9 Dec 2020 12:23:21 -0500
Message-Id: <160753457754.14816.2032676444493914271.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205120041.26869-1-stanley.chu@mediatek.com>
References: <20201205120041.26869-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=959
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=979 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_122406_992515_2BB5A9DB 
X-CRM114-Status: GOOD (  15.26  )
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, alice.chao@mediatek.com, cang@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, beanhuo@micron.com,
 peter.wang@mediatek.com, chaotian.jing@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 5 Dec 2020 20:00:37 +0800, Stanley Chu wrote:

> This series simply cleans up UFS vops and shall not change any functionality.
> 
> Stanley Chu (4):
>   scsi: ufs: Remove unused setup_regulators variant function
>   scsi: ufs: Introduce phy_initialization helper
>   scsi: ufs-cdns: Use phy_initialization helper
>   scsi: ufs-dwc: Use phy_initialization helper
> 
> [...]

Applied to 5.11/scsi-queue, thanks!

[1/4] scsi: ufs: Remove unused setup_regulators variant function
      https://git.kernel.org/mkp/scsi/c/ade921a891de
[2/4] scsi: ufs: Introduce phy_initialization helper
      https://git.kernel.org/mkp/scsi/c/92bcebe4b6d6
[3/4] scsi: ufs-cdns: Use phy_initialization helper
      https://git.kernel.org/mkp/scsi/c/885445736bc0
[4/4] scsi: ufs-dwc: Use phy_initialization helper
      https://git.kernel.org/mkp/scsi/c/ab98105484fc

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
