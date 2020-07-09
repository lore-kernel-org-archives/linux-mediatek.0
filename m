Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FE9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A1A20708
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQYW5Ilm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D9H2k2qU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A1A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=prfBRlMEHe/4/2gim44n9VER5BV4qBhBYSO17G+ojr8=; b=rQYW5Ilm/kPlm9eplEa4P4MrGY
	XocKKOcaMoZ9hkc69X6VqizcuEqw3sCsnfry0MwnLFxxBpvSWisF3ISsqOfV87jEXYd0eFiY5orFX
	u6oLDsq5PImEMzM1LbZYIus7bEvhBm1cRI4HnbkTx8YJ4IZkfL5qh0OefBfebdUdOjVttQLGl+3FB
	BEJvgoLn/700su4i6rgjiBqTX9zphxf/7v/j85nqdUHm2LLhUWkJLvhTbtpEX96F1+0kpEO6d4BST
	AzBJlUHVukXGUe5mOKsUsL6bztSzJQ7e5nljh6JTCGIMrB5Og9Y6kL+Co1/dRM5Jjqeso5XWbemBf
	IqRYCaGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtU62-0001WX-Cc; Thu, 09 Jul 2020 10:48:06 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtU5z-0001V2-Lm
 for linux-mediatek@lists.infradead.org; Thu, 09 Jul 2020 10:48:05 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 069AhkwZ107693;
 Thu, 9 Jul 2020 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=+piH9g8eBNCOi62IwT+RVUymcrfDq/wMfcGf2cw6NRo=;
 b=D9H2k2qUfaEIH044sAxxReGDMog0mUT0PWPjYaeh5T6/MPq5ZEoKJkPCiGsjNda98CPg
 90Ud88UvKEqn3t/H2JP0LnQKgX+yQj0fckQ1z+dTKMVBa/QT5efjjq1tJo4xa1j4KDId
 leR/EeXKaj/1c9m5e0R+k7Z8r/nzp157n8t5O0kFMSgyI6zLTyr9vVTOklNrLtslBds7
 OEb2Eg+WLQ0xf4qiSdKX7gkdKEsXE/SuVM1LIjZGVbC4XAzzQqDAYaP/477HDkp7T9zo
 cdx3+tpQ6R3PcF6vPgdl0lTL4Vduqvp6Y9LTQENfzpYzae9WdN69ZWrTZd46bq+/ycyR MA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 325y0agwwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 09 Jul 2020 10:47:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 069AhM8J072188;
 Thu, 9 Jul 2020 10:47:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 325k3gpjgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jul 2020 10:47:48 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 069Allqi023569;
 Thu, 9 Jul 2020 10:47:47 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Jul 2020 03:47:46 -0700
Date: Thu, 9 Jul 2020 13:47:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: potential array overflow in
 mt7915_mcu_tx_rate_report()
Message-ID: <20200709104738.GB20875@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9676
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9676
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_064803_912517_FCB1846D 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 YF Luo <yf.luo@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Smatch complains that this comes from the "wcidx" value comes from the
network and thus cannot be trusted.  In this case, it actually seems to
come from the firmware.  If your wireless firmware is malicious then
probably no amount of carefulness can protect you.

On the other hand, these days we still try to check the firmware as much
as possible.  Verifying that the index is within bounds will silence a
static checker warning.  And it's harmless and a good exercise in kernel
hardening.  So I suggest that we do add a bounds check.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Normally for networking patches, when we change the declaration block,
we must update the order to make sure it's in reverse Christmas tree
format.  This code wasn't strictly in reverse Christmas tree order
originally because we needed to initialize "wcidx" before we could
initialize "wcid" etc.  Re-ordering the initializers makes the diff
slightly larger than people might expect but it's a required part of
networking patches.

 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c8c12c740c1a..8fb8255650a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -505,15 +505,22 @@ static void
 mt7915_mcu_tx_rate_report(struct mt7915_dev *dev, struct sk_buff *skb)
 {
 	struct mt7915_mcu_ra_info *ra = (struct mt7915_mcu_ra_info *)skb->data;
-	u16 wcidx = le16_to_cpu(ra->wlan_idx);
-	struct mt76_wcid *wcid = rcu_dereference(dev->mt76.wcid[wcidx]);
-	struct mt7915_sta *msta = container_of(wcid, struct mt7915_sta, wcid);
-	struct mt7915_sta_stats *stats = &msta->stats;
-	struct mt76_phy *mphy = &dev->mphy;
 	struct rate_info rate = {}, prob_rate = {};
+	u16 probe = le16_to_cpu(ra->prob_up_rate);
 	u16 attempts = le16_to_cpu(ra->attempts);
 	u16 curr = le16_to_cpu(ra->curr_rate);
-	u16 probe = le16_to_cpu(ra->prob_up_rate);
+	u16 wcidx = le16_to_cpu(ra->wlan_idx);
+	struct mt76_phy *mphy = &dev->mphy;
+	struct mt7915_sta_stats *stats;
+	struct mt7915_sta *msta;
+	struct mt76_wcid *wcid;
+
+	if (wcidx >= MT76_N_WCIDS)
+		return;
+
+	wcid = rcu_dereference(dev->mt76.wcid[wcidx]);
+	msta = container_of(wcid, struct mt7915_sta, wcid);
+	stats = &msta->stats;
 
 	if (msta->wcid.ext_phy && dev->mt76.phy2)
 		mphy = dev->mt76.phy2;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
