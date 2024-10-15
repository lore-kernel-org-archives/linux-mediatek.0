Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60FBCFC288
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00J3RVPq4/h4Gn9zjAJgxg9MqOXs2BDYFaepZNulNug=; b=jbuqXAToC3qb0HHKk/Dy6leC7A
	9+wpFyx3cOnnxXeV0Nzv2ypT9xtgYvZeOy/XqEP0s8bI9EOh/vkSyNzhja0I4b5lMK9+9206hAPR2
	DZntnQvfWy4xWjTGDWF7Cf+BszWy7oM0bkm6+tORcqlTtNT3Vw6dip7A9l3wNmUnpMqrhP+XxJ8dQ
	o3PPNVDbCH2G2ZbCQ0f123LkdOf+xU8/OOJvUew/o8moCTDaBIAckxVpU8ZA1SBhXhzvKe2UAORMx
	SM3ApDJS5WFbJ1SuZ+7suF7gmsw+BqcfUjjPhV5zwh9Gi57/M8yprz3iza1p0hV2HuXUxeLOGGXNT
	hlzQKH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fYm-00000007zOX-2vfR;
	Tue, 15 Oct 2024 11:17:52 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fR5-00000007xvW-28Wi;
	Tue, 15 Oct 2024 11:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=00J3RVPq4/h4Gn9zjAJgxg9MqOXs2BDYFaepZNulNug=; b=murZkFD/6e9FjDuEIp5PZR/1bR
	LzkxMjmNagb5GYM9dLk9SPNm82n01g+KRK4q1pS/kxvZtPVk6yOcwEi11P8OhLOpqvt7eINvvQITQ
	k3/q7lK4AqPOn78czVrT/yEXLrfQZPESdR/piJAnS3FouSWuV2BccVYUtUouh8Cz5leM=;
Received: from p54ae9bfc.dip0.t-ipconnect.de ([84.174.155.252] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1t0fQr-0096bC-0o;
	Tue, 15 Oct 2024 13:09:41 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 1/4] net: ethernet: mtk_eth_soc: compile out netsys v2+ code on mt7621
Date: Tue, 15 Oct 2024 13:09:35 +0200
Message-ID: <20241015110940.63702-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_040955_649893_79DC478C 
X-CRM114-Status: UNSURE (   9.08  )
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

Avoid some branches in the hot path on low-end devices with limited CPU power,
and reduce code size

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0d5225f1d3ee..654897141869 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1324,16 +1324,22 @@ extern const struct of_device_id of_mtk_match[];
 
 static inline bool mtk_is_netsys_v1(struct mtk_eth *eth)
 {
+	if (IS_ENABLED(CONFIG_SOC_MT7621))
+		return true;
 	return eth->soc->version == 1;
 }
 
 static inline bool mtk_is_netsys_v2_or_greater(struct mtk_eth *eth)
 {
+	if (IS_ENABLED(CONFIG_SOC_MT7621))
+		return false;
 	return eth->soc->version > 1;
 }
 
 static inline bool mtk_is_netsys_v3_or_greater(struct mtk_eth *eth)
 {
+	if (IS_ENABLED(CONFIG_SOC_MT7621))
+		return false;
 	return eth->soc->version > 2;
 }
 
-- 
2.47.0


