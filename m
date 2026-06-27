Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C10C43327
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2026 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=; b=26/wq4lyEttp0OKz1ap0oJtOmR
	ZTo5Uq866VYUBK7f3pD/t5Fd9hFymrToCLUjovc+a08OUswDtsec49B/NqvN1xBgxOJWa7IWXW51f
	htH9t3DihQrZV9+TU1Judpr3GC/dyD3+XL/+jZ79RRL855cNzKqdw7wVZ8qTTeMkBC4sz0rWfUGoo
	o02F88W7y4D9aH16LK5KhluHEtx2rwjHQC45m6EC6XFn7rAiBL42p82pfJvW0H9u8msYvwDvC828z
	+Q9BBdiXdkPpwsDZAuKkEI2R5KWJ0RtP3VurVcDGluIY9/6jUowh/cTZPkiUkndb0sJ7R1rsPkbjc
	K+CfbhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRwA-0000000CRN4-0Qzf;
	Sat, 27 Jun 2026 12:15:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw7-0000000CRKt-2H2d
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jun 2026 12:15:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49258ac7294so13275835e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562501; x=1783167301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=FLqJD/QzHfel0SLLK/RO0jZD9dLPH5sy5rVHUXhxNUjz3QJmRxhaWaZxt5X1552IwJ
         Vjg3m6XaDQftnVxfgeYGJT28bzSPVyZdQ3b5ZiDRNJDvH1sGMrBWCGUDCICmsdAAwjNH
         v/ikQSlQGhkECNQYGdwlMklrSQDz3JlXX1u2sEDir/ZsLHhEGy8LQyZP3xT74Tx37OlS
         89i8aAUel0+4rLVlutbkN5zEsb92CUJjKOkIR0Eb1EjsVmYKny7j+iMcA+dVAqLTmrsz
         RZavWTdVOpBHvv7Wx89XKXon4i+63t8jx5YfSrkS16B3Marz/8KdZ5RUh3yGTr7ERQ7P
         /Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562501; x=1783167301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=Mz4qZ1oDkDTgpKMZjsZigftlUiaChr7Lgq2tzTn+Rz6BRFgPqJ3J+eRermZLRaL3rs
         8p7mWHdIBnBuMfqfiUp+a+5OzC20O9ZR07Nwf3Rvo4zDlXTE7Emg1sHJH3vq5+rSRZed
         6M+9ns+txTbHlFztq6IZviy0FN3uXYwRI6CYqNwzgBElSZ9l/YYW1mx7iY+BCARY07CH
         s8FriHatfNSNTRaZKZOQOXuLcc+dr5Yuw3uXcRXv6Ekh+06o8yw+LfF0sRXurJOlKSV+
         4XOvDqrO0bU0Ypj7KtlXpJqD64M+icP7fByfxiR1JmieyvjNcBN1F6NXXx+59F6S1ZOV
         TJwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZN2ySuinFqLarhOT6WH0gsQME3DFFbZrd6YEeeZeuJQipJ7S67xwmpmevvAPa6jT4ArvDv+Wo/1THYzc82g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIKS6wtRNa5X9+tdut/sjTbtgOSimBEcAQmyjFHKlC9yb+CJwb
	iM7G8C3FnWMfJ5hkGCaPrAKuQ4Su79wmu7MlPgCf3e3Rq2Pgfd/sgTeB
X-Gm-Gg: AfdE7clQJvTd+HoKId/zVxFy2bDGiwFeh1Hpq/1gWpFkUbevASaJPpzr4l7ffFFCG1X
	fU/AIx0byx4B4BT8+M4q3pPLZg2AB4m3vQYynHu1KmS4Ewtbpnv9Q7nWUvHGVmscRD433O33Qsk
	k6UY3phh94N2I6DLACiOPCsBIREKtYzXpEf1wyppsqN6UN0S2xKHXPthtrNGBYw+Qzs42A2RTTQ
	0YW94tUwB6XpLbO5GcmGRZtO015XDYGRpIuxeX9a196ZtaDhiHIvqJoRbBqB4/1i6AyLXE6FJnQ
	QmtsFwoQdDO/h9ywAylgpO77fg6D0DsDHX61w4GcmrP0HE04jvyfYSpoESZoCRQVrffrW8+iDLG
	ZLrkfqn7P5QjnWCXRvKHKly119+ge2s1oLP7q0OaFEqbvPcPhoJN/g4ZfAhAwTeO0WoVC/U7zqn
	66Xea0Ua2oCYsKyVltp4fZcyZkYZx08ybnRopAII4NcYXvJ2OjcuJGJwziSfezKA==
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id 5b1f17b1804b1-492668551dbmr160952675e9.1.1782562501557;
        Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Sat, 27 Jun 2026 14:14:42 +0200
Message-ID: <20260627121450.3529133-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_051503_627341_81319CD6 
X-CRM114-Status: GOOD (  10.17  )
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

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0


