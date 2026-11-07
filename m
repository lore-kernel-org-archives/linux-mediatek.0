Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D66082BF8
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qX5HdeHK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iAQUBlVm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRa9PRG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=; b=qX5HdeHK2WDxld
	gbD4Q6pNVubGfqA9lvWX6FI+TUUHnCKIjIGCpmQ7Cho/XVMq/jU5cAH57jG32n3zjpUa12NNk1vWR
	HmBnhirZVZk8l5Hma6we4XZYx/pVDVmZus3ouC3hggu6U4YUPeTxrMvPNdspknpyioD+8GR9loVDK
	EIT+lad3ANlNGwG1ZHcC66Tbu2tifMsI0QGlvIOaKORTidXCdaHb0G+7YfIFKMljIrzkyXqZHgPZQ
	mxK5UPZTJjwjdaice7rOPmge37w430k0d+b5QHAYxtb16Nod5p7nx7gRj8U9KQ4oykJ1fDTCE426G
	zQyQ5fDgmrey0o9I6SGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdV5-0000000EUzK-2NqQ;
	Sat, 07 Nov 2026 10:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUE-0000000EU2X-3C01
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=; b=iAQUBlVm7GjBE6wukHNjowH8LV
	POf0SMLy8ydMI6hRdWZu8u786iCfxJDz3uI0Yh3+l7rGh3M4FrdolUw6eGEvh1cQh7e11+p25sOhW
	so0DSjDZmTMi5Tao3yGje4XaBV4DX1sMQuG5rsZw77VV+/fJ3Kg9BGZ9n2Qx1YvBTsRKB2VFqQNit
	pnyo7KJVI/ViEdNDcEeLbyE5D/fukpivPfDY5fOes+FnX4gPK3+ini+XSjxajsNcmTf4zLKZ//mZc
	qwXjGcQQ2o00pIKQsyyoj/2iQjC5OwP2QX0rPpnbdcOEUDQcfH5JYJw1jpB2OyPZeA4fbTGuCNH1M
	ec3vlbMg==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUB-000000057xY-2dbx
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:25 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-833e671ee9fso1573739a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=RRa9PRG27WU59oh7LfcNJATeay2+r5TuQXVOqLAlh9oGgecQ6DqFJGQ8myeF042hh7
         ssWhKPXRnp04hocqlAKGaOdkKWBXVBSMqHzV8tT0Tdu7hkDNipmY4ocRdn7PvDYs16cm
         uZyfmu0bMTe4BTyWM9ncqhZkeT9yXMkAMGTcvmAuOVFhnVWojG9J9XIHGlW0Gqw/pgXx
         ur8mXK1s3vjbGN/xB9CGDZqqpvXjVDRBXdQyC/4PS3Dh1K9yyojBnMq8KqX0gVsKo0BQ
         aWU7zsQFYqZiZGWOLzn8louu+B9RpDfu47aRcFYtzA4a17wAbp2y5I1CwYuxMO4nVYy5
         uZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=Gc1hmuSPDisqjvFyV4jnTfIGk2yAWJTjIu66p+NvdpBTRFGG2LzNr2CZP6qkWXClNs
         eUAWF9Zu1zme/rX/3x4rJplS+zVZ8XcLAYOQlEMipBU7rKEXUBbhM/ed8RWfT84Ysjqd
         lgr8GnTzM8cak1E4P9T1lfq2+SK67xlL3RfJB6eNhJFut2VRGMVmhWKbWVgNLM/JRI3H
         4ddea48gOFNnM6BG/mU4wl5iVT3KiUP09RsPs5hrRBH/fXE7tu16IlVoQwc5rH9Kzsvy
         qCqnPE5esWIyuG7x56RYvib/DS4bvgttDHhO/qRBxOQiUA7w03fzL1axJA7OFE7cYtOz
         K1bQ==
X-Forwarded-Encrypted: i=1; AKwUvByTOnPfI+HW2FTmishXabZdokKHOTK5+1roS3TMzhrBTB0hro6FtVtR13jZCT7MxJhlIi/yZdrDvpsC/zOe0g==@lists.infradead.org
X-Gm-Message-State: APuU4Z++0v7hwZaAWH/GKgyU60G6N0D7Cv5XDBfbnlNGZunp4EtpSySb
	weXeEUhM9lQlSQKyXYKoVk6CB6D9e+5kunYr6q/63PCJslH+D9GEnu0F
X-Gm-Gg: AYBFou0TVcN71bMnbGatKPRYD2N5t9dBlc/qK+3WKLemI6hFFcC5wFhm06D1RnFgR5p
	RKPOwhinny8kcWIpnHzG8S7aS/hLoFUwgCIieh9JUjVAU5uZ5UwiEBCkn25/4bMGwRd0ka6/Sxk
	YL5gu1Vx/Bm5cwaOMvtXKQVX9ZsYgRZNJH8NF5xjtdleoV2CsQJ1a5FaFDQD/ovhrh21EglEraJ
	JOXoJ8B1fwovLnUcRHGVhUt1cImqjSotXK+2P0fYEmZq5ARBb/N33U0JlR8AmZ4l7M9DwGFHMvy
	RfJyt6wlrnnmu8p0BeKZAAhd471uf6fL+/PLqAj1dcpqz7WVJ6dLdV2ToiYDfocEwCbhYQhMZ4k
	aXzowd5htMqUvfxppwY4PPKpQ3iP8+nWlzcQmpEUfJcZNyyE5293YATTrpnGj0nEvoDp/i++yok
	pgVaE8jgWOjMMyooJ38dWj/Fsw+jdGcWYJoJHcVEQJWWRC3Pg+Yr9I+mfenTk00jCWoQ3oWRzgb
	0g399aydUyBpE+g42pjphGrBEGehbH63jNY/gStvqf591s0CgJ7SZSX3PyVzGs6IhysgStDEVY2
	0oy4YFMQX2fCJGFn1gzPj2bFpCXtJ3+h0e91tckVdDcsROWG++8I/UGoLchRkSCulUbXVlTTEsq
	eB7EEgM2yrcdMDWb37uDTwLSuXPcIVoNlwsNd6eoaQXY5cj6VLRgDSArqnTZGglVactR/IPl3Bl
	RMjqV+LbHObDt/lcwLZHNtn80pELhAVMxffIWHVTYL4bzhs0FBsikqwZTf1rCeDEoE5yZeM4iF3
	A==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_101723_586041_788599B9 
X-CRM114-Status: GOOD (  18.56  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


