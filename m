Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD778C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2516196C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E2516196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=borNe7ZlwAccNFQ1md4n2yn9Hki4Q5ELyc2/szazHeo=; b=bNE9XODG3zmaBe
	rT1H58Ofqz5itFw2+t+HF4sfW+PXLPvAE2iYaQvzUNlh94TJRyw0QAWJr16EfYDU3zhtY+5sehvaK
	y/Fq4qzDEwAl/9N31uvU6smqujucTMflGwZU2yrMQekxDJIdsfnUVPRGBQ+SLzu51SiDw3ifH2LWx
	IezNiD0RT12/AbwIePSjk5AxezJpHOJn8kV/G2LTrEnbhEE1c7zPnoKVuM4JBEgc2445aJu+Up38o
	NcHJkt/uQta2f7O0DXXimgbdDPpFLt+7aZLwg/tRcyiNOjuuLCo81zZ0654WCI9fgN9dsXpnXu/Jv
	XhG3t4oflyMCT3C0kNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwnIa-0024iQ-Dw; Fri, 25 Jun 2021 14:59:16 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwnIX-0024hl-0J
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 14:59:14 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PEuIdr028437; Fri, 25 Jun 2021 14:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tbDoPXETfKm0wSWVuyJVc016FawRN91LSq+bkmm8CnA=;
 b=Pkge9wdirVh+MYeWjF3UVAapC0I49JTHjCpViaw0J2sL2UElv+98p4OUMtK7/LgvTu2a
 TKVQ9wGNEsY9c0amAXtn4vCpYPqoLSGqUgnzpECirWCpe1X6D4F76CDjj0Gig8BA/9e4
 1ERCmAax+pis+SYox34iletlh4upLb83N6xtpk5EbEjyfrtde2wtz1RoOyxtj8UIMOxI
 ZPNFZzUlZ0kkXAcY8MFOliZtcZJL7LMxBTAYRBsIAO5/1ORX2PeiErnjsZGkh/iWCna1
 i+M5rUmhopnh2jyWZkxFj8GIBEeGbRRwJ76klvnMxrvMqtvz5+eOV2mGNKuwXrq2GWuI oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39d2pe9j04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 14:59:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PEtmVJ099579;
 Fri, 25 Jun 2021 14:59:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39d2pyayy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 14:59:09 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15PEtxEt100498;
 Fri, 25 Jun 2021 14:59:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 39d2pyayxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 14:59:08 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15PEx3c6026879;
 Fri, 25 Jun 2021 14:59:03 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Jun 2021 07:59:02 -0700
Date: Fri, 25 Jun 2021 17:58:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mt76: mt7915: fix info leak in mt7915_mcu_set_pre_cal()
Message-ID: <YNXvLvrvllpXgCIn@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: U5TCpDAlYzxOuFnYxZj1yGN63XwzthFs
X-Proofpoint-ORIG-GUID: U5TCpDAlYzxOuFnYxZj1yGN63XwzthFs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_075913_120084_10645A6B 
X-CRM114-Status: GOOD (  13.86  )
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

Zero out all the unused members of "req" so that we don't disclose
stack information.

Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..21769e4f6bc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3481,7 +3481,7 @@ static int mt7915_mcu_set_pre_cal(struct mt7915_dev *dev, u8 idx,
 		u8 idx;
 		u8 rsv[4];
 		__le32 len;
-	} req;
+	} req = {};
 	struct sk_buff *skb;
 
 	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, sizeof(req) + len);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
