Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0596BC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=42eYNCn9ecrvd6d+FrqQZJ7tUlNjSQkIE/+v7XNTAto=; b=p5O01FtkMTZmWTriy71JcYZ1I/
	GiJOCoCTaGCvyDcopAvNsB2Dvh8VAaCr2mtEtp9yyB4wNf1rObUW1RgjCnTbcNwjSR63x6QuyxyVv
	1yPmwagyLAf0+XWLdIQktZ9n76aFFVg+4bTYwJHWZAwsJA03d5Xm0mHgX0jw0I/7ud65GZ032F8P+
	vt7UXturwtJTtmI10wygjVnZTgGmtfpvvFx02QGlRb7Ywy2ClDtsFEzG79CES6LUnA7/kCXPlad2E
	6dcHf6/K/IFFEEERw+mmq5KX9a+CCsU8xQ3Nsv/M34UIivOfc/sjRSeMYubMnGSZ2P95w+xfIN51F
	2DD8f7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxMt-003HCC-1U; Tue, 16 Aug 2022 14:16:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxMq-003HAy-7t
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 14:16:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78A9261024;
	Tue, 16 Aug 2022 14:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D205C433B5;
	Tue, 16 Aug 2022 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660659386;
	bh=hZ4gm5cAZEwvQ6ksizWao2p94DF6cvRGVeeX7yEOIMc=;
	h=From:To:Cc:Subject:Date:From;
	b=udCQE+WACI8+9JCL6QArkC+BwW58WbbawBoH3IVaFVnNok+UvBQ/UKBY/ejdpc5hx
	 k7GAC2RySGPjxADV9uHAbZPMcLzx8+SkqYp+cLq4bjfQfbZ0Ha6u8jNaG7cDOEWPir
	 1G6f7lRUEtdlxoiGRTDmivHGhRoGAwzAYlNep/F4z8CjUt6RlNseMgS8gHNTThACzC
	 KWGc77j5XQAurAVPANaHWKIatp3aS/Lt/xuUv0qykHM6ZL/xa533f2wuILewKcRSBe
	 Cd2o6c4VgoJvIWliZayGeN25s0FP7+kj/Xd8K4SSiEQuhbhix+Mbjb5baw+R0xTohQ
	 kAxOxjTVhp3OQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_xdp_run
Date: Tue, 16 Aug 2022 16:16:15 +0200
Message-Id: <627a07d759020356b64473e09f0855960e02db28.1660659112.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_071628_355305_0CC36A36 
X-CRM114-Status: GOOD (  10.86  )
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

Fix possible NULL pointer dereference in mtk_xdp_run() if the
ebpf program returns XDP_TX and xdp_convert_buff_to_frame routine fails
returning NULL.

Fixes: 5886d26fd25bb ("net: ethernet: mtk_eth_soc: add xmit XDP support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index d9426b01f462..8aff4c0c28bd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1732,7 +1732,7 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 	case XDP_TX: {
 		struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
 
-		if (mtk_xdp_submit_frame(eth, xdpf, dev, false)) {
+		if (!xdpf || mtk_xdp_submit_frame(eth, xdpf, dev, false)) {
 			count = &hw_stats->xdp_stats.rx_xdp_tx_errors;
 			act = XDP_DROP;
 			break;
-- 
2.37.2


