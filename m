Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE3C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opteuoZxy1Qh6mDblgrUCo8A1d7JmdqKzHESqLkEjZA=; b=ZBs5JKSDPpWRL3B7DuhsOioD9C
	ZRIqrwsHnzWtM5CRZw1Jvt4awaXSHXfFAgumE2zMjt2WLYf3V7mPkW/PS3+XtooEMPb//QvxDy4uN
	zKwK6OkGDpXa6ygg12MGMk74dNwNfhfVX7Jpn5IEuv+n6R3fHNOFOASNcIB/30ywzgPk4FTkGtcG5
	HSG6A+DKt25gJTWl44PKUW+yh11H2iFde07RrYk7p2HgCUShPrsdWkP9uw3dze/pK6ecA0+7y/d9p
	s3Sa/B98OXYzJsIFQgc1trL7bP+JWQr3OVqdWqtQbbf+vHR0tiBVGr390aTERJXpsveXmoNV+/SxA
	Jj6Pw49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAn7-004ozy-9M; Wed, 15 Feb 2023 05:57:17 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAmw-004oy8-6T; Wed, 15 Feb 2023 05:57:08 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0VbizXb8_1676440611;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VbizXb8_1676440611)
          by smtp.aliyun-inc.com;
          Wed, 15 Feb 2023 13:56:52 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: kuba@kernel.org
Cc: pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ryder.lee@mediatek.com,
	lorenzo@kernel.org,
	nbd@nbd.name,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next v2] wifi: mt76: mt7996: Remove unneeded semicolon
Date: Wed, 15 Feb 2023 13:56:50 +0800
Message-Id: <20230215055650.88538-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_215706_446876_72B7717E 
X-CRM114-Status: UNSURE (   7.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

./drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:3136:3-4: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4059
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

change in v2:
Add the linux-wireless to cc list.

 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index dbe30832fd88..8ad51cbfdbe8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3133,7 +3133,7 @@ int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap)
 			break;
 		default:
 			break;
-		};
+		}
 
 		buf += le16_to_cpu(tlv->len);
 	}
-- 
2.20.1.7.g153144c


