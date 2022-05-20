Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49896C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQSapxUFGwG8KTQccXx+1tRw3kaooVGkFytLSf9jTqw=; b=FObSv9wz2nRh5g
	XSWNen3U6hgEM6Hp6TEygkojqeEbzMitCObRNgbhkL8xMNSvw3IX0yzUsPpllgjASKUmqfC7nV3VJ
	8JCmGpVt4fKzkR0RdTZHLDR3xDK1cZmKAMDNQvqISKjJBDno1MVuz1xdKyMK0LnLnYeBwYQGpd3L3
	5Yx84z6a2yEWjL+ItEuobf4/MkWvgIdwzviUPTqbvgtONcTxEILfwkV/RS8Ox3/FzVK+zX1GZ4zqK
	eVVIR2+MqQE4kVLxx9/LgNBLYzHdoqB9nE5pBNN53CUKqHtkMwt0V0BuhBYrBiLCAcW5xlwfT9Dkl
	QzSCixcRIdcJ+lGR2jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1xT-00COwK-Gs; Fri, 20 May 2022 12:42:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1vz-00CNzD-U2; Fri, 20 May 2022 12:40:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A26CD1F462B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050445;
 bh=8jcIV3YZX+OFKg3u+2iMVNrP9zKOyojOdJUUR/XsVLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lQEE/GHAcv4KipbnoenKlk+PP+KlgEfM+bhCn0KilEIbDULyU2eJNnq7v6PQhDPyU
 QXc7Gxum/cJfspPv+ND7ZxZukSXzC42P8+dMLkaSNwBTO/N3qQOvH//omNO+78Z4JJ
 eH2Ee4r74YtYR6/4B5XSfvnm5hAwG0PWJpT8tnfTwx9llKC8ovNID5FHWEnUB4Zy8q
 Ns98qLj3s3+vdpgORKXL9SOiWgzB4r4Qixx3OPcYtbJc1WUnP+7nQV0lccU7eL7GCn
 oOx8fnlaVeuknFo5L0BmvHQBJ7TMCM2HNfhcLN6ymJPtgrq1ZMglE3vZD+Nes7HfMJ
 vFlgrepTsNOhw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] soc: mediatek: mtk-pmic-wrap: Add support for companion
 PMICs
Date: Fri, 20 May 2022 14:40:35 +0200
Message-Id: <20220520124039.228314-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054048_286623_572982C0 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some PMICs are designed to work with a companion part, which provides
more regulators and/or companion devices such as LED controllers,
display backlight controllers, battery charging, fuel gauge, etc:
this kind of PMICs are usually present in smartphone platforms, where
tight integration is required.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 73 ++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 76b1f7bc8217..8a4bb6392c3a 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -47,6 +47,7 @@
 
 /* macro for device wrapper default value */
 #define PWRAP_DEW_READ_TEST_VAL		0x5aa5
+#define PWRAP_DEW_COMP_READ_TEST_VAL	0xa55a
 #define PWRAP_DEW_WRITE_TEST_VAL	0xa55a
 
 /* macro for manual command */
@@ -1159,12 +1160,16 @@ struct pwrap_slv_regops {
  * struct pwrap_slv_type - PMIC device wrapper definitions
  * @dew_regs:      Device Wrapper (DeW) register offsets
  * @type:          PMIC Type (model)
+ * @comp_dew_regs: Device Wrapper (DeW) register offsets for companion device
+ * @comp_type:     Companion PMIC Type (model)
  * @regops:        Register R/W ops
  * @caps:          Capability flags for the target device
  */
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
+	const u32 *comp_dew_regs;
+	enum pmic_type comp_type;
 	const struct pwrap_slv_regops *regops;
 	u32 caps;
 };
@@ -1483,9 +1488,12 @@ static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
 {
 	int ret;
 	bool read_ok, tmp;
+	bool comp_read_ok = true;
 
 	/* Enable dual IO mode */
 	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
+	if (wrp->slave->comp_dew_regs)
+		pwrap_write(wrp, wrp->slave->comp_dew_regs[PWRAP_DEW_DIO_EN], 1);
 
 	/* Check IDLE & INIT_DONE in advance */
 	ret = readx_poll_timeout(pwrap_is_fsm_idle_and_sync_idle, wrp, tmp, tmp,
@@ -1499,8 +1507,14 @@ static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
 
 	/* Read Test */
 	read_ok = pwrap_pmic_read_test(wrp, wrp->slave->dew_regs, PWRAP_DEW_READ_TEST_VAL);
-	if (!read_ok) {
-		dev_err(wrp->dev, "Read failed on DIO mode.\n");
+	if (wrp->slave->comp_dew_regs)
+		comp_read_ok = pwrap_pmic_read_test(wrp, wrp->slave->comp_dew_regs,
+						    PWRAP_DEW_COMP_READ_TEST_VAL);
+	if (!read_ok || !comp_read_ok) {
+		dev_err(wrp->dev, "Read failed on DIO mode. Main PMIC %s%s\n",
+			!read_ok ? "fail" : "success",
+			wrp->slave->comp_dew_regs && !comp_read_ok ?
+			", Companion PMIC fail" : "");
 		return -EFAULT;
 	}
 
@@ -1575,19 +1589,41 @@ static bool pwrap_is_cipher_ready(struct pmic_wrapper *wrp)
 	return pwrap_readl(wrp, PWRAP_CIPHER_RDY) & 1;
 }
 
-static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
+static bool __pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp, const u32 *dew_regs)
 {
 	u32 rdata;
 	int ret;
 
-	ret = pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_RDY],
-			 &rdata);
+	ret = pwrap_read(wrp, dew_regs[PWRAP_DEW_CIPHER_RDY], &rdata);
 	if (ret)
 		return false;
 
 	return rdata == 1;
 }
 
+
+static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
+{
+	bool ret = __pwrap_is_pmic_cipher_ready(wrp, wrp->slave->dew_regs);
+
+	if (!ret)
+		return ret;
+
+	/* If there's any companion, wait for it to be ready too */
+	if (wrp->slave->comp_dew_regs)
+		ret = __pwrap_is_pmic_cipher_ready(wrp, wrp->slave->comp_dew_regs);
+
+	return ret;
+}
+
+static void pwrap_config_cipher(struct pmic_wrapper *wrp, const u32 *dew_regs)
+{
+	pwrap_write(wrp, dew_regs[PWRAP_DEW_CIPHER_SWRST], 0x1);
+	pwrap_write(wrp, dew_regs[PWRAP_DEW_CIPHER_SWRST], 0x0);
+	pwrap_write(wrp, dew_regs[PWRAP_DEW_CIPHER_KEY_SEL], 0x1);
+	pwrap_write(wrp, dew_regs[PWRAP_DEW_CIPHER_IV_SEL], 0x2);
+}
+
 static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 {
 	int ret;
@@ -1623,10 +1659,11 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	}
 
 	/* Config cipher mode @PMIC */
-	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_SWRST], 0x1);
-	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_SWRST], 0x0);
-	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_KEY_SEL], 0x1);
-	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_IV_SEL], 0x2);
+	pwrap_config_cipher(wrp, wrp->slave->dew_regs);
+
+	/* If there is any companion PMIC, configure cipher mode there too */
+	if (wrp->slave->comp_type > 0)
+		pwrap_config_cipher(wrp, wrp->slave->comp_dew_regs);
 
 	switch (wrp->slave->type) {
 	case PMIC_MT6397:
@@ -1688,6 +1725,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 
 static int pwrap_init_security(struct pmic_wrapper *wrp)
 {
+	u32 crc_val;
 	int ret;
 
 	/* Enable encryption */
@@ -1696,14 +1734,21 @@ static int pwrap_init_security(struct pmic_wrapper *wrp)
 		return ret;
 
 	/* Signature checking - using CRC */
-	if (pwrap_write(wrp,
-			wrp->slave->dew_regs[PWRAP_DEW_CRC_EN], 0x1))
-		return -EFAULT;
+	ret = pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_EN], 0x1);
+	if (ret == 0 && wrp->slave->comp_dew_regs)
+		ret = pwrap_write(wrp, wrp->slave->comp_dew_regs[PWRAP_DEW_CRC_EN], 0x1);
 
 	pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
 	pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
-	pwrap_writel(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_VAL],
-		     PWRAP_SIG_ADR);
+
+	/* CRC value */
+	crc_val = wrp->slave->dew_regs[PWRAP_DEW_CRC_VAL];
+	if (wrp->slave->comp_dew_regs)
+		crc_val |= wrp->slave->comp_dew_regs[PWRAP_DEW_CRC_VAL] << 16;
+
+	pwrap_writel(wrp, crc_val, PWRAP_SIG_ADR);
+
+	/* PMIC Wrapper Arbiter priority */
 	pwrap_writel(wrp,
 		     wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
