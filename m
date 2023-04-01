Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xQ0TN8kqXc3hwKZBZ+54G4CUYQdzkO4P/nkVK7Yrm+A=; b=kVJWatfJZdqrsoXK/TatjT6SYQ
	55WkhGPwGzcK3/pO0zwZ8wh2Z1CT+Zy7h+nwEQGHPwf+469UdeUd+yWCTqpicelhZCddhhPWstZy0
	Pp9H0MBFt3vGwnCGNHiItDzo705GpIz82rXmbkRUNsfmVUe7bgLdK3XjkpdZzPrLoXFZhZUCAOfWD
	lAD450Ae1IIJvJFx8dOVo2EG3Dj6ArmeKCem11IMsMHURpu9ZffKJTUTOEq0XcWcFIUCIBvfOqZSx
	oo+j9neSn1+3AYO0RpPFWjMwzEDJ7KW9fDVeZLGGivGzVtxOL3dtlTLIKW4kQILce4EFVGQK54xrd
	Y3B9Kyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piUy0-009sNo-0y;
	Sat, 01 Apr 2023 06:44:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piUxv-009sMj-0K;
	Sat, 01 Apr 2023 06:43:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07164B83387;
	Sat,  1 Apr 2023 06:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E23CC433EF;
	Sat,  1 Apr 2023 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680331431;
	bh=c36lwFwHZ8G1e703Idi7Ck6uKneXMSQqAbeazYyyj3w=;
	h=From:Date:Subject:To:Cc:From;
	b=N2hLYYxim4fCGv6fI0Tr8vSVihXiwc8OXIBTgI1F78It1BDze18bhbwKmE91unR6B
	 zhxVXCovtoBsOFIIPOApE766CTypgR+oua2Zr1EZbFr7Mv3DgET1VUic2T5EfqYC1c
	 UQQU8cGmRzMJY9hcUMWlSF5bRC0EiJxT8t26hRATR7zPHkG4Rw4ZNI39OUhh4EQYZM
	 6tgXRtvAnysW6ZUDTWxv3DtwRujICEeXcfk3UgVOEGaKVtG68Gn7hstg0QTszFuqqW
	 S+AEjw8+43WR/TCzGCmZTVD90jg3YWfB0+JLo+Y8mXXI6loHvmp3EG1t/jIGPauJay
	 zccTD4auJs8rw==
From: Simon Horman <horms@kernel.org>
Date: Sat, 01 Apr 2023 08:43:44 +0200
Subject: [PATCH] net: ethernet: mtk_eth_soc: use be32 type to store be32
 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ/SJ2QC/x2N0QrCMAwAf2Xk2UK2DhR/RWSkXWaDsxvJFGHs3
 w0+3sFxOxirsMG12UH5IyZLdWhPDeRC9cFBRmfosIvYYxte23PgrQy25GArqXHAnmLCMZ/jZQI
 PE7lMSjUXT+t7nl2uypN8/6fb/Th+IRJA0nkAAAA=
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_234355_307456_CE11F62A 
X-CRM114-Status: GOOD (  11.74  )
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

Perhaps there is a nicer way to handle this but the code
calls for converting an array of host byte order 32bit values
to big endian 32bit values: an ipv6 address to be pretty printed.

Use a sparse-friendly array of be32 to store these values.

Also make use of the cpu_to_be32_array helper rather
than open coding the conversion.

Flagged by sparse:
  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27: warning: incorrect type in assignment (different base types)
  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27:    expected unsigned int
  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:59:27:    got restricted __be32 [usertype]
  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:161:46: warning: cast to restricted __be16

No functional changes intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 53cf87e9acbb..1e0bb8cee7c4 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -47,16 +47,14 @@ static const char *mtk_foe_pkt_type_str(int type)
 static void
 mtk_print_addr(struct seq_file *m, u32 *addr, bool ipv6)
 {
-	u32 n_addr[4];
-	int i;
+	__be32 n_addr[4];
 
 	if (!ipv6) {
 		seq_printf(m, "%pI4h", addr);
 		return;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(n_addr); i++)
-		n_addr[i] = htonl(addr[i]);
+	cpu_to_be32_array(n_addr, addr, 4);
 	seq_printf(m, "%pI6", n_addr);
 }
 


