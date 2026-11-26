Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BE606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4z1mCUhC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Qx+lZqZH;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PuLVR2do
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lbbDUAZ42bjaI/Zz1oo3546qmyA1evX9LxfwdDvdb8c=; b=4z1mCUhCuySbIy
	FWpMKwFDJwlaErT1QOdmHDTeuTN/5VKIKJOqyFNzzonv6mXXDmODZ+21A7aSb4H8JIShBMoWL2ZzC
	gfxswDBoRhu0a0wQDCBiLx9lvbFwPR/t/ZbXZdO/yqzBdcD1F4msberB14j10iMcEyCAeVULUoO7y
	RQ3I32Xu4MSbY5cU3D0LXIu6nlNu597ThZkZsOlkUAhqEWA6C1L1h3N8lPIG0YONWBl2hCaCNbpie
	XRvCjpTlBk6CDtlPkTR4b/otDEBjKNSKHPeIp2f+mp0rODrYyALm3vleOzlKsLInb0x0zFn3N9Rej
	7NIEWYgTlzNV7sveaGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWetY-0000000EG2v-3hCM;
	Thu, 26 Nov 2026 19:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesp-0000000EF0h-1mqo
	for linux-mediatek@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lbbDUAZ42bjaI/Zz1oo3546qmyA1evX9LxfwdDvdb8c=; b=Qx+lZqZHUK0ZpIitWs0nhaDHmO
	5InCpGLv29W2DGyt3gcLh0GmzE2kIGwpy4rm/RsECbut+Mz9WqcpXk9GQ2/E/Wu2xw0qKAxfSCXyj
	dM+TGGK7G10U+gXoLAIsK2hmSL6Qjl6Xld7+0/QbSYtFIvmaBNw6fVPFhImbBrOETPsDU3VXe5rHP
	ii//qRrWRtP/b4RjrRm4yF7MvLXb+eHahJahEXo24uBQsq47Yxwr38WkO9HEVaO47UzAqmRqpNkb6
	GvnpgoB2zn/mHCi8EWyJAaN1m0E5KAEjfa9wvkql55QE27zroojaMajLMYLsUvNcOCg9p5yJqHVFs
	6A8gC2kg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesm-00000006yiu-0Wro
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 19:11:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E29ABC2B9E2;
	Thu, 26 Nov 2026 19:11:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7B660558;
	Thu, 26 Nov 2026 19:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4FE511E691C1;
	Thu, 26 Nov 2026 20:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lbbDUAZ42bjaI/Zz1oo3546qmyA1evX9LxfwdDvdb8c=;
	b=PuLVR2dojQC8Tq1JLBpLi7shyMSTTwy7V22OSKh2rrJy8a6p8JGau53CW5xapcL+Y45SLa
	bzRk6nIFSaYnHtXUUpfbozomnKODW7SnDWsLM+EIZVpILyRxUn6gDy5a0aKj2VRJ4BtxTu
	mPa/nee7hIJN5vJ3XMSXxcm5rlCaMGwwjpN9ts2qavWOL7e5w2LmBGGFyLZGNIizCqYFss
	HuC9Mo9CGOsispB0hM+a9f4uNrNP7WCh1PwAVhGMNHvQe1iHfR7Rizp/tkr2Fo9uZecyel
	jdvbfltEv45ZDYtxKWKeBg0oQMVu/s6BSo3qEwBB3GACic8Ok0iHIy8gqU9Rjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:30 +0100
Subject: [PATCH 11/12] spi: ti-qspi: Validate the dummy buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-11-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_191148_001593_7CA86A2B 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

The driver has no separate dummy buswidth; the dummy phase is clocked
with the data buswidth. Reject operations asking for a different dummy
buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ti-qspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 091a8b8842f5..5aa6176a3123 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -651,7 +651,20 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
 	return ret;
 }
 
+static bool ti_qspi_supports_op(struct spi_mem *mem,
+				const struct spi_mem_op *op)
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
 static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
+	.supports_op = ti_qspi_supports_op,
 	.exec_op = ti_qspi_exec_mem_op,
 	.adjust_op_size = ti_qspi_adjust_op_size,
 };

-- 
2.56.0


