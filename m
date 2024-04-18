Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBFDC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/50KHaIs29lLGccUeuSbjtU9Qx2XGf+W4BZDJ2OT3ro=; b=zWJteccBaiYCPTDFc0XmTp/AcX
	+eUXd2WTj0349IfhbNNydCADixhiX/+j2TgbVqsNHb7qpyg7SokSTWmKoMY4NOsaCjuQqIEk86w6t
	qp/xUa0I5db4Fcu4xxs/OVtaVWPQ9/MfFgDVOl3r7jrtbuxKiSDcoyoUQRLnQzmwsYhRET3GXp1wx
	2Hx11S6Tcs8G171drUXGOss/tHjS4zmBH4BXIjwJ0rZ2WMoCnkRUCebL4oGY+lhYn9kfPdm61Gx8y
	g7qDxifOJZ3I1pkkFbSLxCRnVX0S9yNIfEdtdzCjbVRcJQiVOfp1aIh2Ro07g7q9IdkLS8iBRqlKM
	o0yLHnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUTt-00000002zSq-0b5G;
	Thu, 18 Apr 2024 16:19:25 +0000
Received: from mail1.fiberby.net ([193.104.135.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUTo-00000002zQZ-2aOK;
	Thu, 18 Apr 2024 16:19:22 +0000
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
	by mail1.fiberby.net (Postfix) with ESMTPSA id 73B53600A5;
	Thu, 18 Apr 2024 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
	s=202008; t=1713457156;
	bh=dI6Cqzw1iKtIkYphmVcf4PPF7ZmfJQ37K3PfXaknTEw=;
	h=From:To:Cc:Subject:Date:From;
	b=g3GKpEMcJ4JZdrNGGO8E+o2xBduPlDkBTG904wvBPPgua1rSNNW+scR/mHXOoTSKe
	 a59sXLHLUjHNKv5h9iF5O7acFSKbe+iiSB2k1kCCbvxl4OfsXSV6Hq2iHForPY0N5o
	 q9nBSms94UZM4kIeQNhim9kae7zQ/nKPa0KvRY2nNQU6dDcl8etcPb/adR5m1/ANU7
	 1+TGbjWZIdHnvp9Vchn8X1L3VZQP/N211ko43qrccFhcZEaQSarLLBVcgxbJ8ulOVu
	 cGeCcFOOL3zk00L30yLBhapKZzR8BXgGdJ+xBmi8tgnUfXRgrzi9bKVeN3fLl4E8CU
	 1VlMdY6mljtDw==
Received: by x201s (Postfix, from userid 1000)
	id 85E9720EF3E; Thu, 18 Apr 2024 16:18:22 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: flower: validate control flags
Date: Thu, 18 Apr 2024 16:18:15 +0000
Message-ID: <20240418161821.189263-1-ast@fiberby.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_091920_818493_9A866819 
X-CRM114-Status: UNSURE (   9.48  )
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

This driver currently doesn't support any control flags.

Use flow_rule_has_control_flags() to check for control flags,
such as can be set through `tc flower ... ip_flags frag`.

In case any control flags are masked, flow_rule_has_control_flags()
sets a NL extended error message, and we return -EOPNOTSUPP.

Only compile-tested.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index fbb5e9d5af13..aa262e6f4b85 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -273,6 +273,10 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 
 		flow_rule_match_control(rule, &match);
 		addr_type = match.key->addr_type;
+
+		if (flow_rule_has_control_flags(match.mask->flags,
+						f->common.extack))
+			return -EOPNOTSUPP;
 	} else {
 		return -EOPNOTSUPP;
 	}
-- 
2.43.0


