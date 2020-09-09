Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955C1C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FB92080C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vfxSv1PN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tw2Y/Kfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FB92080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMaWl2mL6MKVmn+LiyfZzVw6LsCXeqyiaGrQrfwMk/Y=; b=vfxSv1PNN4SXS1d78Z1oBLR4E
	w/m4b6S/xJWLXoZmHt+juLlNnDFasMUGfelOtmMF/iNoZZKOvTIKdum67ZRiKFFFijn7cLfVaiJHZ
	yDexb+ifpAd7o9t+FNY620+SGoJPbBsD0SDcRHm4rqRHG4m509gRoLQg/C8roKzBUjIKC7RIvgW+X
	dxQVSFbEd+2MK33bTzr+mCiVZ5D1tuPUBleUBCeIkGBCv9IlKc5/BYDMQVQMvf7UfRDpBETNZoJqL
	P6EfwBnGi6ZuUaS4FOYvGMd38jXeB5To3wLVUeGSA2QcPUGkJwS/5z4l+h+AmHj0twBd2ywOEZUR4
	szIzij6Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFpgK-0007Ji-WD; Wed, 09 Sep 2020 02:17:57 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFpgI-0007It-GM; Wed, 09 Sep 2020 02:17:55 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0892EXVH110453;
 Wed, 9 Sep 2020 02:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=+6EeTRUGbtx/wzn7rd/wXstaBoeEwA1blINQVhp/ggI=;
 b=Tw2Y/KfrfMFylSY28sOErTj+Kv+Koy80AGC8Hfh7UWI7p0C4G8JhtBoQGsKHZGE1lLm4
 Y0WXzgWTKyO7CiFfZ1bcp+5g/l/eBlhfyMYjfioJYxMCsn2vgcE1bijUTkc41Q3guw9D
 sdbvmXvpDqESeOniudx3yF5tdhMdI4naajt1iY58GIH1Z8dSlaPwlRWfE2FfYm/XkdBj
 oLpe2rYMXqzrvksx1rDEpTWmGNo0QjB7YRH57KSgUGU4hBkFQrpFARzBzv0Rlojnf99W
 U5UuWyFU1Un701QmE3JrBdqeBJ1KJXHDKsRFijsT7cSpr3HMgxhtt4HiXVN+Ahp3F9u2 uA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33c2mkxw9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Sep 2020 02:17:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0892GLKE025937;
 Wed, 9 Sep 2020 02:17:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 33cmkwwtqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Sep 2020 02:17:49 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0892HlwM009697;
 Wed, 9 Sep 2020 02:17:48 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Sep 2020 19:17:47 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: alim.akhtar@samsung.com, jejb@linux.ibm.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 avri.altman@wdc.com
Subject: Re: [PATCH] scsi: ufs-mediatek: Modify the minimum RX/TX lane count
 to 2
Date: Tue,  8 Sep 2020 22:17:31 -0400
Message-Id: <159961781204.6233.3580543216052006167.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819084340.7021-1-stanley.chu@mediatek.com>
References: <20200819084340.7021-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_221754_645832_B77F2724 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: linux-arm-kernel@lists.infradead.org, bvanassche@acm.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 19 Aug 2020 16:43:40 +0800, Stanley Chu wrote:

> MediaTek UFS host starts to support 2 lanes, thus modify the
> minimum lane count to 2.
> 
> This modification shall not impact old 1-lane host because
> PA_CONNECTEDRXDATALANES and PA_CONNECTEDTXDATALANES will limit the
> target lanes properly during power mode change. So we could relax
> the limitation in ufs_dev_params.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek: Modify the minimum RX/TX lane count to 2
      https://git.kernel.org/mkp/scsi/c/460d74a0911c

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
