Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FDBC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 14:54:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869B0611CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 14:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869B0611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hkC1rt3tlWcsZfjAsyk8r0arBdmYQLVm+Ckq0W4xhek=; b=MGF8nRKHQcicyDRPVUhbmodqnT
	z01FLQCCoCD1c8P9RIDy7BsRgYFqnqs0OdVYuoz9Q1WaRN1/0yfH4Z5ZHJ7333IEmYt8zy6eLWkhz
	73m3AnuQ0uQPkcDGTJQbl2k/omTJVxYiTd63qb+V37bdLfHPRPrglqDhoBNuld39+lUzMG9XHxGU6
	mb/CgMxZ2aGD06rS/NINclW1trGY4m1SemlA4G3Ti7O3VJpCYvvzXg+6E1a03cLLgH2tw5oIhASyK
	Lm3Mroe3KBUDxa4DQiGkjoIvwJ4sT9C8uDZK4vO+cA/JQvKbeEM4doit9DNB7Lci+rIdq9EJcppee
	p3RffFUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldZxy-00E8Ii-Hz; Mon, 03 May 2021 14:54:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldZxp-00E8HR-Qq
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 14:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=cdNlMntfr+Dhz5UmiQP55qbEYXLGg/UgqsiwzzTuLEw=; b=1Cziiowy/m3UlVHNAuO6N1e7f9
 EXeP7+zX9SOU0+CvfzAemsm+3cUrG7naaFbfJGmLAA3WHhpZ97CucykPiXetsGzRKYwP2RcZW6/T/
 lNTxPYivWHafpvHEPuwEXufBJm3vwWPSWuQ9Iz9TWfyoHpYRu/iQI4xSljR+Sb0THvu8Y0HNwr7Yg
 WShRQw2iAp1SIyUaMWw4YlhNY/gsFBLbe1om99sFMfH8hi4dLiIPTkCw4Fb9n1718CZvQLzhdrVMY
 AEIXbafUpyKRdqtPUQURd8zxl+zORBHy3nwBu5BoxQ/xsqiwvZ4A6bBIkW0qcp2tS/LsOjlvRfYhl
 7S9Vq4ZA==;
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldZxn-0038zs-6u
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 14:54:24 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143EoL7m007643;
 Mon, 3 May 2021 14:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=cdNlMntfr+Dhz5UmiQP55qbEYXLGg/UgqsiwzzTuLEw=;
 b=OaoFUQGde/t1Ha4HqhHpTUfutzrJ1njdrv/J5Vt97HV65Z5Qe9CzCqKvE397j8fgauN/
 MUASNG9r4NkT/pBdADinfbozMoKdq1HBRrd3KZyyjKgfqei/Ch1Xkqb4/ALtJZrNZ5PE
 OSeP4kNo38VQV4IbbBIOjwP4OrA0wKkhPHJ3bYkuIITtqcW7hPKd6VRZk3VoeGrP9LdZ
 huF0YLREmBI1QO/1Ud0RhC0fNNnthVVMVFDKuAG2J+aCRq5gLJiolQswtL07CbbKXbj2
 M1LCsVwYuj/Pr5+w0x5AmPKg+uN1b7jbG1s1U1WFioJly22hga+QUY1wlRbfhYj0Olig Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 389h13ts84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 14:54:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143EpFkd192498;
 Mon, 3 May 2021 14:54:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 389grqthgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 14:54:09 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 143Es9qr016517;
 Mon, 3 May 2021 14:54:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 389grqthge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 14:54:09 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 143Es7Xr002774;
 Mon, 3 May 2021 14:54:07 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 03 May 2021 14:54:06 +0000
Date: Mon, 3 May 2021 17:53:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mt76: mt7915: fix a signedness bug in
 mt7915_mcu_apply_tx_dpd()
Message-ID: <YJAOhzs1XQQIB1Kw@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: GU7Nq_ShP-nsk1V-MiVG_Nndt6qHvgsH
X-Proofpoint-GUID: GU7Nq_ShP-nsk1V-MiVG_Nndt6qHvgsH
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075423_405137_011AC234 
X-CRM114-Status: GOOD (  17.84  )
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

"idx" needs to be signed for the error handling to work.

Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b3f14ff67c5a..764f25a828fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3440,8 +3440,9 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
-	u16 total = 2, idx, center_freq = chandef->center_freq1;
+	u16 total = 2, center_freq = chandef->center_freq1;
 	u8 *cal = dev->cal, *eep = dev->mt76.eeprom.data;
+	int idx;
 
 	if (!(eep[MT_EE_DO_PRE_CAL] & MT_EE_WIFI_CAL_DPD))
 		return 0;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
