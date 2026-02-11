Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0BECD6E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=; b=EhfbuSMtSILmQf27QMHJtiqW+J
	U2SPBaZARX4jLIYX2NnoSfnNP1aCQroHPy8r1WXFspqcCRDhN1dYgUag49x603YyPNnkIolq3hrEH
	C7mWvPlmQ30TSHZDs0TgNUAl6aZaTECbN6JEpSpgAMhJDh2tBHWPlQhtZUEvzLwtV/dTTVSdFBYrh
	wEPrktUuDa6Vx8GYmBcH6dOhWGzhkdIFpOs1ioigtwLfBR7e9i6q8YPdAfKMhQ3q67QtWf3wbVhGR
	L8i8T4zsztN1wVNg2VGe2H7uyrzfD8AwQ2GVMVpks5xqiGZXXE7u4c5SzadMLvnlLVGxz4uTykP9M
	ntUOATxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXs-00000000xdM-3uzR;
	Wed, 11 Feb 2026 19:06:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXl-00000000xVW-26aU
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4359a302794so3763309f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836791; x=1771441591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=;
        b=U5ceRZlYRmHSlNBt9mkGZYmoGlUXP+2AotK7N6hQvOMwBXHpsVtiemb2a1jttLIdpt
         zAqBKpz8HwqNdyvT1FZecTJ74LODwtoZzL/2Md+Thj0IxHJgtT574kqWJBQ//nckmKhJ
         4pLcH64+b61g4mcgSO7JCmEDgUxjXT8IIwQwA+OdtbJzLwrqk38e78f2hL2GJMRGNW+O
         H5BzkJjIBf4IkIjHRj4zIH9i90c1WdAbhCR5OpeqgOV7KkmoaKRFiwh7wU1leVhDtQ4/
         faj7JVzVvuoiUJ+R18/40HxECbLyRlahiHl/hRNZR4wbFVzjAv2bQqTaQUMGC7J3snnL
         0V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836791; x=1771441591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=;
        b=RtOV8pMq1XR+aSP2bcilVy+0OIqs7jmAVFvay5wqc1tXFLWscA7HzRgrzO3Iq5QoIQ
         IgAQJ3pAwC2ItrSE6May04fGj2zm2vuTzQAqRF+VrHjx3kRfjMfTECVQQNkJMb7OqRaD
         mIcVHwxP+QKUS3hZ+FiepB1U/TUNg+gLam6c2rQAaj1KpZxV1xPRfBViqKgIqFUk5unB
         jhuaozAK2HQsMwuuYRlXBqdUXpBiiETaWdAgvq4qA2c3tznvnVdyLqEn8+k+vO8ENd30
         tjmK0xJzAjcjnPgvIzxR6e/dL+ufBgbZf11yqUQN/OJ4NY77qrNT6ndFYXBJ6P53z54X
         sbGQ==
X-Gm-Message-State: AOJu0YxwF61dNtsW7faf0f3vvevLj+H1OUe8UBEEcpBEMjonpi4JfbTy
	KSmizljwM0SEL6N6yRN6e/7LS8u8nuJdFta/IKA7YEilQy/D59t/hkgk1QogVmGP
X-Gm-Gg: AZuq6aKxegUggtJzCJGtLB1UjVMg7u19m9zAMmp/+Hq3M2sQTTk338nIKrVTSUNPR+g
	hStSsiHOzmQeMwuJ9wrsCsqBL4uXKv4sH+/dyT/zJtWF1cheVZGYJ5uoufToqBf+OC0X/ccs/IN
	rkb0V1lHch2iXLd5VvyuQ8JnLP6wc/NcQmNzVDq6QvFQKzsEkMJMC3w8RjWJwbtCEz3KOLTBr6H
	P0IdZQOLM3ZPXJ29caGF32xBE18nvOLVK2tCVFkALnAHq5QyFeNtSeGJj0G0N+WWlTSPB5GU1AP
	YNFflLUmVUAEkL+Gsi6S8JAEjGMmqyMm5HAi2tAsOhRMhSB01sECJbx5nu62ZizxH1XeuvNxlji
	bLO+K2ak/A8wgPO0l5gV9+jcJqSvFNJO4ooE1uQpYJT2zEj50slCBJpOElWC/MKbG8+lVl0hKlv
	cyY7LanNbWmP+opNzV+zs=
X-Received: by 2002:a05:6000:2209:b0:436:3707:2be6 with SMTP id ffacd0b85a97d-4378ad60397mr789319f8f.53.1770836791489;
        Wed, 11 Feb 2026 11:06:31 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:31 -0800 (PST)
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
Subject: [PATCH 5/7] arm64: dts: mt8167: Add a specific watchdog dts node
Date: Wed, 11 Feb 2026 19:03:26 +0000
Message-ID: <228e74cc870ac01b223875e2a0dd7effa4137213.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110633_537412_B81E4C83 
X-CRM114-Status: UNSURE (   9.96  )
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

The watchdog driver for mt8167 relies on DT data, so the fallback
compatible mt8516 won't work, need to update watchdog device node
to sync with watchdog dt-binding document.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index fd17daa13dba..caf51f203dd3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -48,6 +48,13 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8167-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
-- 
2.43.0


