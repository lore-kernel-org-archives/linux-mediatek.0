Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE25606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ymzJ2WiD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S04xAB/D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WLsrLWcaHLMIPgECXjlqeKlMPqmSq6rMMsrBtlCMClI=; b=ymzJ2WiDcUBYM/qk08zfpqKt77
	bc2s5bahHT9gZLiJXNiwGwZt+SYvQFV7OJE5RufQkxSkrk/n3nVypkECdPu4VuPFD9PzZGRnUupO4
	wx13MOGGgW6shUHwUtLBQmP8cFH52bp7MEjDgbjQ9sTTobY83wMRN0/XmwXFq8Ilng9LHDiP74fk1
	jLqSIKqfqrLXQJ9ZklLCYAv+SR9ULCwCmxI9bthmJ6z+lO+qlDJlPpAi8AasTP9ngPQp0uGrHkGQG
	bTG1KVj9/lXwN8RDUPRXDxbfWk4xCW/FPsuovdU9DmkRU9KZQUvTH89WgZdZriDjZdVTMVv6lzH6s
	1ssTiVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHV1-00000005TPY-3lBI;
	Tue, 17 Nov 2026 11:37:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHUb-00000005T4L-0jlW;
	Tue, 17 Nov 2026 11:36:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B4E36343E;
	Tue, 17 Nov 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794915412;
	b=g/UEmOv8+mHEbevTNYtTO9L8+boGtYtjhsO5ysPQvU9rgBLA7/fiMbrPmxhyCafLLh7R
	 +VfzOU16c0h2/m1Mw7G9IGDSmgmehwj5e2Q8EECTa/j+ydwRwyqdEvzuuwY+6CtKVk2Pd
	 6Ez4szQkofcOCS45wHuXsE5VhxoiGnIzdmOkfhjxbyskd5fVJX9DrRhrwLkygIbJXSMEw
	 DuHTyrtkN5/V2wkq3VhfVxmhvNRm2VtDnxfOVh8Wltf6RmlwIep7nKcdAEctM6sG7Cfyc
	 au2SWXEOdEdVId103m8TpMFcNHlpbBTPjPvIt97OQ9gQBmG6tpGATc/ivPFGRlwRfIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794915412;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WLsrLWcaHLMIPgECXjlqeKlMPqmSq6rMMsrBtlCMClI=;
	b=mWlBWA1/rHinMYgDrie/pp2517Yqs+3qB/yO77c1HvNDuW+OGcnMXBhIDmZwXy3CvHPT
	 Jztvx/TTGJH6SF/h6gwUqMowBoElbpH7aAYSek2uOc0AF4gS39YG5k4MDh0m7t8c8bXBt
	 K7qnnRLMhVjUYXrciFeSqa4kwV1niSSyhYjXPa1hvyU0NabWXcUWfrsGRwzDeT1Lfh3gj
	 bB1e6kShHLL800dGwMRVbbAaOnf9yjQUpji/cWKJqHYDI1rkgbvirkYoo0jfn9bN/DcBR
	 T0eKW71VrzydydsaaDbpu5wIiB3rJofXNBBIfXL7OXUUU2/WLrvZ5SEOxBJlPX2Y7uQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E50481F000C8;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915412;
	bh=WLsrLWcaHLMIPgECXjlqeKlMPqmSq6rMMsrBtlCMClI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S04xAB/DMUIeo+4BQ9Sf5RDhgjrxjzuSC282YbcW50Qn0f8g9j3TeP3s/vRZAav0k
	 5MBxsRsT2DuN4keN0drrRqWN+Lwu43kJVZqmC17o51te2YJqhYggYMzqsJfbCjHF9+
	 D+PbuzSlIRPbzA3zSrWl5UNMeEmY8JUUQccSaK7JhA0vEbOzuPP8SYADTLFsAXO1oN
	 aLiqUzv0km2OHa140FGYhBAK17FqaebqPYJhQ+cfupwbu0sS3NoxymF8LN9sPW40YF
	 beHSNl0HtJq7yU4g1HnfBY4qfMP8Gwff6yWL56iNpUznYL7VE3yw7P21KS6GNWPK2f
	 WGVN7UqdDWqpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 731F34A821;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 13:33:24 +0200
Subject: [PATCH RESEND v5 4/4] nvmem: mtk-efuse: add mt6572 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-6572-nvmem-v5-4-9b561a8a83e1@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915409; l=1186;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=mWKEv6xosLs4X5XvowD7mx6yLXlNMxpHdaw+++X3b1Y=;
 b=HBm6I4zRrHGeg8wxUl+qexXvxYh8tSZFqFTHVfhuk6y3hAcUo0uquOT+hONaqE7KjpawokUtO
 mCBMalZ6Qx5Afp86nBgEI47dXCKaxG3adIgm3qg2H+9L2uxLqiVE92z
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

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index d2e5c69c580e..24d302a15528 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -150,6 +150,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
@@ -161,6 +166,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.56.1



