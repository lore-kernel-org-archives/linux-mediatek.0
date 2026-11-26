Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2D606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaA81gvx;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KoIYnHrO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TPR+DZlMD4hxbZpkOAhfp+MwyLCmcxCGdbeUjUjw3fY=; b=uaA81gvx8Tv/7d
	Ee8YiujI8CffxtbeJlm+OrKGICoykw7D0JPbBf3KiYTK/KmAaQrrbO62HmNSRiHNDjK4f+0SZr4nY
	xID5wkby1mq/IvZV+cqQWtt7qfdBgD/hOqaotZ5VSoTcbIbTlkd3UWRf/AC2TatyXEVxfrY3+RWtX
	bvK7WNHpxaa76PrvV54pS1C8yyiYLnJxXA/R3ZY0CskVsS+1oy4IBf1Q5073LQkDM9sJRLvqau+2b
	TVXYKvHEi+OD8m0mXT5uyJDwJL1MQktprRFvoJUglZn5P8vaBrWl9qSnV4mdnj9EgK/w2l2hRlbvi
	1HcnlA5ZSvBLTTBxdpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWet5-0000000EFMz-1PeC;
	Thu, 26 Nov 2026 19:12:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesV-0000000EEaw-2UJA
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 19:11:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF9BC4E417B9;
	Thu, 26 Nov 2026 19:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCA660558;
	Thu, 26 Nov 2026 19:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B106511E691C5;
	Thu, 26 Nov 2026 20:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TPR+DZlMD4hxbZpkOAhfp+MwyLCmcxCGdbeUjUjw3fY=;
	b=KoIYnHrOnvQ3lZIX7rVhynwZ5ZuUMK2chDuIAAoYmJtEO32n6kqAivWW1t8acn9r/LOWo7
	wZJtWS1LfhgCb8xI+xsmjnctJUOSYICCUbXlFeYNdWNZ6ZyjJbZTQtBTL2llaI4XDk2D5T
	yZ1T4G7/tODk6LGLBz4sZT21Dggsd8+nYCygtxh0ozufJ0wICXTuMBbsluFbZP2XN69A9T
	bHq0mgIxYGUJW2a86O4aJDGZHff8Fg+SzD2M1iWtjnAWvBSem3YqLaSy/ljiyvq/rUCFzk
	q2L+z+K53Ue0I2fzygGBpj6PunhGVrJEDhYslJpPBtXUcHrNCdaaG72abOOFig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:27 +0100
Subject: [PATCH 08/12] spi: hisi-sfc-v3xx: Validate the dummy buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-8-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_111131_868166_61822DDA 
X-CRM114-Status: UNSURE (   7.95  )
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

The driver selects its bus mode from the command, address and data
widths; the dummy phase is clocked with the address buswidth. Reject
operations asking for a different dummy buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 0790c7179868..5bf0f4f68e4c 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -182,6 +182,9 @@ static bool hisi_sfc_v3xx_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes != host->address_mode && op->addr.nbytes)
 		return false;
 
+	if (op->dummy.nbytes && op->dummy.buswidth != op->addr.buswidth)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 

-- 
2.56.0


