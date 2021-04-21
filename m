Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965DDC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:41:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB9061445
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB9061445
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=x42VPMz2ZmHR5bdnHAmnUC2IpqvGta5nm+6ibRTCJSY=; b=hAZu64JkLyI9D2jQoxJgft1sW
	xE6hXffCCrxPw5fL7C9XYpZb7DCEZ0HvqZuXsZoJeAuwmyo8GfaaTsW545eJRQt0HOUa/IEa/S1TN
	nI8xeoUXgovUU0ZzvH19vSy7aaxKlS9PJTDIsf+k+D6HZQ1c08S/VMKXLevtwRywlCFeYFhmmBGRb
	DmXevnKgeFWAs7/Bb3Qr9V2aS3Pd4RGSNIrcS+e/7LkJewPqx9eTCnBxKRFAomp3Ki5PEtIBj/9SM
	jBujpgxsgTLDvCtWTItlOtZjI7uznRbTT3glD1PGWRNRI6/hUuxGyC9l29xGuepmKhAEK9xge///7
	fW8Qe+PsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZD6A-00EU8K-MI; Wed, 21 Apr 2021 13:40:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZD68-00EU82-77
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=CiyY0TY/FT7GLJEH1shy+3dTJnAndDqr1nVXcawFzIM=; b=1Brcqfdv3IJY8Jmo1hFfnzG/yZ
 ffqFnDiBrddIdODFy11vQ83jw6A4TQjC0t505MyIr5mqG//H+S+zEzDxtHhDxQ8CyFtdjBWbMVz1q
 mwmFWYvc6kncREZXxWqQm4igrnmTjzgKee2fODn2x8ejE9TQrw3kRVeerAKDfs8E0AwE3m5lvlzCF
 vih/QHDoy/GPNa0G3tx1BdOsur1l0++D2wdMd0vt9qjPu6wzemcrTk557TaQObetFiZnFYAhRVnof
 3z5NrnpnPItUc2OQ6YOoXgfqbtYWBka99PUzhdI80nakF76NRZz/crDaHnTrFW3X/VZTLlZIE52Kf
 8JkLPfyg==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZD65-00CvOY-GH
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:40:54 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDcNHu006382; Wed, 21 Apr 2021 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=CiyY0TY/FT7GLJEH1shy+3dTJnAndDqr1nVXcawFzIM=;
 b=QHTo7GuamBfRfZRfAZidoFKXUVHvYIvfxo+GTvRkMjq1NS1k4fGwhFxw2ynR5WTCTfK6
 +DWwokTQtnMRkkuW0lkeNd6QDM6TaJzgij+6k0Z+lJ/y0W4LXrdUGNUJb3l6qZRub7ko
 Cd+Or1zg0ED+3uH/oT+5mELGKIVeyR9jXp2r/yKbt1CF3c7RglG8EDMKCNHg2dvxjT7a
 00+I8ltgiq5M8IugRVJEzlIUrWIG589kQcOUivfUVCJJPZOuP683bCBMq2N7FKXjDmD0
 Ep4v/iz2qjlA2POrM6bdTWf10mIB/Q1TIKdib5EgEm3d58ZqbKjTFkXcUoGamvqdXGtv vQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3818whgr19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:40:50 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDbYmI048456;
 Wed, 21 Apr 2021 13:40:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3809eu9qy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:40:49 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDellH009579;
 Wed, 21 Apr 2021 13:40:48 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:40:47 -0700
Date: Wed, 21 Apr 2021 16:40:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3 v2] mt76: mt7915: fix a precision vs width bug in printk
Message-ID: <20210421134040.GI1959@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ecf5b648ea6d42994abbef8d9cde7e15a0a837.camel@sipsolutions.net>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210106
X-Proofpoint-ORIG-GUID: 65bgiovjOKDKye3hix_FCzryIttMqmp3
X-Proofpoint-GUID: 65bgiovjOKDKye3hix_FCzryIttMqmp3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_064053_567457_7E0EBBB4 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Precision %.*s was intended instead of width %*s.  The original code
will still print unintended data from beyond the end of skb->data.

Fixes: 665b2c780d63 ("mt76: mt7915: limit firmware log message printk to buffer length")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fix a typo in the commit message

 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 908e74a6b8e6..94195a1ad3b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -521,7 +521,7 @@ mt7915_mcu_rx_log_message(struct mt7915_dev *dev, struct sk_buff *skb)
 		break;
 	}
 
-	wiphy_info(mt76_hw(dev)->wiphy, "%s: %*s", type,
+	wiphy_info(mt76_hw(dev)->wiphy, "%s: %.*s", type,
 		   (int)(skb->len - sizeof(*rxd)), data);
 }
 
-- 
2.30.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
