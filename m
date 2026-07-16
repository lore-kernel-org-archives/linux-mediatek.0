Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D038C44511
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=; b=c3M9wbaYVCXLFIPJbOHxSrI+NV
	8yykuRd9QDUZvIvGZbjc6qLyOCZZImt34MUvCeksqKYBDuXoN9Vd0dUP1vY6L+Rr6u1q9ctASnkpG
	tjmeO5gGBZQYGW94st8l0hCLiIM3QMiSkf974eMs0WzgYAE5xPjuLqIv0dHQFEw4J6jGOQnY5PbcW
	v+TGfWGurly7j4w3cWJ5i1y+W9VdAp2DlCtvP4kpjsFm32Lr9mOyLKxd4rYfPGkBx9UcTVbcqUYZO
	8r8YzXWgpvBY307wqyhwNbV7ntdtHWGTJLhV1bzViF+U8ULhQLbofHjXr+I8RJO0vBQ2RImzJW4hU
	moz6WQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOok-000000008GH-0ONW;
	Thu, 16 Jul 2026 16:20:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoY-0000000083Z-120d
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84847482584so654202b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218797; x=1784823597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=CUJpa9j7uoWW18t+PpOQ2n969Y2HXCFF1+8QkDrQfKRUI40/I+cNLxC6Os2voc+W6s
         aBWq8/eKUHYT/MP8L5XPDL1VK+awLXIq6SSHRDDlhoMGA8ltzRhHK+VEz9g0ZgDZomip
         W8A2LSsKs/2rCZKnLkZrAJZMcquSHHom2DRGBTSa86oy/hniy746MB2HHKN1eApWAZjr
         KKWpvdiHW4280e3UE+dmGytBu02oDs3f7w/mmZ4AQLJDP7SqwNlLeqpCwNwH921fIEgy
         D44CVEqwMrXzFXTpsx/pkY/fHObOCdsMjGssZyga3zJjkuNlxpOtJ4JjPhfUnkpk9Nzs
         Sk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218797; x=1784823597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=cT8iG8zEC7zsKLre9+Imh+ncsPlmQKveznpoJUSxcpfht+qCHy8LpASPqOgPxKF6gE
         MkkKgwQC5nXkmd8Q9y6wqhJdoNLMqmiz3gK5w+g/u0XKuYmCKnV68AsRrydWZ2iy34zF
         XwAAohlVeqzpqZDo5l/g27YWZKcwDZtdSDv9DhdFvR6qnGuISkPEjt5F6zwQLyH3b+eD
         PmnX0V7HBMVpKtxMP4/EqAK7Ka18dGSpb22wA8HMGxewVn3W7o5k8ksFCbUuMoKFLzsP
         a6cceX6WlRJydie4HzKLR/gRq3h13t/2MC+83SE5VBjCLzVcejadDfpGCcEHa+siLdex
         pvgA==
X-Forwarded-Encrypted: i=1; AHgh+RqQXdg+ars9cjY+zz8ibY1hl9sWfv3ZjP0sCOHVRvt8n8IwSrSTb56p4kac4xu/qO4M6PCfWmJIA+WZ+AcQGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvhbUwhvvj0aSE9MJ1cJaLb6EPsomo2dN/Tb7eZXh0Iz56laGK
	Zs/drumQSvv3ERG0XFm3IeEUwVqRkneQYIoAwI/6YBjWyDbXsteGM2wy
X-Gm-Gg: AfdE7ckDFV1AgaA64j765WRDvBigjiwV38mLwTqGN0DaIxHCaJnd2+KQSD43L0dhuLq
	PdI2F0wpINnwak4vo3WNOOc0E8RViyhyirZsVqVlEnwAgaDALUPsDXGRpQGm49GjLmsMlIEFtup
	pd/KQz3akAwnxqBXDa6F2cCNExST2O6Os/Wtx1DcG2ID8PsD6GcTE8mrnLAjMYXAoqffEPYySLN
	wV2KXqWZoTQyQoR3eG6wxe5rReYS2wpQ/fGQke6wJDn+zi7ThUxQPrhGv4QkdZX7mQDOEgMwdN1
	Vq+8nhHGDisDitVR+oqeERTxf7jyrx/IzWaWgg5OfYOBwedGe724RW4aOyF3mK0wIxvq5+g1hOu
	yjHhwBBsjkontT1TLHQ/rs+etLVbT7rmNo/X6CH3Q2l6aqWkT1l5XFGFhR+zAucbkm1w+vpBwpT
	+JgBHIscmBNllu6FaXOBKuuqmQfF6gWkrD4w==
X-Received: by 2002:a05:6a00:3c8d:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84beb1a539bmr3230781b3a.10.1784218797312;
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 5/7] dt-bindings: reset: Add bindings for MediaTek MT6589 reset controller
Date: Fri, 17 Jul 2026 01:19:21 +0900
Message-ID: <20260716161923.266315-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091958_284435_A096C4CD 
X-CRM114-Status: GOOD (  10.98  )
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

Add MT6589 reset controller bindings.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/reset/mt6589-resets.h | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt6589-resets.h

diff --git a/include/dt-bindings/reset/mt6589-resets.h b/include/dt-bindings/reset/mt6589-resets.h
new file mode 100644
index 000000000000..18ef729022a9
--- /dev/null
+++ b/include/dt-bindings/reset/mt6589-resets.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_MT6589_RESETS_H
+#define _DT_BINDINGS_RESET_MT6589_RESETS_H
+
+/* TOPRGU */
+#define MT6589_TOPRGU_INFRA_RST		0
+#define MT6589_TOPRGU_DISP_RST		1
+#define MT6589_TOPRGU_MFG_RST		2
+#define MT6589_TOPRGU_VENC_RST		3
+#define MT6589_TOPRGU_VDEC_RST		4
+#define MT6589_TOPRGU_IMG_RST		5
+#define MT6589_TOPRGU_DDRPHY_RST	6
+#define MT6589_TOPRGU_MD_RST		7
+#define MT6589_TOPRGU_INFRA_AO_RST	8
+#define MT6589_TOPRGU_MD_LITE_RST	9
+#define MT6589_TOPRGU_APMIXED_RST	10
+#define MT6589_TOPRGU_PWRAP_SPICTL_RST	11
+
+#define MT6589_TOPRGU_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_MT6589_RESETS_H */
-- 
2.54.0


