Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2F606C200
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PTYSNjPE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kG7RYzV6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=; b=PTYSNjPEXP0h6a
	4cWOqwh94u1AguKUxLkyidZDr+SkFAoyqLYzyWqZ7gkaIjtTXxfXvC6u3VLvReLQaBmfnDeZ4WQ9o
	CBqEyQzZqYr5K1uHHhlxyZx+8gq9ZX22J+F7GOr9cna0N2rG5Nr9ldh5ySNdPznu+7Yj4iSrRFNY2
	ZZOPRvaqy/kE1EBWHZVyofMBywyx1Kg746dcMNYEPNEHpc5oTaJPoQ0M/JIB0VYov0yG2frWC+/uf
	cwxoICW/ylmVYEXk+vD1KjYFguFgOA+wmrXWKKw66tcq0jXw1ZzkjE7n52xjl7wwzY78gUKqkmSCO
	NfvKvSz/moSkH7PbdwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSl-000000029gT-0YMc;
	Mon, 26 Oct 2026 09:57:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSe-000000029Sp-2KeA
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso21899905e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008666; x=1793613466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=kG7RYzV6jdYUSsLR2QZM3EOXcbpu+/UHYiXFkzxHnzwDJICk7FEat43/etTU9ldsZo
         2RZiXUR8VUhOPlSe5fyrApMZ+XUD55K1Njcm6/R3lDhmeRVghu7Nby2W0gB+6m5LaKpa
         /7TjeL893pw5LzKlTTM68a1pMaTE1HTKuX/hctHez3XRnCkUAbCffKOmbPKBVScE+vM+
         448BCUxsIFSZSOcSHRu5apZYaeJ5J7TlO1R+rWlSmHUTfheWUyE0P3uR4j72qi2T6awK
         clc5Rxt6aKxcqTLsWb0obdAuFL9phgoRotikvXUEvee+scn1n+YHFArx9dy8brVnR8bT
         vLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008666; x=1793613466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tam/cbr1vHUveXOsMHSlkkyctApx/tKKf0dyw/DasX8=;
        b=woP32ooGSqLhaeaR9WuE6ynJUwH/8k2tddL5xGvFVDcpV2acXVLTRWW1E1NIGoE13M
         RSD/I1xzwHlen2u/ni+QoOXrEgqvekSwhluTF4GDkvkks4H3WgFwSydB0gAlyrL5Pr0n
         GvCrLAzza0Ec1B+E6wQwh4IX60VNMPMsDOnSQPCwluYsDe/3GXdvaq0kPbW+PE2TM+l8
         wKhc4JRCbfoyYeEXzQWTeVLNPgegKBds7vvGaFb/VlQseXE1dN1sg8zFEyPx+mf+pTRN
         9HJQC6KhTPWxqtruNJTjOIuSOFOzEeFVIZEDhtbk2MO9tjw47aSOrgvsbIKpI3EWqRTk
         sXUQ==
X-Forwarded-Encrypted: i=1; AKwUvByZO8W2P6FXF6DIZeL2CBOA7fo4acjcoBNHoWiyTa2pofyqKPGITvbhTLfIsnZarLBfVbl+/AbA3ABI47dejw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK2Oxsp/966ub4U1WCOwsN2tF0Gi6owwFLdpWMerRM0CpEyDxFt
	Wi53t/4rxxJp40SjRCC+Mlrb6SQkKvCDS1vS/0KlnC+lobQLnpBEaS7m
X-Gm-Gg: AYBFou0u+U1xTiHet15w0GS++fY6PSVcVj8wWEpJf2cS9gKCumifDjRCaxVCdyTmV4x
	/OS6/UU9p0plXJJRytGNU6uLNLm9s7/ZRXZJSZc5jhXvJXKmJmcZycfrfSR1iD1YnS5OBmBtMs6
	8aZbyKSZkYVqsWfVQuKtrA2dinOApw0aANzIUFA9kpE9DxcVnQaDe1UQGo0qH8b5H/y1dMUm0xn
	3Mr/+rDTgTUS3JTBKvmbRc3VDiZQDdSyxox1bK4g6D7rh35Vgf9puwcYEtMuMp88zjr9EEX15Ak
	3/X0kY7cYTxMAnwECPlnoGamH8rNGY3M3hH1BL4EMbNbSX8L8ptNBbRoJeodQ3qA6nCHEzXHSRL
	tW/IEV6ByUPto0rKQMdHPmq9GB9KsCknMcejKmPpRDW7DXKKIPCKNcf8ITOhKXw8Xb5/83YruHX
	P3conSzmtDL/+3s7Z3EMNkZ9R1MpkXY8x6PdOd2I6/BICqmUvm7H1ZrYVE4NOaxMQ5JPELpKqtN
	7QWcJOPzjs3Ga/T4H4+p3hbbo6DY7ZvsiENvq8H4J7HWJAVluIVIY9dprMAIurVYxdw5vySxOEt
	MyPDa6e/AKtfc5IZXc/FlDZ7K9xHvuiOkMbPfWoG3T5+8gyx9HBmPF1TWHiE
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr42902295e9.30.1793008666472;
        Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: airoha: en7581: add integrated switch node
Date: Mon, 26 Oct 2026 10:57:15 +0100
Message-ID: <20261026095727.31708-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025748_639897_EB00299A 
X-CRM114-Status: GOOD (  10.67  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the integrated switch node complete of the internal PHY with the PHY
address and the supported leds attached.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 147 +++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index f214fa3a3e2b..83ae41271f96 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -470,6 +471,152 @@ fixed-link {
 			};
 		};
 
+		switch: switch@1fb58000 {
+			compatible = "airoha,en7581-switch";
+			reg = <0 0x1fb58000 0 0x8000>;
+			resets = <&scuclk EN7581_GSW_RST>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				gsw_port4: port@4 {
+					reg = <4>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy4>;
+				};
+
+				port@6 {
+					reg = <6>;
+					ethernet = <&gdm1>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_phy1: ethernet-phy@9 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <9>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy1_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy1_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy2: ethernet-phy@a {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <10>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy2_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy2_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy3: ethernet-phy@b {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <11>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy3_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy3_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy4: ethernet-phy@c {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <12>;
+					phy-mode = "internal";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy4_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy4_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+			};
+		};
+
 		crypto@1fb70000 {
 			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
 			reg = <0x0 0x1fb70000 0x0 0x1000>;
-- 
2.55.0


