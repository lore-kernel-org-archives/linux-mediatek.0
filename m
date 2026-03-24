Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B5EF532EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1AIVSQZ3n2swBcUlLexOCDQZvYcDIRq+pqWARwqygE=; b=oEg08TACMrq/P99+YIlqFxiw62
	KrDJlam78f9KQw1sWSpGRj09OYdmPPpBVrvU4NrQVnxvbXcrPoxxHny+TZgJmffb6GflAIunjJgHB
	b3AkEiBljxveNsh7H3d4fHEsODrLt34muUOxkAfrkRldi7yO0fz1AfQS65BQGePdPqhetyX8tdno4
	3u5R0usAS7KI7rh4b3qK9NaYDrd+g/Yeo9cne8kxr/19xuWCc3ZE5/wCXF5VcX/86Vnim84wYz0du
	8tYfc38EeVZsEyYEtivJ9OxMZclu/J8MF0gkYYDGKaxTD1jkYJ0eG+h22SnJGBGSpI//a7DlPueVz
	tSkgi95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xFo-000000010UW-0YQb;
	Tue, 24 Mar 2026 08:36:48 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xFl-000000010Tl-0MHW;
	Tue, 24 Mar 2026 08:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1774341397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F1AIVSQZ3n2swBcUlLexOCDQZvYcDIRq+pqWARwqygE=;
	b=wCdEs1T7lhIB9UsHzDPrQ+647MQLC1XiQj/9dtW43xXHBglYn5AkaidFKk3LzHFzlEtxKI
	n3MzZlT5VhZZcCcAsT8zlSlwfQmZJFjouPui9akl2q5gmJLxU7ynWCXy2/WmqDecYyaurg
	CpK4jhE8mVz1MWeMJtAO32EAvZkCfRvl2rul7ppTQuH3D30Y0DbGHKQA24L7+DVmrX2l02
	oYhAPs+FEPfR5hjzjNXyp8Obg0AEWiKW67LTjk0cYMYOGlEEAwy29dlmwtNVtzPZwRcZnb
	FsYdUD1+QRCgU6HuyCzovdAtsHDFaO6GR5pjO+xTuhnaMukfvG/z6qVrACR4fw==
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Tue, 24 Mar 2026 09:36:01 +0100
Subject: [PATCH net] net: ethernet: mtk_ppe: avoid NULL deref when gmac0 is
 disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-wed-crash-gmac0-disabled-v1-1-3bc388aee565@simonwunderlich.de>
X-B4-Tracking: v=1; b=H4sIAPBMwmkC/yWMQQ7CMAzAvjLlTKS2WznwFcQhTcMWBAU1GyBN+
 zsFjrZkr2BSVQwO3QpVnmp6Lw38rgOeqIyCmhtDcGHv+jDgSzJyJZtwvBE7zGqUrk2S9BSj5+T
 jAC1/VDnr+7c+QpEZTn9pS7oIz98pbNsHGXP+cYEAAAA=
X-Change-ID: 20260324-wed-crash-gmac0-disabled-ae3a551cb154
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Elad Yifee <eladwf@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, 
 "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=9aR3DY4PzbQk/tWJxiI2QHQO1B8WWwLE28Hg1hdGCOY=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDJmHfPnfHLPa4rr9gd+TR0f3fIhjfX9Xym+aL3+3p99Vp
 QVGx29N7yhlYRDjYpAVU2TZcyX//Gb2t/Kfp308CjOHlQlkCAMXpwBMxOM+I8NDf6bqqNU2h8Ot
 7W6trI76dWzKwhUGjvPevuDY4D3HpXEew/8ydZNPeRclJoqwdkW3JEnd1PidOmfW5LOb7PpSXsx
 Vms0BAA==
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_013645_307032_62B4531E 
X-CRM114-Status: GOOD (  14.34  )
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

If the gmac0 is disabled, the precheck for a valid ingress device will
cause a NULL pointer deref and crash the system. This happens because
eth->netdev[0] will be NULL but the code will directly try to access
netdev_ops.

Instead of just checking for the first net_device, it must be checked if
any of the mtk_eth net_devices is matching the netdev_ops of the ingress
device.

Cc: stable@vger.kernel.org
Fixes: 73cfd947dbdb ("net: ethernet: mtk_eth_soc: ppe: prevent ppe update for non-mtk devices")
Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index cb30108f2bf6..cc8c4ef8038f 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -244,6 +244,25 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 	return 0;
 }
 
+static bool
+mtk_flow_is_valid_idev(const struct mtk_eth *eth, const struct net_device *idev)
+{
+	size_t i;
+
+	if (!idev)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(eth->netdev); i++) {
+		if (!eth->netdev[i])
+			continue;
+
+		if (idev->netdev_ops == eth->netdev[i]->netdev_ops)
+			return true;
+	}
+
+	return false;
+}
+
 static int
 mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 			 int ppe_index)
@@ -270,7 +289,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		flow_rule_match_meta(rule, &match);
 		if (mtk_is_netsys_v2_or_greater(eth)) {
 			idev = __dev_get_by_index(&init_net, match.key->ingress_ifindex);
-			if (idev && idev->netdev_ops == eth->netdev[0]->netdev_ops) {
+			if (mtk_flow_is_valid_idev(eth, idev)) {
 				struct mtk_mac *mac = netdev_priv(idev);
 
 				if (WARN_ON(mac->ppe_idx >= eth->soc->ppe_num))

---
base-commit: 70b439bf06f6a12e491f827fa81a9887a11501f9
change-id: 20260324-wed-crash-gmac0-disabled-ae3a551cb154

Best regards,
--  
Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>


