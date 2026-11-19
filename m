Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277EB606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j4+rPcK3;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SP6+KHpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iRVRBbw1AScz1EIRDRXx4WsoEPpoVqurFEyEK3a1RQE=; b=j4+rPcK3QlM/H5lTdmW23rtm/W
	kTQ9g4h+f6peL9lgRISMqJgr3hRHmoSSVjgI5mClsocALlBl2b1Z8UIXNOA/rISSOUIc9WuF9G7j0
	xVGjIDy64+7lST7K7tszFdCXeKjBKStM18Cn03GyS/Uahojya1otURv3pIQiQj6OINIAabQLVwFWo
	Cjop4I7hHSv42zAzKXDxZPs0L2Z8V8NuuTy1ibryNfup401yTHeip/6I+bEm4j0dN6oMcnj7VGMiE
	nz+2f5dWs9cGY4YilDb8xvdtmRxZnU79McQBx5mHyI5qZaZ0JRjw7Zjvtt2iRramBto+rlOX5iBgn
	RvFhfdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Ev-0000000Chey-37n5;
	Thu, 19 Nov 2026 16:44:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Es-0000000Che4-3dHh;
	Thu, 19 Nov 2026 16:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795106636;
	bh=6i3O8CjIo+HxwDHwcy0vpOyveDvDxBqGr9BQdGbXOqM=;
	h=From:Date:Subject:To:Cc:From;
	b=SP6+KHpdddpuDvZwH1ozd7vGx+cCdOh3bHsLxAPJZIl5QFImPl50zjnkFDktoY727
	 rHXlhVIBTUwxZvuAPzt6/lOslRDqaJtBiD6YMR/Pjt1VqvuEeEw8ILPtYXeTU4kyS6
	 BeEgqQVgGXN7VPgL8/fC8c3qKq/N3KfWq6P7EbGP5WaNL15+2Z/O2ELZvqat11UwMh
	 pS90sAEfysCah6KTIoDfOtMQIQaWt6i45FIBHIP2I5viNE2QPF6n2d2A5Q/k2hr/hV
	 I8cl+tiGwH9xOpaPN2bQhNShLaAvIt6z3Rau1Va+MZhNqBnFQ5Fo481a0rtB10vKxB
	 0pYbdXVqaE+FA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07D5D17E07F6;
	Thu, 19 Nov 2026 17:43:55 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 19 Nov 2026 17:42:51 +0100
Subject: [PATCH] arm64: dts: mediatek: Move watchdog disable external reset
 to chromebooks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr0Jm7SRCYq29iumCwoATAyhQ26Tp3
 SXW5XvJ/2+DQpmpwCA2yPThwik2kCcB5qGjJ2TbGNRZdVLKG4b6RE+RE05JZ1twsR4dr6ipl+Z
 60co6B23+ytT07/o+HpzpPbdCPSRMuhCaFALXQURaK/4rPYz7/gW02dPNmwAAAA==
X-Change-ID: 20261119-mtk-genio-boards-wdg-fix-ae81c75a2dff
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106635; l=3527;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=F/Im64Ni1uwsJGaafftFl+c9JiV9JcuUMsycZhGbKqY=;
 b=7x+/tFXqwjtHaZgkf3SYI6Ef5O3nmvk2xcMmDqFrOUODC/cmdDy1UkzI4uxplB/oqgOr97jGT
 IBBzQ9nctgZAnNjAUrSTgfralypYRCQC+lnB24O+SvXoUxAD+rZ77Cc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084359_104305_6CD8541F 
X-CRM114-Status: GOOD (  14.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

On Genio platforms, the external reset (PMIC_WATCHDOG pin) is routed to
the PMIC, so that once the watchdog is triggered, the PMIC also gets
reset. Meanwhile, on Chromebooks, the PMIC is reset by the Embedded
Controller (EC), so no external reset signal is needed.

For this reason, Genio platforms need the external reset to be triggered
in order to be able to properly boot, but the current DTs disable the
external reset at the common SoC dtsi. Move this property to the
Chromebook base board dtsi instead.

With this change, Genio 510, 700 and 1200 EVK boards are able to
successfully boot after being reset by the watchdog.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[Louis-Alexis Eyraud: title and description rewording]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch has tested with a kernel based on linux-next tree
(tag: next-20261118) with the following boards:
 - Mediatek Genio 510-EVK (MT8370, variant of MT8188)
 - Mediatek Genio 700-EVK (MT8390, variant of MT8188) (via collabora CI)
 - Mediatek Genio 1200-EVK (MT8395, variant of MT8195)
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi        | 1 -
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi        | 1 -
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..7da55434ff41 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1347,6 +1347,10 @@ vdosys1_ep_ext: endpoint@1 {
 	};
 };
 
+&watchdog {
+	mediatek,disable-extrst;
+};
+
 &xhci2 {
 	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 7442e6f160df..d7ab1ab56286 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1322,7 +1322,6 @@ power-domain@MT8188_POWER_DOMAIN_ETHER {
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8188-wdt";
 			reg = <0 0x10007000 0 0x100>;
-			mediatek,disable-extrst;
 			#reset-cells = <1>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 6ffa168dae10..a547b4635e54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1626,6 +1626,10 @@ vdosys1_ep_ext: endpoint@1 {
 	};
 };
 
+&watchdog {
+	mediatek,disable-extrst;
+};
+
 &xhci0 {
 	rx-fifo-depth = <3072>;
 	vbus-supply = <&usb_vbus>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 446cacb991ed..59fca2fc6920 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -859,7 +859,6 @@ power-domain@MT8195_POWER_DOMAIN_AUDIO {
 
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8195-wdt";
-			mediatek,disable-extrst;
 			reg = <0 0x10007000 0 0x100>;
 			#reset-cells = <1>;
 		};

---
base-commit: 66d427575d0a859e9484f76b5d9fb05989dbbdb8
change-id: 20261119-mtk-genio-boards-wdg-fix-ae81c75a2dff

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


