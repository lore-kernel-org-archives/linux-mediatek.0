Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BE4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 12:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C0464DFD
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 12:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C0464DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qw4h3IfF/R3G7VEp3u+3N4EFcm9+ZUfLI8Yc4mreHJM=; b=ac8EXSLYE8dQdu2TJMEHq7Wknh
	H/mszZJ4AxD2zzo4eMVeCFP2tOTi1z6NRQxwBncE4bYxeo6qM7eT+EdQ4ZJEPPDZ92PXSFucweln2
	sYspqxTNhrsLsuxwuTR9fkTPxMThrnyexlliwFj3Qo13c1qXZY/xupapkQxwhqVnQGYB7s3rL6Xai
	jtBdqHUfn7cBNyOuuUdpxKe00vk3mUPt278cymiRp063xy9jvTZL0S63wGTPsIBwKEafQI9hhHgvY
	YtjFVMcgqDATtzOIzz9V7/Q2Xgf6zWG6l/KcqPcR383YQ8MqVJPvu3lJnnBd4ae69LRfdzjD7UHRD
	Jt7l3Hlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l80Vl-0005R7-CI; Fri, 05 Feb 2021 12:46:57 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l80Vi-0005QZ-94; Fri, 05 Feb 2021 12:46:55 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 115CUYPJ079869;
 Fri, 5 Feb 2021 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zXwtIkuYEvqCQ/ph9hBq5tQzsewQzXSxbOL7lVa4vXg=;
 b=oH1DGtQvWsFrFUqJ19MwDJRh34+8Yu03cm+lpQkudCPi/di7LwYhcw4ZMEZ4lVkvcojZ
 zYuIwAjkAhbxaMwqyVFBF1BHpOtY+vMh48Vajs6mwdAaILpboJJoDZ2dC3PXorURrE9t
 adkCNmNZKw4Ipg4Q+ec3wb0uKgpZ7WzzVBgZ5cTUnYekFvIo5GNi3gSvOMqtpgcuxZWY
 vpmCCnQuDA6IAhqd7/csnwlfnX34A27zJ8yOzv/6xkB2bGeeLxZitUxZZwdKlO2kyX2G
 PXUcdckWkwK8+1EkoTys0aL4ywUxpQAOhEp0id70M3BXMgGldczItGn/oGXk1wRpSNfM 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36cxvrcb5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Feb 2021 12:46:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 115CVOCK100352;
 Fri, 5 Feb 2021 12:46:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 36dhc437au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Feb 2021 12:46:34 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 115CkRpd001622;
 Fri, 5 Feb 2021 12:46:30 GMT
Received: from mwanda (/41.210.143.249)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 05 Feb 2021 04:46:26 -0800
Date: Fri, 5 Feb 2021 15:46:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH] iommu/mediatek: Fix error code in probe()
Message-ID: <YB0+GU5akSdu29Vu@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102050083
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102050083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_074654_471858_2D972989 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This error path is supposed to return -EINVAL.  It used to return
directly but we added some clean up and accidentally removed the
error code.  Also I fixed a typo in the error message.

Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/mtk_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..5f78ac0dc30e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -886,7 +886,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	link = device_link_add(data->smicomm_dev, dev,
 			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 	if (!link) {
-		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
+		ret = -EINVAL;
 		goto out_runtime_disable;
 	}
 
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
