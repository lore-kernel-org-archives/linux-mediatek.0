Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E618C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5UpEGTKOl0eSDEbFcM4Pydc/ehl+1Ra7PI5eqi87IM=; b=blrar+rMfUuMYT
	cc1MKrjbexHTy8cev9mORnIQ0/ZpfbYUF4zJw6Ft8oz9N0bWZYxw5wUpcCEq3xQnuTwOkFUt/yd34
	WVS1ceX7FEryM2Z3NfAg533wIHEkK4Sx1nkCFBFo1lbW7b28ajVqxgjW8sjZeQhN6lbjoPuqMx7n/
	NcS9BrYIflgikrdsLO2wJPIxDtHlFjXrbQ0ktxUg3LFgRgm/OSjtx8mrVuPm0bEBZnydOprfHMYpD
	jRtr8SKewIRwiosxR0Oi9FDF4ZGywUxmTlo+dCtmcYLoLPWTCaXCGQ8Rh85+hb2GhF6hi/NfQekG9
	6aSxQ+zlvkzjhMnLhK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvloS-0089oc-7J; Mon, 30 May 2022 20:16:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlnA-0089CL-Sb
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id u3so16004209wrg.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dM1Miawze8sKsOoDP6eNmyD3lGqsAxM4OZW/CsiBCqQ=;
        b=DV2NtNINZimMJqxbhbxmkjmSZbFIXt24MmqWcuL8/ZvoThgLXtp65oYm46Qeakffzp
         8YiwMlunn2bwit89barcdfiiBdM1VgK6D127PSqRqZPGniRfU8r4b2fPz4sDdo5G9y77
         Kl3OQVuwTNBNkTr5qh/edlV6c4xN3cHk3LXZAqoB6py0WCQHzq5ovmoWOWF31g7x2Ntx
         r2DOWTOIsoO7MxsUbK5Bpu2HFOYlbuAdMIx7iyTj/RHJpvNIEwW+E6NxPl/2nCVgsBQC
         2OjX2o7X8EMlkC0ZIOh+kdfCyv+s2p1+KbPalUDTcj0g2XgHloTLysG/DR4T1qKo37IF
         REog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dM1Miawze8sKsOoDP6eNmyD3lGqsAxM4OZW/CsiBCqQ=;
        b=CWXWdGtr23/wU5MamYoLuWLdnsEpcjKaYNcQsDzDWm1oFoGeSytp8j/E+cbMhsi8dV
         1CephA6VjpLQQExU0Oxf32VlVaPdMVB/ggOOI/u7VMh8R/diXb4qjkPiACoxWjDMqIH0
         xeBit6st7GTqkDFLT+7hEEFgQlS+xCFMKxWTAkDV/8aCVHc+OwFYuN/If72Ff6iRf27G
         5hpsVNDiIHp3UYWR6oO1ryxwH4FR+DRobgcSEovLAHRnlzmQ4C8Sb83ErkQBbrNYZGwq
         XBew/+U/mMIxVqRGEkRzhpcHjrsoDbBQyW1EIzVrreCxrH/rJMbFaDKbzpRG2rlOpNOd
         kxCA==
X-Gm-Message-State: AOAM533ax7TuTrwO/KvwWwt1A0OE9CVALAo7OcbluAjLVHpiJ3g1YcBq
	a2/kRCG7RAgyV6dM/z/lBiEtRA==
X-Google-Smtp-Source: ABdhPJwSSjliAbJddGUfeFIGpLGf9IXHfVrDvhvqnHzFPZT6n2sJsLeNwQeWBnxlnJ7JxvHZVTrllw==
X-Received: by 2002:a5d:6051:0:b0:20d:d49:26b8 with SMTP id j17-20020a5d6051000000b0020d0d4926b8mr45843588wrt.454.1653941705665;
        Mon, 30 May 2022 13:15:05 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:04 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display path
Date: Mon, 30 May 2022 22:14:34 +0200
Message-Id: <20220530201436.902505-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131508_960903_81FE890C 
X-CRM114-Status: GOOD (  11.58  )
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

Right now only the DSI path connections are described in the mt8365
mmsys driver. The external path will be DPI/HDMI. This commit adds
the connections for DPI/HDMI.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
index 24129a6c25f8..7abaf048d91e 100644
--- a/drivers/soc/mediatek/mt8365-mmsys.h
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -10,6 +10,9 @@
 #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
 #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
 #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
+#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
+#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
+#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
 
 #define MT8365_RDMA0_SOUT_COLOR0			0x1
 #define MT8365_DITHER_MOUT_EN_DSI0			0x1
@@ -18,6 +21,10 @@
 #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
 #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
 #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
+#define MT8365_RDMA1_SOUT_DPI0				0x1
+#define MT8365_DPI0_SEL_IN_RDMA1			0x0
+#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
+#define MT8365_DPI0_SEL_IN_RDMA1			0x0
 
 static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 	{
@@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
 		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0, MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
 	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
+		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK, MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
+		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
+		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
+	},
 };
 
 #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
