Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF1109C021
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=; b=zKbFjbkS+ilP28b0NKMuZFun1k
	8cLcOmwS9InNaHy/gMqaJQml+hOIBBvio7XEaYZ1RoPEbz5LYgNwH2T3LIkezqhqbrB4T/xwgR1EM
	xGbt4dHOIo5By050sa7ljD2e0Y11owKmPptnBKDt1RK5f2Q0743YJxpitqCEPmqq9EcWmrs5QlGGJ
	v+QIV6Rvu27EUNVN0bZs+04lFn2ObhZ7ZvpsxaE6bSJtRCsvh3x9VlBErCbAw3CarxOYCv+i/VLyf
	khGYZzRvwx6k5uj79XlHJ+xybNksrj+uOdgFE4ra86DzZFLUDxH+10iiiwLe0hZlYv9HoWADHy8aP
	reio0ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTq-00000003e5T-0pIQ;
	Wed, 25 Mar 2026 14:45:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTn-00000003e4C-1QYF
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 14:45:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so6752366a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449906; x=1775054706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=Vv+VRV+TEtHeDBRdcMYhnvK767pz/QnLB6zZCOzxakaJv3kNXNwxm8VhigK+OqCgRV
         4kQ5mBcMGcAmuy6Iq3RwtBO1spSY3siI+460GSH6cDdSnBq7HnT9HLwOG+ro23HUNQsm
         ELSimEIRtEni4x5O3lXFPH2gXMkvajXXywcXt71AdCpR48IVT6Ct3OBFSb8HhDBHWKCN
         r3V2IFDQ+g2wJ0mKgpVaOSDLhj0E+03h7nuzvqFsE6AxnvCuPX3bQUx1UxJCgsprWsom
         Pcz+0TuvDElVAgGDqpNLHhpSqTdWzxBafMZ8/EeKQjJI42ksPrF/DPWBPPltdHd2xEe7
         OTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449906; x=1775054706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=fS/g8XeEaMF0C5VEcrI5wirFiJde9hQeh/VSMBqJtb/lEtT6iwE7ke1g9YKTPV7k/+
         vM0mPfLcMtV8m31M43p56SOfxQMqUnLKOwOqISAAsyM5aX9qFQLoiVRRwsgEONLlsctZ
         gkpDyrTQcdYG38VnXnH7MLU/U/cE5N7MG/8Vnam3uszI3xckBpA7Qjlsdq3551LZuiFm
         VfwSohWnkxmFbgrOpO7OZUzKvE1lazYJZWrYm4xyemfKltjdgqKDfQb+Ak92CKPSU1KJ
         gwOxREDiVkuKsbxP/LHgWNpqWDaN3LUi0Hpayy+XssDis/A49uPMt2fyQVor0mSaucvz
         5/pA==
X-Forwarded-Encrypted: i=1; AJvYcCUdDQhwwTl3SBfk0MTPdW8Atzr12TZkLqdAJkCcThWnIaoHyzJ3zmbx2ZElpZ6OH8QN5FrGHt1xvzfMGAUeOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRshzQmF4gnLNd+/FAjvYTT0MyAOITjGp1YxZiIU5kaF9dvPw/
	DKXvHnKoWTAGEHpPM89Cfg2iOR/R+vhwgTGa217Jm02ocfFumcb/I9Kj
X-Gm-Gg: ATEYQzwFzeLQjZo5p/bbLokYqbkDzHhSB67hlgPNs6Dt7t2pGLUrPCIExoRxMD6/usC
	Abmahh6xqUQnSh2oSyXhinQB9Rr6WLC9aOOKLJuHqgeE9tJkxWLNPXqVkvu1tEQ4eKiHkYh47UM
	X58liRgTf0ez0BcZlsesM3woC353KgtGX6EoongUCKjOF11DpgaCAsdeFg+124HSSbkmdL/gz9v
	xd6T2x0CVjQIg1SRjEx4hdB4btobyWwvfV2li+Sw77NYgwD02jmMBGGwTmdVkPtiKM6sgA+pBTB
	uVfGydPPdFoBrKLZ8LRBa3CHCe2CtmriNkAuFzztI02zAJeU4RX8PPA4aeDM/cMSuAI4wCc/PQb
	YfLG+Oc36RsZK6Pc6rcwhl5vmmN2Wh4RdSmTavLpjyic0U/2ljXJ87RR8+KertBxCZ+WeZp/U5z
	oBFx4EdsVAmKQzZM9PIHLPNOd2RPD99SIcU+48UbNhpu9OtOIgV1pC8QzP1vK5k5Qhn/TPOLni3
	/EdkRw=
X-Received: by 2002:a17:90a:d605:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-35c0dd817admr3310324a91.29.1774449906239;
        Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0dc6287csm1223227a91.2.2026.03.25.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:45:05 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
Date: Wed, 25 Mar 2026 23:45:00 +0900
Message-ID: <20260325144500.667385-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074507_413532_DC1D1752 
X-CRM114-Status: UNSURE (   8.86  )
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

Add the Arm Generic Timer node to the MT6589 SoC.
"arm,cpu-registers-not-fw-configured;" is required
because the bootloader does not initialize the Arm Generic Timer.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index c6babc8ad2ba..46dea445742b 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -42,6 +42,17 @@ cpu@3 {
 
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


