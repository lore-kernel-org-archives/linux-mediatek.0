Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8007606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rPvSdN8B;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oj4WkvGj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fejE54wjl8pNmBwZZ3oMj7oENLwjgt5QRFDy7wYzURY=; b=rPvSdN8BYoICY2/PxoOJy0Xwnx
	S1HAVZ0KQMWNvIw89sq2gHPQbbRNkawLF+TPH+GwnWOJHimT6kskV3cxl0BzC59jvRCo1qYxHr7Sb
	49t8a0gkcDhY6gG9p9QGSXf6VPU72k0zSln+RMOxUapNUDOB8/h0atj1FUXRkOIDySMEb+zvd8SYd
	p/yrKRmYgCeBFpmtjMhg6WtAUGoZHMZWGh+bkKKdT5TPRW1K2XHuvcIYg5uGqKSHZgIhDKuV1jpun
	epo0a3L3ip2Yb1haSWY0f//pyC2i1aW2h7gVIwQt6pInTqxqdCmtugWWSDJmiwjOAWiPb82XPpYpe
	u1v3Zt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWes0-0000000EEE7-1sYW;
	Thu, 26 Nov 2026 19:11:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWerx-0000000EEDK-2yMG;
	Thu, 26 Nov 2026 19:10:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 523021A181E;
	Thu, 26 Nov 2026 19:10:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24F0360558;
	Thu, 26 Nov 2026 19:10:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC92C11E691C1;
	Thu, 26 Nov 2026 20:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fejE54wjl8pNmBwZZ3oMj7oENLwjgt5QRFDy7wYzURY=;
	b=oj4WkvGjpbEtCXPXvNYdoiZmxVhE6DjkCqZq0eOfEiUFId5EcyjXmi4+P6Koqyi5JkVTKe
	M7A+g43HhTLnx2u5ekqs+lz94vuYcuMxDNgxPmy5+iJcNdkM/uBGv1ugIK4TgXOR8r6Nf3
	kXb0wpd2BGkBxjUnK0aMg0qZ8dQIrlsWhKIFkcOT5HpHHp3wRXW1u3fMqO5cQc5Bj6+CpA
	rR1z5AOoNbbiNUiJTHsqRfSfqir6IXN9J9KvjrXzbAJ2bDqlIC1SlbnQ6BfNU7GKqAE8Uq
	QehLkdjxDtvfc486eBghnDQ5cah8AN3WtAhVwur1im9H/KCTC9hloLnpMF1xDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/12] spi: Misc fixes around the dummy buswidth handling
Date: Thu, 26 Nov 2026 20:10:19 +0100
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DMAwEvxL5XFclVED5SsUhBEN9SEJtQEiIv
 zcqx5mVZg9QEiaF1hwgtLFyihmKmwH/cXEi5CEz2IetisJWGJyXFHnHddZFyAWOE+rMOAhvJDj
 yTor9qxybsa8bV5eQW7PQf8ipd3ex0HfNd8sloXdK6FMIvLRmq+9PFF9Cd54/hr90GKMAAAA=
X-Change-ID: 20261126-macronix-upstreaming-spi-driver-fixes-b93f8fb78a73
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
X-CRM114-CacheID: sfid-20261126_111057_886508_100B5304 
X-CRM114-Status: UNSURE (   9.62  )
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

While working on the dummy.nbytes -> dummy.ncycles conversion and
especially the conversion of the spi controller drivers, I realized
there were many misuses of the buswidth (plus some misc enhancements).

This series is sometimes limiting the dummy buswidth to be the same as
the data buswidth, which means I am now flagging controllers (or at
least drivers) which I believe do not support 1-1-2, 1-1-4 or 1-1-8
transfers. This is required to avoid issues on the number of dummy
cycles on controllers handling the dummy phase as an amount of data
("bytes"). For the controllers managing cycles we now have a much
cleaner alternative, which will be implemented in a following series.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (12):
      spi: amd: Validate the dummy buswidth
      spi: amlogic-spifc-a1: Fix a typo in a macro
      spi: atcspi200: Validate the dummy buswidth
      spi: ath79: Validate the dummy buswidth
      spi: atmel-quadspi: Drop redundant address buswidth check
      spi: atmel-quadspi: Reject SDR address with DDR data
      spi: atmel-quadspi: Advertise DTR for the octal controller
      spi: hisi-sfc-v3xx: Validate the dummy buswidth
      spi: mtk-nor: Validate the dummy buswidth
      spi: sg2044-nor: Validate the dummy buswidth
      spi: ti-qspi: Validate the dummy buswidth
      spi: zynq-qspi: Validate the dummy buswidth

 drivers/spi/atmel-quadspi.c        |  6 +++++-
 drivers/spi/spi-amd.c              |  3 +++
 drivers/spi/spi-amlogic-spifc-a1.c |  6 +++---
 drivers/spi/spi-atcspi200.c        | 13 +++++++++++++
 drivers/spi/spi-ath79.c            |  3 ++-
 drivers/spi/spi-hisi-sfc-v3xx.c    |  3 +++
 drivers/spi/spi-mtk-nor.c          |  3 +++
 drivers/spi/spi-sg2044-nor.c       | 13 +++++++++++++
 drivers/spi/spi-ti-qspi.c          | 13 +++++++++++++
 drivers/spi/spi-zynq-qspi.c        |  4 ++++
 10 files changed, 62 insertions(+), 5 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261126-macronix-upstreaming-spi-driver-fixes-b93f8fb78a73

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


