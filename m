Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2D4D44C5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/FeA4DjIpvihRKqOOPncXjlCgByUn4v1i0+sGL5vbs=; b=swC4GP4hYIf01ir7VfX/+nBL6B
	4HShgGAYPCt7cEG7NvoAyDce8L3IrixSGY59Ke7vJZh1pOOLEcFNnWL2Zzn3EM4R4hJUfeTquUxGC
	EUxbk8dwcb05JnlY5WftxagrzmpYh6LFClWUnKB/xebFjqkUKAQuUT7L/auaea0MVzFxmucSiX6w1
	HpPQ/9JZlx7Jm6PfxFsHcChX7fFJhqN9aQks26GioaZehSRLSR6FIy2Caa9GMWnj4bp6L0C3YrV1m
	zrYZTeuBg0XZBb3oiU2bSgVmeYa24Ykc/Srn8Y9NON5/YLmmm+6qKizgn3JMy0k1e3Ap84zvKE9IK
	uqKzkYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUR-0000000CV5J-0ZiD;
	Thu, 15 Jan 2026 14:38:23 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUK-0000000CUvF-40JN
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:18 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4042905015cso659782fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487896; x=1769092696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/FeA4DjIpvihRKqOOPncXjlCgByUn4v1i0+sGL5vbs=;
        b=NqqPViUfaOCDNe46wqWZyF88iKVzCxdXig15BeomCm1DEjLSu+TCNev8Y6TTNNkK7s
         0WrZdH/kRsAdocuzBqKHGH0mmFqoMyexEH2kSLTebIWnr2ahjWhr+6sMkV4Sq8nzeijI
         CNPSRU9oyFHuDB8QltwMcBpjBEIXWxqphRgfJsbZ/y3ef8e5Kflw0Wo/E93rirH+wVOq
         ic8Q445Su2a9OAeg/5/iGEb1IZsVzS2Be+7wu2y4uZTDMo6wHJajdiXemZabo2fzdeqr
         xsck9LkgBnSDxfzMkwrYywPczs4HSdx7vp/bbJ5AJ4gDg0ztiBEsxG2I7NAYH/XSg3do
         I0bg==
X-Forwarded-Encrypted: i=1; AJvYcCUoODGA86f2MwnSei2QFfTRSu4kEXXsgxSZR7Ngb13bavT2Yr613uenXw2MdbVdIdePO4tFavZpKwx0GkZsKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSARVZW5LEixq2auhnRQdDdEq9DoBU32x3x1I6MclEY/qkyTjB
	saMvMWwzQXdx6mv/XrnRyes52/su3nfHfC/GENxIy3M99qvQ/Iqfd87g
X-Gm-Gg: AY/fxX6MEYztqJ+h76/NOwKoD0jncj8CiCkIOV6M4e75kg/AuHU8q24HKwkitpOoA8e
	6joWYGm3Wgn9iskQT1cEWNY92IBLpxYuU0Jw/9APwfUvOMLR8CRUikqzgBYrLCDvs1oco6dmmO0
	Yx37TvgKCrs8hqJPuoZJHu9gWqPKRlSJ/GK+2OZSzUWrG/CPpz6PQy0QdsZJqA2n1WLP2tAdEF0
	bAabdlu4JNlEM59f0pYz1mICJjbH5bTp3k2hrOHV1DdhgNWaNsCdj0z+8BspDn7Cd0/X4zbJtRJ
	4XWGU7M3oJyhvQGHZ1qEhL3jaLv3o7SeOjqD0RT5KWr5qj0vC7qBlAyaX57R5h6v419Dmd5o9qc
	utUSWc/uVpkERX/adJsiV76VYSPfGDy7xPTgBTrFsowqQMw3XaqAiXeGrHNwaI5t9M/WbMt/fmM
	ssyRUdQaIQlICO
X-Received: by 2002:a05:6871:2211:b0:3d4:760f:544b with SMTP id 586e51a60fabf-4040716055bmr4253866fac.46.1768487895761;
        Thu, 15 Jan 2026 06:38:15 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4a::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4040997ffacsm3714947fac.6.2026.01.15.06.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:15 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:50 -0800
Subject: [PATCH net-next 3/9] net: mediatek: convert to use
 .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-3-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; i=leitao@debian.org;
 h=from:subject:message-id; bh=dAvRCGWtWrgyCIbjzXr78wi4bL8QADGL+zFdAiYR2bc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvRK7lb2WvUAPqaQKV1+ODpLebJeMp5bYV+Z
 NGd9H0VU2uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70QAKCRA1o5Of/Hh3
 bSgUD/94DPM5bKVosd7hSCjQw9XhbrFa34AvpHooSQCwpmP0Abk5I+Rh+hYzUDUq0QQV/wSU95b
 CJ6l2SNhGUWoWw3CrFPm80hM6b3RIl6KN0aAsDiaVWMUrbN+KNbT3yEZp73aIHS8o/OxNFuVzmo
 Yuaz7rZ9ekX+FvaUabuLH/dFnmrMGQ5r0AYhTBGOMn5mMtab0Rx7SidFT5AWsXJGb5SSu4S6AVM
 ROPo81FwQsyWgssFN9PiKK19CzyjkMsmSag/Bwi/h50v7tjlNZO+WCcrcFhCQfchKXz2+Plk/0C
 xDGaZ5E90LuNVi916p4rNFr8qc3x8uza4tF9RdurlbPNtKVxbQe6vaFyD2iwpo3p14/XQu+tbk+
 nrJmVj7ro9woJ1ukGdJ2WQEppydsccRtXmOpCuYFPwFfKjigX2c5SVumJtB2W5JUtWRfOXDF3oF
 4HVB/iPaNvLUgH5TzULt6Z3DNCh8d26NSPGspqxMsWndDHfZOjcG6ywIDyI78FCG2fvihxNpGc3
 Ed3ljL/dQPx0Y/nEdviEtGnaD1/d3fBTy3KwjAqIstvw8FEqLPPtLomDZHeyhaO7gB0zmRCH+1h
 Et4JOHjw0ZttjoVW83jemJG1OUmKM06SyamadYHRvSfaaW6aPAvPQQ/sDuW8WlsSRrTiLcICFNK
 fjUU/Z4OqxvNkzg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063817_005266_67271934 
X-CRM114-Status: GOOD (  12.25  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e68997a29191..99abec2198d0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4625,18 +4625,20 @@ static void mtk_get_ethtool_stats(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&hwstats->syncp, start));
 }
 
+static u32 mtk_get_rx_ring_count(struct net_device *dev)
+{
+	if (dev->hw_features & NETIF_F_LRO)
+		return MTK_MAX_RX_RING_NUM;
+
+	return 0;
+}
+
 static int mtk_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 			 u32 *rule_locs)
 {
 	int ret = -EOPNOTSUPP;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		if (dev->hw_features & NETIF_F_LRO) {
-			cmd->data = MTK_MAX_RX_RING_NUM;
-			ret = 0;
-		}
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		if (dev->hw_features & NETIF_F_LRO) {
 			struct mtk_mac *mac = netdev_priv(dev);
@@ -4741,6 +4743,7 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
 	.set_rxnfc		= mtk_set_rxnfc,
+	.get_rx_ring_count	= mtk_get_rx_ring_count,
 	.get_eee		= mtk_get_eee,
 	.set_eee		= mtk_set_eee,
 };

-- 
2.47.3


