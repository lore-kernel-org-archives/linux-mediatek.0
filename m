Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17877C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=; b=CAUNO4FpuFxFgu0Uw/YWjMyNpR
	NpFTW5KLGrFRdkvnq+RumDdaMB9gMqp9njUn5dyerK4jJDIlP9yu12im5VHo83AeuyDayIidJa58n
	bixJFjJ2TRU+5/dW8TpCkypExqcUPYFk79MJikhwAt/Lc2yDdMPngGafHtH9/JRE95IvXwKEWXsag
	tBOW4vkwCgS9UNEHMmluYzttSxsZ/FJsHhxEDmaB0uFQdJEpGiybStxZ6gmR3NojB/uE+VQ3Dn1Ss
	0e6B3+u9868rCHCHpUeTPnJZ9QfCIAKdNKi5BXoqO5lCwtF5ZWGSifz7d1zoRUuivYa9vIpf+lLRL
	ffMow/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63N-0000000ATFv-3x4T;
	Sun, 09 Aug 2026 16:07:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63L-0000000ATBU-2ZSV
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12333105e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291630; x=1786896430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=;
        b=Qq2sqb67+4x1tTo56Q+v2VPBn1m9dag5E1FsmIPcJZFYBi++19AiBuypeU1Syv/cCX
         TsF8HExlOCQB1nQSnqI9gbkvY/+HpL8xXnopo07eYfV/r+OlxMjsDw9pBUm8zKX1GI5N
         X/EMk0edkcQxkfdhD77brC3x8zVdHnWauaRXDm1Cnp6+rt1CwV8iBSlhtBX9TfDVs2Li
         6R485TP3eKI8GJAM8lMx7Psa9d8HUzkpYaOxHrl9t/hAz3JUi0yZbDF9a1Z18iA9MQB8
         MeUR7DPZ4dWrQxiSjwrU4rC0jd35PCS7AM1Wg+zDtkJIk6mmUh9GS/2njX4Ey0KXy4jB
         xWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291630; x=1786896430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=;
        b=tJaSJoH9Ui1u/UMOIHpc9/eKyjogxHWz3nCPf9BKdSy1ifIaQZqI4Huk+yhoOvCxx2
         GxVmsm8BnfSLhgwWCFfrEmqvxlpmpcwsMGlGXQkFeH3wXv2442Xj1sOoOFQ6mwKJXcn/
         1WZiH/sVk+pPDp36N66PFM3YfzI3H3EBqpmTZhB3ElMeTP47B+b10hQlGytiMMELd//k
         H4pAJE9pMFw1Rns/ZvxrdXk5Zx3rosUM+jv9md5hjSCU0j+9xVMMKDB6JT89S/fMgsEl
         U3S08pfAnw8niH4ulFIO1DNkpEWzPjXw9Bncx90FEffV9ZEN8ELyOj20fIERjC2+eRCi
         eV/A==
X-Gm-Message-State: AOJu0YyDBV9fHRi6ORtPEIfwWJ3ua+z2NrU2vVd/XHU6nbpP3TLbmAbE
	7S9RJk2G1bk15tQmDZKF+EScjAQXRqrQ7LtxrIoV5psTEtPp0Vx9iasjYZKPieQGi/9PlA==
X-Gm-Gg: AR+sD12V/YgTd+5mOhvV6bjhqSsTB1/iqxt2fNgSW6GSpksWz7vTYIT8dmv4USZ2l1y
	5Lo6OPm1NYp+ycAvxTD/EqIZLSHO0KxKgg7rCh4iVdtc6zd4PonSvBZhF6GuAm1lctrMq6jMKS2
	VW8+XTxUJNnG+5bblswDkPZWb87LR2CB2iJE1TZ9QMqCNdUcNQi7WoRcyUBVpLYLhj1rFPoHzaB
	2gKX3fKkl2X8WFIshWaHuFqDu04RJflH4ytt49zlWEK/fcYgt5C6pqb4EGawWM5sxkpgoj4iNA1
	PhlwgylVqw/ArXR3hjHQVZzSdUTp9wiHIwbx2cVX56PSBnSa3e1rs9f7Id4K4qr7C07y98GUHDs
	HNOrZl8X8JKFpuFf8bvb6zLE3saSWbQnKQh11Eh2wuzEooN67bUg5DAOTWJtMUxNrMZbsq0KnEj
	UerA27wYP6fDwAGosLRFFvVunZ3mOac9XFWlmvEsSH6PoV0Y7+JRmvWQ==
X-Received: by 2002:a05:600c:3545:b0:499:52dd:c1f0 with SMTP id 5b1f17b1804b1-49952ddd05amr374922395e9.1.1786291629734;
        Sun, 09 Aug 2026 09:07:09 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:09 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
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
Subject: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Sun,  9 Aug 2026 18:03:27 +0200
Message-ID: <20260809160643.33991-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090711_672017_1643F785 
X-CRM114-Status: GOOD (  10.79  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..181d1b1ed9b3 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 
 / {
 	#address-cells = <1>;
@@ -147,6 +148,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


