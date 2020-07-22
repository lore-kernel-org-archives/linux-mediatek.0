Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A078AC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6760C20658
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MavrofmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gBXojG/J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6760C20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1YSL8NUPH6uQUIvIwA9S8bA6IMCTOuTRCr8Bx5zJ44A=; b=MavrofmLSa/s3thK24RcMk8qFo
	XCBX8zRL/eQHFFdlN2lreG187sQK8uEqjVw9fhYuz745bB4CAKJxUHjHAK1LRYRs/rq1XD7yG0qkk
	hW/qAg8tU19lQ3g89vn8EvrNbxDEmoYG7OWLD8zE3rH6+dxJNKXsAea+Ee2oWpNce6KOBwKsNllsW
	wEY27+Wn/doxxlnM+5FmDcfvgo1ypH7IeEfato6jvhqK4wWpZ3gVXRtgiBe6yfiBd0szHyoZxc65K
	x/3IuGKWJ0KnvPZeQqkWbSnE2G1xpRCJect03GDssz95JmCgJg6SzfJQ7oJiFAzoqB5rDaGGrUxD2
	G2jZ9w1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyE5S-0000Wm-KO; Wed, 22 Jul 2020 12:43:06 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyE5R-0000VH-2m
 for linux-mediatek@lists.infradead.org; Wed, 22 Jul 2020 12:43:06 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCVINm015061;
 Wed, 22 Jul 2020 12:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ARG1RVN/4F6TCixySUe9XAtp/OnPCTzgVMh4TORIM7U=;
 b=gBXojG/JTaneWtO9vyz6ktJc0zIKmUUKGU5OgP+Q06B0u3Nn70f8Vcm372F7SCdjOKyS
 fVokWo4EFHYOkK5OuDIj9FDQid+SA2F34SqfH7ifPTZGpx42VH2LrSEtSGwY+9Ru6I5S
 y1q9smgTPT5JLB+JCA9odVt1wnHnitkzThkfDRZvPbttDm6Dy4EpGfm2tCiZmftkomNB
 Y5fdnwnKTSd/pZjV9Jhp/j840c6xr8kSlD6cSae9e0m5llKBjPWhbCFVN13SniQ5efvd
 1w0ADOkTebWSyvKdchT/SMPAkBl3JomT3+l5XeGB23Im1OcOZLFBtju90ysQqMKrozI5 WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 32d6ksq77c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Jul 2020 12:42:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCY2T4152577;
 Wed, 22 Jul 2020 12:42:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 32enj60dkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 12:42:58 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06MCdO4a030269;
 Wed, 22 Jul 2020 12:39:24 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jul 2020 12:39:23 +0000
Date: Wed, 22 Jul 2020 15:39:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Subject: [PATCH] media: mtk-mdp: Fix a refcounting bug on error in init
Message-ID: <20200722123914.GB220681@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_084305_306025_8A1CC407 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 kernel-janitors@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We need to call of_node_put(comp->dev_node); on the error paths in this
function.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 362fff924aef..478ad034ef2a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -57,6 +57,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 {
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
+	int ret;
 	int i;
 
 	comp->dev_node = of_node_get(node);
@@ -67,8 +68,8 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-
-			return PTR_ERR(comp->clk[i]);
+			ret = PTR_ERR(comp->clk[i]);
+			goto put_dev;
 		}
 
 		/* Only RDMA needs two clocks */
@@ -87,20 +88,27 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	if (!larb_node) {
 		dev_err(dev,
 			"Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_dev;
 	}
 
 	larb_pdev = of_find_device_by_node(larb_node);
 	if (!larb_pdev) {
 		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
 		of_node_put(larb_node);
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto put_dev;
 	}
 	of_node_put(larb_node);
 
 	comp->larb_dev = &larb_pdev->dev;
 
 	return 0;
+
+put_dev:
+	of_node_put(comp->dev_node);
+
+	return ret;
 }
 
 void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
