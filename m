Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07FEC4727E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516EE2396D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVz2SqjS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIqGAanA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516EE2396D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP4i3xjNvbFXnMpffFcShAjQ5p2vocJCZ+KBrOoJpwQ=; b=TVz2SqjSnny/Pxum9hzdurxFdI
	hySSBiM2ouh5TsQ18oXeqsyzoWzDrluYj90a7LGJYGcDBPTZzHTiSvfRixzkZgUBSwqqNbLhm7yHa
	K/89vQ7JQqJUPDUTUfL9jy4u91kT0BgnAUmjseZcUv//Faz+ulf8uyJTLmf9x7JoEaGU2M8iU1AYN
	P9AziNUXz1VAUxgquknh7k+BWpH7qUMkX+F+AF7KXK1iChq+coclJQTVo7EO8TL4ClreBLFWoWAIk
	VFXRIFwyvOzAj8IaT3Xj/elTE953bXnIUEdfIgii9ULjerhpN1/Ve40S4GephiGhLqF6FG2sNDSty
	83YH12CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfSG-0000xp-Jw; Tue, 22 Sep 2020 10:23:24 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfQJ-0000DB-Cb; Tue, 22 Sep 2020 10:21:32 +0000
Received: by mail-pf1-x442.google.com with SMTP id k13so11495179pfg.1;
 Tue, 22 Sep 2020 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V9hzjuF0yUErLrhnKbcblV75wxDoRjtOUd/Ws9rOPwM=;
 b=mIqGAanAACGTwur1n3K8HBdLO7I2eHL7uk74eIsQlYejIhwD85f5vPRs6rumxsqbB2
 Teptg/UiElR9YH4qd6vupwsmP3U/yTku4X/bpSAcmlwvb8TlaAwY/RGSJyZ6Y+15LBDh
 TeNOOsRcBvsE1AiZXjFUDSsSgks+2J6GLIi7TDdIsF2MX7gDcws1YhSFptFUF9HpYW5J
 +aBLiGa9MePAAKyPre/HuOdykawqSyFTi5sTmcaCLt0YbIVAB2e56hM3gcjiVbFpqPoB
 QkxBggTqhE46bz+UfLkqopxAcNqrR1DalbI+TWBIjmyH/P/cXqtNRwxRVhlEwPTKDAqG
 n60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V9hzjuF0yUErLrhnKbcblV75wxDoRjtOUd/Ws9rOPwM=;
 b=J5PsBEY+3JV7FB3rg1pFOuXhHJVKXr7X/NAb6UEwA3osJZ1E63bEXKEWzBM2Ws9oA5
 yn7w+3JYX4jmccsGzXNBdZHlx2Rudq6BBmMvdgAqx8vnyxJVStymVKggpVpkPQCsrOa9
 tmhB50kCi0MnEEWCPiB5DdOpKER66dhv4DcBB8J84HucfrAPuNyKg/gC3TuTPJeSPaKM
 LW72hA5O+Or1jAZZw2eE3i911P/bUPtpoQ2RNEmZcDUkucusbBDvOiwurZ68FtUPD+nQ
 s5SJwtpzR/TR/Wge3II9C4SjGOrs9pIBhtSyMvBJTwMemg80EQm4Cbh6yK5EtAXlzUFY
 mW3Q==
X-Gm-Message-State: AOAM530ZxkTvwP81z1IRqVJS5gkuBzHeloYbIUX0mXovUW6r4jpq2PAr
 81KMteUkGMjuHwcrXq0mcm4=
X-Google-Smtp-Source: ABdhPJxHfqAtsye+L7RXzBzq6HmwTmvZ1Z3IZSeaR+my1Se4Rg5yFyrrkuZOdS69/wOvl6/18fx06Q==
X-Received: by 2002:a63:de0a:: with SMTP id f10mr2932846pgg.88.1600770081687; 
 Tue, 22 Sep 2020 03:21:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.21.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:21:21 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 10/10] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Tue, 22 Sep 2020 18:20:18 +0800
Message-Id: <1600770019-11585-11-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062125_734295_98E2FCF2 
X-CRM114-Status: GOOD (  24.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Merge different sub-devices I2C read/write functions into one Regmap,
because PMIC and LDO part need CRC bits for access protection.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/Kconfig       |   1 +
 drivers/mfd/mt6360-core.c | 224 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 190 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df083..1dfe446 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -913,6 +913,7 @@ config MFD_MT6360
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
+	select CRC8
 	depends on I2C
 	help
 	  Say Y here to enable MT6360 PMU/PMIC/LDO functional support.
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 075b466..2ec9559 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -62,6 +62,18 @@ struct mt6360_ddata {
 
 #define MT6360_CRC8_POLYNOMIAL		0x7
 
+#define MT6360_CRC_I2C_ADDR_SIZE	1
+#define MT6360_CRC_REG_ADDR_SIZE	1
+/* prealloca read size = i2c device addr + i2c reg addr + val ... + crc8 */
+#define MT6360_ALLOC_READ_SIZE(_size)	(_size + 3)
+/* prealloca write size = i2c device addr + i2c reg addr + val ... + crc8 + dummy byte */
+#define MT6360_ALLOC_WRITE_SIZE(_size)	(_size + 4)
+#define MT6360_CRC_PREDATA_OFFSET	(MT6360_CRC_I2C_ADDR_SIZE + MT6360_CRC_REG_ADDR_SIZE)
+#define MT6360_CRC_CRC8_SIZE		1
+#define MT6360_CRC_DUMMY_BYTE_SIZE	1
+#define MT6360_REGMAP_REG_BYTE_SIZE	2
+#define I2C_ADDR_XLATE_8BIT(_addr, _rw)	(((_addr & 0x7F) << 1) + _rw)
+
 /* reg 0 -> 0 ~ 7 */
 #define MT6360_CHG_TREG_EVT		4
 #define MT6360_CHG_AICR_EVT		5
@@ -266,12 +278,6 @@ static const struct regmap_irq_chip mt6360_irq_chip = {
 	.use_ack = true,
 };
 
-static const struct regmap_config mt6360_pmu_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = MT6360_PMU_MAXREG,
-};
-
 static const struct resource mt6360_adc_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_ADC_DONEI, "adc_donei"),
 };
@@ -334,7 +340,7 @@ static const struct mfd_cell mt6360_devs[] = {
 	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
 	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
-		    NULL, 0, 0, "mediatek,mt6360-regulator"),
+		    NULL, 0, 0, NULL),
 	OF_MFD_CELL("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
@@ -349,7 +355,7 @@ static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
 		return ret;
 
 	if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
-		dev_err(&client->dev, "Device not supported\n");
+		dev_err(ddata->dev, "Device not supported\n");
 		return -ENODEV;
 	}
 
@@ -358,11 +364,161 @@ static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
 	return 0;
 }
 
-static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-	MT6360_PMU_SLAVEID,
+static const unsigned short mt6360_slave_addrs[MT6360_SLAVE_MAX] = {
+	MT6360_TCPC_SLAVEID,
 	MT6360_PMIC_SLAVEID,
 	MT6360_LDO_SLAVEID,
-	MT6360_TCPC_SLAVEID,
+	MT6360_PMU_SLAVEID,
+};
+
+static int mt6360_xlate_pmicldo_addr(u8 *addr, int rw_size)
+{
+	/* Address is already in encoded [5:0] */
+	*addr &= MT6360_ADDRESS_MASK;
+
+	switch (rw_size) {
+	case 1:
+		*addr |= MT6360_DATA_SIZE_1_BYTE;
+		break;
+	case 2:
+		*addr |= MT6360_DATA_SIZE_2_BYTES;
+		break;
+	case 3:
+		*addr |= MT6360_DATA_SIZE_3_BYTES;
+		break;
+	case 4:
+		*addr |= MT6360_DATA_SIZE_4_BYTES;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
+			      void *val, size_t val_size)
+{
+	struct mt6360_ddata *ddata = context;
+	u8 bank = *(u8 *)reg;
+	u8 reg_addr = *(u8 *)(reg + 1);
+	struct i2c_client *i2c = ddata->i2c[bank];
+	bool crc_needed = false;
+	u8 *buf;
+	int buf_len = MT6360_ALLOC_READ_SIZE(val_size);
+	int read_size = val_size;
+	u8 crc;
+	int ret;
+
+	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
+		crc_needed = true;
+		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size);
+		if (ret < 0)
+			return ret;
+		read_size += MT6360_CRC_CRC8_SIZE;
+	}
+
+	buf = kzalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = I2C_ADDR_XLATE_8BIT(i2c->addr, I2C_SMBUS_READ);
+	buf[1] = reg_addr;
+
+	ret = i2c_smbus_read_i2c_block_data(i2c, reg_addr, read_size,
+					    buf + MT6360_CRC_PREDATA_OFFSET);
+	if (ret < 0)
+		goto out;
+	else if (ret != read_size) {
+		ret = -EIO;
+		goto out;
+	}
+
+	if (crc_needed) {
+		crc = crc8(ddata->crc8_tbl, buf, val_size + MT6360_CRC_PREDATA_OFFSET, 0);
+		if (crc != buf[val_size + MT6360_CRC_PREDATA_OFFSET]) {
+			ret = -EIO;
+			goto out;
+		}
+	}
+
+	memcpy(val, buf + MT6360_CRC_PREDATA_OFFSET, val_size);
+out:
+	kfree(buf);
+	return (ret < 0) ? ret : 0;
+}
+
+static int mt6360_regmap_write(void *context, const void *val, size_t val_size)
+{
+	struct mt6360_ddata *ddata = context;
+	u8 bank = *(u8 *)val;
+	u8 reg_addr = *(u8 *)(val + 1);
+	struct i2c_client *i2c = ddata->i2c[bank];
+	bool crc_needed = false;
+	u8 *buf;
+	int buf_len = MT6360_ALLOC_WRITE_SIZE(val_size);
+	int write_size = val_size - MT6360_REGMAP_REG_BYTE_SIZE;
+	int ret;
+
+	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
+		crc_needed = true;
+		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size - MT6360_REGMAP_REG_BYTE_SIZE);
+		if (ret < 0)
+			return ret;
+	}
+
+	buf = kzalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = I2C_ADDR_XLATE_8BIT(i2c->addr, I2C_SMBUS_WRITE);
+	buf[1] = reg_addr;
+	memcpy(buf + MT6360_CRC_PREDATA_OFFSET, val + MT6360_REGMAP_REG_BYTE_SIZE, write_size);
+
+	if (crc_needed) {
+		buf[val_size] = crc8(ddata->crc8_tbl, buf, val_size, 0);
+		write_size += (MT6360_CRC_CRC8_SIZE + MT6360_CRC_DUMMY_BYTE_SIZE);
+	}
+
+	ret = i2c_smbus_write_i2c_block_data(i2c, reg_addr, write_size,
+					     buf + MT6360_CRC_PREDATA_OFFSET);
+
+	kfree(buf);
+	return ret;
+}
+
+static const struct regmap_bus mt6360_regmap_bus = {
+	.read		= mt6360_regmap_read,
+	.write		= mt6360_regmap_write,
+
+	/* Due to PMIC and LDO CRC access size limit */
+	.max_raw_read	= 4,
+	.max_raw_write	= 4,
+};
+
+static bool mt6360_is_readwrite_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MT6360_REG_TCPCSTART ... MT6360_REG_TCPCEND:
+		fallthrough;
+	case MT6360_REG_PMICSTART ... MT6360_REG_PMICEND:
+		fallthrough;
+	case MT6360_REG_LDOSTART ... MT6360_REG_LDOEND:
+		fallthrough;
+	case MT6360_REG_PMUSTART ... MT6360_REG_PMUEND:
+		return true;
+	}
+
+	return false;
+}
+
+static const struct regmap_config mt6360_regmap_config = {
+	.reg_bits		= 16,
+	.val_bits		= 8,
+	.reg_format_endian	= REGMAP_ENDIAN_BIG,
+	.max_register		= MT6360_REG_PMUEND,
+	.writeable_reg		= mt6360_is_readwrite_reg,
+	.readable_reg		= mt6360_is_readwrite_reg,
 };
 
 static int mt6360_probe(struct i2c_client *client)
@@ -375,9 +531,23 @@ static int mt6360_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ddata->dev = &client->dev;
-	i2c_set_clientdata(client, ddata);
 
-	ddata->regmap = devm_regmap_init_i2c(client, &mt6360_pmu_regmap_config);
+	for (i = 0; i < MT6360_SLAVE_MAX - 1; i++) {
+		ddata->i2c[i] = devm_i2c_new_dummy_device(&client->dev,
+							  client->adapter,
+							  mt6360_slave_addrs[i]);
+		if (IS_ERR(ddata->i2c[i])) {
+			dev_err(&client->dev,
+				"Failed to get new dummy I2C device for address 0x%x",
+				mt6360_slave_addrs[i]);
+			return PTR_ERR(ddata->i2c[i]);
+		}
+	}
+	ddata->i2c[MT6360_SLAVE_MAX - 1] = client;
+
+	crc8_populate_msb(ddata->crc8_tbl, MT6360_CRC8_POLYNOMIAL);
+	ddata->regmap = devm_regmap_init(ddata->dev, &mt6360_regmap_bus, ddata,
+					 &mt6360_regmap_config);
 	if (IS_ERR(ddata->regmap)) {
 		dev_err(&client->dev, "Failed to register regmap\n");
 		return PTR_ERR(ddata->regmap);
@@ -387,34 +557,18 @@ static int mt6360_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
-				       0, 0, &mt6360_irq_chip,
-				       &ddata->irq_data);
+	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq, 0, 0,
+				       &mt6360_irq_chip, &ddata->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add Regmap IRQ Chip\n");
 		return ret;
 	}
 
-	ddata->i2c[0] = client;
-	for (i = 1; i < MT6360_SLAVE_MAX; i++) {
-		ddata->i2c[i] = devm_i2c_new_dummy_device(&client->dev,
-							client->adapter,
-							mt6360_slave_addr[i]);
-		if (IS_ERR(ddata->i2c[i])) {
-			dev_err(&client->dev,
-				"Failed to get new dummy I2C device for address 0x%x",
-				mt6360_slave_addr[i]);
-			return PTR_ERR(ddata->i2c[i]);
-		}
-		i2c_set_clientdata(ddata->i2c[i], ddata);
-	}
-
-	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
-				   mt6360_devs, ARRAY_SIZE(mt6360_devs), NULL,
-				   0, regmap_irq_get_domain(ddata->irq_data));
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO, mt6360_devs,
+				   ARRAY_SIZE(mt6360_devs), NULL, 0,
+				   regmap_irq_get_domain(ddata->irq_data));
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to register subordinate devices\n");
+		dev_err(&client->dev, "Failed to register subordinate devices\n");
 		return ret;
 	}
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
