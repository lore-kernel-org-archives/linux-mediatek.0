Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73367C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=; b=ba8/OEkiGlhXhW7G81wHIlH7PH
	FPgTvb7QttPkkdQcHhvbxpncatPfCTfVfxb0T2Ols9/mfiLaP5m5fgCeKj5YvyUniuPlBj3BRlYAW
	br8+GbGEC0+7JsajTXYr1ydPYDzortTDCSIX/ziA831ezzgIFTZQx0ywDepKTRJF2F8z8Dp/7NMmJ
	6HlenSjevicU2HDFq53xyQdhd+tLzYZ+9ylAiQqK/B7VlfGJngswyUjX4zn6sM9ywlJGJXhCnvBNM
	09cbFu9+tjob2eUxgcaa3I9oWUahMYtBwJwy15jU1yL2GdTlckkRlusILx19tW7JKRhgURLrSg9Mz
	i6K2VcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63T-0000000ATMd-1Ueg;
	Sun, 09 Aug 2026 16:07:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63Q-0000000ATHc-2OYb
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7051355e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291635; x=1786896435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=hSeBhEjPIueUW+ljLoioyOSuuB0s3aambmbFe8+x5nQKfhXV1aLvh1mv3+Z01RkBZE
         IYL/I4lhUQMLCeAQc0OvMzP20lR6nfdj9CaqWZ9zBEPuhp0W7mzZIQ/wON/4muLdik+G
         ZVWyWl2o8A9jIKhIqOLqSNycNhM/2cTjJlFsJq2nXemGoJvXh4dhR/0wzHaiuGcRW8rz
         P6f6D2Ore8Ck1SSBCE6rsd34I8x9yhiruue3WELCVsf1JMFfa2K7UhXRS/m2DRe5iERn
         qpzOw5qnaU7GlfyVd1zlxQOZe9lwLeCea9j6I3URvaTDIHkP5W/nU/rJYD+P14U2fbUS
         yQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291635; x=1786896435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=PA4keepUT3MF4CVykKOZRLMl/sogj3ciJfWpgz7aWsU90qVw+2UONfqKn3tVgLzDGt
         vt8X88ODSAvzNcF2O+ayUiumN9GOVYIHn+Rwja9bKWSlq1aXnhJ/D/PF5rCf03xDpKW5
         hsn7MKMNZ6ciU+5MO/mqR/YRD8k2tUJt5adVJulfvlwm/7CZ5oK6N0qGmqiaGprA4h/e
         Fr9gb2XoxnONUOtA/O7vZh9TQOhTWaUCSHZCp0Efrr5j+gSeN3PYW4CS2c4PsQmGyIBW
         Xn4fFevgsKUbwo2hnAAvxsoMl1VrHD+F/oEwQxJckkV5gTUjq+j2q4T+3hcMO0akDamD
         LxrQ==
X-Gm-Message-State: AOJu0YxxThcbvxlDMvXflX7tIctL5bV0OucHfV5tYyLRdXjTnrg5jVut
	9b78gKlgOmBNmNPzMPuDfRBZ6crxb4MJDPDlFQV/39deG1Dz/OZukpJmVvvJi50d607NyA==
X-Gm-Gg: AR+sD13xSGhdIBjE43SF2C0Qb8CKpcy0Bm+/Q0rARs96Xl6QG5kuncOGDDsxJCVPqmc
	Eo1zrKdkl8ELvxlxPCB330+MIewnOhzEcBusU6as0ydyyUJtQQ0rsj6ltdYz8PsiMLVUtfRwGVE
	ZpiM8azjawd1Td7qGcGk8HBfY2QSfPitw3ZnbNiuD6y1eQpXGiFATiwV2QID48q2SeLhE4by749
	py1LKnKQlM6SbjOvYA30wPjNtQrmv25oKZCaQwXQFIftL04eIIoAqPKHjMyCf9lCbsGXjP2Kv/2
	tJznhU4AeYLlieq8iMfTPwlAhJw31Q2r6NZl04I2tAhtem4skf88eTB5yrtR0y54UvFM8ibLOkX
	wZS1peQQg0P+DAH11g2GQefj/b9HMPujifE8lTG6YX12YYeOeYbv8Cgulmd4y01DGc/HE5ri8Yk
	ZtgPblZNlBKiZ8fZnbC1iXvRF4L5LHSb1Zw7UKOHq5ek7n6PC/iK3jzA==
X-Received: by 2002:a05:600c:48aa:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-4994e7e6e99mr318069915e9.17.1786291634595;
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/8] dt-bindings: reset: Add reset controller constants for mt8167
Date: Sun,  9 Aug 2026 18:03:29 +0200
Message-ID: <20260809160643.33991-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090716_627160_40BC1C40 
X-CRM114-Status: GOOD (  12.20  )
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

Add the various bits that identify watchdog and mmsys resets. IDs for
mmsys resets restart from zero as they are used in a different device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
new file mode 100644
index 000000000000..af8a3e499f8b
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
+
+/* TOPRGU resets, these are actual bits in the register */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+/* The data sheet describes bit 9 as "reserved, unused" */
+#define MT8167_TOPRGU_APMIXED_RST		10
+#define MT8167_TOPRGU_VDEC_RST			11
+#define MT8167_TOPRGU_CONN_MCU_RST		12
+#define MT8167_TOPRGU_EFUSE_RST			13
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14
+#define MT8167_TOPRGU_SW_RST_NUM		15
+
+/* MMSYS resets, these are IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


