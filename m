Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23B606A338
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GBRHuL40;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPO3Q8az
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=; b=GBRHuL40yBTRek
	nkUySSHt71VM5coxG5T7mQMrM+ITt1iQyGElZJuoJRETHVWlouztXoYqINQKUKu8AP5oa3++DsUCM
	bEjP0gdFKCgHdBGIadExdvd+G0n29w+NPD4+R2PHIVcI9dswnHSGjNDL3kGocAM8dtH9ha/88TLFQ
	YkWlV5hRxXl/Rp05CKtI6SWVZ1gOC7Zeidp2gQ8jkqDOLUSh4DtT4gP/cai3O7+uM91m/96E1VJsJ
	8Gh44erpni4zQqgDg0tFvLAxJHDIA3gUlRzMP2ULZahEEiHuJ8tVVQscENGD7bcNMsc6s3PI0vgxo
	cIKWZxW3dOGaL1mXIFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTU-0000000ESoX-0VBf;
	Sat, 07 Nov 2026 10:16:40 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTL-0000000ESbV-1502
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:35 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-84e513874f8so1034299a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046590; x=1794651390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=iPO3Q8aznChSpbcpayKtlbfZXNvfZq4VMtCS3eo0vnmpnKwkHavHMfZx4HF9zx2HHW
         I6aOmVmuWtFT/xu8LmPvXh5gPsBLKpWPopARnH9e+UfWdlgD1Co8ufxgaFxVZILQ4VmA
         7IIu0/MgXm/NR1FmOZfk0IY4nRn3KT9Lk3hgsccgArlDGINEEXPus28sY9xFvif6jjhg
         VezBJzoDlRyt8opUKaNdluFd+kiW6meY18pPVaU+h5lzHDeHplcOYTLk4BdqTxI7rX6/
         /uGs2FQ43KzBPwDf10CMDrVABN3JFL7KJ8LMcEQq4pH5C8vPBskPlTUXlPJXxEyYQ6Ec
         Snrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046590; x=1794651390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=WMfdcW6wifw8VkiqN9nZpdR70K0i0ksABhb7bYkaumPxckvJNEu5BPUBeW78QeKbCV
         8wd4o5RDlYng4/gFV1CQFDlIlz5JlQW5m4hKzJJfkBQeApz4HWLTy+rupIkaed+YMBNB
         ag7povueg71r/WXPnK9iXBkIeGem4DtJLaDSHZbs4/VR1lXRcNBP+DKNlHFOcCEG4fPY
         CdGYr5vXhmDpNCCZ5BSvK34hDOXxMUr/vqG1YH3+Q4zYzGkwpvb8VToIi2SQi82BEsFl
         vm68XiErF8z8KoDD6iiQ0wmy1CoAZHaiJ2StQevltWuy3UrLCFK6TCUOehivUG93NBmc
         AYcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMGkM3VYtKNzQSSGZYA64gIu9O15jWFH1aDyGzs3zFyolMayCIGfbMsE8EuzDnA+ma5HYt9R3JsL4wbHyU1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9C9SZUGqLde7vhib9QQG4/RLNdFMVEJ2Zd0PTI41rGIWrYJedz
	8J3mgdLr8aIguSzFomL938dYy5QPLDmr0DXQjDU7+OMjr6oVX8xRBfjW
X-Gm-Gg: AYBFou3yfspwSSYOdWAvUIPSqv0PeARLERYT52czeSAPA9keokMwGgryir0lL1TmeOP
	o4cq+CqkPOzjm1FjbFXbKS3dsh+xlZ50kbg/2SpKhm6OOLVJgnL00dCk8UwTHkQPq1dR20/FxSs
	DFlinHlaOUKd17bJv2YoTwljEQHtl/yYWaubBb/LnZXd3NTLUPnzsi6OhYigMnLB8uoYNqppxDS
	BnBc0gGqp90LkB6mIl1PryF7CPDVyGF0D/3IlWhyH9PjIIyqcqtHfs2eCeL8zYREy1r4SqzUzm3
	S4UsvzephKqB/lIEBIyFLK2zZ9H8Mxu2u6xmPWpE7BMIbFvCJh/UGDtjNFgPXgLRCBoCqkuoE2x
	2SvwdHJ6awkvUhWSMHV5H9IhFKhTvkYjrE4y4YBRQymWVgNkhpVszJfod93lSRCZ0GQ0tGiwqQz
	GUyMFBo/PevFxiR/BrQvZMt5HM8ys4W5SInkXqqz5dboFr56KN/6jJO+p/25Qps8X/qIUwvpTja
	v3Ag/iKKIM6VKkdUo0F/7nQDVpcECKXK8qNX9PBnYHPgpGlV7lHuwDRJQIe+MatB2rpghCRhW8F
	wl844EWNkevy6cDW4BQb/Edf0nnDOxireNhzglu5UkQBMZenCKzYw2lDg1VEqarms5VoDnIQjAj
	KUj4TxI9UdXcxt7QByvZ/zgaECL/TOFmMFcLce0OtFXadlE+nKvS6/UVeswN/5HN8ZWE/bjJy2/
	Xq/+5NPn4lNYnm9W7BlQFKJnDOpS4rOjbWIuMKObfE8Q0psSVLZSGs
X-Received: by 2002:a05:6830:4c05:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85f1cf838e3mr5603674a34.9.1794046590411;
        Sat, 07 Nov 2026 02:16:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:59 -0700
Subject: [PATCH 02/58] nvmem: retain provider context through final device
 release
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021631_897203_894DC6DC 
X-CRM114-Status: GOOD (  18.39  )
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

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together and document the associated module lifetime
requirement.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 12 +++++++++++-
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h | 10 ++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..851fa5cabecb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,8 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +898,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +927,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +956,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..dcf5d81ca1b9 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..03e8522bab17 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,8 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +109,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. These callbacks must also retain any
+ * module needed to execute @priv_put until it returns.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +140,8 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0


