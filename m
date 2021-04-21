Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62803C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:15:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4046144B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4046144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=s/KQctJ/WuLa4ApiTNjKhrlaJdsgFRh7fwjYMtbk4Oc=; b=Ulou5lAuapb4sRp1mQUTeBBMF
	+SKbjJPJo5xSqUikFI9kkTNPurN9HgXz/aVY8CzecPwJE2pAvBEwovJJL0iKlhO2d4SJGfJBFQRSs
	WekUSbApcvJ0UeDzp1qqsaW+HS+9gpGxwAj1iN3jYDDCGt9npTlQpkil/dIncZps1SyAy9xMkn+Zm
	e/b8/vMALUZR07Z2eDHXTnNWrNgxiP6K4t8Nc5D17lWSJOObzimdSAyzZZpwDHzafYUD/aBelkIOO
	X9X3lOETIvIBtS+RZOcrhzdFHpILsM859U1+vHNApumc9ckD8ZJf9rl0FFDSdkZD/5d7XqboNyNP4
	EdoracpmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZChc-00ERKA-Is; Wed, 21 Apr 2021 13:15:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCha-00ERJN-80
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=voSpbjx/x56pXz5sZw/CvfaDp0mSkH/RSK4TECgB8kk=; b=rIcLUobwZxzLcf+wqKNT1QFZrx
 lHtdEAnJBlsvQpTxWPw2zIjBiqWYIq9wrG28ZV9fkLQ+V06Jv8vKZdnH4/hGX1YLsXRjYjFyD5QmW
 NDLnA/mARYcKNEAmcB2t3KT7oc76aH/Or1CX2qqk7sy5bJ0zzai++BlbQeRtdhBctnmntIWh4T483
 88jdmT2YsSfuLtt831FVbfr4avabQ1Zy+ZFT0urf8ryZIia6o1PUPO88cKhrCmNKyXRnrGhZn+7Ju
 FiiRhpna8fplomNkrUHmzPPCtDngFMB79MwcfkO1pJnlZc3lKQwfu9KfYBoHmh+Tr7xC1kV6hbBEJ
 7ZrKWEZg==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZChU-00Cu9g-O4
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:15:32 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDDZDL017595; Wed, 21 Apr 2021 13:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=voSpbjx/x56pXz5sZw/CvfaDp0mSkH/RSK4TECgB8kk=;
 b=LzC4TYjngueQCSNQfKQi2Qd94J8kyx4A6a3haihNzDz5SJ0ZUyLL2UyrwruK1AIC4LO9
 0BL2f7m8v050YsJz54oZ6U2rVGY52c+SHIWbgyuDQnmHyPt5ztA1ISWXeTj1EQjwK7++
 41pbviWy4SHIILXCtXji1DrbH82qT0xL1xizbN5G4hmG1fvRiTIyHeCxTYSt4Y/hZyCw
 6v8FEJq4qsocRz2xHNLhKpr4EatrYd9cy/R+2ikDMOeFFUKIQyo/gy8eYymVtIKYyUjH
 i3z8sL2R1BBCSEZZRl63KIfAVGEvsYUnhTiHkGR7XuU2Gj9fF6xJlL4KP/4+JpZxQuIr MA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3819340qkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:26 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDFMZi099267;
 Wed, 21 Apr 2021 13:15:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38098rqj3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:25 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDFOZk099410;
 Wed, 21 Apr 2021 13:15:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38098rqj2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:15:24 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDFMOV023395;
 Wed, 21 Apr 2021 13:15:23 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:15:22 -0700
Date: Wed, 21 Apr 2021 16:15:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] mt76: mt7915: fix a precision vs width bug in printk
Message-ID: <YIAlYknkd0SoD6SY@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIAlQKR3IpfKW5Sx@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: _DsSEl4YivLeT4BCMHLoEUKFyR-Hx3Ze
X-Proofpoint-GUID: _DsSEl4YivLeT4BCMHLoEUKFyR-Hx3Ze
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061528_920730_35B7E310 
X-CRM114-Status: GOOD (  14.79  )
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

Precision %.*s was intended instead of width %.*s.  The original code
will still print unintended data from beyond the end of skb->data.

Fixes: 665b2c780d63 ("mt76: mt7915: limit firmware log message printk to buffer length")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
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
