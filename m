Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F796C4829E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLgB39N3TSdl3rr2Xu7xXsmbw+8nItqyRO4tusEPd7U=; b=buEbqW4nzrwF9w7zIeQD4mTKCn
	hPuF94hG/1SWvKKDj/64XuiLGAFcs0pH7JR3qAUoVbE/wopmVFcVlltpV6/cPwzev/UruCKh0+5x6
	3Q9ORpUdUD4lkqlJj40V8RiFWxdOpscXf9Cj+Z1TKdJmTbnNM+aDcm7t7b2u8hsNLXE25K2wtcvz7
	d6PS4Q3cEa146UAyHfjX2A6jmtrDqyymnMgEfw05pFbFwCjF0VLYzFvLmxX70/Oi/TQNW2Yyyj5br
	G8Cf0pAUboYpouuP5hAN3SClV181nzDC1eG7GUhwe5qzECBlprvWcWSDIs32TdKcHbtcRITdUd88K
	roRdjSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZdvL-00000006zZi-09Ap;
	Mon, 12 Feb 2024 21:33:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZdvG-00000006zYc-3pUT;
	Mon, 12 Feb 2024 21:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707773584;
	bh=uL2VF2cuPmkBo5+K9BYWgnyBPmjt/fB97ck51Phazr0=;
	h=From:Date:Subject:To:Cc:From;
	b=eFEm9K9QpelSO+d7WVm/xhJd8+qlJVpl+tnlGZsb8vckGa1tyIHVKBBxNBVdg5h3g
	 3xn2YJbATiyjnp+W1pamAs+m/yX7gjozx61rrNayDWpJYrw3Mm+FAxyt0f8gSibUTl
	 qiGnQfhI+E8SQMHzYAK+vBlQHnYB7bbVTYnW9KGqXIytwVtQnB045arzq3sWOmOPKf
	 +CP8ZGVO7vSS1mcVCImsZCKPeOTOOYrmVnN74ekEC0A65d7GaICBVkMBcLCKWe5rb4
	 F3i/YS4CiM3Sm0Ddj0/LX3jrrkpA3LtymZwNI9RTJ2/HmANT99dOlTnnyrZmWQzK8R
	 a1cANRtoq1K7Q==
Received: from [192.168.1.38] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9619237813D5;
	Mon, 12 Feb 2024 21:33:01 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 12 Feb 2024 16:32:44 -0500
Subject: [PATCH] arm64: dts: mediatek: mt8186: Add missing clocks to ssusb
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240212-mt8186-ssusb-domain-clk-fix-v1-1-26cb98746aa3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHuOymUC/x3MQQqDMBBA0avIrDuQRJHUq5QuYjLRoRpLRkUQ7
 25w+f7inyCUmQS66oRMOwsvqUC/KvCjSwMhh2IwyjTKaIPzarVtUWSTHsMyO07opx9GPtC1b03
 kbd3EAOXwz1Tyc/98r+sGwYRV3W0AAAA=
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_133307_271034_09A4E8D6 
X-CRM114-Status: GOOD (  10.34  )
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

The ssusb power domains currently don't list any clocks, despite
depending on some, and thus rely on the bootloader leaving the required
clocks on in order to work.

When booting with the upstream arm64 defconfig, the power domain
controller will defer probe until modules have loaded since it has an
indirect dependency on CONFIG_MTK_CMDQ, which is configured as a module.
However at the point where modules are loaded, unused clocks are also
disabled, causing the ssusb domains to fail to be enabled and
consequently the controller to fail probe:

mtk-power-controller 10006000.syscon:power-controller: /soc/syscon@10006000/power-controller/power-domain@4: failed to power on domain: -110
mtk-power-controller: probe of 10006000.syscon:power-controller failed with error -110

Add the missing clocks to the ssusb power domains so the power
controller can boot without relying on bootloader state.

Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index adaf5e57fac5..02f33ec3cbd3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -931,11 +931,19 @@ power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
 
 				power-domain@MT8186_POWER_DOMAIN_SSUSB {
 					reg = <MT8186_POWER_DOMAIN_SSUSB>;
+					clocks = <&topckgen CLK_TOP_USB_TOP>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
+					clock-names = "sys_ck", "ref_ck", "xhci_ck";
 					#power-domain-cells = <0>;
 				};
 
 				power-domain@MT8186_POWER_DOMAIN_SSUSB_P1 {
 					reg = <MT8186_POWER_DOMAIN_SSUSB_P1>;
+					clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
+					clock-names = "sys_ck", "ref_ck", "xhci_ck";
 					#power-domain-cells = <0>;
 				};
 

---
base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
change-id: 20240212-mt8186-ssusb-domain-clk-fix-a691eec834fd

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


