Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF2606E11F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnQq4jBZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YbOkg1eH;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JfwfhOwW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y57dJmsapUsf0K8zIJYUWSjG4lZHxo72aG5YqrWTl8Q=; b=GnQq4jBZI/Niem
	D7b4r7y2tVkKuwwVCs9b8MN7GVQEsOlfQv1TaBbWYdbGJEdeBGgBLAAF10MSQ1sIwN/CRvBLruwJU
	PwmlAB0WVN2SHEQha5tSijBynIfsc3VIloq6ugIkaUxqoJ85SaVlkHcxedT+m7KPUdEX831nvabV9
	+kzOTa2bfrg4l8PB/6ZmnebAN1O516ENbEXP8MVlroPtQazLL7K7+Wq4EA5xoVc/trYSErYDIXmeZ
	lliy/yQG0J5GunYcvedtyw4+pOfhOFxqF+a5XkDsSAgzIFUnWfKYNRBxQY9RzH495ourEpCcCW7PR
	l1jGCrsLXSXeFZo6m6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtU-0000000GQB0-2Ro6;
	Fri, 27 Nov 2026 14:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsN-0000000GOCM-18Hy;
	Fri, 27 Nov 2026 14:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=y57dJmsapUsf0K8zIJYUWSjG4lZHxo72aG5YqrWTl8Q=; b=YbOkg1eHPs//y+TLb9tR2JWZ1M
	ZATmq3fB4dNVoAdMxJV9/bXTccX1G44uQrVdTwd3SM6oHRDa4qJv6iQAONojNMiSBfHi+HPc8s8mR
	NUAS3mqBCu4zQGDo2MJYtB2nQHhsT0IEiPBKvLWLFUMNK0jPidYyLQ1kPxZLB0hKtRZulqWH8IuaX
	C4cIDrJYrJRSFNp1I7tSsCH09CQX/LibvUsqZkHtG5J4/7eFyFUW4KN0K+KQQ8BVIe3z9vso4NNgk
	JiQuV91WCIBoAJmn6+2HEs95AW1HoqNnaPnal4+0vswOpChCkgGStEKkxmSlTAG8k8GTBZiiAwcqG
	CFo/XOtg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsJ-00000007mb4-0JOf;
	Fri, 27 Nov 2026 14:24:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CA331A0440;
	Fri, 27 Nov 2026 14:24:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F38AB6049C;
	Fri, 27 Nov 2026 14:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D86911E68FF9;
	Fri, 27 Nov 2026 15:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y57dJmsapUsf0K8zIJYUWSjG4lZHxo72aG5YqrWTl8Q=;
	b=JfwfhOwWdfse5PNcdH/We4rNKJosXgz5tUZtt/kIO5++eOp2GdasD+vaEYBsDHI+O6NHcU
	LbPlWvLnHag9BymLka7+ZOy27yswPFsmLqAms9mOw/Gs6ReC5vEd6icRtVdE/3ZZJ+FSGv
	iQvCy/4VcmtJUI42j7H+J7F1PxAcsbLut/gYalCTEX7gooxZrtvLPKFWa1+LjjFXNkiG8u
	sbOaf6qOaM2sQ89KdbvxqXAPswiEss1+nlSvrPsh+cyckKJwdigRHjNrM78qPjcyBIee5E
	r4qhoGU7+McO8Lbb9rzOSFa+laqInnQ6/iu2uVq0v8PCTd9OXH0XhcAlL5jEww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:30 +0100
Subject: [PATCH RFC v2 08/35] spi: amlogic-spifc-a1: Reject excessive dummy
 cycle counts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-8-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_142431_052460_09F8547C 
X-CRM114-Status: GOOD (  11.31  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The controller stores the number of dummy cycles in a 6-bit field.
Prevent field corruption by adding a proper ->supports_op() callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index d99c72c7a965..bbe1b6b52b85 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -314,7 +314,17 @@ static void amlogic_spifc_a1_hw_init(struct amlogic_spifc_a1 *spifc)
 	writel(0, spifc->base + SPIFC_A1_USER_DBUF_ADDR_REG);
 }
 
+static bool amlogic_spifc_a1_supports_op(struct spi_mem *mem,
+					 const struct spi_mem_op *op)
+{
+	if (op->dummy.ncycles > FIELD_MAX(SPIFC_A1_USER_DUMMY_CLK_CYCLES))
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
 static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
+	.supports_op = amlogic_spifc_a1_supports_op,
 	.exec_op = amlogic_spifc_a1_exec_op,
 	.adjust_op_size = amlogic_spifc_a1_adjust_op_size,
 };

-- 
2.56.0


