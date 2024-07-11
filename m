Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F6AC3DA47
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nwJbryOULZn/pi0C0Agkwp3eAAGBsnyZjEmdILKiaKg=; b=gbTCTxhlaO+F/k86rnv744biMi
	9cUXmNrInejW+L+h36/JerqbOQPr1aNPAJEBtoO9YSN4nZia2AnMT0f8393b2EaGLczOH7Y6/9JrX
	8hd+rhVCz5+hyvlMR96n705QDJ8kLTbv3/0McuW7fYF14ApwKU7c2Dz9rFAeUMvvWA9FQmgSRmha5
	W0VbTmT+0vnKrdh2WUJpi+ZQZ2wa6nLxh1vsBsoGeD9R5VR9Wl5ROgeumFGLR1i2Uu3qEs9WwUJ7m
	GJI/2bVfqdC31/0JxSbp2ErFihHExSM5VbcIS+anlsIQS4WLzlWyHFpYEsS7J4FKI4kqjuY0JhSq+
	Vl+s/zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqAj-0000000DN6p-49DE;
	Thu, 11 Jul 2024 09:33:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqAR-0000000DN0o-2Ao1;
	Thu, 11 Jul 2024 09:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720690364;
	bh=RIRpn7uyPCKGU2gHT1Esd7Wxhmrbug5jzpTCAkrGfS4=;
	h=From:To:Cc:Subject:Date:From;
	b=Wm4GXwdHxwkGa/hrKc/yXcY5UQvlRIJ3fI6kx2mOfOl0cj0OB86w0q2y9hG60jmrr
	 LeRbQ8oilOHD7lxhVBQAfHIJJtoegM+2hoUQvSV/i0RBR+/POz5Qpq58PFPFhFKjEt
	 0y6FJ9WSHhY2pyg3BC00327gIX8TzWL2bGQP4KTkEwTT8EceJ0/A9N23IqLwnQdIj/
	 JzVeI4uOIR2NCFpQJedMvlALT+VVLunDMbpNPszetcYF9BZdylv6OLcrFbwokohp9g
	 2ZScg3QrGojnXrcgBbqJ4/xfVzKxIyhR7y8rD387VoLekBeKHAJG1PyDpfCIHejKPd
	 BlZz54S96ZcXQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2723837811F4;
	Thu, 11 Jul 2024 09:32:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	seiya.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nfraprado@collabora.com,
	wenst@chromium.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Add power domain to secondary XHCI
Date: Thu, 11 Jul 2024 11:32:30 +0200
Message-ID: <20240711093230.118534-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_023247_713655_25593903 
X-CRM114-Status: UNSURE (   8.93  )
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

The secondary XHCI controller, using a PHY that is shared between
it and the secondary PCI-Express controller, gets powered by the
PCIE_MAC_P1 power domain.

Add this power domain to the usb@11290000 node to fix probe.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2ee45752583c..96ad1b14626e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1445,6 +1445,7 @@ xhci1: usb@11290000 {
 			reg-names = "mac", "ippc";
 			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
 			phys = <&u2port1 PHY_TYPE_USB2>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
 			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
 					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
 			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-- 
2.45.2


