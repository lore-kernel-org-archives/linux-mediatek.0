Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01065C79F8C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=; b=p5W4Gz+fVj4sOZFrqkGO9vwbsb
	RG5WboJsMoxaXlJN+wIiirXKMEpWI/R4yd8D9BUR73InKDt/AZGZNfjkStugG2y36m/+DbEWxdhhR
	hmSUpzN/y5WDuKWxcOqP0q0dWjrWBDFFR1AMO55vxfQrG+2ulIrx8XYyYhSZLmq2suylmL++4KW+i
	Eg6UuB0Z5FyrdjeYfPCGZm1uSVh4wjhndYE9vJ2uLVDG1H89lptlBMTjcaM8/3sfV4ORMV+x0lasK
	NRc/yJJ7phL2PHAYd1Q7jNF4mVLb0k78nTfEM/Lzs49LqfXaIAm3Yo96Ercf7M4SaMuTE6IPP0o94
	8wiF73gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cck-0000000AxyS-3rN9;
	Wed, 09 Sep 2026 07:21:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cch-0000000Axwl-3UOw
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 07:21:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so34788295e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938494; x=1789543294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=d0K6YDsWwEd5CeS1V9sfzwjtxULtOq7OckN1BLFdpUmsdzJtqTPRfiFx3D/ZSrHbFe
         0GE+h0NNaLfq68eE0Qk9XdlDgPJstqO/3FDS/qX+nFwHnQX5QUGrUgGHUH/Oi5zjoDBV
         hXjL49U3apw6lsYkPg4aUQaFffPb9d6urFxCOJyzWbR0njdwAh/sYRPWAN5wDffEn8d5
         bIaWL/xlWV6PWSjLYsJ2klQWuyBv53ooarKE1nHucCqQsOINLYxD4t+Lq6dG7jHRXClK
         fkt8umACyu37eJA3wT5SC7NqqVKM67vbUC37EfKsf12Lc8g59jzGtDKcCkPJbwyneTzc
         4D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938494; x=1789543294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=VsO4ivDSt2kK9eDR08tRE2kYuDtMYbnDKbIO65PpwxDb3PBkHFZMC8CHWvpjoWqJs9
         Qp8SuAlzEyxM6TBBip5LrJwwayYLnWdOxZ/f/thTudqC0ObY5E8GSfPqVk29p/sq8m2r
         Ae4spapcDVHpds4bmuDUT2bqcrIgqlVplFEg8jxRfjZQaAB4ogEi9nZ6J/lA1t+N0dK4
         eJ2TclThRf35aUfybdf4opEyOV3FyMm1EzlvFHf+O4JvYLtUhk/lZWNDUJPrNTAcfn56
         wBLZ1aJeNlGdLsPeomWZjM8AjJdhLrPArpPGMmTdGJkG5r2eXyNF9T/iGZKLHcYxQUlr
         Bd6A==
X-Gm-Message-State: AFuF++nKLcmIYHPwPZboQEkBIi3cfrGrzyZb0TI7cs/zgft8I+5Le+W/
	XkKZdFZjhr5b0f6fz9RUrBfyugLuY9B7rFr+fdL/ekrgR409mO5M/p+gnI44iU8X
X-Gm-Gg: AYBFou2v8Q4gyAIKnEcY9sgEMfzp37q8/EJ0+ynkShL7ZBfM2fSBQw5fQvufSTQtzFE
	7bgYeVUmxeUUbE6BCatkqPhCc0jo4ssCJAzz98z7rL1nB4WI3cU/R1GSBsiA1HUEgNHjbC1ez/s
	NabpjGqTza9a2cf6KBmk43nYGGxpCDFD3anBZSYOc1JFe1EXJMjVsgMBzOtPxbCrYWhSo2pYOtF
	+7muzqAkemKnP9sfTvEaODnSqSeAolb3FAGiRa3Hz60kVRjEFthaHQtGaKQmX5lzpJ/koYeH6vX
	m6jhEJzGgjjuF9W0WrynJ2acH2aELuE7/LAYtY89QfLG9q1usI93Pp1LUXBG7Vi7BreIeC9WJDE
	VxLDzdHeOk3ikcj3LKPGbtedHZ11gj5KcrZ6VimVGGvuFdhNg0GagullCXAqyXEB0j20wTjIZjA
	4YMcSB66uxJS/4j9IY9dEHdD9Ze/w0IIgkcxSGf7FfgG/GZ9SkYxgfu6ooVIuG9yDpXfw=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr325233275e9.27.1788938493693;
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm46703902f8f.25.2026.09.09.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Wed,  9 Sep 2026 09:20:14 +0200
Message-ID: <20260909072051.4627-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_002135_869876_E26BABE9 
X-CRM114-Status: GOOD (  11.96  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0


