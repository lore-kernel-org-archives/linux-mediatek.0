Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06C5C44523
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=; b=SLMjJmbNgKUekKH5aBZLLTdOqO
	J4XJ/sSXvwu/UuBamHBKAkGT29YmatF+DsNXPAxEGH3hh6bz0UzMYIamhGbbAClKETsi2HnnnRksv
	auPV3K9QKQtw8xnHRU9aP5DOtyUgKH7Po9mYTaEgPfhPzvLIYpo96gIP4/zfGnLLz9L8D+Lam2YNe
	gL2FbadXCwu3NiazWEELavWWzc1tcRMrwhlcUD04z2u1tSS8UcTIVUcTYAZUsRwXRfUEk130g9kSL
	v1S8drvF3pNCU2gjb+9YSfFHJ1eq6DrOaXmlUTwxV3RbYy6AudFb9+bdJZELNCPwuCmb17OHsUaEB
	weD++bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHW-00000002ZpQ-061H;
	Fri, 17 Jul 2026 15:15:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHN-00000002Zg0-2Aj5
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso7511705a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301308; x=1784906108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=SzIvW+/YtPug/5MbJGp6Sj9acb4AA25hnU2DvmYcSpWj9/AZdZL72PNx0swogSc6Bw
         +MK1zudnTgeFcKpQt4IORhnFBJFOgeNW9t/BBiIWgC9M+viN+tgQ4YmMhHUYntvJaFOv
         2BKh8YdiR4CUyJvHw0JXaJamV9oEGn5TFevEkQbTScHWkSJeYW89igcguIYAqeAnWunc
         vfEGIs8dB5XR3+07lOVrjEcYGNRxSEDwivwAiQXxTZhSmVUZr+Z5Y44SDbvjNF0y/QJK
         lSmbf/oCWB6eOY2DusjzScT+W5SiIODevU9FAhcCi5fmKHLoN+Hm8RlGXvhllUdsNfp/
         YfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301308; x=1784906108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=KTztaHfvjkJukONCyXp3DxIoRvrKZjJXXR8fWD3ww+m+sdptn9DldRb9Bp2EqTCyxm
         efhbuNKIkiLR5jCyZ9MXKakBQJzMOmT7y1/fLVHhsBbOKE/HJ3KdV3g3d7eA+SVVHsSw
         Mq3wo+Yb20c5Xol3cSmob15c2RkgPn7qr1DkMgF0nUO2OTn8w5OTzjvbkabPR5a3go9j
         H3f84GgJCdBMQr2Jx5dcZfCK0zvoN5OpxOB4U93PlcxEBuM4Zl/ZSTEA5w73Of1ihOcj
         4DjoOA43sgEU2UjNE1Mv0itwB6WVVVrUbkRs9NqGw6QhbuMQXvWuMGMNUup2Jflx97Zv
         vR/w==
X-Gm-Message-State: AOJu0Yz7etSmxKtpdJmPENhUcGengsvJRCKQCw0Gx//NWmjffNAwZL8Q
	IaqaLTo5WvwuG+dJkwF2B8uTTEd1El9QQqQaOqXGaK61v6HM4AzbY5nihMlfMCjx
X-Gm-Gg: AfdE7cnvtaQiyUC7XfzLHiYLvS8rGpSFAQieHhnT+8fuRtoWSj1h3Nk5wiWLvjk94PM
	WbFbSVpPWq/xFJRcPi8kJLgccFoKKBUyrCcqo3HJWh/JEcUA/bjgLeC2EKG6ZeAfjQ4DVR4KBOI
	Vaz9pFP84N55/5KdhQQN6IoYtaGI5kGXdwMDIad0H4raIZv+Bmki5ycular23U2PQCJaMh0sOp4
	6cQClc5XJNkP3ZGiBAyXgXtgCh/Y7voryOqXd7hNfqxpJIdfUiMubMl9EYmm2rXIxN1A8kfP9gT
	/WP1v1zuZj7P43RXUKkIddFRLjrXFFRubrj+1AVLGAkX6FwqQTqF6Lhb/vX0ZsaJl7+Da2K05o2
	l7dlNX1k+gTh/F41BjgubEV/3D7EdiMMeBF4cSxXfNfa+QZ9vh9QW5Sn4xHjpCCxSoVXsGjxF7w
	==
X-Received: by 2002:a05:6402:3554:b0:69e:35ae:8af9 with SMTP id 4fb4d7f45d1cf-69e65272664mr1237776a12.14.1784301307558;
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
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
Subject: [PATCH 4/7] dt-bindings: reset: Add reset controller constants for mt8167
Date: Fri, 17 Jul 2026 17:11:11 +0200
Message-ID: <20260717151134.678839-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081509_570011_6CCC871D 
X-CRM114-Status: GOOD (  11.44  )
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


