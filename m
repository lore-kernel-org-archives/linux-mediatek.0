Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E00C79F99
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=; b=icNnEYhcBBsL6hikLKZJtzZNpk
	LhHdeD6KAijsnTMPt8bnAo1CjwCXrHLjuKjHCfmL8PF1cSbqmm2KnjsoX4ax0F4YIcxY2HquyvB7C
	6FMsFEuylIscWopufYMIIica0D0nAo0y7wgXg8tLGL/4MmuXAat6d3ucpsD7rmmO3PTOjo2XLab5v
	kHUmeZqsP5lKC5N9PWYVXbf7KVkDsawOnwdIF+vjHQ8L0QP3QN08N/wW53K1awBSPcI9l0vVSDpb3
	2zKC3arjBXLqTTlfoQRe/us3tK6JBzNs8w1oitWKjaKgjCPfZlfpf7JT7t9xRwHi0RGPkkxiqKAZs
	0nH+AHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rxd-2Pky;
	Tue, 08 Sep 2026 17:44:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrz-00000009rrX-1Er1
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso40453845e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889469; x=1789494269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=jpRUrm1oRQJEtzgvNIgOtesk2TZr9+KP48RW9mgbGb2fkh2Cz5arLw61k4+TWbkii/
         jI2Sqw9KHxcPDvd60rRaFoQkYpQh/wnRwOHLLjpUsTsB+u7+ir8ZiuK67wDFpGlAvbxH
         rVOl7MULIcoaHeAD8dGNr53aAyFgb2tH0CKmlQM+pESHqG8N3uiKRjPVFn++uAnIp7wC
         P1rAUO7/tg9uzPZYWQZw+M7krJ1K++agShH/a9BGzyczCk5PU/oX7Q7QqUxRKEK++FDw
         jLlxOPCUwoMAn0ANzASXQoNQqFQBitF+7Xihe0oG9iuysoKULLMt08W+X6+aY7TEqBL0
         tdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889469; x=1789494269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=N3vkusBsPVYVIcnzhOKJ2Rv8kbILaqGSciERiL4CbJlC+Q5fciXqOU3/tO6uH/M53D
         4G+rXlYPXGw/u2T1MlTQiJRkjMiWxhWaj2kDc100NhyNIABwKB7f9G9gvLRTlelijzMq
         bwhRPGIaJlSLowjciLdqM1Ib9qMzuenUeRJ3tawoAhgQbbeUWVSjw1E44RKl9OG2t5H8
         MmbMpABDR1dPRlKsUS1jYnfbRV3Xx/c9wyPXh1f1b8hH5upEtFF1supOjwwyWiwmxLYS
         SsVlxAK6+5lNgsIqSU5SFQnNc10aVdPSJI5MG6ytTDQ1gohuv1yObk2DAr90E4WTKeUT
         wLIg==
X-Gm-Message-State: AFuF++nCZcM+p89JytUOQzFpL7vLkZ67UYsalhilt9rw38kYO+0JgBiw
	QYTRJ8c4IsdnEmBu0WA6BxkFC5ruEHz+Dr482nN2drlFPEoPd+IfAIoPouWGobIM
X-Gm-Gg: AYBFou2u4FdH0n5o5gOcfk/ju/4oAdmTbCIDDtOPxx5emUJy5GGD+hXhkbRZG7B5NSP
	YjkJl9i8+mj4SbbfpQuXaSI9hk51BHuvsVDxfoIdaSE7TsQpB1pkNfcyb0uw5FmqXHzB+MZySL7
	TyrX5lrOYeuQBPLjPUpO32kBF33SjaN5ZKHebynX2hfNnJIhgHxUcSk5KTIVc5z3OwAS5Xyz+Qh
	LrEWuDPN865rB49DW1Ktmb2uZDPXUpCoKfQTeN/js8S9QCHTQ+JNyPTNpFiGS8b71ZyPsojdqVh
	DYUGePtU6kFGQ+geDQKHcXBXqnTSJpDxYg73e8S6n5znuTQjaS1tuCLPjJ0Om6raj/KpZnZ5x9O
	TLJlFTSHQN3kTfEj+zFaBm9xukGZu5wZaYC0naMKGSYK7yPcgUc+g4QL6FYhTudfRaJw9TYkMsz
	RuPRet9G5MMMr6vWaY/i2ZQuiXg6S5+CpTIUWs3tA1y16LwFrIZ/YFy57Y9Wk2TDJBrlo=
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr202027975e9.32.1788889469206;
        Tue, 08 Sep 2026 10:44:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Tue,  8 Sep 2026 19:38:30 +0200
Message-ID: <20260908174259.9009-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104431_356064_DBFAC835 
X-CRM114-Status: GOOD (  14.90  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
resets instead of 12, and its reset bit map table is different from
mt6589).

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt8167-wdt.h b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
new file mode 100644
index 000000000000..1a24bfe079ca
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+
+/* TOPRGU reset IDs */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+#define MT8167_TOPRGU_APMIXED_RST		9
+#define MT8167_TOPRGU_VDEC_RST			10
+#define MT8167_TOPRGU_CONN_MCU_RST		11
+#define MT8167_TOPRGU_EFUSE_RST			12
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		13
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_ */
-- 
2.43.0


