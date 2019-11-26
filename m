Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2FAC432C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 04:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E127120678
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 04:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDhGCXCC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KXvWCB5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E127120678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AAMKvRe7ujHx9/I9jNjEFG4Yxazk3d2Ywhg+J5EwEu4=; b=jDhGCXCCDEypBW
	fnE6PaAHEd/kwgT7IK0Og+yggNqE7L5uUTdxqZ0pAhq90OezwUmabD/L90bdeJ49OBdGpPcEaFWhv
	/nXHUws8zU+Jgca+WeDmbbt1OS1lt+RhFjK72F7ZamQQywG4qdOAinA9E5K84ZM0Y6o2c5RqCG0Z4
	zOhqWobfymW0Nwfo/xjxQogo7gPSNBp0uod+enaWbuP2ijO16GULoKFl4t0Yr+Qxk/2DTN04jj5KH
	oChEBc9ZNbT1+2NZqVQ6ae5N70NzXUNJeW/TePXBj/w96kHX2Rc7V9KMUFBfZ4A/YsZ0kWX/+hN1l
	DAGjauxFr41x5aQfo6LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZSpp-0004gr-7s; Tue, 26 Nov 2019 04:52:21 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZSpm-0004g2-U5
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 04:52:20 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQ4n5en136542;
 Tue, 26 Nov 2019 04:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=px4UVOHmBMQFSbsmmo+gAq1ZrSLk2MVlqZaq1ybrBa4=;
 b=KXvWCB5eytJ+Lf/dFLDRjZrNAzrt1wt39nIxAJbB3rLLIbrsgdnxcYpx6T+oqV4XKS4m
 fAgoDDcc4Pl71r1v3vDovWlqKVE8jam6AJe0rGO0J6dDqLcxa2uZ2FC3hGhoosnI5wUc
 fu79M+KkUBD+gS6bisbLELX7VjzqN90Ov5S6kjsykQ5cmHIgHuA+vgY6cSiYkIVfvOxL
 RTaz1zW1vas0K+11SVyR3nJgX1fNbhQrY+l2RuvWyke7Vdq5oCMgggT4Zox4Hj59kQGR
 cEBkg8egH7rY1N1ix/cl646ZlBt4KCwtPjlurmSNtYm6vaolqWq19t5NBvokV4uFfNfC wQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2wev6u43xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 04:52:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQ4n1Jt137817;
 Tue, 26 Nov 2019 04:50:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2wgvh99tmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 04:50:14 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQ4o94a016699;
 Tue, 26 Nov 2019 04:50:10 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Nov 2019 20:50:09 -0800
Date: Tue, 26 Nov 2019 07:49:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
Message-ID: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=756
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=817 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_205219_061749_1519A33D 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The sband->bitrates[] array has "sband->n_bitrates" elements so this
check needs to be >= instead of > or we could read beyond the end of the
array.

These values come from when we call mt76_register_device():

	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
				   ARRAY_SIZE(mt7603_rates));

Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
ARRAY_SIZE()

Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/airtime.c b/drivers/net/wireless/mediatek/mt76/airtime.c
index 55116f395f9a..a4a785467748 100644
--- a/drivers/net/wireless/mediatek/mt76/airtime.c
+++ b/drivers/net/wireless/mediatek/mt76/airtime.c
@@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, struct mt76_rx_status *status,
 			return 0;
 
 		sband = dev->hw->wiphy->bands[status->band];
-		if (!sband || status->rate_idx > sband->n_bitrates)
+		if (!sband || status->rate_idx >= sband->n_bitrates)
 			return 0;
 
 		rate = &sband->bitrates[status->rate_idx];
-- 
2.11.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
