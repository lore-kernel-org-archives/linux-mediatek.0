Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAE606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=03HjnByb;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=r+Rlj/Uf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3wS3MrJJemfmkKmZHQvuQ5e1ha4PFkjkqrpxxc6PrgE=; b=03HjnBybTaT40N
	Mm11x3sP80kBZmzX1AjQbShdJYLtLKdE+V3oUugWNFGZnIZOOb5YQQp7KjvIFgFXIOaNwOymgD6fA
	PIELpZmJnvr8xFM2TSDql+Qq42zo71twOQAz3qS85Qp5ofOglV/VNmtEvUIKkh9BShvwymZaX0S45
	2Ysoud31NPKdosSVqFpHNdh5qjzCLV+juVLnW/Gowc3MHP4+puaqkHUHqP/6pm5zaFamCmq2UluNX
	hSu3Lw4YFe00v3dacUoQPSNuCpiE2ZBPZlgXB2B7l/S7cVRmW/aaF4TcoJtezMnCrDIVWkSp0evf4
	HerzL/xkWvYd4Ku3szag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesg-0000000EEnW-3hf6;
	Thu, 26 Nov 2026 19:11:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesJ-0000000EENt-38h0;
	Thu, 26 Nov 2026 19:11:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E64654E417B6;
	Thu, 26 Nov 2026 19:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B21F460558;
	Thu, 26 Nov 2026 19:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAF3611E691C9;
	Thu, 26 Nov 2026 20:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3wS3MrJJemfmkKmZHQvuQ5e1ha4PFkjkqrpxxc6PrgE=;
	b=r+Rlj/Uf/5FUfMBke6i49V0U2qJVmcrX8309hbV1z32hKiLRldD1qjFotA7Ja8ONXy8F3m
	Fhb+rIybEcSSNvmcrRPtgLiBHwl0lDXnZ/0GHavD9rLiHpOQ642VNudPJogJDVZe8D5L+L
	EyzwitqTY6u3fTXK9kwvhK+dD2BN3kG6xjdEtxbY9UxRQ5D+pKOVAUjI2ufk8benFG0GKw
	3pdEJ7GCwAM9yLJwCAGExPLM0FB5gn3Bfs3rEICp8hrZEiyJ8hAU26DpTXo5bT0TMzLRb7
	UxmR4wGS6vxN2KfQqirbpKVYVHoDiaf49tAtJGCr94y8IucOft1P7+49XPnMqw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:23 +0100
Subject: [PATCH 04/12] spi: ath79: Validate the dummy buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-4-ca8e924cca1b@bootlin.com>
References: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>, 
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
 Mark Brown <broonie@kernel.org>, CL Wang <cl634@andestech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Yang Shen <shenyang39@huawei.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_111123_473946_799D428A 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller is single-lane. Reject operations asking for a dummy
buswidth other than one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ath79.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index 1f5d0fb03917..36f21918d790 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -145,7 +145,8 @@ static int ath79_exec_mem_op(struct spi_mem *mem,
 
 	/* Only use for fast-read op. */
 	if (op->cmd.opcode != 0x0b || op->data.dir != SPI_MEM_DATA_IN ||
-	    op->addr.nbytes != 3 || op->dummy.nbytes != 1)
+	    op->addr.nbytes != 3 || op->dummy.nbytes != 1 ||
+	    op->dummy.buswidth != 1)
 		return -EOPNOTSUPP;
 
 	/* disable GPIO mode */

-- 
2.56.0


