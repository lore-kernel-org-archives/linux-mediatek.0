Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353EAC4707F
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F4D61009
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 01:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F4D61009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nARazAi3qhAwdf+O4g6ggp25VXEQG02XCIPP18pB+1g=; b=vBkTv22eaAuIbN
	CPx7ZiwSOxh6D6zQcfWoKpsSk5MrqT8z6Eafl1EnNDt3UaLOJkzrgGP6HcNu6LNzCVx/zaYIXxjxy
	zzei+eWaCPBXPJfBUgOOy5ZIu2toIYvx8ny6CzzDgXf7aBeINrgljzh+Y36Pa6Fn7Lq8xANSNmPj5
	v4mar1dQgx6KJrH70y4nTKHG4F6U1H4qJbS9gHLu5IaxGAljX+3gZSandMfcPGXXXddwLBL6D7it6
	W7O0GxG9AXt/HkZcNIErVXsIDNqC472oUwmiQ1s0boULPWFMlT62Bpb8Bs0/hymHOhh1uopvAY1nj
	W7NovjnepKvTsJ/to0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmRap-00B4cE-Dx; Fri, 28 May 2021 01:47:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmRaX-00B4Ut-Ei; Fri, 28 May 2021 01:47:02 +0000
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FrnXy3mlmzYnqS;
 Fri, 28 May 2021 09:44:18 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 09:46:58 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 09:46:57 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <nbd@nbd.name>, <lorenzo.bianconi83@gmail.com>, <ryder.lee@mediatek.com>, 
 <kvalo@codeaurora.org>, <davem@davemloft.net>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] mt76: mt7915: Fix unsigned comparison to zero
Date: Fri, 28 May 2021 10:05:37 +0800
Message-ID: <1622167537-74981-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_184701_705706_75AF815F 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Fixes coccicheck warnings:

./drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:3450:5-8: WARNING: Unsigned expression compared with zero: idx < 0

Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b3f14ff..764f25a 100644
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
2.6.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
