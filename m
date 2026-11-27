Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE88606A31F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bNzS2iLV;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E+DjkZ/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+CU5gTDGqNI0A7OtXnfaxY+IVWdsopI+NOANirtisZk=; b=bNzS2iLVuBmphu
	16v9JEoEy2kNCQoNFN/P0PHFsVBOT/QOfcwS7a34Lf8d0EktszTN4qXaYwHw+noVPLHmB5Gtv1sM4
	J9qSXhZYZmmxIqYk2hryK2DhEx+/OKvAsHq0S+HxMjOuDc4eMf+DWxKFx/in8y7HE2anwRTu6CPev
	TjAFDq2EtRMVXZFW0XWAH/NFSKula5OCu/tpxKYJx9Fce2L/1XPewX3UQeNVD6VPYeTeMXzgzf8Vy
	m/tgx8+k3q11DpfJbvEvBhhEgYnwvsQZJjm8nb6U97iIWq0A5G3dmfJXs3mLdTWHP5mVs3VWAYIjq
	y0HihhebdVzeAAYPdSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx0C-0000000GYdK-3OpI;
	Fri, 27 Nov 2026 14:32:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx05-0000000GYbw-3cUu
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 14:32:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68DF44E417C9;
	Fri, 27 Nov 2026 14:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 342DF6049C;
	Fri, 27 Nov 2026 14:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2FF11E68FDF;
	Fri, 27 Nov 2026 15:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+CU5gTDGqNI0A7OtXnfaxY+IVWdsopI+NOANirtisZk=;
	b=E+DjkZ/y7ZfCRww8fNEowh4OMsOcCcn80GvTb4Hr+lBZb5E1kT2KHO395PZmz27BScMe8/
	HSntgqrnLZC/e7np/CzUpxIoMu8Sld45fsWnCmrSTpGiQgj9a2cwhvRpJaJ4CqVANWcvAa
	9NvVc2rFixduWXIeDC1rOTR1MMUxbrCVcb7oXIe7hd/bbYmlPiUaADEghABIBTwcYMzxVe
	PtGt3H5PCCY1K46IijtFval2jAqtebcKcUAFaEwYZHjNhkXo7LL37yqyDP/CofIrsfmm4C
	DG84wbaFSgsE9w2q1oqns1CFnkCWXhufwEqyh0DE3DMpCKV4ljb6RIupvSik+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:51 +0100
Subject: [PATCH RFC v2 29/35] spi: stm32-ospi: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-29-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_063235_157972_AFA23AF8 
X-CRM114-Status: GOOD (  12.08  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-stm32-ospi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index fa0e8e83cb1b..bf42f46ce194 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -492,10 +492,9 @@ static int stm32_ospi_send(struct spi_device *spi, const struct spi_mem_op *op)
 	}
 
 	tcr = TCR_SSHIFT;
-	if (op->dummy.buswidth && op->dummy.nbytes) {
-		tcr |= FIELD_PREP(TCR_DCYC_MASK,
-				  op->dummy.nbytes * 8 / op->dummy.buswidth);
-	}
+	if (op->dummy.ncycles)
+		tcr |= FIELD_PREP(TCR_DCYC_MASK, op->dummy.ncycles);
+
 	writel_relaxed(tcr, regs_base + OSPI_TCR);
 
 	if (op->data.nbytes) {
@@ -691,7 +690,7 @@ static int stm32_ospi_transfer_one_message(struct spi_controller *ctrl,
 		 */
 		if (transfer->dummy_data) {
 			op.dummy.buswidth = transfer->tx_nbits;
-			op.dummy.nbytes = transfer->len;
+			op.dummy.ncycles = transfer->len * 8 / transfer->tx_nbits;
 			dummy_bytes = transfer->len;
 
 			/* If happens, means that message is not correctly built */
@@ -784,6 +783,10 @@ static const struct spi_controller_mem_ops stm32_ospi_mem_ops = {
 	.poll_status	= stm32_ospi_poll_status,
 };
 
+static const struct spi_controller_mem_caps stm32_ospi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int stm32_ospi_get_resources(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -933,6 +936,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	ctrl->setup = stm32_ospi_setup;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &stm32_ospi_mem_ops;
+	ctrl->mem_caps = &stm32_ospi_mem_caps;
 	ctrl->use_gpio_descriptors = true;
 	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
 	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;

-- 
2.56.0


