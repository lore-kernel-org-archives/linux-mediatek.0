Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F05D15D82
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTVtbHUUOZj0Fo+dP6D7qhW4pSqQbmSUEEadn5eVpyk=; b=uvItQ4DXaLjlow9XaBOqM7XeWw
	vcVwU1dO7vLN+bUbx3mS/6G7FxSe0z2TweNRM2LSTCbCRTYP5VbXpTgy0zPSvk4SsWPpDUOXTlnQd
	+bi775BiFv2WZq2SilOcXNm0Q2KgDD4PY0GokTCFlMlgzwD7L+iLohmvz2F64T6Wm+Wdlq4+3TWqV
	9eOdpJm0gtEaWJkUWHNnIpccBkr+tMQOXGYy2XRBWGSnhjAGcRN8MXo+HYrPuP0NrdUbcf4VjNJvs
	S9F3vHLXBOvNHgRquEw2cLB/NHs56/GpaearDlEUP0WCH84U8oclGIqiWSF2kcK94oGItjdBSQYAO
	giBkzFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rNA-00000007CgA-3XwH;
	Mon, 21 Oct 2024 12:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rKx-00000007C13-1Ueo;
	Mon, 21 Oct 2024 12:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uTVtbHUUOZj0Fo+dP6D7qhW4pSqQbmSUEEadn5eVpyk=; b=rAtVaag3/H6ggKyXdPktsw6djq
	Uaz4AknvHuSpYoChAAgb41P/LoEbQcgWewn4MU7N0BGPaD8cCJYjASA/dPbpYah69yayOfkJ95Lzh
	NFod06VvLL92sIt0AH0mNI6TuWt/mV8z0pMEqv4IVLurGe/v8oqznN2v9AhGm636l5O9TCCxTIOxr
	2U4UDOu1eWxLrCZdtfaxityFzQtjG5a07UeAaMLMYSFG6hbq9z1o9Uc9aAuYWSWIN4kzhgoLiKsyf
	pzigbOCzg3GF0XOwJe3R38cFMMO8VTKmxa8nDMNyiAVgmZvudf0E1k4iiO77y9gvTgWbAuVNHR2GA
	lluhGQ3w==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rKu-00000007uaF-0ySr;
	Mon, 21 Oct 2024 12:16:38 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso64474811fa.2;
        Mon, 21 Oct 2024 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729512992; x=1730117792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTVtbHUUOZj0Fo+dP6D7qhW4pSqQbmSUEEadn5eVpyk=;
        b=InhaNGxVJGrWWmkjsBcmuJR9V/j7RRlYAWZqby1gDmZKSreLnxp4w/qhgp27Zt+CUs
         5k393magUNXVEMxgR+4idi13II1B6T6ABJeA4mVtj6i+vjITXppGVjwB8yOA/DFJqpnm
         6QR/vhKH2s2oD7e1Vc9/GI3NbNoC0EUbbkjjhREXaC4rIDI4Q8qJxq0VegaMm/FY/vxF
         SoU09uILCmn4Lffu6n7+xcq8fPzMXFIz975CO7/LJdBc/9Xj2DdhC089qdroA3Fi4lI8
         s5DG6qgXXs48raYHfSrg3fKlWAfmJ1jnWtljp0LUOacIkMaDJjiFnqRy6+o8T+nfAnun
         5xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512992; x=1730117792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTVtbHUUOZj0Fo+dP6D7qhW4pSqQbmSUEEadn5eVpyk=;
        b=s4JLulP775tBnjJ3JPDFo1R6KOe2nPMmlwIWFNEEPnGchYa5dx8cjMkEMny1XYQ3tC
         8q/zmapcTHSOGw1AFycdxkTOYo9HQ45J0mOcwd7cxhG5v2eYsY+e9Q0fpjY+EyokbxEh
         86bdQbvwKjLG3SJy9pt/HbM+vZ0beSwfPKDdhfdr8x7NUVXEgnf0qjS4Z2Y7gprtoZ1p
         zI+7NhMS1UX0olhXfnTMCQp6Wp293NjyYY8CzQmoOW0e1e55gy1e3lPoqCPKLyuHn4c6
         S2m1cGrGLCdcfidEBon/F90VMab2Lpju3GDCV+fEiPnl7hFLnOvVnhR6ZtswXqc2JGgs
         Datw==
X-Forwarded-Encrypted: i=1; AJvYcCU9XiZEpu+V5yBeWdx+hhtpGCtKTuMEFvFAz4kNu2G+ZguD1xqfPFhLe4iRJbtTIs/06LDOS5Gixgpi6AH6rMFR@lists.infradead.org, AJvYcCV2lqtrt4ArFHML+o/XTX2S2NYFxIdjvaFVKxsiDRbY55SJcnPilJ/HestLz5ezy3KudVfXOw6kPeUP58qJdro=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/fidwK95csQsT/eC7adyUPc4csF703C4zJ4mF9cKj9tn1twh
	fdzUucYVeQi5z4Lov3GsU+8x1kxMa5vsfIYfrD2yn6ph8S2gUWYz
X-Google-Smtp-Source: AGHT+IEm0Ja1MxSFcWf7f2KGhUWcvjXbHvNe9J2o5guzSmTzD587KByO1eC9ACbJeOYsW3chN/7xMw==
X-Received: by 2002:a05:6512:3b89:b0:52c:cd77:fe03 with SMTP id 2adb3069b0e04-53a1544481emr9066938e87.14.1729512992115;
        Mon, 21 Oct 2024 05:16:32 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6ee6sm197068966b.4.2024.10.21.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:16:31 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: clock: mediatek: Add bindings for MT6735 syscon clock and reset controllers
Date: Mon, 21 Oct 2024 15:16:15 +0300
Message-ID: <20241021121618.151079-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021121618.151079-1-y.oudjana@protonmail.com>
References: <20241021121618.151079-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_131636_462228_F7E560B0 
X-CRM114-Status: GOOD (  14.91  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add device tree bindings for syscon clock and reset controllers (IMGSYS,
MFGCFG, VDECSYS and VENCSYS).

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/clock/mediatek,syscon.yaml           |  4 ++++
 MAINTAINERS                                       |  6 ++++++
 .../dt-bindings/clock/mediatek,mt6735-imgsys.h    | 15 +++++++++++++++
 .../dt-bindings/clock/mediatek,mt6735-mfgcfg.h    |  8 ++++++++
 .../dt-bindings/clock/mediatek,mt6735-vdecsys.h   |  9 +++++++++
 .../dt-bindings/clock/mediatek,mt6735-vencsys.h   | 11 +++++++++++
 .../dt-bindings/reset/mediatek,mt6735-mfgcfg.h    |  9 +++++++++
 .../dt-bindings/reset/mediatek,mt6735-vdecsys.h   | 10 ++++++++++
 8 files changed, 72 insertions(+)
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index 10483e26878fb..a86a64893c675 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -28,6 +28,10 @@ properties:
               - mediatek,mt2712-mfgcfg
               - mediatek,mt2712-vdecsys
               - mediatek,mt2712-vencsys
+              - mediatek,mt6735-imgsys
+              - mediatek,mt6735-mfgcfg
+              - mediatek,mt6735-vdecsys
+              - mediatek,mt6735-vencsys
               - mediatek,mt6765-camsys
               - mediatek,mt6765-imgsys
               - mediatek,mt6765-mipi0a
diff --git a/MAINTAINERS b/MAINTAINERS
index 2ce38c6c0e6ff..25484783f6a0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14537,11 +14537,17 @@ F:	drivers/clk/mediatek/clk-mt6735-infracfg.c
 F:	drivers/clk/mediatek/clk-mt6735-pericfg.c
 F:	drivers/clk/mediatek/clk-mt6735-topckgen.c
 F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
+F:	include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+F:	include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
+F:	include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
+F:	include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
 
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
diff --git a/include/dt-bindings/clock/mediatek,mt6735-imgsys.h b/include/dt-bindings/clock/mediatek,mt6735-imgsys.h
new file mode 100644
index 0000000000000..f250c26c5eb4d
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-imgsys.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_IMGSYS_H
+#define _DT_BINDINGS_CLK_MT6735_IMGSYS_H
+
+#define CLK_IMG_SMI_LARB2		0
+#define CLK_IMG_CAM_SMI			1
+#define CLK_IMG_CAM_CAM			2
+#define CLK_IMG_SEN_TG			3
+#define CLK_IMG_SEN_CAM			4
+#define CLK_IMG_CAM_SV			5
+#define CLK_IMG_SUFOD			6
+#define CLK_IMG_FD			7
+
+#endif /* _DT_BINDINGS_CLK_MT6735_IMGSYS_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h b/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
new file mode 100644
index 0000000000000..d2d99a48348a0
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_MFGCFG_H
+#define _DT_BINDINGS_CLK_MT6735_MFGCFG_H
+
+#define CLK_MFG_BG3D			0
+
+#endif /* _DT_BINDINGS_CLK_MT6735_MFGCFG_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h b/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
new file mode 100644
index 0000000000000..f94cec10c89ff
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_VDECSYS_H
+#define _DT_BINDINGS_CLK_MT6735_VDECSYS_H
+
+#define CLK_VDEC_VDEC			0
+#define CLK_VDEC_SMI_LARB1		1
+
+#endif /* _DT_BINDINGS_CLK_MT6735_VDECSYS_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-vencsys.h b/include/dt-bindings/clock/mediatek,mt6735-vencsys.h
new file mode 100644
index 0000000000000..e5a9cb4f269ff
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-vencsys.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_VENCSYS_H
+#define _DT_BINDINGS_CLK_MT6735_VENCSYS_H
+
+#define CLK_VENC_SMI_LARB3			0
+#define CLK_VENC_VENC			1
+#define CLK_VENC_JPGENC			2
+#define CLK_VENC_JPGDEC			3
+
+#endif /* _DT_BINDINGS_CLK_MT6735_VENCSYS_H */
diff --git a/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h b/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
new file mode 100644
index 0000000000000..c489242b226e2
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_MFGCFG_H
+#define _DT_BINDINGS_RESET_MT6735_MFGCFG_H
+
+#define MT6735_MFG_RST0_AXI		0
+#define MT6735_MFG_RST0_G3D		1
+
+#endif /* _DT_BINDINGS_RESET_MT6735_MFGCFG_H */
diff --git a/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
new file mode 100644
index 0000000000000..90ad73af50a3f
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_VDECSYS_H
+#define _DT_BINDINGS_RESET_MT6735_VDECSYS_H
+
+#define MT6735_VDEC_RST0_VDEC			0
+
+#define MT6735_VDEC_RST1_SMI_LARB1		1
+
+#endif /* _DT_BINDINGS_RESET_MT6735_VDECSYS_H */
-- 
2.47.0


