Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D5C636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5U+6Z0459SCaD+OwInItRywQ8Q+yZ7dB5UAq0E7lQmM=; b=G8VajObvtO3uT7BpU4mst8mkkd
	wb+qwQZ9rYUqLPrdstYHg6YYPvfIgzkxHiF4eCZ9zhOj4D1OCJREL8mxw++qkUvuMeXWokqz6lmUr
	sF/QUymHbddj7vmJ6bQgKhpH27Q4yBKzSodUjYcpEsIqxVpPxWUuSInDZuA0LsQy0OPcIuoroG0Rl
	D+knbb+8r6dP6iAjwex9zSdwHIWn4M2PFuWyrNHsv9miarO3H8FqjEx/+7CNAXf308TqHDUtp5ErJ
	iWgT9I1qihO4Ylvf/zsq4xTYgOBEh68IULhZNugEQ89I0rJpGqnohdbHmFcXktI1bd9GZZDG7dQ9b
	+1oOPKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLQM-00Gthy-4H; Sat, 18 Feb 2023 11:30:38 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLPw-00GteY-7Z; Sat, 18 Feb 2023 11:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=5U+6Z0459SCaD+OwInItRywQ8Q+yZ7dB5UAq0E7lQmM=; b=G82eN/oLtC/wEu84JUQh4YEEQO
	V5FlAWUPWKFxMhkYMluHXpPYfcXxhDc1vvO0AGAmSXUYR/DKwwE9KkXeDkfadyquw1saUMrltIq35
	W1jKiau8NgEgA5EkkVwofKr4EiM6XxYb8QvFXLvHTcgRzdy6vi56rMB0pqMnF8OpspbCBkv0R+g9L
	9nNF/YYAWFtii9OmA3gSlxlOEOGiXJeTmwPFiumLH6PqkxxiEkG4zkzB8UjHN4T48U9NOtsX0yEhd
	g9pvMTluNcTOU2TjT3Qu8MKxNT8/EtNUN2D2OuoJB8a1HL9AUlBJj0aX1z9Qrb8IhlooTn6xK3SSZ
	pLVmiLpA==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pTLPZ-000XxV-0l;
	Sat, 18 Feb 2023 11:29:49 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mt76: mt7915: expose device tree match table
Date: Sat, 18 Feb 2023 12:29:45 +0100
Message-Id: <20230218112946.3039855-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_033012_307888_17E68683 
X-CRM114-Status: UNSURE (   9.54  )
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

On MT7986 the WiFi driver currently does not get automatically loaded,
requiring manual modprobing because the device tree compatibles are not
exported into metadata.

Add the missing MODULE_DEVICE_TABLE macro to fix this.

Fixes: 99ad32a4ca3a2 ("mt76: mt7915: add support for MT7986")
Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 2ac0a0f2859cb..32c137066e7f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1239,6 +1239,8 @@ static const struct of_device_id mt7986_wmac_of_match[] = {
 	{},
 };
 
+MODULE_DEVICE_TABLE(of, mt7986_wmac_of_match);
+
 struct platform_driver mt7986_wmac_driver = {
 	.driver = {
 		.name = "mt7986-wmac",
-- 
2.39.1


