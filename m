Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55216C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:15:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF7C6144C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF7C6144C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EonDW53+QJ5qDoSvBH+6c9MAvhDT/KMlneo75RoZkHE=; b=SZZRyHrX0r9yA8butQ8E5DoOcE
	8nZi1XzmMYzyqgy4VKwQfocma/uZrEQ5PC8CuUR2g0E3qaT4Ag2jGq0BNMkqdU6mZOq8+98mZRvby
	fz27+e9ZFgsExwNRwyNM6bO5PZkz/Xpd02NJkfdTsu264Npcyc3AqA77FgNi0CW8+O/WJcB+RvF1q
	uFb9ltkjeqaI9KU0qjVL7FBE8JVuhc+uZS15yRFQeAJmhAz30WEijnZ9bf1Kx8w1xoOl2ra5ikd0b
	ZYKglyLOo6/KRqxlbI8Jwonh3XBpaJOsIt+klEhRZpawtFsQPINM2IMT5mOW/I1ZlAcPgupLD0rou
	mlY5YUFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZChU-00ERIy-Kt; Wed, 21 Apr 2021 13:15:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZChF-00ERHW-EG
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FlzphcOCSgX+2k3rUk5ygmbE2dHWikxsYFYPqUAoI5A=; b=G2h+7aWmGLYP4BjkwmayP2JvkU
 d6d+yVohhMuSVHRv2/Wbl6LvCp8T2NJ+qas2GPxa2IS7FEb4TpCV/OHPXkf1/o559I+HprtuKvNT5
 ynBpksT7ICwxmwUuzbBXRcpHExJ/70euArWqB/uSRqB4L1A60jaIsauTc8cbBowmh9cPe2dl+n/g9
 Cezk5qM0R12I1jVZfE8penepTU94CMpWpfigFC0LHIloX9akAo5W/ZecayMKuD4nMHFqWGmQXqegz
 5leih0RDSr+iLCKfOwZWtmt3lWRY0VB1WTe6EfszSYZPh5eCBS97jrGWu/rOyE/MEKXDEMZtPSR3Z
 v5+ldyLA==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZChA-00Cu7k-19
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:15:12 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDCEw9005847; Wed, 21 Apr 2021 13:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FlzphcOCSgX+2k3rUk5ygmbE2dHWikxsYFYPqUAoI5A=;
 b=vDAk9jhA93QJm/tDNOkTo9apIGr5dShybhB+BrCKFXqBJL86F6Gl+N9stG+JyVEMDCOi
 sKmqXkx9QnkYcWXMLJ/5sBCOCoOU6FVdx8tKPOUuXDH1M/vnd/S4r3NmRIexi6SVpqwL
 XYbwAucWPfh66eyIPDbZz//gmFF6pJdVIoYWBiToKA4IleZ+tthQwPDOStg6pGgJ75Mg
 E2eA6tCy010xvN3MwyvfZ7nFXPtEtgL+Bd+SmKGD9mPx1wUdfkf6oejeBODEbYU/4tOB
 +hWTurCU2xa6xeDdRachcbvTmWhU5r+h5Ll03v8SlyCU/NSXaTjO9/dq68lqd5Pb83nK gw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 381bjn8pra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:02 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDF26f098309;
 Wed, 21 Apr 2021 13:15:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38098rqhhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:02 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDF1uk098159;
 Wed, 21 Apr 2021 13:15:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 38098rqhdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:01 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDEqlP015391;
 Wed, 21 Apr 2021 13:14:52 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:14:52 -0700
Date: Wed, 21 Apr 2021 16:14:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <objelf@gmail.com>, Soul Huang <Soul.Huang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] mt76: mt7615: fix a precision vs width bug in printk
Message-ID: <YIAlQKR3IpfKW5Sx@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: IN-xhjViv_z8hvaYiIkNq2YIg1Cs348v
X-Proofpoint-ORIG-GUID: IN-xhjViv_z8hvaYiIkNq2YIg1Cs348v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061508_214148_FAC4C5F3 
X-CRM114-Status: GOOD (  13.73  )
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

Precision "%.*s" was intended instead of width "%*s".  The original code
will print garbage from beyond the end of the skb->data.

Fixes: d76d6c3ba2b0 ("mt76: mt7615: limit firmware log message printk to buffer length")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 9b9f8d88e9bb..00b1b657cb21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -424,7 +424,7 @@ mt7615_mcu_rx_log_message(struct mt7615_dev *dev, struct sk_buff *skb)
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
