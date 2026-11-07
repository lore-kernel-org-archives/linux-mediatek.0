Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F04606D815
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRaETs6p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=; b=oRaETs6pqveDQK
	fPtvhiL2lCkKfFjHEIzG0EjryMfx/5eqZXkioNNPZNQwL86ij8ZvIAOxaKfxFMuQFI7Q7GFnm8vxL
	EeLt2NlEmzcLL7p+CDduWjE8Ej38klkaIS9nNqO5O8pDHeOKgJP55c6PyVe0LTF4LYOo77LXUWe4V
	aMQ+FOj8KKLyRtWBJAtfsTcDRTMNOFpRq41juE7m67OdXz5chh66g3/lreZPBkgKtCCI7o+HwvamL
	gWKrYkxoztbtkxx2v/lijvwGyPHIkGKEXi+J540wxn0R4PxDszxGh6qwX7IZxvcy4B074DwexLuIv
	hYX5SQ+7a30IfsEfwBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmjz-0000000FGbt-16tB;
	Sat, 07 Nov 2026 20:10:19 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmju-0000000FGYO-1oST
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:10:18 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed0b68895so5547fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082213; x=1794687013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=Kh58js7zeLktHFjYbS+tRqpqzZvz0UqvK9vE7g4GLyJvMHCWY8JwOifNsWlvkYyXsE
         aYw14CpnOj2Rw5FAlP1vmLJLaTqunrKoZkianqvgKZo2lMxqs32wMhL8XqhwpetHuniy
         /QAGO35+6xBj3Jy+tx0D6MRmGFu7WdYNfEO9D3JHbq4CbRcMeFVNpHESDF5geXKdDihq
         tumcK0yoP39zgkC1X0vGMOjyqUtE2NDNiB2P0GEM9YohqmRHCs5QHvOgcYxA1Ggjvgul
         enl/eGc2UpEed+YMLebBvk/Tg2JJdfUkksIbZYfkePTJSv3fND9dfFefY6+TucmEDJgV
         ifDw==
X-Forwarded-Encrypted: i=1; AL+hErEzIOWZbeqX9lb3ZWci2gHYnSG3913ttCBYkh4zz8HOB8sl3cdzqIod96ZbX1ZXsOaiuUqWkPAX5iWEzpyB1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8K5YiGH4E1gThQ++3jjMIWXfUCGzcNpsT9VWG9zGtU2frbzC9E
	ld2KGQ1iav+3UfJW3Cn9+zYm+z9VL5UieT1Ld+8ghrn05MBWloBDtwc3RQWeocHRf+s=
X-Gm-Gg: AYBFou1fwopv5zdQMP+BcIVCPJRh6ClV/eVDDIZ0zkaP8PvTLDKxbBsFkLCxvLMQ3Me
	XsaS4XN73piGReY68J4aYMRgC0t+xvo3edzlWAGVojGG3JK7hzXhIx6zvpcxf35aE9Ohd3prGbe
	b8yMj0AbchiG1mIOkUzfBeVS1ehduxkrnwuLRR4/um8cVDdhpyzwkA1e51FUT09vevXKFP3QQ12
	y6EbFOsw6IgbhPSRVe3+8E5t+aBhCsj646Xk6FaA7bfdmE2fJEJV7CkKvnGtrmKcoheFbym9dC/
	c2qO+Ge54VljMXbWySIZUB+IgV4trv+lxRjZJ3b2gZjRHZpMkqrYnWh38T087wrS7qkvOKbb8/h
	BduM01GQZVGSVeHmLygC8iQ1C7VQqHVkIZdypo4EibUU6WAi/kRouHS1CwmDVuiRL7oYIoAUSBf
	X9EaWVstxdyRSNK30f4Ms+0j+mGtfmMEOkETXJ6wQyRmZ9PDXRhoYc9Vp2lQWT57dpM8KwwzXop
	Y4G+u4TL4zl2FhmS5xqponwt5UNQeY6P9H4ZQqgvxpVUnqaixuL/82wftGykrPcGmemmPljAHOS
	ED3jq5Uk4QdXa6OALynoN8Dp1BplOgcgglXwvu5y702kINth/D0ponPE5pg=
X-Received: by 2002:a05:6870:4507:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4ad98b59767mr3847741fac.24.1794082213294;
        Sat, 07 Nov 2026 12:10:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:39 +0000
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-4311be01fa4f@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_121014_498138_318968A1 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


