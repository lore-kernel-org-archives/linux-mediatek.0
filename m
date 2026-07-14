Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFBFC44507
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=; b=hSRBBxT2/KzxV7WTBBZkvR/rTq
	0jW4hehAoV/PCnJyl6ZQV90kFjDp3/jNI1TYONLzsHJCb0f6cqRPvIQ82OcAXiBIKsgfRflKscDMd
	5s1EGz8m12D9rGiifU6Zcn/dLnDDGcOFN4dx8rPV/rXLugKolAT0k7JyJAt1PLgfAAqjH/OeIhT7N
	o0vtiARGnp3PeO7Od+MsYmUxJzMfpLgIH5G9JsBUJ4FKLzXo2RfWmT0wiMnU03CGorDaPUfQk5utH
	AOpgK25YEUFQgamykHkAPzRsEL8jfgMnEpYuJRzkY1TJ2shqDeTD9H/ag5hBwpaWs010RzPxKAFvH
	oeGIkP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmx-0000000BovH-34BP;
	Tue, 14 Jul 2026 11:59:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmt-0000000Bort-3CpH
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493c733f15aso38693255e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030338; x=1784635138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=GxD77cLpo2BYZNDhHMQ/D14HQ1e2rpL8zxNbVcRvRHi4n8sOBV677OPEGIJY41oXT0
         Lr/GOcSZQ14ozCDHW6KJH7/C/ZZslchn56uOMaBRRdH4i0YGPeRYGmUNYfiAYs+JTSXn
         7UBlUO88qfuCSnlQ146tV5rd5JlW3GLZPKNmGF3q/qZY3Gslrd0BOoXwCL4Z0olfeeas
         T2p3B0PEZT6G3spORY7FyZXxu01Sd3IJ+3wxaIhqJVp/UYNxcZm75SWjcwjaZ9k9ek45
         PSUEuOuRvNJTHgIpznf9vwE1TgKTF6KLtxEO4VUmuE/zj+2PY6PwJJnec8E0k67w0VVd
         gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030338; x=1784635138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=HwuMlhJubtn0FF9O5vIQTtW9Jf3l2DOe2P9v9uWleP8NiLdCwPDxJjHRaBs9XbVPQx
         4Jq3mvxYoHD0zbClpAMk/3JC0AvZtdEZKtF5NyDeCvrLgkXINgKLEMqzQwXaY7uS7TQj
         OsZGpLu1aV8+ObLiLOV9YqpRUQg8Mn/0nb5UbhZuDreJgMbiA6YcxueB/5AOoUEh0eU/
         9Pjq0XANJLcgvrJXh15JvHw/LaLnm5O76aU2nyFST7q7DyZOEhpz6xZdmmPL8jFLssze
         M2gLXjgDjQAW1N9KBDneJDvdtyDuOZav7mRhBDsEFlJqEvpD9vWs16Samkq9ojh3b0hi
         ZXGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvbLqunpYStNDOHQx+Dr0ABxhy7daZ2UCFRJsFYDB9gsb4JafAK2RDXz5k8CcHom4mF49qyAXiqmE3TuM1vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc03hfT2/HF41mcN8sB85JmfRqhjVJhZf3dOaimJC8r1glPUFS
	Jt2O+rnN0NvqpXPaGREqqGteqIJ0ByF7V+Hz8GlujRHM+/n/Z/qv7mI/
X-Gm-Gg: AfdE7ckbyyfdpMrxrqJ4gFVC/0Woy9KYC7V9bZSt1TsMbGgqOcZr9YLWXb6EZwfmZqZ
	8dX1QY0qOtBCu3++4OxNwiaGpcUgYQsRdvTHo9/FL94bby4jQkYSuA1ktCJqzKR2pw7e1xKZ9ZG
	xp9TjoEovysT/wxFG7pZAFRk7ytQsbVOiTFzhVmxx7E4kxYd75MPIAV1wztkzI9/jKFEToEHbr+
	jIzs4MQiKNoGNjApyUhWBcXk5Wu+Fj1oBaKxBcWIjZdMC9EtfNLBz9FWcrDjhfjb396rzpKgi1O
	v8NYWFjEHq0F2PKTczM/jEhcX+F0I2g5bUqvkigZ9h1FV4IAsv+pBxbZBr5n/RWeFfw5dfl/spx
	L6yrSssAdtftB1nxLhZosQZVKPwuMB1zvXd90MyLFowNEV3zganNoW9wY5uXFF2umOILD8YrjOm
	XudmlVPm1YswzWR/w9u5vVODOwdzZcBfTZn+hEyknEdz9wM5TXzerDHLRW/OILjZljAcJq4ObY7
	pDVCJsW
X-Received: by 2002:a05:600c:1f94:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4953909f29cmr16692335e9.6.1784030337488;
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Tue, 14 Jul 2026 13:58:43 +0200
Message-ID: <20260714115848.8537-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045859_822949_1BBF0E49 
X-CRM114-Status: GOOD (  10.52  )
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


