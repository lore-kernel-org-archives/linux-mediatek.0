Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E56083628
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lrsB+3Rx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/Vit/cv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=; b=lrsB+3Rx7v+cTw
	Nq939vxInw2Ws/MvW1v6x7hwq00FlqbRm4DKRcxgfWW9Boml65Y/gVtADXsHGPwoFyUoafK/o9oIe
	LI7Gt/VpwUk4snVHKQdlzfGOpV6ia9bY991QkM7/5OjjL7Ub+eM4eYgsmMTfuyIt9f/7GfrdOnU9Q
	cahiWv+RAtUFQherYAcPeyiJHBisWrdieFT6GuviBEFixDt5orVdVEMVppzBSqsB1SJoH+Lr10PuA
	sK0kdKJnfy+zEo5FGtbOFXQIOEnV1BTdAvKkNXl/yv2YVkay4FdmR9AMxjZAwbpGQ+1+W+B9EjB/N
	KYKEPX+kRbpFOAh48XsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTh-0000000ETDG-24jS;
	Sat, 07 Nov 2026 10:16:53 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTU-0000000ESot-3FIy
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:47 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-82380b0f55dso720504a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046600; x=1794651400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=d/Vit/cv6f2wZmco2jo2Ob17WUhf4txOlRBkvrnkvTgqJfuh69X8o3K6+cOXgLG2Lp
         yCYvStspsNLdFZRQz0Rka1ShzA5XNMHwxZn1w7XO/EpxWCMxRqchZgKQ2+EvFrP7B0lW
         2eeuKpx8SnNGT0XoOqEmfX0jOmpdUl4+JVCCDXHDu2/ASgdA02O+SKT40p82E1cBFqhc
         hWcEhR6BzbvIMkAG5tWphSbcMERpK4yw4D2WQlVXqejWn2GNpBBblXufEcKNsstHPEAy
         FYoz3EDw6svDIt+KagoW53sp6D6hAHNDqOxtKRMEGqT42wmwJCW+hP1b0IslbL5YTCsV
         y+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046600; x=1794651400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=dha5icxaZffu+ziB9MpqZwEEOjk+Tb+VdpSYC9QhvBuUNwOECtlj/yGMOlqs6MQjWd
         kmqJnyqHBFYU+2tqJyVwZpgPcIsXj+V2EQEk0ZInRUckEL23AuUQiJQEVdhi8zGv1VUi
         Uci9H/qzMIcDUis1gXBozflsxxdBrtjoplYx+z2TeTqIUhok5OCgQpdMyxpk3yzPLK1c
         BSseENCMOvRl6Q6fMQ7HkNhZ632A6AahvclJMKq7la5zP1FtZHeU+QlWo2kNcsy1BiaE
         WSv02GvHDIlMhF33jwJGklehMoAL3ISakkT4jhtAo81IEYYGdH8lfBma7L+D8Us9HScq
         y3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxKAbsupdZoqggiReN33s3LNGfZYH3AmHRh3Bhe226HTkxPultOXk0+Jfaz88go6xgJFxfzBcNBvDX5QdDLDA==@lists.infradead.org
X-Gm-Message-State: APuU4Z97m6wabq5Iy1GZAfQjvPLVgjYOzB069dCPFyarB2CXwvp7WQm+
	FQtlWytP2sO036LH1P8yocKX1eatEqnp0lHOyQI1yNQhOwkoIlvcVl0g
X-Gm-Gg: AYBFou2R6QA8InmIu1bR5nzdPuwkvxJDyyaIoUU9TkFEs58uKOvKyQhRVBjOnf9PN4a
	aOZ1Cw1fItm9mLv2brLybWuzjQEdqhBsUavm0NEOgRjyPcwlgD3+88ARHj/KnMvMkJ8D+xX2IkP
	z6TqkNdgDUhORzHCxrYy7uRfEyGYFJdPePg1G1PkDqC4K0fQZyBsb+6Jwki8qgFxrDCYiDo8RNr
	r0U1ufn3senfAO+qujtv9IVJ34VmL8Zhqo8+UNTtNEtjAaAxWRKP2OSc/KLakNDqw+W+cCatgQ4
	rOioVkBdiVMoQ10B1cmFLL+c94nT155ofroaT7iJZzPYbsXoYT77n+LU3qSEU9K1pEVjlR95UcV
	ujNRn3hT7q5yUX9v7tN/MucRc7gz/je/y/SvG35HlwrNMeeLBNpaZ5B5ABvP+IuOHIRH0btJXxi
	iC8EfcEVQutJYKAx4FoUHnnT0FHHfcphDDnQBwvaPS+12tMMSjPBxO5J5PksvbefN30HVPhx+vq
	eRVk9nz+wUR/3WnAxtILSftA0fw5vFZ+VyXumCMPveQKzCp2jCvC03hFco13CJYIK8sY42KB+2o
	4tYgm1fwdYqeN75Jshp7X7pRPODXeIVNmBATqK+q04JdwuKZWadvPNeFVV1M94lDEpLwkiyIKdL
	s9U59rEYeeYpMEQaD0bKZ/0LycsJ7VKT5ctcREBcMHCDpTbHayV4FlaPH6AOGb6nAaqjkFbkoFZ
	pN58tMdTzAUFIatluPsKNDZea58F2UUR5SO1c1jcisupt0mmTIRrYI
X-Received: by 2002:a05:6830:438f:b0:821:94d2:83cd with SMTP id 46e09a7af769-85f1cee4f2cmr4595254a34.9.1794046599688;
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:02 -0700
Subject: [PATCH 05/58] mtd: rawnand: share retained chip and controller
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-5-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021640_928504_0AA3FF49 
X-CRM114-Status: GOOD (  23.48  )
X-Spam-Score: -1.9 (-)
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

Controller drivers need to keep chip metadata and serialization locks
alive after unregistering MTD, without retaining their hardware
resources. Share the name, firmware-node and parent-device references,
the final NAND cleanup, and the disconnected-device open check.

Provide reference-counted controller storage with an initial
device-managed reference. Register that reference before managed
hardware resources so their teardown finishes before the controller can
be freed. Each retained chip pins the controller independently, allowing
multi-chip controllers and embedded chip structures to use the same
lifetime rules.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_lifetime.c | 118 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  12 ++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 619760138d32..7ea275a40fcd 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
 obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_lifetime.o
 nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..9518c9a4bc63
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+static void nand_controller_release(struct kref *ref)
+{
+	struct nand_controller *controller;
+
+	controller = container_of(ref, struct nand_controller, refcnt);
+	controller->release(controller);
+}
+
+static void nand_controller_put(void *data)
+{
+	struct nand_controller *controller = data;
+
+	kref_put(&controller->refcnt, nand_controller_release);
+}
+
+/**
+ * devm_nand_controller_init - initialize reference-counted controller storage
+ * @dev: controller device
+ * @controller: controller embedded in driver-owned, non-devm storage
+ * @release: callback freeing that storage, without accessing hardware
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * storage reference after releasing those resources. Chips prepared with
+ * nand_set_release() hold additional references until their final MTD put.
+ *
+ * Takes ownership of the storage even on failure.
+ * Return: zero on success or a negative error code.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller))
+{
+	nand_controller_init(controller);
+	kref_init(&controller->refcnt);
+	controller->release = release;
+
+	return devm_add_action_or_reset(dev, nand_controller_put, controller);
+}
+EXPORT_SYMBOL_GPL(devm_nand_controller_init);
+
+static int nand_mtd_get_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd_get_master(mtd));
+
+	guard(mutex)(&chip->lock);
+	return chip->disconnected ? -ENODEV : 0;
+}
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_controller *controller = chip->controller;
+	struct device *parent = mtd->dev.parent;
+	struct device_node *np = nand_get_flash_node(chip);
+	const char *name = mtd->name;
+
+	if (!controller->release)
+		controller = NULL;
+	nand_cleanup(chip);
+	of_node_put(np);
+	kfree(name);
+	if (chip->release)
+		chip->release(chip);
+	if (controller)
+		nand_controller_put(controller);
+	put_device(parent);
+}
+
+/**
+ * nand_set_release - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @release: callback freeing chip storage, or NULL for a controller-embedded chip
+ *
+ * Copies the MTD name and pins the parent device, flash node and, when managed
+ * with devm_nand_controller_init(), controller storage. The original name stays
+ * owned by its original allocator. The caller must set the name or parent before
+ * calling this function, and preserve any other metadata used by MTD callbacks.
+ *
+ * After success, unregister MTD, call nand_disconnect(), and drop the driver's
+ * initial reference with mtd_put_master(). Do the same disconnect/put on MTD
+ * registration failure. nand_cleanup() runs at final release, so controller
+ * detach callbacks must not depend on resources released during removal.
+ *
+ * Return: zero on success or -ENOMEM, leaving ownership unchanged on failure.
+ */
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip))
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const char *name = mtd->name;
+	char *copy;
+
+	if (!name)
+		name = dev_name(mtd->dev.parent);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	mtd->name = copy;
+	mtd->_get_device = nand_mtd_get_device;
+	get_device(mtd->dev.parent);
+	of_node_get(nand_get_flash_node(chip));
+	if (chip->controller->release)
+		kref_get(&chip->controller->refcnt);
+	chip->release = release;
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_set_release);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..313e0d88e19a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1116,6 +1117,8 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @refcnt:		controller storage references for managed lifetimes
+ * @release:		free controller storage after the last chip is released
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1128,8 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct kref refcnt;
+	void (*release)(struct nand_controller *controller);
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1137,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller));
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1285,6 +1293,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @release: Free chip storage after the last MTD reference is dropped
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1345,6 +1354,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	void (*release)(struct nand_chip *chip);
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1608,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip));
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


