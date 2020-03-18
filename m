Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EFFC5ACD7
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 12:41:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DFAC20768
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 12:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbjS9yzs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ7EWbKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DFAC20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xh805NMXCEKK6PMreDCiyGEHe/mkBrSGactk71rMotU=; b=AbjS9yzs6JANCG
	g76L5ElJjP0j8JLgG+ltQpaxrkkiQt8XuQjchNPOuvZ3RMkjl1FbkTHtFZCNoc/ZqlA0lzKSveksA
	HOS1VBVuECghyf0cc8VBivtZhJZTqLvjebVf83+jpXxDeVT3yNR/T046jO0ZJVCTVJT0EBZzWnZmF
	JDcaBqOrRRSZDlktn9TDfe8Hc8aIRIGFq29m39LgWjIabstRSPNtahAZW7RQagd3dS7dqZsCDpKSj
	tmRQuPrXNZsC/kxwAqkm3AK/rhGkJWhFQTsbevS1hORLQiUGNogRxLvtdgq/4nF7ga87h3JxP1zrt
	07O9oq+8nxqq204ClciQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEY0z-0004dQ-GX; Wed, 18 Mar 2020 12:41:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEY0x-0004bw-Bk
 for linux-mediatek@lists.infradead.org; Wed, 18 Mar 2020 12:41:40 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9620120768;
 Wed, 18 Mar 2020 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584535299;
 bh=z71jGjL1m9KrTtjlItnXbj/IEW/7YEgbritM5qt4bys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nZ7EWbKsBEAVtjmww42Biz3rYKcXIchCsy1t0R01XAfnblnXu7qH9MOZ9BDUtKhBM
 F2SIO9KX4j7sf0MTQZucB6D66sWo3iwk7zNwnX5w5fot/Y6PHRcYRPOvauCdMhtVxl
 Ckup6ZciY1atAJ3Bnyr1AxJonUIDVuQbLV3dF2dE=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: kvalo@codeaurora.org
Subject: [PATCH 2/3] mt76: mt7615: fix endianness in unified command
Date: Wed, 18 Mar 2020 13:41:04 +0100
Message-Id: <2447b399d3c63885d43f65ba988c057fa96f5236.1584534454.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584534454.git.lorenzo@kernel.org>
References: <cover.1584534454.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_054139_428299_89539EA3 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix cid field endianness in unified mt7615_uni_txd header

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 323d7daad363 ("mt76: mt7615: introduce uni cmd command types")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 9978f6bb22ab..610cfa918c7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -120,9 +120,9 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 		uni_txd = (struct mt7615_uni_txd *)txd;
 		uni_txd->len = cpu_to_le16(skb->len - sizeof(uni_txd->txd));
 		uni_txd->option = MCU_CMD_UNI_EXT_ACK;
+		uni_txd->cid = cpu_to_le16(mcu_cmd);
 		uni_txd->s2d_index = MCU_S2D_H2N;
 		uni_txd->pkt_type = MCU_PKT_ID;
-		uni_txd->cid = mcu_cmd;
 		uni_txd->seq = seq;
 
 		return;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
