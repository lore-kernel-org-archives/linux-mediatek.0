Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C40606A32C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wBpMo1E;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mmv91+qO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/M+HfMNi3TcbhGwOrAuJ9bcXyilkjFKwqsxMBnv5EpI=; b=3wBpMo1EoAkafJ
	GtAPrHnDH7sv54X8lE6t9BTVgJYBioIsK2e5OkLoTPCJZpNUGexPyyELosfCjZ60WEiJaCS98GUYp
	zXNkGOkc0sz2ScmLIppnAoqGhPouGhelnxsCc3uRKm+Rh/7mbvH+JgdGBGC5QJJOkeAIrlDgttiMh
	/vW7s5h+npKmMndb97VlB+QV5vCdYjGBlLcSAWPv81lcZiKCOpCTxerQGunAo/hZ3V7I/XR5T3Hqh
	ZpQ8DAkamMRGPIWL7X5MYTiqcLDgnVApXI193yXxTJU2sNsUVNTlLtcVUZ97NwBQ+9pVtbWYJjDjE
	dv4f3Jp/2b+IaQqip8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesQ-0000000EEUE-1aNg;
	Thu, 26 Nov 2026 19:11:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWes9-0000000EEHM-3YBS;
	Thu, 26 Nov 2026 19:11:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2C8E81A181E;
	Thu, 26 Nov 2026 19:11:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0073F60558;
	Thu, 26 Nov 2026 19:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E7211E691C2;
	Thu, 26 Nov 2026 20:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/M+HfMNi3TcbhGwOrAuJ9bcXyilkjFKwqsxMBnv5EpI=;
	b=Mmv91+qOiLKrIGNBpZKd6M+eVyf+7sO0JRHY0vUhU+ENb3oO0WfPB99X2BHhnbihfSmm0J
	v6V2vLx93smS0GkTp1XPcMcMunQA9ifroOL8gmYvVJO8lBDcWRPrpiAlWz9Wf6hfglZxGr
	Bup9d9XxjNiyms+qumpmt0iiXT416j/CPONuMU5HusooMDcIRhECS3iAej4+nHqIi1LNEH
	zRUurl+UTTCfPacswOM94xvnPc/Y4DO5w1CaDoIowe9ficpWxPNb/T5N7QqZS3U+q+dTSO
	VbT5eemGG7ygC7Tic7RdvcnGwM99CX+AF3C6NtKCAnuzA9VJZLg3wPaZKSWTwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:21 +0100
Subject: [PATCH 02/12] spi: amlogic-spifc-a1: Fix a typo in a macro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-2-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_111110_019632_3FD906F0 
X-CRM114-Status: GOOD (  11.04  )
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

Correct the macro name: sycles -> cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 388bd2472dc0..c7cccc8de6dc 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -43,7 +43,7 @@
 #define SPIFC_A1_USER_CTRL2_REG		0x208
 #define SPIFC_A1_USER_DUMMY_ENABLE	BIT(31)
 #define SPIFC_A1_USER_DUMMY_MODE	GENMASK(30, 29)
-#define SPIFC_A1_USER_DUMMY_CLK_SYCLES	GENMASK(28, 23)
+#define SPIFC_A1_USER_DUMMY_CLK_CYCLES	GENMASK(28, 23)
 
 #define SPIFC_A1_USER_CTRL3_REG		0x20c
 #define SPIFC_A1_USER_DIN_ENABLE	BIT(31)
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.nbytes << 3))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.nbytes << 3))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -195,7 +195,7 @@ static void amlogic_spifc_a1_set_dummy(struct amlogic_spifc_a1 *spifc,
 {
 	u32 val = readl(spifc->base + SPIFC_A1_USER_CTRL2_REG);
 
-	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_SYCLES);
+	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_CYCLES);
 	val |= dummy_cfg;
 	writel(val, spifc->base + SPIFC_A1_USER_CTRL2_REG);
 }

-- 
2.56.0


