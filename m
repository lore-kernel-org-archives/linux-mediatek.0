Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2960A3819
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQOVipRx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WB6forK9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkJoHxck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=; b=IQOVipRxjEvY22
	BKBFBR4Xm45WuswsTjLAfkHQRVIPXj6Iqv7/i4sNpqA4z79AzwzWIcPtjzlmhJ3wckN6Nj5M47Ki4
	7ZfG2Dy6682PVO69E1okBeTKg5MCCJp36SGipzH3HqNnlnDd+sKI168uizboHlvwIu/5WEV4yNaDu
	skJIkU3O/0rkA84XD1rFYPZt9zmpIhBRlLQ9aSetN4Kg20rzdnrVuqfaEmpYFyPEoH0eHI+cDy/8A
	5t6vvUuEy1om+/1mSZRrHkJFtyXoH7NLSGCXNQn6CZy+6vesDkCZe2AGUkUpeexnendSJaIZUjSvJ
	ZtkQugmcY8RR5s27z83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTu-0000000ETbX-0DCk;
	Sat, 07 Nov 2026 10:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTi-0000000ETCz-0NtN
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=; b=WB6forK9s5mqcdMqIQvw7yPgHf
	c0VsuuKrXG2B1HkUYMuCGbIARL/LRmA5S4kM69kSvMHGPOMev44OSTD5JXAiGLs//Fs7Mf3x020pG
	+Ag4pxJqTiNP3AwicPk/kTsSV+tbg2uS08cjcckJz7U0vm/ZhHV+UC2rReorG3LGjHnLCl1VCG3s6
	BiRNM4w/vl6YZonqgDMVQHn3lEDWxi4juYQFhsDBr3HTSjtxajb+8euGj+eS6T42rg8IS47drTZzG
	NwkzFxnf2+CQ7K4YI72BlXBcm9x013zQBAWu5Hwz5jrRCGesCYRZU2es2cLTovosck1gsUeH08Eds
	G/NwfEug==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTd-000000057df-3Zm2
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-85ac281604dso881374a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=OkJoHxck+VMcTAS0xnYrL0kSobzuhN0x1WA5xRhxBAHU+OyCZKud98NbDtRUUIbBmr
         +y9zeXvTg4i1B0lUFRCErba040dKP41m5yOowPP9jk9FHmrKTayrkTlbHyw5SMBdH/Cg
         jQqi2EMOOGIA1IiMjIzFnz6l7aVcTsVX8nKjG/Bo0bLhPMj2U0XQChZHHImmsa166uae
         qnX5DLUQl84zFqp4j7cNCvhimBQzdB29Ih0S2NyP0G4bj8ULOIpD/bxlcPR/G3rFS+xL
         85uMyUKmH0BuT/1gc/LCE9JdzyrxMla51IGFCHupG6hoLt+s35JcMvz6ZpD6m+ppVTY6
         pTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=GgP4on32TZHMFS94gnAPy+VgRiVaCQwwcwrfabPNGOcHP1bQI2CF3uhL5OfhroLw5S
         +VDb1PMWUAkhDpHr8UztZ5QPz7IH0eiwD6Wg4W9f5zrXe+TFq1gy1QPAQh0Emk/MLeit
         a3QBnEEEJw5sHj/4esoe/CYgdh4uWQ41HGVFfXjPG06yQSRZDuRP+3twx6sLitILYyms
         mw9W+lc6i3LKtBofRBO2HzAkrRYZSeG15annD2eve0QB9i0CpI+fHcU7/k8qzjoIYPOi
         QrUEnTEwcjJY9aHh/ul57uGZiTv6YbV+rd8AQShTEEXw9eTJ5XTvjwBUvwof66Iw/a4m
         fhkw==
X-Forwarded-Encrypted: i=1; AKwUvByrfy7QnWHppe9Nu2mE1hhZHXCF2tE/pffEPCuNFW5ZqtymNhEb7csulCklVTyT5Chx82H9ZMNKx8Ti99haGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8B4kxZGQ1YHIG+9F6ySpNjpc/OoX9X2eqgQggNRsjQIIdAmVu7
	cLZdv3YS1KKqwXtPFH3za+qqrErv65bflfpQq5bq9CazsqDYyeu49XVe
X-Gm-Gg: AYBFou0qSXOtKTNts8GG02EOegBPMPz5hILcSoed2AzYUzTSQ1Ztr+5J9tplgwuY2x9
	d229SWA6fLrrc4tFdZ8WAd7kfzU22S7lHHxZc1g7/KIYkpW2vFQo4tj8z1BMNKoaGK51Tt/LWhV
	/LR+kHVugu73bww+aZ+pKs2qemE9co73i+iTKiDSwF6l77sGszDuRG8aRGnaoksc+eJCTdk31Jz
	bn0/5o8/Aa9F0cqmaZund5PkVYO+3wSzDz62APma9pWOVMnXps4nVphBeseqUynQqNI0J+Sc8f+
	/R6chDCGeU/9nSwcwrhTAnYNsazlVb4T7e0Nd7M7mR0ZJt/g94dHNrcNCcNpowg3MQ8+n/Ns5FE
	5pgY90icV2cGSCjI6GSksR8K6VTsXQMnj/qt8cXs9uBvrMsE2VdSKcuC0omx3Y3STEyLsS3FIaj
	iwAQEs9zDNeaSKUNiSWSHnn4qURZW5Ea2IxSRtsoPV0IUrkXORwzWmhRu9OKqeglgUbHCvOEnQ5
	GuqsRrbQIEfiea4NpddjgWKsjGusKUIEB2Zg9yykUEy9SDGnXyYorE4BK7l0jjdH6mcryh/oGmb
	LdmRqGZD8XcEF88L90vdnU23kaZxXgYfTOHaOA+bU+HcU32sEU69PXgItPAOu1mxmZGFpW+VoPd
	ttfUqX+N+IiF5QZopImR5IujO42dfwCBLMv8IIHsaSc4+7eJrQtHessyVedQy6Vb4XVt48Ii6qN
	ydJsMJ7dqHbFUyFi9XsLsPFAUl44JEZYwB/Buzz3u0VmtvDLP4yKGN
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101649_923590_42193883 
X-CRM114-Status: GOOD (  20.62  )
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0


