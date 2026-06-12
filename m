Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA06BCD98CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=; b=ES54tOwjB8q0rBseO8dB5IcdGG
	4PY7RZ7UJVls52SF16RF6/FSdebbKeSSFpbnOC7Ay5iHJDQrjJUhVu5lR+t/cGCMgIMFAc8fwFrub
	4idXvVeXmHyCsbiOx2+0CqeSBQzewMYzUBrE3Q7WVNXCtlcVdHzvWkWf9n+aMtK81y5twnfS/HhEf
	RdKXJCQcT/s6OyltAEaw9LKFIvZOyC/8p/bPClzxWK/DfxVi8wrY+Sk4jpPVvLfVkdSKn6tH3SlOo
	q4N1n7OTDMPYEm8U7e36wqB0xquJvSzeNjEY4A1nVjAHJ70lh+KrXeZ8Bcin+MeaEVU6ZQQXZbUww
	nmf0eO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8TZ-0000000BYMG-3fAV;
	Fri, 12 Jun 2026 20:27:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8TW-0000000BYJH-3Xjh
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:27:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1094426f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296053; x=1781900853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=awnQ53CJXBqYzWw+mXXe0Qe6vYicNGzBNULokgBPpeh7+XCEpwIzXg/BhSXGOndyd8
         2qLoojNfF1WzG8yRfkKGa8MV23YgiNRTfv0j8PyzQIuhpoN9YnHRrdFVA0B4usTRnrHK
         W5mMdARTl9DXvJa+4zSeSi5ZodSb3iHcrVmmcCFqaEgewG+nUxYSClwppJHd6vRHHy3t
         S9P9QbQ+C8/yRpGLhP1tM74QRBaOr5wiTcx6Fg+hnP+8dABaTxOvv+QHvskg116GSHpU
         shDhFEGA47j+fO/2c8LJOWKWR/1aHvOunDC0TKn+JK2eGTACGpWqmv922N+a95eDbPqC
         76ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296053; x=1781900853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=hNp7H7jeuj8/QzZqBW2yJW6UE2csFDBPA3LxNPEns3BR5LmNnXd4ELumCw+4RXLkuO
         r6+sqggixNM993oglogJ1jpbVHArvD0Ppu5xvGjNtPaQS+th+tv0MAfKmjtT1rEjwuYB
         KL/dT7TDkBhb6xfziwUzsZKbmwo/Ho2cqVtStXyX2oKyVndbISLhFyvxcEUMH9fbFSfS
         FiZjPs10zCLFE+16Yx5fBuM6NcV3UE7ZObJE50A5R/G+6HNnWVYuRlUUhLx5EUzoQaK8
         Rav5IpCAKn0eXNmlL/Sqn+xKo17EDuhAkCks1l5ENEShCQCLeeWH+j/skdv7Z7PEPqAu
         qRJA==
X-Gm-Message-State: AOJu0YwAfWPiSsr73M0j5UqgNR4DWfVI2TAg+Q+3WI8vEZNQFffa03ep
	UQOE5mnitQPz4IOer/N4vmrdh6wj1MP+fNXfuaMPqc27CkCaB1dPKLlNcEjDq2mK
X-Gm-Gg: Acq92OG/v+vGYCb7+Sm+zEOdQQU5OnLDn1PAkn2zijp8DUHzcTUZkTcmy7WNUD1DbJY
	owzPvwjUkj7M23YVx+Iqq99bn4FYZfh/jt1wDPNHvO4a4SV7zvbTwFl4UTocWkjC1IF8/PQb+FU
	Vszh3kleOzrbqIJhutHf1rRtbKeoqiCasSag9LFQWJus5YB3LrWCZf/zUln17tm9lNM4jEwNLgJ
	BCMykF8M5z5QiP/CnQEp5opzf9J3G8Jl/6krJvEoydEBBQhv+RX3uqXOGgxEoo7+agGY0jUSPTn
	OkYP/DSy+SzNdDNfDYxD3y/xVtXeWm2IQ/MHT3uRJbpFAPz5dvZQ5RBdx2T63xjIeMTrt4BN7Jg
	1BFyzivrmQnALjtpOTctZNply7hBEaChvjLQCR5fLY33JQRk3xSsZNd7Hum4C6YqXsJgj7IyhsL
	1NBA6+B2EP0n8B0kHd
X-Received: by 2002:a05:6000:428a:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606db9667amr6456265f8f.6.1781296052923;
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Fri, 12 Jun 2026 22:04:12 +0200
Message-ID: <20260612200717.361018-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132734_902125_6B3355C4 
X-CRM114-Status: GOOD (  12.77  )
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

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..b8d943e47816
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+	};
+};
-- 
2.43.0


