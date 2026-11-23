Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A430606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5Rj45+T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3zvRi9P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RV4Mc9YCuuMAl03wMSi/U06IKR6bjQoik0XuwOphOYw=; b=R5Rj45+T/rq/ghVinrVa9eqRZk
	6Wew1aPcjUtygSHYjZlQH1oJ9/dc74JGzrILPh0GBIfvcZz0xQN5u32SRYfsnHzgK2Ggi3RMvee+L
	pspR3OEJbPYwnUFs7Q6Jn7L5JuRRUCYVC1wNKnZvxYoTNOr7TFzmNXm/d2TPFRmOsG00Tt+a4M2Og
	+tH261+ALkTLrv8cJY4p96e99u4v5aaEBOVllddD7Z0qA6uqmuuY8LtjIRiBZ7ATIOKYdwT5ZULlv
	HeVQcMUeZ3TSE5DwucVaM+KQyIpx+Lc3/M5yZKYYFgWpfQwn6PR7MAMwzSgn0tHm1VluXGaC4q8EJ
	uNHhrU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbE4-00000004vRq-0VMQ;
	Mon, 23 Nov 2026 21:05:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDy-00000004vOo-3rGP;
	Mon, 23 Nov 2026 21:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA3D643AF6;
	Mon, 23 Nov 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467918;
	b=uSq/kXMh8h9/HeeHXJLdGbsoCdwATFQFCqlPKmFzp+3lOLI8Dt+SSzf9BhDIaRIgSgQe
	 +yLF9zZ4LaStQdsZ0V34/fnFpcyq1CO/7ljfvj/HEDRcGSN1gB3p11r34U0K99bSVC7XB
	 4afNgg5S9uuu5XogiSjelNSt+1QvXsCXbmmOfBa0Iwe8shEjejfTRlxnQTwNS3yl5tF8q
	 UFxkuJG+grZhdmn0GWN19x2UqXek24OFix/lWkb3QdysNH4+6mVPyewS20an+cKQYXcef
	 zC5PXL/KpQ0xSnuuPDDb5rLCtTi4UVxakxUc+G35cmPgcjE6u4LR9TLyvxqUF6PKwAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467918;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RV4Mc9YCuuMAl03wMSi/U06IKR6bjQoik0XuwOphOYw=;
	b=cF2XhI9+sS/jqJnR0/UXUa3e2NAw1IjtC259exojTbR0HLBDx/B2Uuq2Qsk90H+jFL5l
	 XmZAVE9sC95Id5GV6OiEC60EK+lf9MAKupSeyBs2mhdbQBI/g2lejaLkY1XogmXmmNCIA
	 fR7fsayBal5hkHD6zHFGux2jiCzFS3Dkoaq2fRSmHv8MiXYE/kgtOkcVDSPqQd/nyFrAr
	 Xo4FL5aMf/eJU5WLqj9HaK5HmrMaRywvupltMS3wXBMSbtTcGQTbB28pGEhJG7xXWJJYg
	 uZoHgIm/RzQfjGFM715A0m9HFkbHt46BkaUJ50YSYUTsNe5h1zOLJYNiLA5SD2p/phQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5A161F000D0;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467918;
	bh=RV4Mc9YCuuMAl03wMSi/U06IKR6bjQoik0XuwOphOYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B3zvRi9PZftrqX0IwUBwLkaUIjnwBFx6Rj9UTgq5nYy9kCjghSTRzgQIwsa05WRDK
	 9XiUeSFt2dnUXZg6iQJ35e1RlOCc+g8Nd71w7ovxD4r7Ew0GGW7ow8MVhNWShH43tm
	 nmSYIVed8hm3JfpMUp3/dFqLOT7Lrle7sQuUt/kJ9q6K8kqZEWp+4PFU6iKQ7MF31p
	 TSNhK4m8pb1362Rx0XuCkl8s6SiYefTBcK/pF3A2lhQTSwMf1s7H83ywnpPDPkKMly
	 +/y8CD/AbyI1Lch5mDG4yklc7AtiBxczkOo/IjFQ3Ny25zbO7Ml2qN5ja14bhPYknk
	 4sjj/Nc9RSEXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32CD34C75E;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:02:33 +0200
Subject: [PATCH v6 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-6572-nvmem-v6-3-7ba710b15657@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467904; l=1989;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=wvU1NPRqy3lUR7AfJOi5v05HYuK5G0Upeyo71cnpGfs=;
 b=dINnKayKiufmwMGlbu1UkXsdVD7HlPGdUOWY7gX2+5TMwc/36W3OembB361yATvx2DZ7/2qIY
 wXGadnGV/0oCo5ZakANtiWWTWJprfZK6OVFVShLLOkY0inSc8B4dlHO
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

MediaTek SoCs are often released under the same marketing name, but with
different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.

Since CPU speedbin is stored as a number in the efuse, similar to GPU,
rename mtk_efuse_gpu_speedbin_pp() to mtk_efuse_speedbin_pp() and add
check for cpu-speedbin node to fixup the value for supported-hw usage in
OPP tables.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..2c09649ce7f9 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -59,8 +59,8 @@ static int mtk_reg_read(void *context,
 	return 0;
 }
 
-static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
-				     unsigned int offset, void *data, size_t bytes)
+static int mtk_efuse_speedbin_pp(void *context, const char *id, int index,
+				 unsigned int offset, void *data, size_t bytes)
 {
 	u8 *val = data;
 
@@ -76,13 +76,14 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	size_t sz = strlen(cell->name);
 
 	/*
-	 * On some SoCs, the GPU speedbin is not read as bitmask but as
+	 * On some SoCs, the CPU/GPU speedbin is not read as bitmask but as
 	 * a number with range [0-7] (max 3 bits): post process to use
 	 * it in OPP tables to describe supported-hw.
 	 */
 	if (cell->nbits <= 3 &&
-	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
-		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
+	    (strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0 ||
+	     strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0))
+		cell->read_post_process = mtk_efuse_speedbin_pp;
 }
 
 static int mtk_efuse_probe(struct platform_device *pdev)

-- 
2.56.1



