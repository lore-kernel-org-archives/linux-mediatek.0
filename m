Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CF0CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=; b=1ZM+GG774NqRRSmEwDgpRkHviB
	Phocq0ZIiNNx+JXwVQ0lnL3lCG4cGGC6/7acC2XrX+fkRZ94dCPmbHS5p3YSYcGeHYo+mdhDbvzFk
	fGSoeG6nQ0vgeVpujmruGSn3+0/3uToaSzWuhSw/0KOksTn0/FnQRpYtRL00q/FSjkI0SAT/6sj4i
	5ECTiZkmmGi9b6OY6fj+y0mJKRw0vENk5o2uwjV0DhrMep1z6N4N+RffpbkoUbi3HtRLSEOgsqy9+
	tavuhrR3NmQD934VIxPGfaXhoITK6HmGv1gNaCdrl35YKt+cBSUn+cY+FPUEl9KVlnUoymQdjQEvt
	4lF2Xfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQBA-00000005QhO-2a5K;
	Thu, 30 Apr 2026 12:07:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQB8-00000005QgP-0NT4
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 12:07:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b2589c26e3so6683845ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Apr 2026 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777550857; x=1778155657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=Z19+VKORQkdIQR9UwWNFy/IxVvSkCilsVnJZJHbmT85ezZtlmpk4qyetOsev81eJEt
         hp9SMeHg+tvH3+XmNrKtl1KSNe5WpY7hOwT1uFUmiJm9U7pViHtTSzY9a4558n/4iyQ9
         6E3xxACZU/fdExc/AlGhowTnxqv/dJd3dcnck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550857; x=1778155657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKv4W/JoMnGa2IT1tfwDfZQZp49D12KO1oxnjPxBw3Q=;
        b=KN4ExgyZZopOXviS5Mle1No59q36JG9RFeBqpJswNA5aNpp7GElXXqKb0vW1qCmETI
         A9aaDiyHKL1B1BvI7QL2zacwc/lS0B6KTWheNvqM07CYLBD7ltL7q6No7z5ab8t6QPZQ
         o7uxJ0qgxqWiZZtouyFY7RCVKbyJC2FO9CPbfCpdLxCBOu6pAMR53WY33h/LL9q4SNqt
         UHeIml8qS/XNQ4L1AnO8WcRjN+KsVVhxZgq2cHFMCHbTF2RakjENBFVns0wdUnvYHy/J
         nvwRcNp0bnwledNW39S7JZby+9r3nMmnWHoo+0atWqFswuCWcDarBD0hfT9tB9Pyx4FY
         Gd7g==
X-Forwarded-Encrypted: i=1; AFNElJ/aVkV0ldM3WwDyKSrKxp4WGn7ec6fF4Z3JeBUIkeeqlo8mv2hw8nJuZllvOh1Z7+/MSOMk6J42ziPG4wNgmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCzdwENKv016C7/Ki5+fKnEx0EqWIkU1G1dP6TZO4kWGHXbRgO
	VveO+bAONpJasX0sN51fa0YLOEs4m7SpTs8q3zv6nyhiqVV/WAXfMRJA5MB2RSQDUA==
X-Gm-Gg: AeBDieuf7ehhuQycmEx9msltUAHEIu6jGU2K8QJvPtXkgxz2oHWTWUIuV7kk1eY4nCA
	2qIfrQt3HsVkcdWgycmtmXFQrEG8FkjKu0i49z0FZM/KGW64/6iTbugvN8isElGYBL0mmCi2rOw
	7XA6tB3l8EHdptWkoapP/BhJNW16L1j/r3QvbSErnGo+RgIK5lCtaVu+6u59yDiljfeDNfLAo2q
	7I/KPcsOskhnf1IceXpjDtdNlGDMWbNOa3ciokJHb9TmLHtUtW0OS71zgj2zYGgO7XVOYc0pwF7
	0EQBPmYE9icOQgOwO6uLL2j03wR1/KA7xyGaXbMOc9zByTG7IPy2Z03UEDiI/ndSwt7SsTjaXee
	zo1RET7GdU2C6slwIeAVLqBkXC+1Qk58NNq/ZKTLtHJ47udxVLo4Mg9POzh6yF+FL5AkiQ1k1rX
	qsfhzWPG6cMMxRwQ+Iyogr7iLFFk1ux+yRwnau+4T6baEJDm6uUlP2RcFev6wi9nLraPFe8nHaF
	ItcUK/M3lVhvK2C7AM=
X-Received: by 2002:a17:902:ebc2:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b9a234e8c0mr28352745ad.16.1777550856708;
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7c53:8aef:3f8c:bb04])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b99835a796sm34576285ad.59.2026.04.30.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:07:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
Date: Thu, 30 Apr 2026 20:07:24 +0800
Message-ID: <20260430120725.241779-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_050738_184897_179142B7 
X-CRM114-Status: GOOD (  12.79  )
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

The DMA bounce buffer is attached to the PCIe host controller, i.e. all
PCIe DMA transfers should use it.

Move it from the PCIe (WiFi) device node down to the PCIe host
controller node.

Fixes: 0dca9f0b3e63 ("arm64: dts: mediatek: asurada: Enable PCIe and add WiFi")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 217c9bd5e9a1..eebcc4068e28 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
+	memory-region = <&wifi_restricted_dma_region>;
 
 	pcie0: pcie@0,0 {
 		device_type = "pci";
@@ -659,7 +660,6 @@ pcie0: pcie@0,0 {
 		wifi: wifi@0,0 {
 			reg = <0x10000 0 0 0 0x100000>,
 			      <0x10000 0 0x100000 0 0x100000>;
-			memory-region = <&wifi_restricted_dma_region>;
 		};
 	};
 };
-- 
2.54.0.545.g6539524ca2-goog


