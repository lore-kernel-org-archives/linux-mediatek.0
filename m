Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF6606EE8B
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KeKITyWZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gAPPljsj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=; b=KeKITyWZeuhHhT
	6PGkexhOdRAMsP5inRkVTd8qOmLdoGITHzDy1D7djPvMT18QIrglDfolXoF/GcZi/GsH80pbRr7zl
	3r4ki+RQ0hlOaRQ9PVdxlXYPSExLpqpVKXeGdZBKSWw1avYCftTNGfT3iFtHwUXfVjtr8u+QwkN79
	yH8urvHJ20r3YZptrY4iffL9p1kAyMCsfNt9pqOu5HsS8o3tm5ulIn6DAZRVzmR7r/RdO0vpKVuGv
	a6VRnuDqIWZ7E+aeGUU0/5be7djRG8xyrXkzu92gJIdX9j41iQxRqnP/pOm+RI+TDOoHA8zviKOkB
	Jcjda2OLTIZBN90V8Ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmms-0000000FHbq-34we;
	Sat, 07 Nov 2026 20:13:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmp-0000000FHTQ-25Px
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=; b=gAPPljsjKpha+AIVYA7G69STa1
	we+gLlelsA8s6JXKmKxK/nHd3yw/kkbxPOjrPBdcBjX7apEPMhsZrurqfRcwLv8Pvw/4xU2/mTNcp
	6a7kJClUFxKf00GcAvOTcuRgml5e0t0didrzkCBpG5fE5Jzpgn7hXOAgm57rc1W3r/+hII1eVy146
	KZwSpJHueRHKqtWhi4yetWJeFs7mZsuuyBDgk/am+fnFtbZuAuyJUVzfpZSP5onGzZABwz2QRUNMl
	FnJlMrH2bIoFoKuh9T8LlpaaRp8CQ4GZNulqxGGe1kox/06B2xo7GVr/N2apcuQUYMF/SfS8ScBOs
	+39f9A4w==;
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmm-00000005QOR-1u6z
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:13 +0000
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f1fso1601464eaf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082390; x=1794687190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
        b=wI0oBgoM+rMdPF0bei9xT1wWJuglzY97BkLWRdGziZ9pKECiaWJEKCrhyxe56rJRzj
         rPWz8wwWva3EdY+X0GEhVQT235KdvYKbigSE2SfThpHMMhfBzYdAT4T07iQsTFaNatoU
         fmoeua4NeOH7ZHRhZ6q0xncwF3Ccy8eUhZtND9PqnGyKTLIS0de+LRGp1lm0wX8tRnYc
         9iWZeTnCH+X+FGEtoZsT2Wjx5/2T9dNigWWqNINk+z+atyQyE5AXDK+jJAb8FqL691rj
         pVZEzPn1ec5rKyN7B9TlXjgbVB1yDzQkmhEUfjVOktdNLhF/FmeJFBd5Y8D9d/6+SZzl
         sLhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrLHGWEctzATMIC9vxUgV33sBKEXs6/GISFYJnwcsszlYigNnUdIUADfH9pQZMqoO3BPSswzRb3zt2YD3qEg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9yUhWkFGGp2FNh01DuzMGfsRfpeHPhb/CW3pqxyNv4ktd7kE0u
	FxtwAR7ubC7qjf2kyE0GnexMwRF1T8on8Pnafr1A4KafLEl7eqtpzVKmbzZpiMiQheE=
X-Gm-Gg: AYBFou1CB1/H/faYTXZ81+phLaE34rurDxJzj8sxP4j5AjSKuLkkmtlfNw6wanPnGI0
	pFwCQnG63ji+ln4Mq4k6ijTS81QzlU6hSlbIrJlTEm254eR1JbRF+CBr0/9RiP5/u8ZUuxu6pnU
	dXpP1Q9iteYhpk/VtopTuD2IiBOnRQM/zyVrPi/tRnz/z07kax1Zv1orUWswLDNwRr3yynMKIx6
	k3Y4xCC6luMgAbkBLt8dCRMToTD/oR3vaFRYvt7vCFtLlzoZ2FaizaDQNP1R3JrslZ1136VVEkU
	Lh0qt80Os3oMoS/mqkML/cfzstYxRDUoI7WL+PGNzg5NfVYz4WiZnrvmkW9TdVnxd9b+rRRSti0
	wWFnggbqaFhoHDQqo5ISlJWBDSfIoutafHsZ3RcfNx7uH60VciRIgxdXjNCJNGwPlj+qiL7eJLH
	+Yls5q3lNLx2ahVM68mhK2d3wTDtlIh8MUG3C/KCyjDru/hRpaRTT179Y9svrx3ykWXptzLYmX+
	DELYWM1ZcCwn9yOb8bQtZM5sc3PoSRtWwirsnYGgcgp3Es84G03Kqjd0JWpU1BbMzfGUqVoPdQ4
	VXsWnjDLXEIBuYl1W0CQ6k2DPrBYZ9rVp69IezFqtkoYzaJDi5DkO/JOT9JP
X-Received: by 2002:a05:6820:838a:b0:716:c53c:3f4b with SMTP id 006d021491bc7-7170f35914amr8104eaf.88.1794082390463;
        Sat, 07 Nov 2026 12:13:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:30 -0700
Subject: [PATCH 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-33-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201312_520954_9AA739AC 
X-CRM114-Status: GOOD (  17.07  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0


