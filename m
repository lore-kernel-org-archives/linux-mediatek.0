Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120BC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huP/oKiTocOPk8/V8Wp8xZfhx6i2OxdPAsbxAXxAKMw=; b=ZGvNgMIlPSGdvWhxwGn4ezMl1/
	VRQYpFM4nKrSRMJYHqC6KBWDs5YqXsNqI6QfPiNOCT/a9CHR7GZRVfBlSrtn7V2Vkldpm7F8qoykW
	FrXndTmytyGM/4rUKBKQV+XQHuUwl3pJgZFsVoyPGoMySPS/MHnpZLpB7AfdwLxnk80bb6k8nVqb/
	HndlFVPl+Of1kNFvYPdZ76Xh8sQvMcJ7eOWe8md0PnvjyH4lJLRWNsQifzpcLNf5s6A/V0vHMi5PB
	yRIyXgR8DEAOkrvXDqslJazQOhiRB05I+ST74upEmcLE7DolTfw7fNILYgGHku87vCiaEGWt/SA2y
	ZABU4BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJJ-00000009er0-1xzD;
	Tue, 13 Feb 2024 15:03:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJ5-00000009ehu-109M;
	Tue, 13 Feb 2024 15:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707836565;
	bh=Mq7Gr3WDYsBP1PMrwjprrD4YC2YKvVWwkGxj9ia8i/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hwduHJEDs0vx3pjIVoR0oZ6lTTt3czESrIxa+bFne47UUZgw0bwQXZ6SPw37KeyT2
	 AqUf7Vi8aMvJhcyi3J2mTafivV6AkRoCDqJmB/2w8j3nz3OZQMu8XyV8NzfL7WBvYw
	 d0F5hPRilnGFwFy/lsBuXsdX4DslFUkk/xQPI+gw4qJddB1X9+mh+sMftaipnTX7og
	 58bsvuJfu/pcm/Sqyza0iYex2mN33f91od6aOCyWi1/aXX/hOvivWJyoJgxaar3+Wk
	 LAIbMzUe/4mTmI5kp4y37EzPFWrs5uyznJD7Z/0s0rlN6JOCZvSOSYChbXRDZ9ml0+
	 2QlD5kef4rivg==
Received: from [192.168.1.42] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 569D73782073;
	Tue, 13 Feb 2024 15:02:43 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 13 Feb 2024 10:02:37 -0500
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8186: Add missing clocks to
 ssusb power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240213-mt8186-ssusb-domain-clk-fix-v2-1-1f981d35f3fd@collabora.com>
References: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
In-Reply-To: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
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
X-CRM114-CacheID: sfid-20240213_070247_528659_B9C4937E 
X-CRM114-Status: GOOD (  10.11  )
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

Add the missing clocks for the ssusb power domains so that they can
successfully probe without relying on the bootloader state.

Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index adaf5e57fac5..e0e5721d6b53 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -931,11 +931,17 @@ power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
 
 				power-domain@MT8186_POWER_DOMAIN_SSUSB {
 					reg = <MT8186_POWER_DOMAIN_SSUSB>;
+					clocks = <&topckgen CLK_TOP_USB_TOP>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>;
+					clock-names = "sys_ck", "ref_ck";
 					#power-domain-cells = <0>;
 				};
 
 				power-domain@MT8186_POWER_DOMAIN_SSUSB_P1 {
 					reg = <MT8186_POWER_DOMAIN_SSUSB_P1>;
+					clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+						 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>;
+					clock-names = "sys_ck", "ref_ck";
 					#power-domain-cells = <0>;
 				};
 

-- 
2.43.0


