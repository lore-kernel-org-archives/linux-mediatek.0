Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79689606EE85
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ytWwGhSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=; b=ytWwGhSerClCLp
	+FHKwZn8Q6CDRPOHctX+Z9gTZBDcVpxh51O/9AEZOfY/0GRJ8psd6M6o3RQZIgaBlhfT/K231sseg
	HKynluWj6aGrpKz8H/yE4frBqbis2KDudgoCaqtZhuj+bdEtYPcFN0NPQhF7dVfltUYscbyO1OhMW
	xKyrWeQSa9mblOJWJ7lhZ9N/B8PxxdZQUEQ1CdLnerQ4Sbp56QrvEF6WCX6cc4dxhV1UiZijlz48K
	optsVGPehUNfuACdi3H6jRfXMWl2WcgTjJ7VmPjlLiyjknJKYd8Pfeli1XHLFmgsrwCnk4CWlgKse
	mUOmKsqL+U4ZNDBCPxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmo2-0000000FJoA-0Eka;
	Sat, 07 Nov 2026 20:14:30 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnb-0000000FJ4A-43IV
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:06 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43bf9548df4so20521fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082443; x=1794687243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Q5e5yIGTXK7xHQdIJMFEChTgYJAM4yLdAHkjKqEUeE=;
        b=y0M+z3dGcl4bxyXiQQtJ8mrZkvd8kzRYd6HUX9HP++6XwEDaBnvBiNz9YLSLTH3CEa
         b7byU9Af3A/mcVkWI8ob9zTDWpoD5plWzHa97ejT5M8EBDH/X1lrwbX1rV1MoLOsZl9S
         iNjv9RWr518i/u/UTky9SSN9mfMXlnByq7bHjcAk4IuDhCnC6Cse8UYM4AJ1jeoR3a28
         84x2PgvrzAM4SLrsftCC4RsNyxYyIoPKMCVCyRL/JQo0Gr0CxkEnfM5y7Abdx3bDcA/a
         sIcDX/hRrFwFYoGR2nc6MhgRn8XS3yi85vY3PHUBMn8zUe7wsvlEU+ki7s6KJUo6C9pg
         7nGQ==
X-Forwarded-Encrypted: i=1; AL+hErFeenWo6M/xXSU1+V/rkEQPP4+Gt68jQI1v9IXDeRTW2vzDK+K8JGkNhMPPjKWNFPbNCUAMPigaYOef+5laew==@lists.infradead.org
X-Gm-Message-State: APuU4Z8qwqUg0JFlwTO0oAm8JhY6JX/IgdhLiOEI8HbtlRVfhnZ6ldWC
	KLsCBiysk0WXaZyX4UItuLrPsqle/llEhD2QBBzBWFlfCECjgz4pvHTEV26MEpCkV08=
X-Gm-Gg: AYBFou1FrDi9WMWaj8udtsPBTclL85LdU/leHrjmENQ8WDhW0SqghzKvurnq2sStfn5
	G8g08g/7HBwIn5+Onj4RK9ZT+KWmMWy0KpKVhm9ABVeDFvwyr0nBn5qtqHOW8Crx2eeSlotgKOU
	T/ILvbcEUGCmikKoCtevMIOF36ZtKBDAgs/ZYQBS9eqbVcZGGBlcI/xoGxemUbywatWHi6qzdN+
	3jf/t1rG9mqZVf3HwUhVijAMO7pP687jczpz5bGpJ22km/0dRvxBkWcsQhnhHcULJP2bSYrndYn
	pqD4Ja1xS3DOJHFjerWV3VvDT8EamOYstCl+Vwv64E2gg0D5J4nF+/9boo/4agb09IU7F633b/Y
	fHLzk1efZgx/wynmk2TISzgjoCgb4lCFgCSf49RcctmV3X9rJlsLAqYodbHNJ2bnsSgiHl4q3Lb
	l6kfgfJ7BWRI/VD58rjHppg5P+GbFdI89TpOJI5CHSMZMiTQn0Vs8CkXVRuYE+qu+fqjkfpg2MT
	y4MwXOowcYhC9SE31BKB77MNY0gqoVqZ/sjKY0DsHUlZYWcXe+O61ebTU6xh4ynyKmpGrmoH6Ec
	cge75FBrDAYxGuQaTTqkhIpbwnPJ8yzFG68ljQxe+3ZMX2VMMWzi418YsMbJ
X-Received: by 2002:a05:6871:3a10:b0:459:fe2:ef54 with SMTP id 586e51a60fabf-4ad984fa6famr4620570fac.1.1794082442478;
        Sat, 07 Nov 2026 12:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:48 -0700
Subject: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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
X-CRM114-CacheID: sfid-20261107_121404_171234_4054228C 
X-CRM114-Status: GOOD (  15.26  )
X-Spam-Score: 1.7 (+)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0


