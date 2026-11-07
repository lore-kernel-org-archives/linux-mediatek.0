Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3522606D82E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1WFd70x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aed1CdqR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=; b=h1WFd70xm2Y09w
	TCvl8i/1s15zXJqNf2Jez2XnnVZnfKsxbbCJ72JA2LFus3Cf/Wrp/4CoTISF8aPiU9tcj2DDburK8
	SIBRtnsugkwDT3BrYfl/lSXrgoZLkLaZPndsAKbxikgAksm2cM/GrDtDVv8tiUGBR7kT/J12DVysn
	kKk2tXaYuXZFQRi+cSBttLxTzPK6lxhIi0rtUOU3Ea/9V27I+l4aiIKet2RG8mQhc/q6EiZPa0jZD
	ycKJpB3O1MUmZx4tPMyXS0wVViUwosOWtYVaVysvtV/RXkFOEgo7wAoWqDFZe2sdpfNNzTBAhGn76
	yd/+xD4vnLhXuooBmWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnG-0000000FIP5-47S8;
	Sat, 07 Nov 2026 20:13:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn8-0000000FI5m-12Bh
	for linux-mediatek@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=; b=aed1CdqR7iCQUzKxIjJ1Ef5S2k
	EmQYghtgu96Pd4yVP9pJkeLCDBKa9BtO3AaKS8fXD1jhIPCoM+u5v8pqPeE8zrMXQq9qiQnXv3MTu
	l4L79JDUkYE6WfMKzd+oME5l2TtHpR+sagJu947lpuM43b4/DUIMLcBFqpGNr9GN6V9PAyrF7LaBX
	p/xRtAUOZ2E9czrDNP9gFtg0qrZ7NU9sXX5gEY0lZQLenu39hNGYqw8ZSp9f+RMW2114o1j4udwFD
	Im7K+gSec8NI/sVq1ZGX40vtwsEr93UX9AnGvSDBMXiw+ad3jhsLi3PQ46Eg/RJzajw/ngp6HP28O
	KhKqajBA==;
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn3-00000005QZ4-1vIO
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:32 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-490d838b425so3314fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 12:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082408; x=1794687208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6C42oxILqzAGe2XSYpJ1wKWPDH0Wjq+6Bkl8QonrCw=;
        b=GJg0wsbxR1PcsinoQIe49DzMp09BEFxQ/cJ0j7wQmBVALYiwphM7IPWuDY73bOCnNS
         OMg+a59jaRUFhY1s6oEwWVbe06KRY7zGaf6XH2jGqcONhfBEQnLqt+dNnUnbkOH2Qdgz
         sfypbN1CnlT0EamCEvxSqmqIGYF+ipzPgwPlsCtbFugXKHgvGzEg342pUmgUUgP1fvHo
         /SLgWLOG031xEoOsVRuX2RnT5FykKEfZxJ9GS5Jlm3xGIMR1iWgp3oFoWqJ4V6BNglIg
         n7QT54SvK0LDJ6OsilwpR6SLdXfpC9ND2VkVqA6UYgQuXVsG2yYSqNaKPUladW7mogPp
         NbYg==
X-Forwarded-Encrypted: i=1; AL+hErEYwfo0WfVqLrYRDvOxRNgfuN3RcttDAyaRSbhthPS6Ong0nSfsJkrDL2Yt36Cn6WEl7LSmoN4rovAm652QFw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+HWuecHVEMJnCHZFd8gD24eNLlTHm4P/ioFnAO5q8o6Mi9kfW2
	KytyLnr4nW7bCf5FS4Seo5c8yWiadpuP33RB/VvOmcNtu5oy5QKy67F4rqFAEBK7mvs=
X-Gm-Gg: AYBFou1CMnBkggtDTZJFzu7D6FQowG1Eq8JDPjYVYyS5VJIYy5QWTuwmA11yel6Swhv
	9CrC3Oo/uWCMkCVD5WDO7T2b/ysbuLBjDEMAX5HGE84rSJ/BL3ePWBVgS2d7shTHUhDpyQIVgnP
	4UWD42PFERxYs6jCozJzbq4zIDlVoJ74pp0q0O0iGQ6RrrK/LTkjNCiFUKRg7q+OhJiYGDFCSIt
	1pJ3fVOADoRPsfzKYspBnmgSocRsDceH6wKefs1Ri1RsGzYCbASF4YutydLyn4XDDWjzhOmzZ7n
	aKw36Jn70HKZe8+uym2YRpkl9aiX0pzir/mWKTNx/sw5AGk3Z8cxBxZWUP/AkPNTjzpzvgRXIis
	R2M/kkgMDFci260klHg32POSQSMHuv5uOq68NlUwkPyxapwaVSQkmfTOc4NCnmg1WWYX6+pFAHT
	/Pu7Wscw5rV7h4xPpRscKuFA+Avi+uflMnhMUAJgVbM0ZOcEahNLUmnoR6feC3GJtHM/GDT3uhg
	IRSgHHYkFekin1lcb8rsDShfprBe0yS9C9922igh++g7+3a+5kqeWuHqmXdY6eL29S87TVpeWt+
	Ul9g6Rq0aDpbb4z2ByduFS9vjRZOfEemEVwwN/g9SM6Bg4+FAHbnAXnmXhlmgQ==
X-Received: by 2002:a05:6871:2b26:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4ad98e4af21mr4151086fac.39.1794082407651;
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:36 -0700
Subject: [PATCH 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201329_546207_2D1C4F53 
X-CRM114-Status: GOOD (  18.10  )
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

Validate boot partitions before publication and unwind partial probes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 74 +++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f812de1d776f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1900,7 +1900,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2007,6 +2006,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2019,13 +2023,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2050,11 +2057,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
-
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2062,10 +2065,21 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2077,15 +2091,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			continue;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2119,6 +2131,26 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_chips_cleanup(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2127,9 +2159,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;
@@ -2188,6 +2223,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	return 0;
 
 err_setup:
+	qcom_nandc_chips_cleanup(nandc);
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
 	clk_disable_unprepare(nandc->aon_clk);
@@ -2203,16 +2239,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_chips_cleanup(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0


