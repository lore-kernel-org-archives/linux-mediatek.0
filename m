Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADB4D44C51
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otSP3WumEJ9ljtBMFrQYAuqQcsR+pe8+cqNgEJVYYfU=; b=QgeI0+Q14HRU92IIFfq+Lrw2YI
	BNzAMVI1Lhk7SYzxVUEThP2gNG4G4jE5qI0o6/AC4mIq3RVUM1prWFG33ChKGKtYqmA5heZvtdDQc
	CA09fd6aH2dUncl67byWBIUZvL0RJvMzmDTu8f7fg5ji/EGQ6sgqAOGB9UYMUVrhLxHKLE0UJUbPF
	uf54SD0JfUDKd2A/SbHTLdRVsKMYTGfJbXFvqDpvkE5CiEEGGJFGIwhgrSjp8p+xkGkCXomdMoiEm
	x67MTN4sNw50E7C/C2Btywy4PbxbSd8c8U8dfE7cZtqlthwCSSHXy92es/rZjeN5zJV9l4bR5tEsR
	+2ze0mRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUZ-0000000CVFA-3wnX;
	Thu, 15 Jan 2026 14:38:31 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUP-0000000CV2C-2LzS
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:23 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7cfd0f349c4so628404a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487900; x=1769092700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otSP3WumEJ9ljtBMFrQYAuqQcsR+pe8+cqNgEJVYYfU=;
        b=hTzfRtHkntu7phC+TJUOvRrLriRNuT0BkHPd1vfKnH5TRJFXtm1Q6zVTTCuoqxFvs5
         4XhIoqaB3ny5nHM+Ge6Utv8/0JEw1WO1lyj2cbrErUZWskO3AgV1vI/J6ek+uQh5RBff
         5RCtvPL/4m/RKLMsdCzHDz7i8EIqiVmQ5mHY7la/Jcp+AOV68YSEffMz+0t73wYm/qgn
         mphreobMi42gvuh7ZN5Med+BTCOXGzM9AIOorbbYf2M6vExKA4fJ6FHuoedlk8nLnbTz
         xXgtkQ6WNGbAPA/hJ6CpGmYQA1MyIzoeKJQMbC86oU2wfypOXBS7SuVocWV1LN6huU9O
         DbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVMQYBqds4dP3rvtXkNOK87Tvw5MkU6s/Bk4+EYT3gtEip3bxI0fG9Z2EnfYYpnbzw+4X2FF9FT4lwpNJYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEg/5fGHdvqKQpYY221mx/EXJWCZT3hHWZSRraULyOAmM8CBiJ
	Nq30oyIZABIjmzpNxc1e1bKz4ElXeBYr76arGUEEYkvgz9gK3IFp1vJl
X-Gm-Gg: AY/fxX7pYPKXgKvoFISfGTpSkj41qbYqtipIqzb3gEzpS4Rkmw0EFLVzD7NrwGwDdGn
	yY7CCZgoDRPI6HESdKngnZvj7L3gNPTyOgd4n+aWltfwFUlcIjF24YtaDOKD9SdvL4yoU5tzPLh
	U+EJKVxkITC87DBlSM4y4b9Pf6GbfM8llF1rmawnuwDGwniuyVZZwnPu3GfP5zwS1Fi6QVxsIqJ
	fjvaVS8VZXFBWqCzDM6bBFRaUJm0D85BIuzi3SuDfgVkyP+PagSG744Nf+Dj2FIlLXzV7Qxwj06
	nrmA21SXzaK36bFLFZGjL6fD1FvCBcD2BuJbqJou2iezu3Htzz1FlVLQc4lX9gBRc9HqwhHyLMx
	cxxUE2t1Ge8+cjDe8BgS4O+LAplaDszFiSQ4lanwOMyPH/vRbtfGTbZBwdYc71ygi/zk7BoPKpn
	PGFA==
X-Received: by 2002:a05:6830:358e:b0:7cf:da97:57d5 with SMTP id 46e09a7af769-7cfda9757ecmr957520a34.34.1768487900523;
        Thu, 15 Jan 2026 06:38:20 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfd68b13fesm1559488a34.3.2026.01.15.06.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:20 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:54 -0800
Subject: [PATCH net-next 7/9] net: cxgb4: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-7-b3e1b58bced5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=leitao@debian.org;
 h=from:subject:message-id; bh=mTt9g4AIDDCE/wyHFNRn7ITIDqk1FNXdFvVq0NDOWRs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvSKI56w6S51MA1g4GESPyU+3R/PgLYWFpyg
 RPCz4ftjtyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 bT6nEACvWlpHECCXJWCsSIz2b2fYD3jmE+YC812EOVG5+Zgom6pRSjYRnpNtdw6aB4pt4AqHazt
 HZFziZXiPwrVJ2KHKtvLJZoxKPasMBVoOXL66e2D5tK5/mI0KYr9tm7YPRiMH5dGlcGJKU6XNsA
 G6N+dTc7KGSezfQbek6Bd8dWIpoxHoewdIhlkQFtiQ/X0GnV8CP+YBxfN8e7VxS6ORKI9Eu2w1E
 KRO2JjSj1cz2bfntjyD/I3tzznYWFgp1+ghvduFHDLRfEOFyjxdMyJ9/2hwXO/SiLOUDqhFIK2I
 xHata1GinUobVH5wC/JDB4I24G7sUoqrW1vUQVFScu8p+i90ajthRDbJFsAIEJ3AdeAWWu3VKMI
 57ArKtwl6Qv6V7N6KfHRPi8sFD6PdAv2wVDq4w/LJbAzSfug48nxIM664m9EihWEaVEvEZLpiDZ
 A/ODC9UEICyZdjzs/yEz6P3R3/Oyjrh5u0HffU7u8PEUU48MpBTkw/WaTy+sTzjhAAm3+DYsLGT
 YxghWqGbpydPH6FaGSUgKB8ISAEFYnUsA3Zy0MBeZ4UbwKOTxFAIC3JhDyrH2GLh70WwgTyGEjC
 ZMISm3UWHjF23jaIfJBhLLEk7ANEUDZd0JZ3YumtwhGKWR0ZvjOj/uQRxh1k5rkMRlHSNhqRCZv
 YJxvQ2AHmSnZF5g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063821_669879_425AB566 
X-CRM114-Status: GOOD (  11.23  )
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
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
index 23326235d4ab..faf8f7e86520 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
@@ -1784,6 +1784,13 @@ static int cxgb4_get_rxfh_fields(struct net_device *dev,
 	return 0;
 }
 
+static u32 get_rx_ring_count(struct net_device *dev)
+{
+	const struct port_info *pi = netdev_priv(dev);
+
+	return pi->nqsets;
+}
+
 static int get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info,
 		     u32 *rules)
 {
@@ -1793,9 +1800,6 @@ static int get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info,
 	int ret = 0;
 
 	switch (info->cmd) {
-	case ETHTOOL_GRXRINGS:
-		info->data = pi->nqsets;
-		return 0;
 	case ETHTOOL_GRXCLSRLCNT:
 		info->rule_cnt =
 		       adap->ethtool_filters->port[pi->port_id].in_use;
@@ -2200,6 +2204,7 @@ static const struct ethtool_ops cxgb_ethtool_ops = {
 	.get_regs          = get_regs,
 	.get_rxnfc         = get_rxnfc,
 	.set_rxnfc         = set_rxnfc,
+	.get_rx_ring_count = get_rx_ring_count,
 	.get_rxfh_indir_size = get_rss_table_size,
 	.get_rxfh	   = get_rss_table,
 	.set_rxfh	   = set_rss_table,

-- 
2.47.3


