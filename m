Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02513C44523
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=; b=h9JE1fGDcZfJY4AX1O01DGtte6
	LD4ollNx3Vt2yHUoDrWa0+/lOLMmMcDDw3WVa15GC+1tRNQQDcYKzMfqgrmsK+9JlLDZkV0t6DmnM
	fUPnO7wm7owPrGtSMUlOd03Vl3+ckHaE070YA9ghkvv4RWnujIneszbz3/nGM6/tudgSKCateHsA5
	WTnYuL2Sf/NKRM5UMN9cLG3D9oNrCPFQb04esAhNHNN944PoswlH8X+Iz828fpTUnrBAy9rvvZ4NY
	OowToix9YRwosssMbHVtBRtw9i95/U40rO6/1bHq6A/R4rKAA8MCHnImoIOZnd8yOk5Gs2uBU4CQZ
	SMf8nm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldV-00000002lJL-3XzA;
	Fri, 17 Jul 2026 16:42:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldR-00000002lEr-2crR
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:02 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c167aa9500dso422171966b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306520; x=1784911320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=WgIQ27XCCQeV8uYhP56R6J0/0lxKqXF8VxNa5asRA1el+k8NFqqTjnBQbqQ3oFbLTk
         zExyEOJotx3cOxKOvDTOR0XXAnaApQ2QjD8MyV3OdRZo/vln+yMCidzp8WYdW29Z88qd
         nPlsQHWuN8RYj/cJAYkpuiHxH9vUffCUsGNpFU6Gut+uDC5jstQ19w6b6QCUhgmSl4So
         wy9w4VJ+kyFirRp+pSUnxrUTDcB5ZUMFiBXZJmWaK57vyffsYOufIyQmNoM768ebOXkn
         6O9T/XO7uV6KQgxTj2JBtO3zDgFHcNEQilvkuLriP2dogrd1WauwyuwpHN0ZZo1xlFvl
         Z6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306520; x=1784911320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=lA81VCuJJOh+EBHWu6GznF87olYvn6IV/1UMlOGyOqeGggur/ISim3md4B45JrCSkt
         GUxp2IjcpbiIPhKQ/9nnw9QXVv6/j8MN/zviadZglCjE3blLl0+T+vYFq9Yb2uUv5Xeq
         R9u6rHDeHfwpsYnVBw070CPvXkgd64pX20ncN3sOnfRpIny9jrHZMmL7AtJa2cGafMq6
         KHOK8CNmLroBtBtVZZnz15I8jTbrMLKa3C1nsCt9ld1CLkBNl5PvyPWinE7SKRWbbwvY
         /wUX/ffAKWDJDpZ4JOwedkA0XhoeVorfn3GcFJ089ZXGdCo14Gidg+iJ0ZeD/ckRgzFA
         WSrA==
X-Gm-Message-State: AOJu0YyAJxXReyzjouU2Cn+SDHHo+vawMk8nIY8dDvnnbCS8PiErY1pc
	qahBk25LgbUgNa9MLxAZ+OJVPyDGywgR4fm0DfjpptQue0Sx3DI8kd+vmWunjbO2
X-Gm-Gg: AfdE7cn7c4/FyMNx1m2H+/LUSEww+ULcbORY0SAfN9O1KATnT4LqYBW+YY167yP3pbW
	wgbkuX6xTH9iw0rfJuHHAxCQpGKD5hxM2PewInXfgxIwXQ9XS5kPQW73uio2aEn/9PU8h2SZzfz
	2omeM8aW4AtQTpdwhefO/aX6XYvfxYKPV3NP1DHrsn/y1gGCgY0sjMNF+D5sS0GuTBq4gM/rx0A
	lOLcs8nLo2Vl6rnxqFxs6IABmfc20ZQ1xnQ3trVfCVRLgmnQkj1Spmq65SpZkGO6yc9oKHzHTrB
	MBhNWf7rnzGsyU/Q7GgdOCH9znb9DmqDF+5UvTGupf+n7JKZNYuR6OWfcxHV1SUhdMkYE1jHJIy
	kKFypT/c1LXcjOOoqZdJzoeUW5emtlao2/abEk7GASgw9+HM4dX7qdgt1+kwQOxviDKzYchYLDK
	+tCU/N2YcQ
X-Received: by 2002:a17:907:db02:b0:c12:8b1c:454f with SMTP id a640c23a62f3a-c16b457b132mr151894766b.2.1784306519677;
        Fri, 17 Jul 2026 09:41:59 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:59 -0700 (PDT)
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
Subject: [PATCH v2 4/7] dt-bindings: reset: Add reset controller constants for mt8167
Date: Fri, 17 Jul 2026 18:39:15 +0200
Message-ID: <20260717163959.714561-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094201_686239_DA458939 
X-CRM114-Status: GOOD (  11.64  )
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
index 000000000000..85d2d0e99c68
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
+/* bit 9 is reserved, unused according to data sheet */
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


