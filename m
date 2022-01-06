Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C3C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGfc9hwLUa85HpGFNur3y9Ryh/CgvfwzygOcV3Kd4Uc=; b=WmMnFR6WFaBMdm
	eTOAoz1y4NDJUi4tXaFty0tbtc2ZZo9WrR2Vk5t/EaVKKBB5EDX0Q1IBQLuvxknD6MLKk7Ke2cVKA
	lRlsTc0gCqkyyfGEAiWTqUdE9dMGbDCDJdoWsta14EG2NcLpP0OunCp+kSD6Fjpvkt3h/NZKZEYh5
	Zeo6yB8xK7Ro0hga1wOcQWgcRyqPN8rLUZ8Qe/KbsTzoxi4A2xjy6DvD2h6I2CWTdboi43doxA4nk
	iJCpGYgMnoFHTepXyg94xOpavDJ3u1ffT4RmZu0hDPIvQ/P7RxHOUVquBNYlxEYbymxC/TkLBNZn4
	s5aFg+cMXoXRr6y6ZupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Mfg-00Gmty-Kr; Thu, 06 Jan 2022 06:54:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5MfL-00Gmmi-3n; Thu, 06 Jan 2022 06:54:28 +0000
X-UUID: 8b0dbaff8bd84d8c8cc73f406d6c268f-20220105
X-UUID: 8b0dbaff8bd84d8c8cc73f406d6c268f-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 207193118; Wed, 05 Jan 2022 23:54:20 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 22:54:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 14:54:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 14:54:17 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH 1/4] mfd: Add support for the MediaTek MT6366 PMIC
Date: Thu, 6 Jan 2022 14:54:04 +0800
Message-ID: <20220106065407.16036-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220106065407.16036-1-johnson.wang@mediatek.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_225427_206697_F867BD7F 
X-CRM114-Status: GOOD (  12.27  )
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

This adds support for the MediaTek MT6366 PMIC. This is a
multifunction device with the following sub modules:

- Regulator
- RTC
- Codec
- Interrupt

It is interfaced to the host controller using SPI interface
by a proprietary hardware called PMIC wrapper or pwrap.
MT6366 MFD is a child device of the pwrap.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 drivers/mfd/mt6358-irq.c             | 1 +
 include/linux/mfd/mt6358/registers.h | 7 +++++++
 include/linux/mfd/mt6397/core.h      | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 83f3ffbdbb4c..ea5e452510eb 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -212,6 +212,7 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 
 	switch (chip->chip_id) {
 	case MT6358_CHIP_ID:
+	case MT6366_CHIP_ID:
 		chip->irq_data = &mt6358_irqd;
 		break;
 
diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 201139b12140..3d33517f178c 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -94,6 +94,10 @@
 #define MT6358_BUCK_VCORE_CON0                0x1488
 #define MT6358_BUCK_VCORE_DBG0                0x149e
 #define MT6358_BUCK_VCORE_DBG1                0x14a0
+#define MT6358_BUCK_VCORE_SSHUB_CON0          0x14a4
+#define MT6358_BUCK_VCORE_SSHUB_CON1          0x14a6
+#define MT6358_BUCK_VCORE_SSHUB_ELR0          MT6358_BUCK_VCORE_SSHUB_CON1
+#define MT6358_BUCK_VCORE_SSHUB_DBG1          MT6358_BUCK_VCORE_DBG1
 #define MT6358_BUCK_VCORE_ELR0                0x14aa
 #define MT6358_BUCK_VGPU_CON0                 0x1508
 #define MT6358_BUCK_VGPU_DBG0                 0x151e
@@ -169,6 +173,9 @@
 #define MT6358_LDO_VSRAM_OTHERS_CON0          0x1ba6
 #define MT6358_LDO_VSRAM_OTHERS_DBG0          0x1bc0
 #define MT6358_LDO_VSRAM_OTHERS_DBG1          0x1bc2
+#define MT6358_LDO_VSRAM_OTHERS_SSHUB_CON0    0x1bc4
+#define MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1    0x1bc6
+#define MT6358_LDO_VSRAM_OTHERS_SSHUB_DBG1    MT6358_LDO_VSRAM_OTHERS_DBG1
 #define MT6358_LDO_VSRAM_GPU_CON0             0x1bc8
 #define MT6358_LDO_VSRAM_GPU_DBG0             0x1be2
 #define MT6358_LDO_VSRAM_GPU_DBG1             0x1be4
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 56f210eebc54..1cf78726503b 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -14,6 +14,7 @@ enum chip_id {
 	MT6323_CHIP_ID = 0x23,
 	MT6358_CHIP_ID = 0x58,
 	MT6359_CHIP_ID = 0x59,
+	MT6366_CHIP_ID = 0x66,
 	MT6391_CHIP_ID = 0x91,
 	MT6397_CHIP_ID = 0x97,
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
