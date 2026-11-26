Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BC9606A335
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pbClc3ar;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v+eLEvJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZkEjsyv0Cfkvd8f7cD7poUzh/Ooh+iJ1ptYcpqpt/Co=; b=pbClc3arcYeOMI
	RC3q8lcQM+9/W98pgejLVVlJwnm642Ps9arLZHpCxJ97Wg36Rx9Gl3IFY7AK9oJ96TCdvU55Hdt48
	FjvRwoHsQPr2NanhqUeh0FHoJb/MwD3M9jEXchJCTyNM0uevjkVgyHw604xm2lZL65APRganMuE/c
	JT22gCegHBgnt6Tm4t4NoyvMYDSdgLQj6e0C/RzOp7OW42bLH9kabqK8Zl5K+Ndm5dFR2Pjgo2z+H
	pU6zz485PrP6k7a7u+PUXOlW6vdGIu0ZX7DvDz/wDJGbE/pPvw7rhGY7kW/AtnvD8dS1RRkidC07n
	g/l1YsBH+lAMg4VpJKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesR-0000000EEWV-3Tbi;
	Thu, 26 Nov 2026 19:11:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesG-0000000EEKb-1IBL;
	Thu, 26 Nov 2026 19:11:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 91D104E417B3;
	Thu, 26 Nov 2026 19:11:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65F0A60558;
	Thu, 26 Nov 2026 19:11:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF33311E691BE;
	Thu, 26 Nov 2026 20:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZkEjsyv0Cfkvd8f7cD7poUzh/Ooh+iJ1ptYcpqpt/Co=;
	b=v+eLEvJguOcqRS5QTc68UKAmP7cgXkWSQvtrJP10gsrR4GIm8jUgJX7n8gS14K6eVigD/G
	vqfhzN4qnO0s8svSIEmi+Wk79WlTZY5IFKIZ46B7FZCftqWyF7fVNZ+0VmQCf5VmD7wOPm
	ChiqXYHcI7lVyp1vJloiBap5Ww0o6W8jIL3e0ZULAIPmk/1rzoQsGDoFr/8I691UKeecFA
	2FHdOKHPnRFP39mbL7g6HA/aEvyDZQteRAMk4WcmTwA3tfsm/fB1P2c2UYRgZr6RiXgtH6
	gisn9AB+cqu6VLCBrqBkFyORX3vua3b1mrY93Ol+VMetMyMG44aJSCanQe4lUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:22 +0100
Subject: [PATCH 03/12] spi: atcspi200: Validate the dummy buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-3-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_111117_132793_19382605 
X-CRM114-Status: UNSURE (   9.40  )
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

The driver clocks the dummy phase with the data buswidth. Reject
operations asking for a different dummy buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-atcspi200.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
index b532c58c0ab9..dd39323eb37a 100644
--- a/drivers/spi/spi-atcspi200.c
+++ b/drivers/spi/spi-atcspi200.c
@@ -396,7 +396,20 @@ static int atcspi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	return ret;
 }
 
+static bool atcspi_mem_supports_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
+{
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
+	if (op->dummy.nbytes && op->dummy.buswidth != op->data.buswidth)
+		return false;
+
+	return true;
+}
+
 static const struct spi_controller_mem_ops atcspi_mem_ops = {
+	.supports_op = atcspi_mem_supports_op,
 	.exec_op = atcspi_exec_mem_op,
 	.adjust_op_size = atcspi_adjust_op_size,
 };

-- 
2.56.0


