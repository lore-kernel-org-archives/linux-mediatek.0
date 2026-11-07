Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEC606D82C
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YuP34aoK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nwjNFf7h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrfShWIu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=; b=YuP34aoK+97vOX
	MM/0NHcvOo0LRMQKc5BBBI7lzYjbK4NG92BACZhe6DFHwtcSRDO4r4S2S4z7OC+yzIERF4zjy5aIo
	CPF0I/FVOg4FOiHyQRa/3kbeVIQZYpBf39JnOWCz+PZ6AszHi+pQ/k39BpkwO3J+kRdksjXPO9Eis
	mP8L25SLonstalMW6+VU92O+hCqz8tEIB/6dac0Po1EsJgUmRi7uu1HrZTmDk7Jr5b71VEpt4Q/XP
	yvDZbrjQg0aSjuXKiWFBPQQcmNvLR55Ej2aGBiwuP84MGMyc0dzAnXX9ryiwRy0EbUTX8apGu8eEI
	SJcpJh4AMEhXsIm1U58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUP-0000000EUKa-16If;
	Sat, 07 Nov 2026 10:17:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTt-0000000ETYl-028n
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=; b=nwjNFf7hrO7vh/sDxwbT9a/0aM
	dkGBrUNgGNVZVcL14k46jF+Op74fltkBSEcHsF9bpnmn4bkkuDvMn9jawRmOhgtUa0irDAcWf739a
	JTP74PyHmHWTK9y1kX4BtquRdIPmreYVdhlGH+ScE0knI0Yj9LmtnGdjISIyJ8/R4PiggJUF/duBn
	Dv4b+0LDpPswCzRIBGm6fPu/8f/wncYSmMRTbSp31Q7qhd3bfN8ESwzzvo+5GT+Y/RGwpgwvl4ulk
	KJo9yvu7Ow8yEi3D8a4QEfl0/zdohxxU32Pw3vJXOlY99GcZuwsBuONPCM7dbbAfQLDneN6m6j2Uu
	R01F2usQ==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTo-000000057jt-43OR
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:03 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-8446af403b5so877938a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046619; x=1794651419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=zrfShWIu+gH5zGu5JTyA4ymLYmdRYANM69bN2GFekWP1OZZt4FvYqHn+miwHwxFqCD
         yPcmc7yz8s04PIFBMCLYtxIti4irI4izF3mfUCLZkzgKQ/bpSDdFy8x3kXcvhCmZvvtH
         QPdxKX4vPlWM3SPoKYdKl6ON8wePgS3Xy2AFu2eCKsADYhZnzg4aeofQbbRxOQlb5XF8
         tnxmuBv/onrprDIrAOKO4z5ftac98zECpVl4ZN6vtC1XjeQtie+YwMyZKNSe6Hp7UES5
         J/I/HeGKhTx4t880duEJZgdQZtF6yZfSJ12JoTYa3ryKg8Bej03p9N9ikWgsnjXBPBrC
         VV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046619; x=1794651419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPNlTJQB2JtnHksSH6UTNWuXH1VDaK++sm3Uz94AgtA=;
        b=zmw01ZPY7tdlFw6DmVuu5m64RYUAeZW8f+YyfF01eW+CEjOsNA+VBkDfqtLabsYLph
         Uy8VaDeOE2mF+asR7G6uh+TPwaSU6tJTlFXrK9lIuUu/IJJNFNAvERTlW/KpTQchlUrq
         c41k9qpQYCpnYBfy2qL0IsP3rDeNSjKVqTWy+OEFeKHQoFy2mKk213QEsX9XHqcGfASp
         dqQbY+uLD1y962U9/QwTNeYdhx2vpuqp9Y/29HTRTXKYKj/dxUVOQS0XSdGL/KZctj3E
         p49vu2Q+GXNbR6YwpXpU3WYltaC9mfLXSMQWhP07yN7VMj2dE9sGgrYP1w5LYrKstAjp
         sSlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4UofyG44mD+ojs0XwrLh1MATbwibKoHXhE1cShmVUJbB5VjSvAckQc4+7CznnpwunKwjNwKvwvBtcMef4oQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8FNuLVoBo+NiWUnT6q1qPv/4uAn7dspjiKBnUyYXYdBdOPxpXS
	/mPyrtHsl1e5prYTfUmCQWUbTJLlZUC1XqdFs7H/7ZRF+iKNdp1xiITp
X-Gm-Gg: AYBFou1U5nrZLolvTt2h2SOhkr3OuhgpYh1js8lutZzz+yQKRSu/E9UHxt7aW+VrEcw
	Ljy2eIaVR8fd/Y2Y4cOBE0cPMs7NXTgDcKsW2mrbSLdrGHp6XqMfPKXc+lcO1WGp9TSBeknG2VG
	VH1go5iZqx0AQcGOxB+o52uneHFvOo0+4wab/zuPTwULFbdtx4tc0RYb1zPgT3DlNqcpZyd0OG7
	HQ4dTbT0koeuLs/jJRNmCyAtigYL8Strh/UIVhzDIGs8/z2P3fPzXc+Pn0IdN5AS6v+1iloiSvR
	Gc1n1bKNMc69hyeNjP6uRANiryGn1G5jVX+cQStg2T6VxwbAENeV3M4N/8ZcxLo2/T3I2gsqPid
	UPxr90OPk1clXSaMNIRzeVMWK9rSlxwsmeFrIqk9a/koYYUUdO83VkQKGQEomq+wQ7QYFiQKB7g
	UTnz2nCxTZR7Psmlgz0o87RQ4gexqfbPhPyFx/kyHOA2Jgdi5ccTDOm1Ga2A9Gzeys8fgvHRkdu
	aQxBT4FwJkRytgO4wPeSEAyUzyniYfW42iEuPykRK7vpIZH0HgdNC5/fk05Vaq7loRPAN2aitcy
	gqQkIJxqQn/dLVAihidf42KblHxmUZezEWXdKQKnbtF8MKzue/hJtummE2Mv2BaxJCOFTKdRgpx
	VpqOL/rr6gkbffmAhPzwg/gXP0HLDem3ktlu+xEmO8FRielcvqHkcOECT+/1ZnC0o3ZCnxO4vZm
	waNY4TI1lpsQdsnReoxAOP25s7iC3zcPe00RiWgtjpXZjETO8iV8rv
X-Received: by 2002:a05:6830:7182:b0:85e:f82d:4389 with SMTP id 46e09a7af769-85f1d001fdemr4006750a34.14.1794046618968;
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:09 -0700
Subject: [PATCH 12/58] mtd: rawnand: arasan: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-12-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101701_108602_7D2E55EE 
X-CRM114-Status: GOOD (  19.42  )
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

Keep chip metadata, BCH state and controller storage until the last MTD
reference is released. Unregister and disconnect the chips before
releasing chip-select GPIOs, so notifier I/O and active NAND operations
finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 57 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..57b5d6119b70 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1269,6 +1269,11 @@ static const struct nand_controller_ops anfc_ops = {
 	.detach_chip = anfc_detach_chip,
 };
 
+static void anfc_chip_release(struct nand_chip *chip)
+{
+	kfree(to_anand(chip));
+}
+
 static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 {
 	struct anand *anand;
@@ -1276,7 +1281,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1289,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1332,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, anfc_chip_release);
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1373,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1431,17 +1452,24 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	return 0;
 }
 
+static void anfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct arasan_nfc, controller));
+}
+
 static int anfc_probe(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, anfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1509,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0


