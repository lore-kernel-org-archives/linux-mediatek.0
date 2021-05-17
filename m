Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A6FC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:38:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3840B60FD7
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3840B60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BUk9D+G+D60bERJEGYITkbcxWgkMnMgiIHWWW0gO36k=; b=YTVkcORcoImd9G67pJV7Mk6wh
	9nd2ac6auqHl1iahj6p8aHdWs2sB6N/z0pBDM8ze2AK1nS07xRzW8FlIvgNyUt61SJ/vObby5SIK6
	LXqpu4JPg7JIaEr3Q76Mn7WsA9CX+yq/xawDSBStzil6hZGD0Uw+2hUkXNJ30lL8Kn9yR0Duph08c
	EmXJANqHr2qC6dPadbOyuWTg3WJXc5mYjIRHDNUqbrDY1tNRqkli5G5mdtnmb+e6XSK2qUhD1Veh8
	O6GGrFl43fmng1B8NpXUAWbfhvnP3EVjuUw9gCY2NcZcojOkP+Nw+U7BO3MbjxI69DKxwMecj4MIw
	ZBVmkWXlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lihBl-00FghM-5X; Mon, 17 May 2021 17:37:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7s-00FfDx-9D; Mon, 17 May 2021 17:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SpbIQzkfbixUlRA8bBdjOWnojgoIaGzYZDD6NB2StNA=; b=4qbjnByC0Y/oAgkxBPK67cwB/W
 lLQM2NVOElSQVjYGYkUNbpUu/fb+M618+L0Jb6h6A5q5z11GFBnNFi9sf/O8EoyWSM2ELMn+prT0p
 HrhVu1Cn3sF4DMRtoFExTOFv1nFaod0gC0u7H7q187BJEKXox+Sc6ueiZ8uspr3ku9/tuNk/HS5jC
 oTN3G7S6islRt9rJ2mcgKMk93Q/CkcWkLUtwL8TP55sU/gl+qkGEVcRrpq0PKiJPyqG1UWETHT9tt
 FhB9Vhgou2J1e7FxXgFviZDszNS8PteuDJNXE45YOb+NmYzbiGy7DuXglTmOW2HrNhGZiHeH5K6HE
 kzQm/S2g==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7p-00E1Nc-CV; Mon, 17 May 2021 17:33:55 +0000
Received: by mail-pf1-x42f.google.com with SMTP id g18so3784720pfr.2;
 Mon, 17 May 2021 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SpbIQzkfbixUlRA8bBdjOWnojgoIaGzYZDD6NB2StNA=;
 b=MErJUk2YilS2O5yCjGNY6zmAVy9t/FQHdD0Xejlb7DqIpgjNxQXe3sTk/OKiVmFY8t
 ZgaPVZJdyqYWE3NjyOvl7/1XqmCEvTXHW9qYV/a/UR/e3cpvVLneACsj5K+g1cJI+Bb/
 Vg54Jzmlf26YCbFHoR0PiwwnbaH+rnXoet6VmWt9No6pEg4tSb0DL1Mky6pQJE+IAwVS
 qxlo8/IB5cz8cxgjJvlK6V8fOz6ozZ25+DBMdcNPLZEZZxsRFQauK7oI5VOl7YkvGMcW
 JRvWolWc1BDAeSF5t1hHCwFxDvzw2Sa4ibJKkwFMCMfiwHdCQxxbZ607ZvGS+7wwWYXj
 6fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SpbIQzkfbixUlRA8bBdjOWnojgoIaGzYZDD6NB2StNA=;
 b=Gd/Qy8/N5Zc4Viw9ckNkanpHXViwBgKhwn9byb9Y4414fJ6kwAupiZPS85b86A2MH9
 n8I/JEsnOGu6yhRm2wB3zwIsS3PZFEvIHg3nYsYtBFXePOb31CU2yBLDr+WXt6hiWcAJ
 Zmlz4Ev/J80uw4AU1XqfPQ0xA70SsPKerko5ZLIfqrsnWVwpf12jieKd5YpJ8SMNG8R1
 vIwnnNjBMx0Ijh4L2kDXyoqdrgKqEhp9Xcwl2Zn+VawABP/52GzllrHO7vedgJZSRphm
 SEFGkIEC5hYBavqIYd4+0VrIw65ZWnpavUB2DkyHs2IMXaVmu2ZjZ8PSlNu/ivKpanZ9
 /dmA==
X-Gm-Message-State: AOAM530GeK2k8mF9LKuo904LJpvzlxjEXZXajI4mOcOqF8XxfVIB21mW
 vdN7MlbsdGFe6nQ7lxTKEXw=
X-Google-Smtp-Source: ABdhPJyCPxqBfiTeb2OagfXjAVy6G3QWCkLAQzqLlg7mSqih2gisSpcxbFjEb90UGLEPw3XVw8RVcg==
X-Received: by 2002:a63:4559:: with SMTP id u25mr641581pgk.93.1621272832364;
 Mon, 17 May 2021 10:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:52 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 10/10] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Tue, 18 May 2021 01:33:14 +0800
Message-Id: <20210517173314.140912-11-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103353_454391_3956E961 
X-CRM114-Status: GOOD (  19.76  )
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

From: Gene Chen <gene_chen@richtek.com>

Merge different sub-devices I2C read/write functions into one Regmap,
because PMIC and LDO part need CRC bits for access protection.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig       |   1 +
 drivers/mfd/mt6360-core.c | 203 +++++++++++++++++++++++++++++++++-----
 2 files changed, 181 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..143715e22ca2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -902,6 +902,7 @@ config MFD_MT6360
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
+	select CRC8
 	depends on I2C
 	help
 	  Say Y here to enable MT6360 PMU/PMIC/LDO functional support.
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index a4c705c8dd68..e628953548ce 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -63,6 +63,18 @@ struct mt6360_ddata {
 
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
@@ -267,12 +279,6 @@ static const struct regmap_irq_chip mt6360_irq_chip = {
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
