Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED38C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eX4/CTCtjyiWC4V7OvOX6dzNZbFQNR2QZZFW5KPupw=; b=FdTlHPFBuf8jxN8dSCoUtkWUdF
	ugSUgxvVyyre88cqoJfa86k6rfmxu0mEQA9xn+kzW+kFasipM/mNERszKe2bPzdl4C4cxRFPCCLnI
	GOHOYNV5VXMDG4BheY/xW8Gd9mW4xGErEtk21z19GYDGMzqdsmJ5uRF4RGW5SbGrGUdSPGRmMP93I
	1JhDTrX5m39FzkVPXHn9MDduuAhCBOkd4hea3Ansz4F5rnCW+oImeQ6YQonOqoEw+fmyOGKll7nX5
	2CMgtrRyLcpasgZs3V2QhCCXZlouTwtmYdMn7GkohqkyXOBMJd0muj64ra3rCRFcyMHDGXoq3xdWT
	JRjHVcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmWa-00G9V9-Uo; Wed, 23 Nov 2022 09:58:36 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmWE-00G9Mx-5X; Wed, 23 Nov 2022 09:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/eX4/CTCtjyiWC4V7OvOX6dzNZbFQNR2QZZFW5KPupw=; b=Wb7gqAByhlP9lJAokk3U4HXZvf
	JpCNn6xzFJgoUbEzxz7fkKuSA6cRyCHwDsvj2aS7e+gZwU96Fls3DqOjH6vqG1E/vjfeyQa9vI848
	PdftqAdxza637CWdWdZFm8+skDRGRekev5MfNbleUXaG//cOThYgYLTPqyCk2GNF+Hz4=;
Received: from p200300daa7225c0894d890dd9e4669b3.dip0.t-ipconnect.de ([2003:da:a722:5c08:94d8:90dd:9e46:69b3] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oxmVx-003vzk-HX; Wed, 23 Nov 2022 10:57:57 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] net: ethernet: mtk_eth_soc: fix flow_offload related refcount bug
Date: Wed, 23 Nov 2022 10:57:53 +0100
Message-Id: <20221123095754.36821-4-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123095754.36821-1-nbd@nbd.name>
References: <20221123095754.36821-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_015814_308877_65B4E7B7 
X-CRM114-Status: GOOD (  10.79  )
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

Since we call flow_block_cb_decref on FLOW_BLOCK_UNBIND, we need to call
flow_block_cb_incref unconditionally, even for a newly allocated cb.
Fixes a use-after-free bug

Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 81afd5ee3fbf..412d215b9571 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -554,6 +554,7 @@ mtk_eth_setup_tc_block(struct net_device *dev, struct flow_block_offload *f)
 	struct mtk_eth *eth = mac->hw;
 	static LIST_HEAD(block_cb_list);
 	struct flow_block_cb *block_cb;
+	bool register_block = false;
 	flow_setup_cb_t *cb;
 
 	if (!eth->soc->offload_version)
@@ -568,16 +569,20 @@ mtk_eth_setup_tc_block(struct net_device *dev, struct flow_block_offload *f)
 	switch (f->command) {
 	case FLOW_BLOCK_BIND:
 		block_cb = flow_block_cb_lookup(f->block, cb, dev);
-		if (block_cb) {
-			flow_block_cb_incref(block_cb);
-			return 0;
+		if (!block_cb) {
+			block_cb = flow_block_cb_alloc(cb, dev, dev, NULL);
+			if (IS_ERR(block_cb))
+				return PTR_ERR(block_cb);
+
+			register_block = true;
 		}
-		block_cb = flow_block_cb_alloc(cb, dev, dev, NULL);
-		if (IS_ERR(block_cb))
-			return PTR_ERR(block_cb);
 
-		flow_block_cb_add(block_cb, f);
-		list_add_tail(&block_cb->driver_list, &block_cb_list);
+		flow_block_cb_incref(block_cb);
+
+		if (register_block) {
+			flow_block_cb_add(block_cb, f);
+			list_add_tail(&block_cb->driver_list, &block_cb_list);
+		}
 		return 0;
 	case FLOW_BLOCK_UNBIND:
 		block_cb = flow_block_cb_lookup(f->block, cb, dev);
-- 
2.38.1


