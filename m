Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D845BD44C59
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3QziLtppri025RUH9iC7KG4n81ulsbjnXMb8+qxeEw=; b=MDKS69KivYjEHsG4vwUCZZz/yo
	4IS+c6bfByNClxyCmFWmdPRFU76qaadS+hhmx39cwpu3vjHuwyLacuvShrhnulI+GAom7yBC1xiRo
	rHj3UTQ2jELcJEiu0uUlDMTxDoNc2yNxgUXad1gbjd7lS7uAg1rEbY72wZAbJaKtpd+q/7m86OvjF
	6nbJiuqWoTMiyQrHF+TJ63NtE91wbWawtvlOt3RwHMQiV+Jd/BzgXbYVW6Ei+4sg1/I2Kgny2F26f
	xnH8ToRLVGEYLAFb3HsP/171XieFye7h0RXlvevuDc0uPhmWJviHT5F/vFIhT+k05+Nl2mDLlo5XC
	zUibZ+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUb-0000000CVH1-2npm;
	Thu, 15 Jan 2026 14:38:33 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUQ-0000000CV3u-2ptj
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:26 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ff4acb6eebso666799fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487901; x=1769092701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3QziLtppri025RUH9iC7KG4n81ulsbjnXMb8+qxeEw=;
        b=G5zw9weKGlOvsliFs6T7qKRNyuFk+m+OLGa44ptClCzSxSlArQ3JTdclPa4D5EzVdw
         7OFVO8VVzd0522u5cG/jk75K7upsWXfnZD4LLFTcWYSn58ut6vZ/NLsL3PWERCA1lkzD
         hr1XXDtVOmRVMg2dKhFGBUbOSc4TVB6GI+Lw2kZN9K22GXhnxJ52ZOEG4t3VByvbefpj
         YsG7nY1JKdqP5uP9FataZvfX2L0N1ygT278kvXPEjH6KEKBkIJubAT25kpBL1Eb7Zw6R
         PD+5ox3SmfVZz6WCDt3OwK6RepR6BNUV3XDMduByIkQijH6SMTaRNZZVv5i3WMPfZz0Y
         FJLA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJK4bou65T2+ohtc6/RFuPS18BnT/QCd4MTZbUL/FqOrhPCnaun3PbZWQ667QOSv+qGFpK/LN1eh8/NBMDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWP6384KFZh2ZVjWY3WLFJ6J/0g3izYZNe6GHtPnOan/v2yha9
	Q79XlXTL2IuxBoQPFwdACAPUZht+Pn8U0bS5JLe0NMnMFWF+nyxP0XoZ
X-Gm-Gg: AY/fxX4NGPCTfP+sVBc6i9HtcyA+/e37GEwxUoMnYrdIlatWPklEvgpZXgvS4Qt4k54
	YlpBOWR+nFNL7WW1gdEJJoKmeYJU1r93mVtWG97941XNa8x3cakUU79iYO1zMAfQ79Ba4x3Qf7/
	4ZI/XJpfQYR3p0FuCQwM7zLWN2MCa5+pBtcGuhSYlQom8HPN3atCToJyfW5GscHUuPPrZKs2yeR
	Xjnee5nHcOC6Ftg0V8bmEiJTgxPe1lzaOZS+L8p1Cmp47jO8a+KLrnyWC5Nx5/9g+6nR6jDb9Gg
	7RfKxF7Dd1WMwdJOI+u2FOtV7vfLviT9EJpytiwUx1x+t8okEXr1083BpjKDSAPNxNaftH+HUSF
	RZrwsLu2uTrw9GjS03oMatw8BCrYiXI7QLtumxunhl6//kCgf/ZbE6zoxa1eBMtgh9Z64T9ePkH
	5ssQ==
X-Received: by 2002:a05:6820:7508:b0:65d:1697:e6ce with SMTP id 006d021491bc7-6610068d279mr3919809eaf.23.1768487901584;
        Thu, 15 Jan 2026 06:38:21 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:74::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-404427177f0sm400425fac.9.2026.01.15.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:21 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:55 -0800
Subject: [PATCH net-next 8/9] net: macb: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-8-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=leitao@debian.org;
 h=from:subject:message-id; bh=EDM5owIVyL2DjajXDu3o5iZ+GCzD1U2tQZv0qOHfOAk=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvSl1e/Mq8M8IDjFCUaBOsQM77krGX3tiyP7
 UJQ2NGca2SJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 bTjfD/wMzBjLyL7mbyJwNKwc6wxg6I5YpP5F0V0MfH3hnmp955ZI8DFLIKq/u+nPJlokYB22aYt
 1Bplo+zYTfN+TGaRW6KNauxtNSk3BMTcqkeiTWWZ4SI13BT2RJWkI1x0pNcKsCDTy/jzwKVXUmH
 pZFIl2VCZP/VGdI90bGpuzJ2NCJX5OznIHaPnZUrsn3NWmViPkOxaKvchYbloRkbSONSAQPT5eH
 4XaveFvRvIWR8a6jhKCJwHvJ4z+ovYTCY4nQSEXt9Yb7plU9XNWh3jufYzDXv/gtbHdGhZZDxHJ
 2rgPBil9vZwKsxd99nkO3TwH/fQ+btPcSNDi7+bNovV9eGPzEa0GKHYNPIbvxbSppQ57nrQXOCX
 U8HHIZuBgGueWGZjo67G3GUZ+otCCqpD9X5Zkbiy4dLYoZOjAJdZPoFFvds34Pfoq7hd96IZe7D
 5Tn9iZXKP6RzqTskPCc1IwSgqO6hWUnkmrPArVr6yS7mgPf4Ed3TQWv9TjlqWcXN0/Rmvaz16Po
 uYu+x+fenatWmWeGgp5Vq71IelJuxVfwLYkrWbgF1ltF8+/lc51g/6Kv0WeVl6OXVRixs3En+RP
 fKnKPBRdciCbDxzoocETR6oC14LkfWfBT2KUEBpglwPpNa45J9T43hsUu2t55DfC44qRxs9/1yJ
 pIRQaqI/0N1tTeg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063822_715244_BA40CCEA 
X-CRM114-Status: GOOD (  11.66  )
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
 drivers/net/ethernet/cadence/macb_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 2d5f3eb09530..8135c5c2a51a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3850,6 +3850,13 @@ static int gem_get_all_flow_entries(struct net_device *netdev,
 	return 0;
 }
 
+static u32 gem_get_rx_ring_count(struct net_device *netdev)
+{
+	struct macb *bp = netdev_priv(netdev);
+
+	return bp->num_queues;
+}
+
 static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 		u32 *rule_locs)
 {
@@ -3857,9 +3864,6 @@ static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 	int ret = 0;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = bp->num_queues;
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		cmd->rule_cnt = bp->rx_fs_list.count;
 		break;
@@ -3941,6 +3945,7 @@ static const struct ethtool_ops gem_ethtool_ops = {
 	.set_ringparam		= macb_set_ringparam,
 	.get_rxnfc			= gem_get_rxnfc,
 	.set_rxnfc			= gem_set_rxnfc,
+	.get_rx_ring_count		= gem_get_rx_ring_count,
 };
 
 static int macb_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)

-- 
2.47.3


