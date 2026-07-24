Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B4BC531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ3CZEvc59csGhSGtcEHAlqUrhIUJB9Ew3yzaCx7lbY=; b=W6WjyuH5yUDVMSCoxfu6zDsaQq
	zhElIy5jt/1Wm2+DAeVPsI7WiozWoSnvt3rR/G2YupSENOYA5ZxbzFhKddw1O7Gk6D0rWofZgHJEn
	+B4ZtRiGG4zwghugEdb7f0eZMjh9+IXOmFYPaAqY8RlsZmiRA0j/LKOjhl9j9CpzUKjBrKZ9+4F7e
	DPZ3LqTSDGmd+DnCpFcMBXl2s1TatqpKQHlKRcsP6kE+BUJofgtuvVcWH/FIqdH0aKjHiNUTdklly
	B1VOUMRUBa0E+vi+8CbxDNclDpxl4AYZt0xq7u8zVVy5AP5Sc45qLkUx3wNiArQ1eEfdQ3NJLJ84S
	yKvP9hMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6J-0000000GILd-2mDu;
	Fri, 24 Jul 2026 11:29:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6C-0000000GIIH-1gef;
	Fri, 24 Jul 2026 11:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9143600C3;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FA91C2BCF7;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=C8aXXQaFeWZmsrlMRRyh9TAsW3FMnEEDkAdARgX7WzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IywIaAWdoc1GT6Us92RjWj9sQkc8PT7ppzysHqy8dqPiomNqe7PfyX1ZvYBVqbuQ7
	 SglkxSJqYGMZrpSSakSxg8vMjoDDbc7FMjCC7KegwzecLWxWoczYyqrNlj/3zRo9ai
	 40xNOBM/Jpcts0jQMLeYrsai0ZG4gI8WIe7eyzv1xGf44+bGS5DX6CxayVbQgoNocm
	 jxfHMdAyDpPJf/UlbkIyM3pq4zWFeAN4/Mc4meFmt4dEnrDSyqXVzbE0FVw/7Wl/It
	 Jfe95a4Ru7DThWtryqdhItSWvd/RBGZcl6ws0Hr68xE6ONxv46XSeBdiNly6NwComR
	 BSA5mJNm1e0Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF25C531FC;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:07 +0300
Subject: [PATCH v2 2/3] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-2-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
In-Reply-To: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=2506;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=ylH/IgEJCVkseD04fa7EwlxtvDcFp1eXUc9OswjHzzs=;
 b=/8VB81TrG8SjFb9w55sRRen2VjLM+hfW97QRD/CaBKXKSzGpXGhXDnsueEA8V3wSIRvkPK73X
 S1jMcqsdLFLAhCz05D9HEVfK5BBKrQv7ApW0EVDtZgNR1mivuqBywOe
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
to zeroes or garbage data. 32-bit aligned reads must be used instead.

Introduce a 'mtk_reg_read_aligned' helper to enforce 32-bit aligned
register access. All reads will be performed by reading 4-byte words
and masking them.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..178b9d85f813 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -14,12 +15,37 @@
 
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
@@ -82,7 +108,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
@@ -103,10 +134,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
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
2.54.0



