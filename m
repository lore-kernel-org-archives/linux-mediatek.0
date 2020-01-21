Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57644C32771
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 00:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E5824125
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 00:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kTmKlcOX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ezRDrvTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E5824125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ald0g2kNuHpfkle+ktBu3ZaGLW7ZvpPHSoJo0boVqt4=; b=kTmKlcOXH82Kma
	U1RT5//h01j0TiwmQQ/lalIcebFhhu0bruFrwK3Gyj/8WSyvri30WQsMsRYg682rVP02IHusKPOFd
	RMfh3Lgs0OwGvGcQRwaHV7LnwKu4D4sfFbkv27/NREb++7ZItLZuiomYEHUx56hByHyfpNDm57Axs
	l9kzgCVhNUr+M+PssLYAnX7o42EuGnOg7oL/S72cB8mBFt/5vyf/k11o8coS3NftQQwSG1S+4rT0U
	78+WuvH+Wvn2vvuXz9VgcSw5WXbBuFmh5E5sgfVcbgVRTtTqUlM7jtqBTedrCGPU4EB/n3QUSW+ZI
	/yGC4X7H+nN6Di2VnOaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ith8j-0007af-9Z; Tue, 21 Jan 2020 00:11:29 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ith8f-0007Zb-Ra; Tue, 21 Jan 2020 00:11:28 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00L08QET083194;
 Tue, 21 Jan 2020 00:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=9FblVbcSnUCDH7zhnS/i2/0a0D7oRnkTC1vUJXOtlIc=;
 b=ezRDrvTlLW8PYGviRj7jCiKInxf7Dm8+It1fOSdw+aieI299GZNKyVcKg3y6LACv+hDl
 oYCMHO6VPrOe9MgbfOZQjNsv1sJ61hwzpmY7D37ZUcdJXeQfXunRxJuAmi72QKMbs3tZ
 pY5KPoZmhGKZeRs1RqRte6eodDzb71cELLrUiYGZ8TUJfYl35xQoWXoW6Ot8mFuChYX7
 T/QHZdhoBNktek3zmCkm0XmUzyzziokio/BVAPUkvygmDveRp8xdNlZ7+5fHhQqyt/aG
 sQxhLXlVJ0IIK2DDnZI72w6JNHBLXbVkLalHWoCdpjPpdEpKzImK0MVNauX0T8tyPY0a LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xksyq1tp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 00:11:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00L08mU3176761;
 Tue, 21 Jan 2020 00:11:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2xnpfn02ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 00:11:08 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00L0B3Ml000710;
 Tue, 21 Jan 2020 00:11:04 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 20 Jan 2020 16:11:03 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 0/3] scsi: ufs-mediatek: add MediaTek vendor
 implementation part II
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200117035108.19699-1-stanley.chu@mediatek.com>
Date: Mon, 20 Jan 2020 19:10:59 -0500
In-Reply-To: <20200117035108.19699-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Fri, 17 Jan 2020 11:51:05 +0800")
Message-ID: <yq1blqxk6ss.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001210000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001210000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_161125_984283_E9E1A2E2 
X-CRM114-Status: GOOD (  10.89  )
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
 asutoshd@codeaurora.org, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This series adds some MediaTek vendor implementations in UFS driver:
>   - Callback dbg_register_dump
>   - Low-power mode for hibern8 state

Applied to 5.6/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
