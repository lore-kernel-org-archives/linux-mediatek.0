Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A7C44507
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Message-ID:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQto5Z8Uhf4eXqdGlAl8y9PBSAdtQt5TSd/Tz46JS3g=; b=aY3eVPZ+5dDGJ2XvyD1rmTggX4
	I0XVcUOzc4Ekmur7uiW5Qcz4b5dc+ZBNCI+p5loqEgoWBOJ+keWdKBE3JdwlNf9byIPc/fYbEDk3d
	wNJsKkeDiOMLihnPE4si3642lF0Tg47oL+JoEK94Qfabw28Jdg4N0qMl9xTHn5clzOG5ScK9Bguyb
	g/ngHXJE/Noaw3ZCDiody0wCLfXv+xJXVoNJFqyI7WAIjJD/BE2Iz3UG1yk6g4Wg9bjmxEDZ0qIsj
	HznkamW7KVImwurIk0GrlTEfpcgLfvbFHz992nHPyKgX+iSzpFSbd8iMh6jiWwcD5BNWWEg+4S/JJ
	Y/2yvTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIw-000000025Qr-2y5M;
	Fri, 17 Jul 2026 11:00:30 +0000
Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com ([23.251.234.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIm-000000025KQ-3lb2;
	Fri, 17 Jul 2026 11:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=clipsneko.cc; t=1784286017;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=xWCYjiYbaynh1mEZgNMgNviDRlvyEcEP7+Xg/gNItPE=;
	b=WD9sNtxxEl4X+9vKGMX31nqo5ZolFzPGMU9i4UR2ltWo4U2tq30tBMuSzh3WqJcv
	9kLzvjvZF2F5CTWzYtDqK7CqlYabWwSL283M2FGbFFuCGNTt03hgUuFDzizWHkeU6se
	iok7EJ9IBgTgCG5wTfmkaknHKGidALHnzFJeSB1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1784286017;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=xWCYjiYbaynh1mEZgNMgNviDRlvyEcEP7+Xg/gNItPE=;
	b=RNzRRxh/bxIUUueL1JTdNNb7T/lCpLH/ytpUo2YgIixQGs8rb41DTd2/VMmY8yYE
	9nio3tT4YqkZ2xBkshVm0ndO95pv2a1AkWuCFgVQJlWjnoktZUCPw4XHHcI1bZbvvSb
	2myVBShVaL84jbwp6GDuccSmvL0jsWwh1AlJ8fSw=
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717105748.1194693-1-goliath.zhu@clipsneko.cc>
References: <20260717105748.1194693-1-goliath.zhu@clipsneko.cc>
From: Goliath Zhu <goliath.zhu@clipsneko.cc>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, goliath.zhu@clipsneko.cc, 
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: skip NAPI deletion for WED RRO queues
Message-ID: <0106019f6fbbf57d-e08cf023-2c26-4186-81c7-f5f09f3ecc40-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:00:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.T/9jWCDXa31y4gauYStyPOpWTrkJmzALuy1iq6HUX1VjlgPUmzq7ZFI3EvLLZ39jJzv+2I2PP/uhCYcS7tWi4X9gcnDJGZZVVULSu7C54EK8m7rG19VNcAtmWQSUeF+Ydw79jCgmJ2QuxiKzKA17O4fInWrH2kml2UpMwmQGC6+Ow2RWdTIMP19sAecDaYp3:1.ap-northeast-1.tL27A1JIpKR2Y51a8BkHZBekDcSR82jwOhKrSwgRw2U=:AmazonSES
X-SES-Outgoing: 2026.07.17-23.251.234.56
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040021_049136_09D573D6 
X-CRM114-Status: UNSURE (   7.64  )
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

Commit 6b470f36616e ("wifi: mt76: Fix memory leak destroying device")
made mt76_dma_cleanup() visit WED RRO queues so that their page pools
are destroyed during device removal.

When WED is active, mt76 does not =
register NAPI for these queues.
Calling netif_napi_del() on their =
uninitialized napi_struct can
dereference a NULL napi->dev.

Keep cleaning the RX queue and destroying its page pool, only call
netif_napi_del() for queues which have an mt76 NAPI instance.

Fixes: 6b470f36616e ("wifi: mt76: Fix memory leak destroying device")
Cc: stable@vger.kernel.org
Signed-off-by: Goliath Zhu <goliath.=
zhu@clipsneko.cc>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git =
a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/=
mt76/dma.c
index f8c2fe5f2..ddcfb9e46 100644
--- a/drivers/net/wireless/med=
iatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1189,7 +1189,9 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q =3D &dev->q_rx[i];
=20
-		netif_napi_del(&dev->napi[i]);
+		if (!mtk_wed_device_active(&dev->m=
mio.wed) ||
+		    !mt76_queue_is_wed_rro(q))
+			netif_napi_del(&dev->napi=
[i]);
 		mt76_dma_rx_cleanup(dev, q);
=20
 		page_pool_destroy(q->page_pool=
);
--=20
2.55.0


