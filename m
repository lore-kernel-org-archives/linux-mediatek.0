Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC5AC369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnHRGmsVHCAzzguNdboWfzoodwE1k89QD1aj6OsQ0N8=; b=sibqKSediu8HcVrlJYLls7SHd3
	ZKRUfinQp0EAfwvukPOCJPVZJEBdmyElmzHjHWpG2G4mzTV4RaEBErc4TyWSoj/y1T5uE8QfZuzcP
	NBl3gDymnjP6KSw1zvI64FAKTBp4fTc69GN40XGStdKkmfzDKfSpLrRQDkxOJnUJskmsLSfXzDluQ
	F09uFTtHBYeFonxUtEv94v3GFSDHMfHhhhTHPexWn94dXktJ5YSQWEcHLQWTQv4pQYfv2l3gEPqw0
	f726xFcmSKnHkkfg5JQ8VCAgWQ6RPq6hXsc1jksW8aKvqTzjZUulVJ2ILvXszHwP77eRK5poDxFjl
	aH55thHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stR4x-0000000583M-2aWV;
	Wed, 25 Sep 2024 12:25:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQtt-000000054Po-1KmS;
	Wed, 25 Sep 2024 12:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45C3FA4415B;
	Wed, 25 Sep 2024 12:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF3BC4CECD;
	Wed, 25 Sep 2024 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266424;
	bh=ev5wvojVnFyXFugc+1rqnmORPLhCYPvYkXPNKMIuqu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCCQ9/lONINeJn5fIC5DHfHEv9tLd9Em12OTupakeob05YrkXEraoxWHk2YKsusia
	 m1oqvohzMZmrzpIwVQYBx7HzbALjFshqEf01OzuJXhs+YZdoKE9OSMSHNKaxNnfbkd
	 KVThyadGy6nO0ZLsVn8byC0rpsKvLjOnl8d3lYUd27mzcuLazl5fVocunJGGeE/iDc
	 KTvaLWBdSUbOQPB/vgv7JsK/bvIYiSti9yAG526F0GZoCt7sg6x3oVH3uPlye9ntCc
	 dbme0cKJW4bQueSlCT5IupVFigYd9vFtURYL7//5+pX+sbONODTnWu73IQOju4X98u
	 MybFRcFA9dYrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	yunchuan@nfschina.com,
	Bo.Jiao@mediatek.com,
	shayne.chen@mediatek.com,
	henry.yen@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 053/139] wifi: mt76: mt7915: hold dev->mt76.mutex while disabling tx worker
Date: Wed, 25 Sep 2024 08:07:53 -0400
Message-ID: <20240925121137.1307574-53-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_051345_447656_A7CEB241 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 8f7152f10cb434f954aeff85ca1be9cd4d01912b ]

Prevent racing against other functions disabling the same worker

Link: https://patch.msgid.link/20240827093011.18621-17-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2222fb9aa103e..38d27f8721733 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1538,12 +1538,14 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		set_bit(MT76_RESET, &phy2->mt76->state);
 		cancel_delayed_work_sync(&phy2->mt76->mac_work);
 	}
+
+	mutex_lock(&dev->mt76.mutex);
+
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	napi_disable(&dev->mt76.tx_napi);
 
-	mutex_lock(&dev->mt76.mutex);
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
 
-- 
2.43.0


