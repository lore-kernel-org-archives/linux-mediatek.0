Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF34ECDE010
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=; b=jaxlMY9u0NKiwCrVIDZoz54/C5
	yfQuTiOb8AgihtSR97amJzLsogNE26kUGuejeIkP/irhiSOXVKFWIop07ZRnKoBLGrTOtRZRnmFmG
	BeJUX/iu+AEW69rfZG+NhwbCnu0iHgaLOa9FEGJCiN3998qo9OP6nL88MDZZcr5NfBdvrR9CKNVCe
	Ki9Z5+g9R3A+8nPBCxUOdmza6kWFklSYrer8jB+e+pfdRIBe/Oj69gj3quwkm2JqGDPvTG8CXHAxj
	+iuiqXyWMEQnWrX7BK8XW2KXc3lnbcHfVbWSNArgWd8JupIC9z1AwSsy9biSWFGEGCOdOTO0ncI+n
	xRql8v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5D-00000009teV-0Wbe;
	Thu, 25 Jun 2026 21:58:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5A-00000009tcH-2iMN
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4924593f45dso4383715e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424679; x=1783029479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=IE5a4TC7nWBNeVSnvmbVX1C3KDBun1Ns22xAxtTou6eZ6EgbdltkHWAyZtlWTPAopr
         e70n0g6xMb04R0hCeqiOEXNDiczXVmzvUQUzVkf5ZNtxeuRL/uH1jTdv67XTcwsUJsUu
         LR3XdILFXXJvPPt0eo9lpWHVjiOcHQgHfbVNFXQRVEsuqOmju2sOfQ+7wuPwxnnwMw8N
         VIHyvzlL+PxZgcNJa5VegMmfkZA/NjTSHqDerjkj+6OIbOthBbJDbjYoo191eofbqxvr
         Bj1FiwoEJfIvV28ei763CRkSAbVExWwd6OE8lfO5G8OHUGKsq9HHBldoLtLnSUqb9Wib
         IWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424679; x=1783029479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=mso5AwZyH/lCxTg3wwjb2hBkyJfhizI27OQTto3IJwc1gpHQo1FQl2tuXp2F7kwT6H
         woLw4oysfjEmJ6NUfajImq/zmUZ1xxkJd0TPihpmpW/MB1soXphOK6mVXDpjRV08/FFJ
         X1VgThFa1FuSTx8ZmGV6/BEpjIv7aZEp1k2UW1d6R/Rta5qxdm/tTH3lSxXQ0PoQ1L/F
         E7GrIEm6MpqjSMYAEIxKq9+Qn+7Twl+my+V00LGnLPojHIAExeZW+quv046K5CIT6itt
         V2+wInJgVT3kKn4cPP0oRfHAGb66MKF/rTMX6lg7btrBNrnPI3qtcOVZbCqG5F1Hz/P7
         21GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DPyiCtt1lDvmX3t2X8+tzDSOHFRvgJfgST4ewr6MnbalAS/bbj1l3pht+fQIa/q/AYpuMyhLqdnmacyF2sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgXxgFt/g40h1Dyl5jD61KQ1smUbQnUw71BWo/HlKjlr2U4XpT
	jax6X4z8vL9AU3uoSUS4cjuj1R/gviB67L8mvr7SWzXAyZ7iMrGnACl0
X-Gm-Gg: AfdE7cm3RwSZB0+kZo2t/kE5Fby6DD3a6qwiydlxXCuROY/u7GpJL8qkj5VgbX6S0ci
	jscHHHbTWry3V6SQAfUlJzh3tvMAUFFfCE0ZPXRWUWDH6+N4lFrYHCLgQoGVMzeNxW7p49WwuRF
	XNQbbXBqkX9ZJSTbJS6/k+GffSN2ryctxLg/UlhvKIM3OkUBT7HfxpK0q5QYUGMEiM3AopwXO0G
	sJ82Sv1xfIoGNOaoZlX0+T7tKu/rrrDhmOveFWw84mNGsnYy1/MWj9PoXuyMq8xasoDfxb0lP0r
	pYC458HkhSwqOvPMqQYZnsyI5xEZxH9wz9wBi+fG0ekXlyFZTG/sSYWbRB7tRK+giO6viaw8Ytj
	yyL021MyFi0DWN6475IcTgclz9VDZQeDmFxC5idH5JnClE20wnK7jl3eIStOBCIkHDVUcIldY5Q
	HnjZLPL8uAK9+L9bPMvU87hnajq5n17MSQzitqqlM0E/BzsWv3EY1S2ihuKgrjSyr4ximWV+w0B
	Q5YOMjhuGOJ6WRxyOFLMrs=
X-Received: by 2002:a05:600c:154a:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-49266881b0dmr61623945e9.21.1782424678463;
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 25 Jun 2026 23:57:34 +0200
Message-ID: <20260625215741.3253212-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145800_711731_7029119D 
X-CRM114-Status: GOOD (  10.32  )
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


