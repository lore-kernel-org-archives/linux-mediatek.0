Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E8CC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 21:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ciCY2A88SYR2CM75Mx7Nj/WCo5wz1n2MA1VbEnrH3c=; b=0NigQUNHQU8OPOV0YUCEPUFCqI
	SaUQbv930qPeIcEic35ZCLBWkqxHHv3wIp4toZI5V5+q+Kv3jdZiCO2anR04bFpO2+0xRmKJc4+B/
	M+oW+ZG4lBv4GZQyx7PIjU7mkIVAnk7Mv1MTHDhyVbWuzRyYStJF/DtGpE/9HNwCyDaJwYwBVZUgn
	w4p8rOYs178//mBq9SE+aiWAzCfq+gjLEcS8tOzrxd1eeQW7HIkazrdlr9Gh8sPVuvqy09MB/R9Zu
	eYlInVMLG+yL1bB/GH723MHHh+krt5WCNpwUJLR8SFQ/fP+Mf3uFbzSdcfzBRDeY7ILJxTqjV4zf4
	8A48U8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6a0-0000000GKWA-1CBI;
	Wed, 14 Oct 2026 21:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zx-0000000GKUH-1r8N;
	Wed, 14 Oct 2026 21:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B431843CEF;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF6A1F000C4;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=8ciCY2A88SYR2CM75Mx7Nj/WCo5wz1n2MA1VbEnrH3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D4M5hJEB78IP8JqO+BOpPD0CRCX/LISBnMa5tXS65Grt6Ze7KoCoaiHMWrvejJHJ2
	 CBSLkayv+C30UrrClXPexK2MxEEuMT9EWvNemrm0Dz+jSyhX2+9jVs9NXIH6gHb33D
	 6BeL5saVc13dK2fxqSn+Cxm2/iGYoatt9IcQkBKf1WosSNjTKxuriQ4b5rBk1dhQNd
	 yIJhFucaXtirNOQkCmoe5b2PYBQV1jFcH64tAQFmLyrcHfGzkXCQok3CclXSJanW5A
	 IuV0bs27kKHQ358nFv31UaMA5GLAMMIKxw8l6p0ziy+IoaS5VkbcDHvORVCeqRblQK
	 ST78YbM9Fnzow==
Received: by venus (Postfix, from userid 1000)
	id 69F1E1804C7; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:49 +0200
Subject: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3DNpBRf6NQYwnHQxzmDmr4mio6Ob3qWU/dTm9LpEHl0=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TQSsWLBKOLObM4EqmAVmFY2kzRbt9LfnGBN
 86eL6pD8haJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00AAKCRDY7tfzyDv6
 mrtbD/4h82QyYA/iAhpmTGtT/QpPrOEBk9fiSiiSH+1FwwfO9zPb3CFUCqTLMx3W28UTbRePRVT
 dZ52TbY8klUtlTD7AyoV9m0msJK+HATfBoHpjx7RFoRDWCBlNt/v3R85GKj0Eb+ngqoxgAreCP7
 BDmavivDpwNH/n9tvwpCMjzMR9ERcOWwflYC9zN2M5pF3S/MPd2qTMNzrP6nZOxQHthhX4RvxvQ
 JfCR3sQjGFXe3nwDsPucEYufmy+n/dOVodL+vT3Bc6/m90Ftt3kXKf6wzOFq74vhyuDsjDALrIX
 A1JdTvhJARLih0Rvu9hm+AbYv7Y6ZCeuTg2OLxgyb15ZizzV/POhtx2H53pN57feeTQ2ZDJS0fH
 +uM7TJ3nFLl2Q1GQRByoCDEsDHGs4Ua/uREp1mlqBrBgS019i9EXvxwpBlnhmxgnbKh5dhkEi/K
 IWLsA+qRVKYVO3pSBYa72hbYScMYEgf2hlBXXX82Iad4Be7zrDG4zG9n9x4hNpTHMTiTyMg1HOx
 xA8VgkebQhrT/Xm9rEae9wN9tqTGm+KXVEzpaY89tZXyRfISWwRlvh2wF0x8dTTSEtrEQ0Pn79F
 /HJH34SdWfitqWkxdYrSPE+qOJG988S1wOzPKeXnYjnmRLelpd4Pa0MNVfoek/nFCVr7JkkLq9N
 pZq6cQ91aWcpaqg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The typical USB-C DisplayPort AltMode capabilities for a down facing
port (i.e. sending out video data) looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <0xff01>;
		vdo = <0x00001c46>;
	};
};

Improve the readability by adding defines for the numbers, so that
the above instead looks like this:

altmodes {
	displayport {
		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
			      DP_CAP_UHBR_13_5_UNSUPPORTED,
			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
	};
};

The generated DT binary will stay unchanged.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 1e64a1f563f9..6cea6165fc0f 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -483,6 +483,64 @@
 	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
 	 | ((gi) & 0x3f) << 1 | (ct))
 
+/*
+ * Displayport AltMode VDO
+ * -----------------------
+ * <30>    :: DPAM version
+ * <29:28> :: Cable type
+ * <26>    :: UHBR 13.5 support
+ * <23:16> :: UFP Pin assignment
+ * <15:8>  :: DFP Pin assignment
+ * <7>     :: USB
+ * <6>     :: Receptacle
+ * <5:2>   :: Signalling
+ * <1:0>   :: Capabilities
+ */
+#define DP_CAP_UFP_D			1
+#define DP_CAP_DFP_D			2
+#define DP_CAP_DFP_D_AND_UFP_D		3
+
+#define DP_CAP_SIGNALLING_HBR3		1
+#define DP_CAP_SIGNALLING_UHBR10	2
+#define DP_CAP_SIGNALLING_UHBR20	3
+
+#define DP_CAP_PLUG			0
+#define DP_CAP_RECEPTACLE		1
+
+#define DP_CAP_USB2_USED		0
+#define DP_CAP_USB2_UNUSED		1
+
+#define DP_PIN_ASSIGN_A			0x01 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_B			0x02 /* Not supported after v1.0b */
+#define DP_PIN_ASSIGN_C			0x04
+#define DP_PIN_ASSIGN_D			0x08
+#define DP_PIN_ASSIGN_E			0x10
+#define DP_PIN_ASSIGN_F			0x20 /* Not supported after v1.0b */
+
+#define DP_PIN_UFP_NONE		0x00
+#define DP_PIN_DFP_C_D_E	(DP_PIN_ASSIGN_C | \
+				DP_PIN_ASSIGN_D | \
+				DP_PIN_ASSIGN_E)
+
+#define DP_CAP_UHBR_13_5_UNSUPPORTED	0
+#define DP_CAP_UHBR_13_5_SUPPORTED	1
+
+#define DP_CAP_CABLE_TYPE_PASSIVE	0
+#define DP_CAP_CABLE_TYPE_RE_TIMER	1
+#define DP_CAP_CABLE_TYPE_RE_DRIVER	2
+#define DP_CAP_CABLE_TYPE_OPTICAL	3
+
+#define DP_CAP_DPAM_V2_0		0
+#define DP_CAP_DPAM_V2_1		1
+
+#define VDO_DP(dpam, cable, uhbr, ufp_pins, dfp_pins, usb, rcpt, sig, caps)	\
+	(((dpam) & 1) << 30 | ((cable) & 3) << 28 | ((uhbr) & 1) << 26		\
+	 | ((ufp_pins) & 0xff) << 16 | ((dfp_pins) & 0xff) << 8			\
+	 | ((usb) & 1) << 7 | ((rcpt) & 1) << 6 | ((sig) & 0xf) << 2		\
+	 | ((caps) & 3))
+
+#define USB_SVID_DP_ALTMODE		0xff01
+
 /*
  * Sink Load Characteristics
  * -------------------------

-- 
2.53.0


