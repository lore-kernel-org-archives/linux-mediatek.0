Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA113606A326
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kGqTV7CC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MfdO9RSv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=; b=kGqTV7CCbAXwU9
	gOQ6AecM4JO+ZTPVw/tOq/cF7pFG+hWY3t9HvtxId5pGycmDfy/P1Y95FHGTEv43EziEvM1Lapmd2
	CzTF6UpB2MpKeiDMi2zbyEDFMFD1FNI4k2ASKcY8HMgLIutSzuCGtkeifMf1yzOVf6UWetrbblhsp
	fTwfVqyUAsdj28o7LzxoxUDklEm1mEMxepOJHDnljbOZhtEvGvHrPjK1zIa8iO44qW0Ma/naitL+U
	uhKHFnQpMIG1gYE1wQxvlV2Y0qePcAynbBfs1FSHKZPX6ppf03xBZl7yQCSg0ocfFRp5mYfOKnHpW
	XtNiRWwl/gkwT1YAb1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmoH-0000000FKEV-0R8s;
	Sat, 07 Nov 2026 20:14:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnq-0000000FJNG-0xbQ
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=; b=MfdO9RSvBMuMr1r2HfieJiTqh3
	o5ORw2I+6p1HuMOMxoXpbT+QUz4ArwUg68kJBj2KZCN9WDBdS3O36p1zm9OcZNRfZJGSgJDTUSlbr
	zN7WwuIweMP9CQexvGzvysKzKCWjZQqy3aCLX2ebvhgAxOLlUbLrWBZ76tx8uBaVCdkuw3HhomVdv
	vVI3V/P+WdorOTDgCBT5l/ACQz/zUsuC037/vrcmGhk3Ch49B76c+YcByHzQyPVNsfb1QjpUNUpGG
	sJd4QjZ5DJyChfL4HwUzWxSHWOYOpTV/TK0/+IS99ZA/lL2ujMFxSX3E9IbmhXelr01U86RgmZd7N
	9gJTj/fQ==;
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmni-00000005Qzl-3glp
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:16 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso1240632eaf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082448; x=1794687248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=FZYRfuytSyGg49le4j+E4ghrs9G6qI8nXq+8iFMNGAmbvyYrMVY4Yg3iguo1CbG278
         yU/hNWE8vOcbhOMjzF/IaDT31rsT63PHj7/TmToMdb4e9Qf3jYNQ1XI7iuYYfPC97a0e
         zrBmWljY+U7v07DrrgNhA3tvz4JNGwMOIy5onTdIJHU1V2ULd4+Nauxrs0B7pnu6tVzo
         zZWRKu0tMpoc3xbSAjW46bujYn3xZrgziyKFRptYW0cvGWtnRQM7IAUJoesF3FHGVp4E
         3qFiP+TgJZZCjNsJSmEJQnMHtr8S9ZsgJ0WdLG9HPFXqEJe8tmFEGvV75XFee5TnvGhr
         fEGA==
X-Forwarded-Encrypted: i=1; AKwUvBzoskWB/s+fnWDlUOkmk/Kfv5Z1svq3nfMTZzKgX0v+o6aH1mANTvRaD2tH8kMke73ygjfmNCoBE6zHZV9ZqQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+6ECpt+/eQM9QtM+z10q2oopClmEPqPYRA4EgxuXjZTEaolcVL
	VRC4KMb+5sn0i+ifvvaBwXz9YRKUFn5qnG8xun1wqNvDG7e8gITkqsGUA+gyPvDl06w=
X-Gm-Gg: AYBFou0jLIZKjbZm/h8q5PNLqkJ+uUbLb99HIABXjee1H4CP/5GkYpo6AMeDWrMx4do
	7P2SvOtN/59MtMab1dxNCSNasIL7dY3M3Swuvd/i/nbD0qPNJSxKpqc/yhFrb5dgWwoPpBskBUq
	IYQIA6Y7xJyHsxzwTi4a7BWcVcxw+5cb53rZTfPFxxOMz2W/7NLD2EyBqXUrLq7LmrUaWx/PxVw
	bUGX96UBme7xpojgCaPEjtE+vgokE3dI1VK/Sf9L7DlBSVHRmu9J2AxD6MtkVZraxrf6jOsgcEh
	N/OTojSoswnS02U0kj8zV0bJ4cP5QEJ0bkhxF3aFfEa4iz2X39Sk2d7HfSNtYZzGWw1YqxnNd3b
	fv3PC/zqlfDveKFutqjUGeGjf1JWu7UksIm8qNET34owvAZ/1BXGxnILWPDc6MHx/YnCqc8x2uw
	47aMQ4b9PU+6BN2Xhw3cNCjzKbfe6ngDcObbqGCgMjdUePRXp8MW2PnM1uF9GSb3dlOn9tvLbMV
	9zce1yVexVodHrO916bOFf6oW4FW49IYQdGYSEFWZyTdgAZ1zAda8Wzd0OYxLll9ORz85NsbtRU
	GrsRqP5hH7O4RRe9CnoRjfAA35UzrnnBIc575Qt1FX7eD3J6+lMOV/BaZaE1
X-Received: by 2002:a05:6820:560b:b0:700:da68:7398 with SMTP id 006d021491bc7-7170f278e61mr16479eaf.43.1794082448352;
        Sat, 07 Nov 2026 12:14:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:50 -0700
Subject: [PATCH 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-53-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201413_476112_D8950B42 
X-CRM114-Status: GOOD (  20.05  )
X-Spam-Score: 3.5 (+++)
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

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Release NAND metadata, chip storage and the shared controller reference
only after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 68 ++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..c27e89050270 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -48,6 +48,7 @@ struct fsl_elbc_mtd {
 
 struct fsl_elbc_fcm_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
 	struct fsl_elbc_mtd *chips[MAX_BANKS];
 
 	u8 __iomem *addr;        /* Address of assigned FCM buffer        */
@@ -837,23 +838,35 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static void fsl_elbc_controller_release(struct kref *ref)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	kfree(container_of(ref, struct fsl_elbc_fcm_ctrl, refcnt));
+}
+
+static void fsl_elbc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_elbc_fcm_ctrl *ctrl;
 
-	kfree(mtd->name);
+	ctrl = container_of(chip->controller, struct fsl_elbc_fcm_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_elbc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+{
+	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +880,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +918,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		kref_init(&elbc_fcm_ctrl->refcnt);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		kref_get(&elbc_fcm_ctrl->refcnt);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +963,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_release(&priv->chip, fsl_elbc_chip_release);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +987,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	fsl_elbc_chip_release(&priv->chip);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0


