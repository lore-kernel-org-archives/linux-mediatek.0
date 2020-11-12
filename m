Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A5BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A1422201
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GON0DBiX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puPi7mqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A1422201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUxtug4Ou+RpwcNq8g63cIQDKeiZFcZr/IsEKD0No08=; b=GON0DBiXs0QSmS+s74z40ubVTx
	Zsnyi0UzsjGN5GYbJ4wjYa5scpUm6OJsgLLEIXmQILxPxlp1Ayj0Hq9N9yuoj4ZnhI7XH4HejNkkt
	lxxiEFboaI5vMSMl5a7pGjlAqEhzFqoQOC+Em85UItOXZ8Qdt8IqcPDxy4gifv3QqKnNgkanYOXzz
	RAzO3w+/rHNI85PbHtwAQtgxb+VnRow7sfiSXtWq6rLG5Ll8uj6BJG9iU5Fjpi0xu8S0pmEwdMzM0
	4NCBJcCwLsLRkfVSy2UMZJYDNnw8Z92TWmyBpOsGC4Nl+++6LhKKSsM3BLLzAZbH9PXmbgzUVYdWf
	BDmjXPsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA3h-0005ZZ-8M; Thu, 12 Nov 2020 10:42:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1z-0004b9-Or; Thu, 12 Nov 2020 10:40:45 +0000
Received: by mail-pf1-x442.google.com with SMTP id c66so4161129pfa.4;
 Thu, 12 Nov 2020 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u+M7HYglZOp5MaUV2OK0mqyP7sVvY6YqnuX0C+YCA2s=;
 b=puPi7mqRZSYMy2nKr89wfsbRifAOi0lyPupwgU/0yHVQy/X0nbpsG0m4rojcctuO1S
 6YGgh6QJ38e0n6yQDR1QpjkEcn4nUFgGrdl0mryr7iUiM2n/JVgixwztdCYZvyPK/GM9
 IiOfJZWaeRWGOcOVcnyzoOpIkEjVJSmlaOdBWkL57eO5zwI35DjjK3tLSSL1Rbp4Jq0S
 kwab1tPpOQ0jHJMzGHB7kLj+LoHybJau+Pe1d/nBu9aqEmiAtFqb/6f+blNd6R8w/e7a
 DOmo5hiX5fCETTmj6f5yztC7cYS3Ve4uAv4SYeTI+Tzw17CdGZmZdjeecZBrxkbtmEPy
 TCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u+M7HYglZOp5MaUV2OK0mqyP7sVvY6YqnuX0C+YCA2s=;
 b=Uxgb0K75A0N7xrV38zv3InetHJjDzCtz7qw2oYVx42a5Ne1ep1nGaQKFCBwu9P9Aeo
 wTuNFNtn1Febg2Ue1aEwb+416LQqRXaGbfUZ3RwJkKDJxeR5g5qgn+1MNv3mSxVbOEeD
 mYwL8sK893M4bM5dyZmhZoHgTb44hxWkQuj1eaRJKDCoD4MzQWO8EvenR7azmtbE89mx
 WEJDLwHy2vRlQ9XvZ/wyqYtbK1TZUJhBLOORQq9O2Pwfy4yXDy9Pe43eYOrHBN4nbMk1
 Xun2iNR0JvZ0uqa2hMO8xN5UEL+9/ClZTqZdLJ0LOzJZhQ+4rESaQF1+W8x2T/KJ5BD/
 RYBw==
X-Gm-Message-State: AOAM531IfA595E6hnSco27PBoxQqluXl0XjhE1TKHqTF+un1adBl6DIy
 SzAejy1M8Fg+l7jZerJ3S4c=
X-Google-Smtp-Source: ABdhPJz5Jr5hxYDaMy3CcNOjKiLv4DZzpOLSKdQSu4fJeNhdIFcETU90ZupIbsaluM+0qO56SkwWFA==
X-Received: by 2002:a17:90a:e28f:: with SMTP id
 d15mr8410309pjz.96.1605177641128; 
 Thu, 12 Nov 2020 02:40:41 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:40 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 10/11] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Thu, 12 Nov 2020 18:39:57 +0800
Message-Id: <1605177598-23501-11-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054043_972982_662841D1 
X-CRM114-Status: GOOD (  23.16  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Merge different sub-devices I2C read/write functions into one Regmap,
because PMIC and LDO part need CRC bits for access protection.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig       |   1 +
 drivers/mfd/mt6360-core.c | 203 ++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 181 insertions(+), 23 deletions(-)

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
index 14a9927..4bcfa7f 100644
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
@@ -359,10 +365,160 @@ static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
 }
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-	MT6360_PMU_SLAVEID,
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
@@ -377,7 +533,22 @@ static int mt6360_probe(struct i2c_client *client)
 	ddata->dev = &client->dev;
 	i2c_set_clientdata(client, ddata);
 
-	ddata->regmap = devm_regmap_init_i2c(client, &mt6360_pmu_regmap_config);
+	for (i = 0; i < MT6360_SLAVE_MAX - 1; i++) {
+		ddata->i2c[i] = devm_i2c_new_dummy_device(&client->dev,
+							  client->adapter,
+							  mt6360_slave_addr[i]);
+		if (IS_ERR(ddata->i2c[i])) {
+			dev_err(&client->dev,
+				"Failed to get new dummy I2C device for address 0x%x",
+				mt6360_slave_addr[i]);
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
@@ -395,20 +566,6 @@ static int mt6360_probe(struct i2c_client *client)
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
 	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
 				   mt6360_devs, ARRAY_SIZE(mt6360_devs), NULL,
 				   0, regmap_irq_get_domain(ddata->irq_data));
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
