Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251E606D80F
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzXm08jn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=; b=qzXm08jnIzLcwN
	LvLkwK8rxbPmL7Un7cOPg2GkRwruTAJc1HbgDIOmo+o35J9dhJuuBBGT6gSlh004zXe7ErfciQ2rf
	dyjoDWeDGQK2TyY5F/4LNMjulWtptec3Qw0m1DCAgGLQRYH0T6t0lYLJ2GCk33uuDjpGENvs9FF3I
	mebwAQ5HGFBZfr6ICnxrWCFmMUhicyBKx0zxtJKnCOZYHdAU+16rO/yYxFJ85NaR1cz0E9V4xAWV2
	jzPT46ghYXKWTW1LG0FJuGJhsXUoqleAHpFo5HOHNzPy7OkJasUJNH1lYpASMrswngTNox1/dBn5U
	KmMcZh6i7sFEVIRZjJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmv-0000000FHhB-0dxf;
	Sat, 07 Nov 2026 20:13:21 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmo-0000000FHRV-0pKQ
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:18 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df0b02fe91so449572eaf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082393; x=1794687193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=SdHGxpmtHxeYQ68p8/VX1xdQwDs/FX/CIXvVgXxfdC0KCXGHhq3Xlbqv+mM53t079Z
         +mptPJ1Nj2j/h1XHpA6S/LtavvL4Trocn5J/4LMYdGbtfGszdIisJdL0wUjZao0njUQE
         29iGhrQrVM1ZZlw8qbfrcygnW3BKun2FSVEO/uBh0yWdbTjWZ9V9KOYNbQHcyM4VQvQo
         0sm1+NTPhxgG1cCzrugVi/aKcPjCR+jj2Nlc2NtRf1iKJBB5ZLsPrb39V8Cm5yKDKLdf
         bv62w1qa5qkHT1ciN7kSbqu4nlMpr/qMQ6uqrsBXw3UrlibxPcwuwxPczI/JYcHjnIKm
         P33Q==
X-Forwarded-Encrypted: i=1; AKwUvBwy2HSP6VmxBhC/ja6GLz+Oe3WWgteR15YQhAquCVXysGsdoi++lp+fsBNp31Jqc9jOdLcaLp3svsPjYv1CQg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9RyeSE0dFzvAXHLkvTxfOYefB1jfA90Ga4mqxTzwyIf2Yga9Ye
	cQKQRRwnpxiCKm+cia8ssM4zQp6b9Fc6x6N1vrjPvYFg9UMF4ueXMxh7mvo0GJd9YTM=
X-Gm-Gg: AYBFou1mZ+hN6YOP7hj6uFz6f30rnYEF5g60tSBqnfSqXcgwr0WUFPmlXWdTWwcVcNV
	Ers4CfKk70f31VAVmXLZLYA38a1oymGs9jcvbVJZmsYdnGNJOcFshcGzVMPGTDH3RezBqrNSygJ
	3QdwyFMnQwl2FKIIVqOIylCdSFAssBQld3lOh0Yw/QhbbKJuoyBTh9LSRNQrJaAmMOixWRAMMXo
	x8LBK5ArDrcFXmUmvJxkACC4qZvgEGjD5eHKp1iOKwpvIVs28jimX1v+eEoPRT1w9cgPVOzUlEv
	9yEmmcIav+suY3jko+RaXV175YBMlWA9di0gGyGMsP2Teps4yDRd3g0Gq0szML3JNhFtdGOfts3
	h+twm2n1p4pgXf3JbHanJ9VP7HdB5aXIh76/XN46xdSmAO1idshTn3H6BFmUz/sqTSP9oqkCLjq
	Igpc4/sUSnm0JppaTD5zRQVjIfuczS7nuocpR5HjiboPRtN40c6WWNInjqbg9P4hxscZ6v3J4z7
	wPYOtJAKh37xdEdPGrcSJH05gXSOhH3lnitwsXEbnl8kuyfJBgI8xaAvDxuxqZ4dF0krCxBBNm4
	9L+wQ2wyIh+VcvpOOf+t29Q8BHrKX6VjpENJXsr+OzaQZrPit0pDmZKFdzOdBw==
X-Received: by 2002:a05:6820:188b:b0:704:2628:b1ba with SMTP id 006d021491bc7-71700c850a0mr1064837eaf.23.1794082393182;
        Sat, 07 Nov 2026 12:13:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:31 -0700
Subject: [PATCH 34/58] mtd: rawnand: omap2: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-34-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_121314_307320_4BD85DC1 
X-CRM114-Status: GOOD (  18.39  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0


