Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E67606A330
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYWbbto9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPmxjEsd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=; b=CYWbbto93TRPRJ
	U3ULjVw4l7FyDe9aSADHJll/amOcZrhYBS5QKchL5VrJa34hz0ceVxHZgPcP+anzfHeweim+25OJS
	CnIZgnH/PtAJ+uNXRd/9ZotQwkSs7zGW5hHXZ9U2vGy4GmYOYHSDkk5aft+b35pka1qlqnjCQbxvH
	H0SFMQZpyEohTrEGT8hm6k/DbSJx+WrObgyp0OsISfzr/JA/gNd5uRIdXjYv6BWeSduNzfzviUzpY
	yfG0F6UIg85bWe0/nf/TpY0k+IMVe9dPDJMamd8MX/C46t+z30itCk4unVZduMpYQvrSx2LbcVbaN
	GHt75wHfLKz8Qk489vUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlzy-0000000FDhE-2RoV;
	Sat, 07 Nov 2026 19:22:46 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlzr-0000000FDcT-11Vu
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 19:22:44 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-490d838b425so858500fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=RPmxjEsd3Kiw3SZxz6IDd4zQt5MLAmoyGOhAY2gFTRbn+96hXV21Bpa/w4CD7FnDWi
         rn00qlRsuC9imVVtrtEkMiXR6b6CUK0QS0Mv2US4Uet09OCdxh1vHG6mEeupnlTZEWvZ
         /WSsrIF/arG994O/A6vp5v6kMbwjUsqpVfndDS6v4mTqPGU/r1rloPcfT3kJGIrdfPbX
         gV/9EHJ6rKjC1Sh2TBzSDBZc/vDfAng973m4vMEniOSOD9CAVXbrudvZlPv8ruN++G0Q
         cbBBAh42jWWxUn8mDfuU8tWZYNoO3ytMCapykv7Loqd4W1lfVQidwFq+VLoODd7zhIlm
         9sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=kT7Kq3BOdZ4Lb5EMDwphSuh0rzvadC7nWWo0P9/Al8MX5Ehk88jdf3LH9Fr1Y8tawy
         x7/H4g5NuE/+RJVj/mUF0BV7sDRfcIoa+u6sAIdhi7FX6M7OeqMQaYf93SeURRrZ1t1Y
         RJlQQjAjJi5EjJo7mGsM6ouI3obbDZNxFdhPEJvwcP5Lj18vBvDMY46MYra824kIhAFX
         lyEtG1ah+mH/nW3sLoRmkqwBm9gVjaZuBfYpYJoScU8trTo0j6Zq86V7bs5Hzkrk8Ruc
         xua5U+H2Cj7aA1LFnQgYs/SKT3FYM09c8mhi4LxP1eTdsKum2Sk9cYY/JXZGG60MCjaM
         uDDw==
X-Forwarded-Encrypted: i=1; AKwUvBysRR7V7WSsSZ7EnWJbmnIIgbU4Av3AuVtYL4fcPbTvdEgq3kYJzH0ZidaCreYj9i332k56hmh9X4Oh4rImlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+eT+grrzyhWTjSwNFrFhGFdUDMTPVUod3pcQfKGZWvj7hCbDjK
	p4VxVNRBeFxwqUo6m8imrcSpV/DUDCyTrXzAbMZZYlJQhHVtVNNvTfKF
X-Gm-Gg: AYBFou1Q2jf/dVPRTmpOMnUEDZVvh2ljYLGVunAx4WY3BOd0IqnkaEMkhUJDZHtrlHZ
	TlgyAnxf7oF7Zf4BzLntmkHdDdabrx2xRWYU2KKdqBPGwoZ0DCzEIuDOGg3P1eMnWcurtPymYsb
	dtybGkbbYNzOGZGaYvLHvLd9+r8XjElrrNOuOZHjMlGcSPjefJeRq1RfzrOfxe9Wkmj5wfSQisa
	zEha1NtpdMGbpX9112W9PnYGpvZAG6wQCc33UUaFeeHLKPa5ZNXnVymorg3IZ0kGTLjxmJKR5T9
	ka6bEiDP9QEzI845sMhB4tXHUCbQmcerN7lyo8NTMSPaN80KK110WCOpFcds/OfEjuk3XEyMuP8
	XzI1P/cLspR0eillyOv564OR/DazbMYD9KVNOyEwS2+HjYI6KM0MKt8gx9EFYFSaoVpjNysWpdM
	6UooUYP0a/eFSC6iaBz3TC4O0u+R73u9Ync+0vrxxhAhxnIxdI7K0flMhyPVoj5Lq7V4msJkUeO
	yyDNE6DX1gu/cRiqWKszvzHkIj1f9xbEgBVcgKeAserXnMrNFjG+u4lKCBAhUrDO/T4Cm2RugFu
	Avf5WNdRUk2kiYU6rd0gWry6jweFSNnbbb7BzftYilhZWggeRW55HI9SpNYquI8zsLjBByvrmky
	cUyIwWxbqwYVwxKIKRek1PZJ1xqzvaxKF/sbroCn2Aul2+XlDTRaU5sK7lQ+gPxvCS0gdDm+BSv
	PI38ff4cg7/4yNZdbmZUx4MM93IS5WRnWvLe5ZmG9+5A4otjFy6MJTNg==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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
X-CRM114-CacheID: sfid-20261107_112241_926620_732076F6 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -0.3 (/)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
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


