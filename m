Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3507BC38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 03:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h7yF1dXBnJEVhGGTIzHbHbpBrHmE7RRuUtKfNdRHcto=; b=QUREOPLojXHQu4rsbkYgUAlnIF
	LOC8IhKqUmzY1qZDQDX6ROm7aEEq02WmOX6pkhk0WT68D2Vib3seCiN2V5nFsoHJlElS9eP8V0+iN
	mjfqK7vctIjwWuAHASpOX+i+KF6aGTZZCWe+b2/gYvMlJ9JWO8G5srJqmtw1FxvoSADEvUBmThPAi
	eK9BYKPM9hLMcEXc+r/7GQJXNB44q/RApe9Kl92M63LEgaVN0ZYYvTBgkjtN9ZbsOLzuXDNVz2WeL
	qsN6jIZ6H7jYB7yyqfAoDdB4m0MR0axRNpeWxWmn/nsF/36rb5SdvbLMlX+jkTt7pW3XdB2GE652Q
	cFYb1KjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ontdX-00BiKX-N5; Thu, 27 Oct 2022 03:32:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ontd6-00BiI1-Ro; Thu, 27 Oct 2022 03:32:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso5059202pjc.0;
        Wed, 26 Oct 2022 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7yF1dXBnJEVhGGTIzHbHbpBrHmE7RRuUtKfNdRHcto=;
        b=gu6eTOkZtN4JP0DfX2VwONvMw+YB9vTjBp2U/9eEjpWrIdTvvb/NT8IBB/HSfr77T/
         KVU109xPoqhChnO4jEJJeNoR4PxuEiH/nAXSGrDwiBwAXDYj5CYtkIuQ1KlG5Q4jPy2a
         /mw69vD27HVRoam4QlHY4I8x6oJdbrxeOUjLEnJsyCgctGEqkezSz0C/2pICsRoGWGW1
         KKDcghoA6uiFfa96jQd/mQ8IQ/ySUBgXYphkyeiQYOdMfa2rNBeOauCMLxN1f6kzy/FU
         OPiSipbCxduZWTiG2SbeVpLYiA2gE90MJeOgKT9NtDNr4li1Lki+e+3JtuJxOzvZha/K
         eiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7yF1dXBnJEVhGGTIzHbHbpBrHmE7RRuUtKfNdRHcto=;
        b=BshEQJBVZ5Rq8zkvh+aJ8+MvUOngcyHvtqI0pt0aTAdupM1pVZgiwACDbHXVjL1v0Y
         Slx4w9AXL8F7QdMQ3RhHoERBl7NXIiTcSFjHGJK4uUx1f1EnKmRvDvKfHLp73guCNoDR
         Mx62jPWvX9ht8MuZJO9UUHSvNl4BQg4mG7GHFpStzDX9oLFBJaQqB/An0qtpHxHec4UR
         ITpF4D+R1l/P/ddXaerFZ3nbGMcpQR7lhaNcFEUth1XNQxiqMFD70rLerdyA19gvhgDe
         iPsQfn0mhvHfCossZOsMlsbUNe6rE6UTVmefZQLFUYUtvyHW4/d4qY2TbRbWQ7XRsb9b
         oiVQ==
X-Gm-Message-State: ACrzQf2ISYLIizJBAU1EMXoshlNCe3s2/rDsQxxfzCjd3R7a4zdNfaU7
	XdGxFr3J+UlORql2XG3C7f2isvJ5/O4=
X-Google-Smtp-Source: AMsMyM6oUvd42J9Qm3Kf9To8fT2/SccEZj3w8kvldWdNKTSEoPdsjH8KiGX20Bc8aBzrrQHNBi1Tbw==
X-Received: by 2002:a17:902:a60d:b0:186:61f6:d7f4 with SMTP id u13-20020a170902a60d00b0018661f6d7f4mr37042665plq.75.1666841542726;
        Wed, 26 Oct 2022 20:32:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47a:8591:f9eb:aa62:7d76:f953])
        by smtp.gmail.com with ESMTPSA id o11-20020a65458b000000b0043c732e1536sm65921pgq.45.2022.10.26.20.32.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Oct 2022 20:32:21 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	gene_chen@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ChiYuan Huang <cy_huang@richtek.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mfd: mt6360: add boundary check in in mt6360 regmap read/write
Date: Thu, 27 Oct 2022 11:32:09 +0800
Message-Id: <1666841529-12781-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_203228_958123_9669FA93 
X-CRM114-Status: GOOD (  13.26  )
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

Fix the potential risk if virtual bank index is over the maximum.

Refer to the discussion list on mt6370.
https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt/
If not to check the boundary, there is also the same issue on mt6360.

For mt6360 register virtual mapping, the normal range is 0 to 0x3FF.
Below's the backtrace in my experiment to access mt6360 0x400 register
with regmap_raw_read() and regmap_raw_write() function.

1) regmap_raw_read()
Unable to handle kernel execute from non-executable memory at virtual
address ffffffd4940c4c20
pc : platform_bus+0x8/0x2e8
lr : i2c_smbus_xfer+0x60/0x120
Call trace:
 platform_bus+0x8/0x2e8
 i2c_smbus_read_i2c_block_data+0x74/0xc0
 mt6360_regmap_read+0x9c/0x180 [mt6360_core]
 _regmap_raw_read+0xe4/0x278
 regmap_raw_read+0xec/0x240

2) regmap_raw_write()
Unable to handle kernel execute from non-executable memory at virtual
address ffffffe4a0ac4c20
pc : platform_bus+0x8/0x2e8
lr : i2c_smbus_xfer+0x60/0x120
Call trace:
 platform_bus+0x8/0x2e8
 i2c_smbus_write_i2c_block_data+0x84/0xd0
 mt6360_regmap_write+0xa8/0x150 [mt6360_core]
 _regmap_raw_write_impl+0x6e8/0x828
 _regmap_raw_write+0xb4/0x130
 regmap_raw_write+0x74/0xb0

After adding the boundary check, the above two cases can be solved.

Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/write)
Cc: stable@vger.kernel.org
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v3:
- Add backtrace log to help understanding what the potential risk is.

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


