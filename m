Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0CA606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KpFz5snl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cHqShPiH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=; b=KpFz5snlt8+VOE/1rCiKBrt60+
	TGi817tugJyOg4nVjwR3Tc7Rf18VpD1rC64xAyBpyI8i8HwcgeJhpemEjJSqsZDs8MRRRrDL+hYQ5
	WTXqHcoDjj8yT8NIIgiOs3t4pZaRmC5HT5W/LJ3YS0pzxulTa5jstknBhrSBXU3CKegedLThC6LYN
	KEu3BIk3EG406xWqYBqnCjv0goDOwhH/jdzEm/C1fqXMbMWF5zi07cUNghTMW48yx1nUhIWiBT5g+
	9BzlRWF6EHlwQZ3mENTWUFQs3gspAnPWkgcPdDb9PcHhU17aQXaTCfL6dJM69gPM2l1HtHbNWl8F7
	HRzROmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHUs-00000005THn-0wyT;
	Tue, 17 Nov 2026 11:37:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHUb-00000005T4M-0Cme;
	Tue, 17 Nov 2026 11:36:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C84B4468EB;
	Tue, 17 Nov 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794915412;
	b=WhD54QDt6At7I85ME3JDOTi6RIJCAmScVrgvBFUDdz37ZmpUdHzDAoBmuhLSOmMc6JhT
	 c8NivhW2zHF8wwP6r+ZTRLRjZvsrpZpPzZ4Zbd2yDdBsD3tgaa3OnqSR1HomG5vK5ruIT
	 VhD84MhucCghjJoYyqsgRl4t6AS/gJurE/iwGMh4dZK5g3lJYZV4PD3YzCT8DYTHDXx7+
	 HQz5U6nEP9jX7w05pz29cs971vGyGuut4V+20Kndx2MFyD6Yz5x+lQdTuJTi6Bx7p7qkW
	 mJtKZ74OEGij/4DE/IlOgdkYAv+NplpCvM6Kn5DNBuaoqFypo430H83tmvn49KoTaAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794915412;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=;
	b=ixOhRf2NypzW3AFdrvWUAKkJoHq1mjL4RJztrPrIPcckCySs/ioXPPv8k4c0J2OgD0d9
	 +dO4dUcAY/wY7kG7aYhhsHajjg5YJfqcw3neliDGAL3AtLfKTNOK+vCj0b0AZZMXjQ4Sb
	 XFfqJX3UEOdjZosxp0TPm3jmmQNjG5wAhqCJtlL17wyhvfm9y1+rQfWcMz76ZG20n9y0A
	 H0cq2lAhlLIgUhn0+C3W/ANMS5ycLNtXZ/xtGMMORjysZMfbMSnZuHC53NscMgeD9yuXC
	 sHj3p9cEG+co/v73g1JEFrKlDWYnXQ0vDNy9pBChXXj/L47NYfsLnGzfIFiu8hQNssw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6CC31F000C6;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915412;
	bh=X9HZqJeWaujFrx8RhVbz39RVLiUzLr7qnqhJVg3dmCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cHqShPiHP/FCJT3LLWhj1Mnbsrd29jCZGqJeDBM5g05NPxAg8wsrDu+ykyPbO69T4
	 olhUa6ss3O9/YogWFd/LzfEFsdskWCAM6Wep1KQ1AcyCwShUd1TimsRZjSdJ+Kz2H/
	 Rzn2k4/LA5drYktqqsAwrDyLNELI4Evm5vW1qEA8E5q2z87mjfl0/5ch5yXbIu3hhV
	 gd8hUGNuGXAseMYf7JB9hUo16jNyNHHZJjdA7KqecnSE13aKHJQp/eJAub0Lxm2LPt
	 8PYT8ki1eW4bBG8xd8hPsBKtL4UB1lwew6hq51kDAxWMipT6LNSmEQrTyPKLM5rvPc
	 HIx9JE75o4JYA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 450D84A819;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 13:33:22 +0200
Subject: [PATCH RESEND v5 2/4] nvmem: mtk-efuse: add support for 32-bit
 aligned reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-6572-nvmem-v5-2-9b561a8a83e1@protonmail.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
In-Reply-To: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915409; l=2576;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=mDeWdFlgCV5LQ7V1Qel0v86EFQeD6sQC8dDyGhHzDrg=;
 b=kThR0pt7ntH1vuOsJ5KCQ19+F/lu3NmbHGIjqzow9PYU0aErAgxLhyzJ/n3G0Gt+qo+eWcRmN
 Y4MckRVVvcmB1EFSvQwG0bKcOL5x0ejq+a/B9plNo0M4SuTvFm7cVy0
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



