Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BEAC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 02:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5vB9AdNpMbk+2uUPlTv1wvt0hrX4ZZuVlJ7vkkQRH8=; b=gW60xfgS+7eJvaWleZqlb4xP/F
	MS7VI0Wi+1ZgcxsQrx0F4st2oMRHgznVCSm0KsO0z2/rhVlTV06wvPMQCLhqzpTDRl6UJbhFbxC8Y
	N84flB/Bpgj6qoO6R1hzVQgmmcVMuYUROs50hLs4JU6jF5d6W4amW+ad/pQN4g0Ye9tNuhVetg0Q8
	uoQjEoK0mZ0W8OE7XEZs6XY5vO0WiYVoM2xvaZurdpQ6WdDWuE/ZgYvC3gbXMKLB3Wc8EspHhCRfz
	CXFkaRyKiw1sSk0JL4cIQYx85C7buKW0nPNFMicyYgtI2DRdtZ2VzR0W/l0HA1uFh33Z8tbsYVkw4
	6vLuFFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odiqr-000vKF-NX; Thu, 29 Sep 2022 02:00:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odiqh-000vIc-LY; Thu, 29 Sep 2022 02:00:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 8-20020a17090a0b8800b00205d8564b11so5094pjr.5;
        Wed, 28 Sep 2022 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=C5vB9AdNpMbk+2uUPlTv1wvt0hrX4ZZuVlJ7vkkQRH8=;
        b=hPDZmGiqxB9XD3Z6wxo4PZNRWs3oY/Iz5OeU+JgazAdaRNCYb0hY+XBfMT5h9LpDuK
         sCGI7yR8/B5SquXIbmemuUwjvIDSrPu4q0TQj4VgxJpWiQUjdojJRHZNtrxDqXrzln0J
         SC2HI4obfGuU+uLyFgsG6Jz52S87DuPUi+3oTAYb331UHYMDQuKvHA2vT1QADuBgiLVe
         7VSIb6tXofr7qFnhoUnL5WuTwLGNHphva9ycidtoa1lkJdflmrIUQCf9iwfFzPojQGuX
         dzg1bswH2ufICBvvHb6SrbK5MKAhZ6SJjKefrLNz0CNT44/RBeJw5+BJ9/93nNc0aH6Y
         FW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C5vB9AdNpMbk+2uUPlTv1wvt0hrX4ZZuVlJ7vkkQRH8=;
        b=vb+4wB2bOGYuxkHNutk29yEvygfzs1xLPlNbEu1q6LelbaYS8jOijBQoF9atVxMO+s
         N96N/0AbHDWsQ5PJypsyOICH1VNjBz5SiM826bbi+GH+QC3osHIGcQ0ARz7Ue9xqV8uu
         LtmajsHyCkGmcJQFokw9RF+jO3uFJYCkWgfG2KYGn4Wb/oyy3FL2r+auU6pO2dMSVdxy
         1arwPXtF1umZ6TbJc3n2Cg8eg8ejv6MK7+aUskom7RnRFPDoy8gcsMYImA50Rmx84dIv
         VsbYxZi/cfY5oQnS/Gz3Ohftx8dlyzjENfpSWnEiL5dv8UQDBqxIo1wOwDIFSJUhSdqU
         9fCg==
X-Gm-Message-State: ACrzQf39nVo8WPBUwv/gqvIkGkrhOJ17dnob3GOy1UFQaceVFmBhsF6n
	VPFZXH72bMQe9jvRHT76FGg=
X-Google-Smtp-Source: AMsMyM7ZzV1vVGJNs6nTmd5yrCePl3Paqmk+hVgLyyR8mFNJpaQU8/eOM+EA2rjQyhlE3+Pt5NXgtg==
X-Received: by 2002:a17:903:11cc:b0:178:aec1:18c3 with SMTP id q12-20020a17090311cc00b00178aec118c3mr994449plh.91.1664416823981;
        Wed, 28 Sep 2022 19:00:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:579:1b3a:f99f:1552:d82e:aa5a])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902d4c600b00178bd916c64sm4512864plg.265.2022.09.28.19.00.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 19:00:23 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	gene_chen@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ChiYuan Huang <cy_huang@richtek.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mfd: mt6360: add bound check in regmap read/write function
Date: Thu, 29 Sep 2022 10:00:17 +0800
Message-Id: <1664416817-31590-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_190027_749782_590E1E7F 
X-CRM114-Status: GOOD (  13.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Fix the potential risk for null pointer if bank index is over the maximum.

Refer to the discussion list for the experiment result on mt6370.
https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt/
If not to check the bound, there is the same issue on mt6360.

Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/write)
Cc: stable@vger.kernel.org
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v2:
- Assign i2c bank variable after bank index is already checked.

---
 drivers/mfd/mt6360-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 6eaa677..d3b32eb 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -402,7 +402,7 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 	struct mt6360_ddata *ddata = context;
 	u8 bank = *(u8 *)reg;
 	u8 reg_addr = *(u8 *)(reg + 1);
-	struct i2c_client *i2c = ddata->i2c[bank];
+	struct i2c_client *i2c;
 	bool crc_needed = false;
 	u8 *buf;
 	int buf_len = MT6360_ALLOC_READ_SIZE(val_size);
@@ -410,6 +410,11 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 	u8 crc;
 	int ret;
 
+	if (bank >= MT6360_SLAVE_MAX)
+		return -EINVAL;
+
+	i2c = ddata->i2c[bank];
+
 	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
 		crc_needed = true;
 		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size);
@@ -453,13 +458,18 @@ static int mt6360_regmap_write(void *context, const void *val, size_t val_size)
 	struct mt6360_ddata *ddata = context;
 	u8 bank = *(u8 *)val;
 	u8 reg_addr = *(u8 *)(val + 1);
-	struct i2c_client *i2c = ddata->i2c[bank];
+	struct i2c_client *i2c;
 	bool crc_needed = false;
 	u8 *buf;
 	int buf_len = MT6360_ALLOC_WRITE_SIZE(val_size);
 	int write_size = val_size - MT6360_REGMAP_REG_BYTE_SIZE;
 	int ret;
 
+	if (bank >= MT6360_SLAVE_MAX)
+		return -EINVAL;
+
+	i2c = ddata->i2c[bank];
+
 	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
 		crc_needed = true;
 		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size - MT6360_REGMAP_REG_BYTE_SIZE);
-- 
2.7.4


