Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90F6082BF8
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gXO2WSyo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AhdwKVtq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=; b=gXO2WSyoPVP/tJ
	fkcNzNWBF3enONFU/MJRYpKtEoChTbGBAR7NFBJJitrG0yi4etvrhqoxS2JnmARvIdtutivIe+iFN
	9MavMhYjyVqMf4OCCPU8YbftCFrKTZqVcFZPqQ7PFG+6KDdFVnb8nMfTqcAXCEjSCGOrNMYeEicUy
	bYSYR1+nEGdyPw0RCxw1mGxaNDjyoc/aJn7eGPCsL8IVFEVYTgVrLziLApVTjvOseuhglMzU333jj
	cXLM1QlusOZdsV7ef6tu/MaR8Y9NPUYxdYeRe7qcCFRitTZKvOdOYJiz3jkJUR+ew5wGQiSYX0KjV
	M7MBO+zAIpRcvHRmJpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnp-0000000FJNV-25lz;
	Sat, 07 Nov 2026 20:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnS-0000000FIkn-2WZj
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=; b=AhdwKVtqQ8GrWVd48Q9JHq+0hP
	gZ6sJzfEuoFeSOXYsAOAIPLvRmlLI6nkctS2lQj5lOxE8qE4K4SgsnWSWVJjNEmZcVFPjvociSyou
	b/bLHpJNvHoBp5VA4qvEqQrZKV6CslUuZytRpJrxOyQZpQ964NsdFRelc7Bycmkv8W2Yc1p6mVKnZ
	jG/pjL8NjYS1SrBeG8kke/nQBLzDGPqNeQpOQtOuYpYTzSsWcAGF89GkLLibqM0c5LTf1V7eG8Fxw
	1uekVAvwNcgPellOHzHHp+F+wrVOfTKHsMNmwGG0TtjNvMPrNPNs0ja+N0GdAg5FYfx0rQpjbS/I4
	XGHNThjg==;
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnO-00000005Qm6-2NAU
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:53 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so30291eaf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082429; x=1794687229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
        b=gXSP+4NMIkzRnGiLy+G/GrqIKxHZCZyBuS/6pUfuDlNa/aOZBUevnHy+Jf4rZFis/I
         U+UVPpLB8OqU6B7l89zMAAKvHEoWmQjd4Crefy6cntKSCAdbKw3L9xT8ceG7qE3oGxKZ
         HzQdlZ/kXBH+Le9g21u31t5vfUAhmjwVBmX5ZNk7P6UGRFSXdMjOXu9H1c8MEmKSWrFn
         qcvtzVaMPKFsj0WpiadVUL8I4ht/ZZQ6f754xiuArqfazJI96s2wwf5vKne1P3//gjEU
         +x8hdo/oNir8EuLrM6jhQrdP2S1rakIEPHPE6OouLK07SSMPrPG7IqRK5qEtyOafzvo9
         ycfw==
X-Forwarded-Encrypted: i=1; AKwUvBzZvswUMoVhnwL7sbUNKfzkVAijL3dyMwTwphuTJUasUJ73guLwm4tb/HikYYvylTPCJ2Ojgc6am5wZWrlPTA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PvZS6ccpcvkgBegGkmAXPu3JdUe36FaokATkEYI7PVXzseiag
	xkePazypd9cdLXS/yjhKkcFTCrz5cRdDOymkUTvB1QUvADQ1P2Uqy2UoNgRL3T7diYE=
X-Gm-Gg: AYBFou12Z//cYgFaMioufs9q/DRdrLnJk+ToojxpNwRah5L4UefADbHI39pBq2gLXjO
	vVfuwqI3Oe4kCKBAJi8ytHwRjQ9lkYdnCYoun7KPjahdej5Aa9ri/FRYMCX4HCOT6mBkjJ2RUc3
	0z6hasD1VxPzokwiEgkNZb6310XKgRVYlT7y8gZSl9vlbZ2zPGtjFPMA28Sxd3GVc21uj7y6iq9
	QmISClTJ6fG0lUY8Vu8sUDHmud83Gwq+OtdbypAsMdholvidcJqkTOHdBTlbE5EfIJbnDse8XLf
	YNdcMkP6YrWrVJvFxbzSeWyQOtZHAmDCvJ2/gtxiYWMEeGyxlmwAxCy68GQwihe/ttXavxzLxVP
	+XpHt41znX1yH7mYlODM5w0rz8XEjqgu8kIBrKvRdT7ETFx3hkiz7ZJSlH7MxcvwFfcfZAxibMj
	qo2jik0PRv/OE1qzMrVuxFlQT4YLo4CyO0TifEMl7ddJUvyB5YOJrfzPk50uU6VCU5ZADqfexnw
	NY3zph0ORxnn2BzNgz7ThsbcD9AFjR+BdUYKDU8WF4y04FG5d/SgpMgMznyM2GAxQrg2B6qSG2+
	t4ni+pwTQescXHvXv3eAIPwOUV2uwURBFmxZUpdcKA0yOMQZrZCUsqXFBbLe
X-Received: by 2002:a05:6820:c90:b0:70d:7461:973c with SMTP id 006d021491bc7-71700c853ddmr1078198eaf.17.1794082428281;
        Sat, 07 Nov 2026 12:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:43 -0700
Subject: [PATCH 46/58] mtd: rawnand: lpc32xx_slc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-46-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201350_473246_C7D9C07D 
X-CRM114-Status: GOOD (  17.85  )
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


