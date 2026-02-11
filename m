Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D7ECD6E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=; b=SQNEDzEC8UC2V6JgySGrymux1b
	T9IhOg07Aolu8tw1g3ziyVVe8relsT2EzTCLi7AT686oMoky7YUDpXJGfvbsE+F/gAs7kh/o4oxh/
	hCdgBrQVJOC/H59VooO8PVZ4Z9nEm79ur32yXu3/px4rcAEv3ooiE9zQiuAXLyBZQp606UHN2PdAK
	Q/MFc8tUuo6FjBATh9S0kCbq7+Z1wrxmX2GvjTxgz5nLmxQ0t+tUjlUFc2bEp/lmuM2BLVwQYz10h
	HpPnLBGFxtDogR3TzLcw/wYgP0tKJaqygsSzFQD2DS4Qa+go3ti08U4XfqexvcN8bfAGbGg9luEmy
	pUFVIgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFY0-00000000xiS-27bt;
	Wed, 11 Feb 2026 19:06:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXq-00000000xZr-3b4t
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4359249bbacso896279f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836797; x=1771441597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=YJD8WrS9qCzqkdIWVH0KyGSjBj7g+u+1YxoomuLOHlWKDvB4KSvuUX5A6VAryL47uK
         jMujZnvK+I6qO2taKUTRHexjg+wE5FJDbjkHET8iOeHuzurxtR6nKGon7ML0JjlLMTVE
         nhz/0sVDEyc0NsdDvBWyMBbMbRUd6ksff/nrGOZZnYfjjH6mgO2IyMTv65fuTHnHAgZ0
         YN3/QxVUi5FDgD5KHXT3PqSHAMtmQuYUAWtAMe9tkAOSCWhwqsTByLwwnGtAuyYWyacU
         wTZMliY7Nl5kNUWptAjwoLqxQmOmEoWXXSZ78Ino6pL8SMSA0yQCwNwR/sK9jlwLR/z+
         BZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836797; x=1771441597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=jqZi7oBupMyGxC3RqZYQyWN1so8Rb60n6d6JYOM7OYKwTlkBbhDv06CwpyZGJo4tfO
         vehbw+hjobhYvdwgmYx8OmNe5rNzkAIdQ8vR9AEEIyK2VAKic94AUzcuilu9UMfQKTAk
         S0ZBC4htI68piP5pD3ZwgXThJHEkTNkePNMlir0VFtTMqyau5KNLX7M35Dcku+oRBks3
         XollWkxfJzWfcEd2jtw99/oukzpX1IucMQU9OjlY4R3ErodiVwUDXUc1Ver2TqDw17IA
         mI8Ba9hmB8JUkArvNzH3b3CYvxYDYS8IUZNJos2dCHzLEsCBEAjzE9J0S6aaTrGc0eM4
         d6Dw==
X-Gm-Message-State: AOJu0YxPteH5d98NAYmjwfx7wCvM1++v3tTxhB/AbX1ecDvSzajcOMtO
	GOz+eUI6cz2LEcAXDkwN+Zx3Dn344pQLtILd1iDOIQDR2siZzBxBMucVC7Rfywww
X-Gm-Gg: AZuq6aLqAp8bVMOjZPzllVTSUuhP1OBlAFsFp6JLpm1qmCe6WiHG3jDT3GN0rKdMeZ1
	0FS3tZn0L4q3f/rzgherwIoa0hm3nonzBBZSD1GqFJVwINUNl9y8GzBn/STtokiGlg8Mf3V8Wfe
	uWTOxTEZmtrG+pLERLqpG0QGKjE6KLEaTcI6p++fFBJ6UDwUweQeUbTsaWiId3b9aXFx0XvKCTm
	s7KoHLbq5PetxJ5ifi6+dh21lGKGVrF8+W4AIADMXNvUgtFEEswKP+PPEvUnmiD7SF5OEVmMLrO
	3+J2LMZszMGH5cf8HmD+i8zsrVkjsriC3IWw1bt/c/ubN6jC5eGfWyFLghip2i5RJXxRHgj6U4M
	usk/D2FQT4d+7BKI3RrGRgj7FeaHC257GL2Hyax9mRPp8zdjOxoTZCgETUrjLBRugrfSqLFxLR5
	73R9Iapws8JbGr4jA8vbQ=
X-Received: by 2002:a5d:5d0d:0:b0:437:722d:5c66 with SMTP id ffacd0b85a97d-43779ead6acmr12591005f8f.16.1770836796836;
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
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
Subject: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
Date: Wed, 11 Feb 2026 19:03:28 +0000
Message-ID: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110640_216535_AF4C9A20 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Some extra mmsys reset bits are defined in the Lenovo
Smart Clock kernel sources - file cmdq_mdp.c

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
index f77c2ca897cf..b379f8f023d5 100644
--- a/include/dt-bindings/reset/mt8167-resets.h
+++ b/include/dt-bindings/reset/mt8167-resets.h
@@ -33,6 +33,15 @@
 #define MT8167_TOPRGU_SW_RST_NUM		15
 
 /* MMSYS resets */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
 #define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
 
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


