Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC76606A332
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WqX4D7Yk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ysu+d95A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w9APPl1aY1SSZgoOHwjq+b2ybW0FDqUHjMIv3d+TVZU=; b=WqX4D7YkHJB47A0xmDOauJzeoY
	7xP90Pjx7Ias2RORr+m/cE28Q1vrVLDEiF8SEWbJJK1haBh4iGeGv0cgBGOmD+22JRNl5nSJuzP0J
	m09iELeakgK9b0ym48Ctw7q04wzuR/UxV8QDew+PdqLnlE1223c0T1puamiZZe5LN/6lzvztFpJmu
	N1Q1vhZ2eYUukcr+xfRUFDVQHpmo5B1HAguDfroCkmX0B4CDeBq2Kz45uyaMiqakjDY956zVcLHEH
	pikQ7qOw2jz1oICOV4X/jFDBGM25RF3G5JTOPXu9kGWXoJjSnKBOASXHNxphpVrQH9q/4sO9NkHQi
	IPcVe3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbE4-00000004vSg-1kpk;
	Mon, 23 Nov 2026 21:05:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDz-00000004vOj-0G3Z;
	Mon, 23 Nov 2026 21:05:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A8D62385;
	Mon, 23 Nov 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467917;
	b=d1O4JPC+R6DkjsczartyAd0tR4g2PbUoO5VAhMivpkz+tfxBPA5aF2Wj09+vyXyN7CrD
	 OydPjDRTEBpAiLVpS0CAzK5nbtFKfl6EACYmDUhVUhhZlc+yke/axquNjfPA3c6sAtXR8
	 OhiMeLCf7rJHftlLB0Jw0lSzQJ5qlJBuyygw5x1567lGBJrAu8CYGGgVgfedh2XsU5yzQ
	 uLSawoUt566SbRYeLgK1OmRpVtVuDiADdWu/iByms/3/3SIYyklN3paZYyvfouN6z0Fcy
	 ADLZ70UENFoastUe8tiPAxaZrRWp7ZVIW9uFgzhj76dQTLlmgx4x0JdD6CIDYaJt7VQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467917;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=w9APPl1aY1SSZgoOHwjq+b2ybW0FDqUHjMIv3d+TVZU=;
	b=e1rJxIhTkApoT07X4PQU+aEkZjHkGqdWY7MyHpTCXFOjtmxHuiMZNMJz5CxaD/7QZruF
	 BR5MNcsL1rstVoSBFgt8i+TamdDodH6NAX/isQAzE3CP/kY8zN1P0xGrAveuuWjw7sC51
	 20YhxRhGMiSgLB5eDMvhOty/wMXkzDvYuw26JlHgSJmXBUS1zFT8VPW9Ga+TbNUj83+mc
	 WekFa8WWfjTcc8qwR6zN/X4sGUaXx9epKR8oZEXsulYltK9Hv/POCUz42aql/5ZhONlZk
	 rgHGD8EwxoHj11GGuIZopFL9l92qVPxbT5tC7VvM895vjcvJc8isbwjpRzfpRaqUDBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C10791F000D1;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467917;
	bh=w9APPl1aY1SSZgoOHwjq+b2ybW0FDqUHjMIv3d+TVZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ysu+d95Ak4LWW/fuSH0LBHUyg0C/aF7YTf5KTp9nGudH/GtpLVTSOt/SRi8UxQEMu
	 9dec+dF9r8b55UNegkQZBwo9IY9KMhjRCNHX4SBlbyc5aYpsq3dwMUaqMY15gUCocw
	 q0zcpfbdkx50cIYHVtkphoXOMvybIjvy695y+oGj3JaZ9d37FI7f+lk7PfVmpfP/HT
	 3kvmTgB+gdvStfcQjhSAXzfCG3ZPOJM/8TRxsLPz3LhTFXbEOW1BrK6kX0kMgsq/9p
	 /XiQwz2I9EnfNZU33W6CbIGNjao2K0WXQG2vbKaXq5cU1UvSsaJyF/H1vTvVTbY+U4
	 RYfvBml1kXGNQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4E5424C762;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:02:34 +0200
Subject: [PATCH v6 4/4] nvmem: mtk-efuse: add mt6572 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-6572-nvmem-v6-4-7ba710b15657@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467905; l=1269;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=43Y61F/xVDuBPxA1cuPoUFKMo2eztmJj4amb2QHL2o0=;
 b=96ireVmWbTwvAGGl2DEiTClHAzLQlYXs4PPCqKBg5UcGWdi15Wl4o0bsAq+FKOgSO45oRonSw
 ur39kNSH+rACvC8/ca+keKVeVg0Y5Qaqkp/BeRAI9DREW0y01e7A7j2
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

Add a platform data struct for the efuse controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 2c09649ce7f9..88d84ec2f435 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -132,6 +132,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
+	.uses_post_processing = true,
+	.needs_aligned_read = true,
+};
+
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
 	.needs_aligned_read = false,
@@ -143,6 +148,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.56.1



