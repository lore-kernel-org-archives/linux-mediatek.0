Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD9606A333
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQz5LHMx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6KeA4i6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=; b=iQz5LHMxKPOEQ+KnotEs8RRL3r
	2iDnOr82mdAJLEyFa7gtQvyG0gZG4OF7jjWbKzghjNnRXZWlsMEXo9mmnhwsicQKnGfRoPbPeE/3w
	DqpNZAsHid5DnsCuX//j/ZnGMeJVGmOT6HIBFSZL2Pc42u6uMXC4jlDCJnloAXw4ScniJn4DXkzrj
	J7GWe3+X7gHlBpDiA7Wp6tOGh1XfJdU6HT1geDFOuHPM6fVuQcrMv7LDpPSvNxcBVUqxkI3vjIGn1
	xtOW0LMq4AR41p6bDJddjmxfRa1VtXQCW26eiYpYMAEu6SfabJLQVBZI3QAEA5Vlcewp6OC1PXPLr
	h8c/UGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbE3-00000004vR7-3WiP;
	Mon, 23 Nov 2026 21:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDy-00000004vOl-2wmk;
	Mon, 23 Nov 2026 21:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74352438E7;
	Mon, 23 Nov 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467918;
	b=1dVyBpQEahDV5mO/9XLEa8neNvOudymtYMuxCTz7ejDldDKnlIywhi4W75EBGQx7F8A4
	 1ECTSFdhRx+efh2MBFHMLxF639/b+2FYDDeCqf9nlXVRQIutVq164MN8lGlcn46sOLAjj
	 heBZbpK8jIjnQJnWURANWCblA4SSgqJK+WBKCadLoX10dCMHDr3JpGR9ucEXfKW6nKsiW
	 L1xPufaJL1IgYLOFakqQxtOvNR4SAoP55e1CwrWaPzxVst4xpqE7ari2+PVhl8p056+A5
	 76KYbBWKPE9QUx8p/jfyIePHJl/RLLwlK4/vwV8klAIXsekKq//hsmI8l3WY7NBbabA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467918;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=;
	b=gELWT2DGSLFKjf8gzVKIWIFWDfo4Ot7pPU5pavT80mVjHVxWnItAcKymoykGd22y5fuQ
	 5VGl6v4TRv/q3If5y3VKjm3snzER5TiONg7316mmbwXrw3sSwuQkQONo2Eoi1fvv9iBtw
	 99UZwBNRMq3mTlujD0bmpySurb7EVHahuIJQP5vtu/jUXnIVZhUCFimymUUEJGo9uTHms
	 K4mnvd5AP10l3DcNCRciE9qvv/v0HBSffhW1+qVZ3sEKhAGszVph2ZiMTt+xD8wOiVnkV
	 ggruM3BUGnDi/V0cD5PVjWtmKH4w/znubNbOgtbiH9s93bwelscRMRBgvMFyerIn1Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 896651F000CF;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467918;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=G6KeA4i61vuCXf9c2fwcYxGZbvjxA2Ojx704OEEKFsT2voIvy07M7YDQxR1w+i8ce
	 7Yw7ihj00cLCFp7dAn1eu8/UwLoWna+bcIeuFSMFPcxiSR1Obf8NX/dEgFyXcS7dGL
	 2aJYYje8f69gZb/OKvBgWDmjv5hgzLXvTmaGOmX13bfSfdlwnPNV9ijxHGelP92Hat
	 gbJ1bpnmrLxS7Ft28spDERhPE4w+g1y0rqomtno4Olb56rXs0nUYDtmZaBSd6i+R3R
	 kf//hm5yJ+0ICdABSsa2w8617Uzx3G4OH4C+Tbk1C3C9TK2eOjl+xtx0wZ4ajmnWc4
	 ZXQVaula6gaJg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 169E14C75A;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:02:32 +0200
Subject: [PATCH v6 2/4] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-6572-nvmem-v6-2-7ba710b15657@protonmail.com>
References: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
In-Reply-To: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467904; l=2576;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=mDeWdFlgCV5LQ7V1Qel0v86EFQeD6sQC8dDyGhHzDrg=;
 b=C+LCemvr8jh32YbpwCbK9Cx4Wtd6UAjcUq3tDhRZ6iYA4bGwLTlBI/UPVMIoMLjP2nL2GqfNj
 FUzCq8Zf59lCe5+cWqpAAmN6i9DnOZVHSV8fHWNVf5C2yiyGmjCcPae
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
to zeroes or garbage data. 32-bit aligned reads must be used instead.

Introduce a 'mtk_reg_read_aligned' helper to enforce 32-bit aligned
register access. All reads will be performed by reading 4-byte words
and masking them.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 00a84ea963a8..980c29d01337 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/io.h>
@@ -13,12 +14,37 @@
 
 struct mtk_efuse_pdata {
 	bool uses_post_processing;
+	bool needs_aligned_read;
 };
 
 struct mtk_efuse_priv {
 	void __iomem *base;
 };
 
+static int mtk_reg_read_aligned(void *context,
+				unsigned int reg, void *_val, size_t bytes)
+{
+	struct mtk_efuse_priv *priv = context;
+	u8 *val = _val;
+	u32 i, pos, shift, val32;
+
+	for (i = 0; i < bytes; i++, val++) {
+		pos = reg + i;
+
+		/*
+		 * Read on 32-bit word boundary or if it's the first
+		 * iteration
+		 */
+		if (i == 0 || IS_ALIGNED(pos, 4))
+			val32 = readl(priv->base + (pos & ~3));
+
+		shift = (pos & 3) * 8;
+		*val = (val32 >> shift) & 0xff;
+	}
+
+	return 0;
+}
+
 static int mtk_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
@@ -81,7 +107,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.stride = 1;
 	econfig.word_size = 1;
-	econfig.reg_read = mtk_reg_read;
+
+	if (pdata->needs_aligned_read)
+		econfig.reg_read = mtk_reg_read_aligned;
+	else
+		econfig.reg_read = mtk_reg_read;
+
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
@@ -102,10 +133,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
+	.needs_aligned_read = false,
 };
 
 static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 	.uses_post_processing = false,
+	.needs_aligned_read = false,
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {

-- 
2.56.1



