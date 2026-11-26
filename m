Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E54606A685
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I86Ku5E1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP0iFo9e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=; b=I86Ku5E1MJ9yC/KMTpF9sYlF7J
	ZM8yfIHb/cZBPBpDYKFBFbqJZtpu7aVwRnOnbAoPngHSHPm2utGBCHEiiZnVcHJ7HLyDurUT5b0io
	BL2so3+g7rUN80CoJkBihVJP1BtdAgctB3hYNocwq6fzZPrgXDQjN1F4Y2szBxpCjV9I4jBzctYub
	noGRff+iq++RhR6XhZR3eWOUBHvCMvv6B+8HGnBnuIxBTYoJHebEo/ur/3YOFkQ0ulQ70sv9bnTXm
	iMsw4t17YEJvJ4YRgww2MCMJvYNBlNEFExPBNRCUmmPyozETCn/iuCFgQLLPZwJTDMLSJ4YO2bWK8
	V4hhFj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjv-0000000BiFM-2p2b;
	Thu, 26 Nov 2026 00:53:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjm-0000000BiAf-35W1;
	Thu, 26 Nov 2026 00:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D646A61EDD;
	Thu, 26 Nov 2026 00:53:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654401;
	b=S9uosQGiVKHcS0QYQaTCgqC1tVxQEJiz0jV4YhZ2mjZAQuyBxkHDXrglugnMse3ildQ6
	 PkxtRlzATU/6x1emi+bHZD2Xq9hjF4HtzFAFGhx5CscPLSGR3cx9jktfiE7v6HoRE/F2m
	 oYpvfk9bx0mX1kCRjVwZI90fQaIvOxrFaOX5AOnOkg+ZACc2HS3WcDGUfZjw3kmbfoGxa
	 eqyBfBtDU6BiGNRIGKvebehS+yh1JOgHXtu4WfVLdAPPb93s4Po6siInIUPhqGoKcFx09
	 /gPCZSmyka7vmBiOQIdX4MDEwctY7oIuygDOSehhPPVrEoPyixdCzTM81xI7iwa11rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654401;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=;
	b=i6C2fhDUMj6sMwJEbRYK/m92yJpQLyQig4r0PSmD/CO7adSZQt4oZuZym+RSTg8xjqgx
	 kHEUXLkVQqTFv/DMWACJvxLgvmHVRofbJ6Hffwrm0EDLMD0wv989RQ/kg7ZkJLCN+G7iH
	 AObJIiyfsqOoqk3TavIXwgAvF4Z1fDFXQwc37GZ3kjIO/lMFTUvWHovbWf51KRydD88AV
	 CupC1cBNE6oCbOsc22EfeTzMeiA1fFwIf8gl8K+K1l9FBevvRPsE7BnhQo6rbpywHu45v
	 pz+jM1CiVPcXP2TcGaKOWEVyQkrIWNAQ67t1RXLt9CSwSjfO33n7mfTO/+827rlx1OQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84EA01F000C4;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654401;
	bh=+/bIrVInONR+XJXRCb4gtlY7/LMelusfalrzxxtW9MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=bP0iFo9eAe6OMf9UKKjrS4i6bGXdfOYPavF2qPUhbQ9Edxd0E0qWYIYGA7QP2BRzc
	 A25pD3vuVCLf+j5dNaAJU8gOjh5xP5EvwT+fvxtsoevIqXFksh2KFd4vVFKcCScOt8
	 EtT6UEzXUkuU+CVHEhJUoak7Z8f5dz/Gk9MfUnPJNpMF3YNH7BSTuko2D7VUkbSHhk
	 AhfCP31s2NBofLfKeBMldphbCNSr0036uUizWf2O49ll2787w6Cb+l6xrn8CAwVreT
	 sOaTpsJMAVdGLC6KRT/UTLRJ29hp8QyROGBHrNRnuHGpQMOkUla+nkMWl6e9GUEtoU
	 Vp4lyQXxoSE8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F4464D121;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: mediatek: mtk-btcvsd: bound bt_sram_addr[]
 writes in mtk_btcvsd_write_to_bt()
Date: Thu, 26 Nov 2026 00:53:16 +0000
Message-Id: <20261126005314.71606-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126005314.71606-1-iasnezhkov@gmail.com>
References: <20261126005314.71606-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654395; l=2237;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=9ux9uWFLOH2k0sXAf5BIFccI/VfvFaqk+pxBS8OV1FQ=;
 b=sxViQTOIXvR9gTPR1kuw9wCzmYkm5MD0oresoHVsiSj8O4Gd+jsjJWH8N42jQz1v1X3BMCUEX
 dCBA1zT8fh0DHQKBL/He63v5rchZsgNHdPJMlR63kJMpTtpDya30zIN
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

bt->tx->buffer_info.bt_sram_addr[] has a fixed capacity of 20 entries,
but mtk_btcvsd_write_to_bt() unconditionally increments num_valid_addr
and writes bt_sram_addr[next_idx] whenever a new SRAM offset is seen.

If more than 20 distinct SRAM offsets are ever observed (for instance
during BT subsystem resets or corrupted register reads), this writes
out of bounds past bt_sram_addr[19] into adjacent fields of
struct mtk_btcvsd_snd_hw_info and surrounding memory.

Check next_idx against ARRAY_SIZE(bt->tx->buffer_info.bt_sram_addr)
under tx_lock before storing the address and advancing num_valid_addr.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 752856a..362d608 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -466,15 +466,22 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 	}
 	if (new_ap_addr_tx) {
 		unsigned int next_idx;
+		bool stored = false;
 
 		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
-			bt->tx->buffer_info.num_valid_addr++;
-			next_idx = bt->tx->buffer_info.num_valid_addr - 1;
-			bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+			next_idx = bt->tx->buffer_info.num_valid_addr;
+			if (next_idx < ARRAY_SIZE(bt->tx->buffer_info.bt_sram_addr)) {
+				bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+				bt->tx->buffer_info.num_valid_addr = next_idx + 1;
+				stored = true;
+			}
 		}
-		dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %d\n",
-			 __func__, ap_addr_tx,
-			 bt->tx->buffer_info.num_valid_addr);
+		if (stored)
+			dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %u\n",
+				 __func__, ap_addr_tx, next_idx + 1);
+		else
+			dev_warn_once(bt->dev, "%s(), bt_sram_addr table full\n",
+				      __func__);
 	}
 
 	if (bt->tx->mute)
-- 
2.54.0 (Apple Git-157)




