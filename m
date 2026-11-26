Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD6606A32E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMrlzRhW;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Rcje2CF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u/go77fGa6BBlrSXB/4W1ywT2MY9Zfsd5kv0omZx16A=; b=oMrlzRhWRb9RSY
	mnhojROj3u39AdROt025shfrhlWcoiGFieihK5xYPnAnd+0RpVM8BqzAwjgheHEZ7neLcjx36WLRO
	FZVDDHTsSCBG7HaVwbQtcln0fB5Y/daZe+JMjDFUjShyyyQXokkGHEo1GSNuPVh91ZZFBCLXX1D3H
	eGCSIvpFMm6IU41j7b8o49AttLdiskmNpLMvkMoegEfNq0f3z75kIZ+0816V3N4zZtIiONXS62jAa
	GFi/jHj4OjiUTdZJXRf9keMdl44ntiTyDRkPywjCs+wBedUyMnVbE02DrZ3tiw1WYmpxjguRDQMA8
	HkR6/cRrjGFUFoAf8Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesE-0000000EEJi-0yao;
	Thu, 26 Nov 2026 19:11:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWes4-0000000EEEA-0siw
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 19:11:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 906F64E417B3
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 19:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B33D60558;
	Thu, 26 Nov 2026 19:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD73111E691BE;
	Thu, 26 Nov 2026 20:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u/go77fGa6BBlrSXB/4W1ywT2MY9Zfsd5kv0omZx16A=;
	b=Rcje2CF+Rc768pJDqRn1xd37LOi2ZIWrxvd33CG/i9GDTQ0Z/EJe+AolhDRapjXHvUkKU4
	PSHE1y7kkqv/OUQU/TIc4jMD2rQuT2wjnvS2u/sgriHXlls4JIwSW3Ni3kXsnhZ5bWctyb
	nVdjMtMlYHzTl6mJsuxFo+Y2XheJr/bn3+JDUH4frs4MhtQ0PVyyWNH3QUyOEkumCYUHLT
	J0yKXlJrC/JniAPkCb1q4N3041OYRixmtCFzrNTdlRI6B4dgEFz9twZ3CTLF0vycvS49RY
	IJ6ZdCUiipuYtudozCl6ZJP9t+Top9GY6XCEdTgXKkVPyGe5Gd08u85xMdREUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:20 +0100
Subject: [PATCH 01/12] spi: amd: Validate the dummy buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-1-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_111104_397386_ADD920D5 
X-CRM114-Status: UNSURE (   8.87  )
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
 drivers/spi/spi-amd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index d3953de255be..0c56d5b2a6db 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -459,6 +459,9 @@ static bool amd_spi_supports_op(struct spi_mem *mem,
 	if (op->cmd.buswidth > 1 || op->addr.buswidth > 4)
 		return false;
 
+	if (op->dummy.nbytes && op->dummy.buswidth != op->data.buswidth)
+		return false;
+
 	/* AMD SPI controllers support quad mode only for read operations */
 	if (amd_is_spi_read_cmd(op->cmd.opcode) || amd_is_spi_write_cmd(op->cmd.opcode)) {
 		if (op->data.buswidth > 4)

-- 
2.56.0


