Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F2C7115D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 04:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+h//h1u4VNN8yQMA42JFOOJYxZB7jSPI+KUI4YrKMnk=; b=POQ3JoivevR+FiJbMGsjnnZir7
	7Q/hVYSfbjRSh79MHqZS8HgjgWVhUaLodBBJ43W71rIRDXbLicXFTE0LGAUbsOxto2lDwfw0u7T8e
	ekhO2Q1NIf4wXcBYIC3RWsps33wY+HX5w7Gofy8hdLeeKcAaJWEUPIp5w8M2uCDOwtYqOalDK3hwc
	txmvlZdzc+XeRWmOZaLxBz6pCANMmUdgT3q391dJ9CqMGLLmdeEhTIvm0ddY93FMy2O2g2gOFLMJi
	O6iHcRa3h1wdqxRBnmwiMH6V4uDu5EMN8usHOPzGyii88XNIXgVlf+FLg50H3vN+EKsFgY4N/1Ycj
	91pYOOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjWLB-00000000Qwv-36g8;
	Thu, 29 Aug 2024 04:00:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVMX-00000000Hjo-1juD
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Aug 2024 02:58:19 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 982DF3F183
	for <linux-mediatek@lists.infradead.org>; Thu, 29 Aug 2024 02:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724900293;
	bh=+h//h1u4VNN8yQMA42JFOOJYxZB7jSPI+KUI4YrKMnk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=k0TfSTEpDHA25lJfz6WwurOoElL6rwszdZqQtbwgI7nHeOX4BrrIWPYjcpI1oHiNl
	 w0cbs8gxgsW6cJysfeB187kHseIITXf1AliTcs8RguhRvj42Cv0m0iCtdQMAzRvFfT
	 EeMSPO1JCVVShJWEQqVvYoc7XNXVTiQC8NgK8+d6dyThzc4odzf0T9cN6T5IO4WHcQ
	 dcSp+kekwjPMaWVpWVZ0HYkBAiC/L2ODuocDVnZ9Gwd7ea6h/W9inNHrR/NU+VbPAO
	 QBN/DtoeURimInbJH6QxJDlLZdcDlwyuFw/M4vU/8upvhg6t7ZL0KLHyAkLu1M3UmL
	 oVeGx2zG/e6NQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-201e94a71a0so2015325ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Aug 2024 19:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724900292; x=1725505092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+h//h1u4VNN8yQMA42JFOOJYxZB7jSPI+KUI4YrKMnk=;
        b=G32kbZyAVHvwD3QZ6Cp66ypPD5Ysu2KQJJsaX+Hu6bFlmPI/ikOeU1LOLeQZd8Zkuw
         pqwEbDWyjLuhadT0cHSFz77txNdqeVV9lbvooEDr23rIDmFlxkjmJ41Tf4bDajLnUJD1
         gPnk+HCa+YxtkeFszePkyw4h6s4YOjnp7gC7ilE6MMIpwpY9X9r+k/smteLqd5xXtPzh
         iEUHBABYSGfvjtU9F37kbtxDYHwkxd9QuljTrH+4x3pqj4kW/wR3KQlB/OpcVkDi9vTH
         RGkNN3KVO6wqJkaP+XubE0ZxjBgJJgv6/SRRENve//qIwSzQ7EP5z8CtyBuLb/9kwyO1
         H1uw==
X-Forwarded-Encrypted: i=1; AJvYcCU6WqxgmFk8i7+FgqevdrMjXimtgzoZ9uo/Omsn3Ts80vApLsNO8x5QeVJ1sVSY0xjPARqVPVsvSr31SAgPPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7kwVPDzTkZ2osswB6+lTLReGnCxNyIR9kDzD6RQLDZJEOehx
	/4Mw+AJNv+JFpMuzJtdS79HeBi5EdPqobSJU2rDvmoIX+pYTuxwVq7en3F24DhnOAWn+mSZCmZG
	RiVrDQWllHvWpYginVcRehIjbLlG+tiM/m0+PMUspvgwmfnMCCGzk42uLhluVGY5kS7oqPYpvI3
	N49OVsfrZX1w==
X-Received: by 2002:a17:902:7087:b0:201:e2db:7be7 with SMTP id d9443c01a7336-20516743038mr2750575ad.13.1724900291982;
        Wed, 28 Aug 2024 19:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmbNWB34P18PQrxN3YT3XzJ2HAHmZtxZEyX9snuPC9wbBVBdVqO8dkGpqgtAZz0xb2gwNf0w==
X-Received: by 2002:a17:902:7087:b0:201:e2db:7be7 with SMTP id d9443c01a7336-20516743038mr2750335ad.13.1724900291565;
        Wed, 28 Aug 2024 19:58:11 -0700 (PDT)
Received: from solution.. (125-228-254-191.hinet-ip.hinet.net. [125.228.254.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155528d9sm1666315ad.264.2024.08.28.19.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 19:58:11 -0700 (PDT)
From: Jian Hui Lee <jianhui.lee@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Axel Lin <axel.lin@ingics.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: mt6359: Fix UBSAN shift-out-of-bounds
Date: Thu, 29 Aug 2024 10:58:07 +0800
Message-ID: <20240829025807.2455823-1-jianhui.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_195817_801514_5A287AA0 
X-CRM114-Status: GOOD (  12.78  )
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

A shift-out-of-bounds will occur as caught by LTP fs:read_all_sys, if
modeset_mask has not been set for MT6359_LDO_LINEAR regulators.

Example command on MediaTek Genio 1200-EVK:
 # cat /sys/devices/platform/soc/10024000.pwrap/10024000.pwrap\:pmic/regulator/regulator.28/opmode

This patch initializes the member modeset_reg to zero, and checks it
before any further actions.

The related log:
UBSAN: shift-out-of-bounds in ../drivers/regulator/mt6359-regulator.c:281:9
shift exponent -1 is negative
CPU: 1 UID: 0 PID: 4473 Comm: cat Not tainted 6.11.0-rc2-custom #1
Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10 10/01/2022
Call trace:
 dump_backtrace+0xa0/0x148
 show_stack+0x20/0x48
 dump_stack_lvl+0x80/0x130
 dump_stack+0x18/0x30
 __ubsan_handle_shift_out_of_bounds+0x144/0x250
 mt6359_regulator_get_mode+0x154/0x160 [mt6359_regulator]
 opmode_show+0x84/0x150
 dev_attr_show+0x28/0xa8
 sysfs_kf_seq_show+0x90/0x180
 kernfs_seq_show+0x34/0x60
 seq_read_iter+0x1f0/0x518
 kernfs_fop_read_iter+0x170/0x220
 vfs_read+0x288/0x338
 ksys_read+0x70/0x120
 __arm64_sys_read+0x24/0x48
 invoke_syscall+0x70/0x120
 el0_svc_common.constprop.0+0x48/0x138
 do_el0_svc+0x28/0x58
 el0_svc+0x40/0x1a8
 el0t_64_sync_handler+0x15c/0x178
 el0t_64_sync+0x1a8/0x1b0
---[ end trace ]---

Fixes: d6208ba87066 ("regulator: mt6359: Remove shift fields from struct mt6359_regulator_info")
Suggested-by: Yu-wen Fang <yu-wen.fang@mediatek.com>
Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
---
 drivers/regulator/mt6359-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index c8a788858824..24b1dcc5eee8 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -88,6 +88,7 @@ struct mt6359_regulator_info {
 		.enable_reg = _enable_reg,			\
 		.enable_mask = BIT(0),				\
 	},							\
+	.modeset_reg = 0,					\
 	.status_reg = _status_reg,				\
 	.qi = BIT(0),						\
 }
@@ -270,6 +271,9 @@ static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret, regval;
 
+	if (!info->modeset_reg)
+		return REGULATOR_MODE_NORMAL;
+
 	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
 	if (ret != 0) {
 		dev_err(&rdev->dev,
@@ -303,6 +307,9 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 	int ret = 0, val;
 	int curr_mode;
 
+	if (!info->modeset_reg)
+		return -EINVAL;
+
 	curr_mode = mt6359_regulator_get_mode(rdev);
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-- 
2.43.0


