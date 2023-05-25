Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F59C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y/FBbEvGFOXbNlqNDIbgxkDVo5dkbNP+vkZmdRLTPfc=; b=IAcY4XDBFX/Yfmhcun7MwNNJnE
	k7uI7Er0KP2Mn+tUGzW+MWYgOUuo1/C4qssa3V5WR7MuEcM9yki8wo2NjMMlISYQL33Q2vAa/taRS
	DX//ia/bggIwhRjZNjfbZe3MIfD85dbJtGHJ/QCg7lizu0zkdFAcjAf/CCsr2gYektTZwTja2ffQs
	fI4U/D+SXJIktYQQw0qAuzB4I6aGpc+5WeVzOZog2MDGkobfjkbUc/iuyG6uMW8iLIZUQcg8rkFvQ
	luHnQwr3O4wBSX2v9JsTYg8i062eJ9pkwsVpwE4HrOvfhJKY88Smk8owSsAeUgC/EHmJUi/ZRxg6L
	kaK9hh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BoN-00GoyS-1U;
	Thu, 25 May 2023 14:19:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BoK-00Goxm-2F;
	Thu, 25 May 2023 14:19:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADC396155A;
	Thu, 25 May 2023 14:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61CAC433EF;
	Thu, 25 May 2023 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685024363;
	bh=3jOIJADSMaj767haeBuW7tG2pkAWHCO/ya9AobVrfls=;
	h=From:Date:Subject:To:Cc:From;
	b=U1HbooIqhrEtr/vJLGU7H1tZjRhEQFxQyl3pmfCtX7UyHLFnajaRMF03Y9lovRseI
	 oh3SUhmCqUFuCnZVGNY7Se3Hv9d+4q/9NLBltfEQAh9g4m43l6zoO7ejzqhZO6J18y
	 s/krbfZ2xfDgF053ixAF/Ndw3Qu2vhI74DZlztzFPK6Mj774sHYiXt07d8YLZ5CuIz
	 N3yMJRng7Dyu6aEsYRSFgZceXGUt4RfQr4AhbL8kLhe9V7g7Rd7+tEs7BVTz/2rgwq
	 SMw6z0bSIYuiVGK35CgWcuGyWg9g5kZoT/FeEwxAfBnRUyGA8VGMv4U+/YRzqXjVsv
	 juahWJdo5L9bw==
From: Simon Horman <horms@kernel.org>
Date: Thu, 25 May 2023 16:19:13 +0200
Subject: [PATCH RFC net-next] net: ethernet: mtk_eth_soc: don't convert
 byte order of etype
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-mtk_eth_soc-etype-endianness-v1-1-b5da9258ed86@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGBub2QC/x2NwQqDMBAFf0X23AWNKLTXQj+gVymSxNcaalfJp
 sUi/ntDjzOHmY0UMUDpVGwU8QkaZslQHQryo5UHOAyZyZSmLhvT8Cs9e6Sx19kz0ncBQ4ZgRaD
 KdeuOlfdt62AoJ5xVsItW/Jgj8p6mLJeIe1j/z46ul3MhSCxYE932/Qc3tZmzkQAAAA==
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_071924_796234_6D07C303 
X-CRM114-Status: GOOD (  12.76  )
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

*** This will change the value exposed by debugfs. ***
*** I am unsure if that counts as UABI breakage.   ***
*** If so, this patch should be rejected.          ***

The type of the etype field of struct mtk_foe_mac_info is u16.
And it is always used to store values on host byte order.
So there is no need to convert it from network to host byte order
when formatting in a string.

Flagged by sparse:
  .../mtk_ppe_debugfs.c:161:46: warning: cast to restricted __be16

Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 316fe2e70fea..7e4213241cc1 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -158,9 +158,9 @@ mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 		seq_printf(m, " eth=%pM->%pM etype=%04x"
 			      " vlan=%d,%d ib1=%08x ib2=%08x"
 			      " packets=%llu bytes=%llu\n",
-			   h_source, h_dest, ntohs(l2->etype),
-			   l2->vlan1, l2->vlan2, entry->ib1, ib2,
-			   acct ? acct->packets : 0, acct ? acct->bytes : 0);
+			   h_source, h_dest, l2->etype, l2->vlan1, l2->vlan2,
+			   entry->ib1, ib2, acct ? acct->packets : 0,
+			   acct ? acct->bytes : 0);
 	}
 
 	return 0;


