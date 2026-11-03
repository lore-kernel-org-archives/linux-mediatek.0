Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2538F606EEBF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m02ORLfJ;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b5cvYoPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=; b=m02ORLfJAMsYtl
	oOQlTgXIBriz0Jw1V3WzgTyROHsyNAY3t64S49lgxmNXLDs68kSdoR26IZbBeUy6NOK0ODn3Cti+V
	ujmVbYCJFL0ECkhb92NqNkv0LcH3wgm42eUIuZkQZ8BB8daVQ3dkMtIqkLGHe9Dju/MmYCmRPLVxZ
	PiDGLMqX2Qcll2mUjFfXaUxEx94rpq+CD/njC3VzCqA+hxd3L3Ef5hxsrgKzSvPDMHLSDJHXAnZVz
	3cmFm5JOofJJ7tYQhRAt7vqZ8s6sutVDCRXyTzUOQqNo9EhKMhc8rtT/bbwR+fI0PVoo3ak0syh45
	h1uz3dtB5K3BPca6skyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xn-00000001Z5M-3WFw;
	Tue, 03 Nov 2026 08:33:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xk-00000001Z0w-3KSR
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:50 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso232903a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 00:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694828; x=1794299628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=b5cvYoPAeY4kMBcmxFRjNXeXNBa+AycGI9pp/Rr9fGBpGqah47o6I9E9i46rwAvcgi
         OqfW5FA3a3m/YrIr+11uAv0qbN7qLR9zeyiBXu3GqW+cqMP4/J12kFF4TbXZ531OMT+8
         8RRyVjdFIJIm/Vi+SV1DszYcm23ZPL54v6ZKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694828; x=1794299628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=rU8lAa+cWWGYnmwcqPLAORmtwuYlQCOVxxDGw57iQYQ0qzKRYqpjcAh/AQsRX7nHU6
         2fYSWaIdFHciCskfYSfzj+9FXv/NubXNQenOpTl7vQj3TEpGyqlDxVmEY9VZhIvKwOSZ
         BVkqrlRVXgN76AtNYq7BeBSmUSk5+bIlsYIhgxBCXp2CWYGR0J+7h0HYFNDz5fjsdgqH
         1m6orhmsd8GYAtcnd7iJ18enBniKMROkAN7GZv14qqD3TQLzXoNubTR4iVww7+c9nt8i
         Qn6oU/w4qw2L3Pc1SBiIohyVModu2cmEV2B2ofeOSgLlONNDg1s+rncqQBj7CzVanNFQ
         M8tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbky3mREuiALon2KXTfhdoqks5QuZJb8VuSzbAuJTXRWsmnaE96q0rQtXnNVagM3AKASGZo/9KGVwfPd58pQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PfNV4mzURii4lXeYLBIGiXuV3w5u2oKe8T5dJ1+KMl4e7VU7L
	G5oSBj8KBi3qxVyQHEFZGs9Hdn23gdXDtC4tAWss6zlx5N0NfkITUDxg49Z5QH/4EA==
X-Gm-Gg: AYBFou06+GiGuCdWqWbT1TmYBkXDwXo1Iik+kxXQvYakyXV6S7PXxfv9I9KZzaixo92
	hVoXqNdLMT5308ZQtIOBnR/N8IoAkif8Bv+8cXZrrv9B48x01Ug+ORixRsaRYW1uHTPEaEaYbyF
	g8LI+/wUUrpGTIrw0bEuHcPb5+Tusx1AzaJOidL8V1VTpTpRuM55CknOzFZ2MwT+zToIp/pl3Ih
	Pu7rbqaMbbdeXAlwYTNX7T9CUVpI8RLudfsHSEqtCSwst0tj77Tsr8AN//oFETLn5eOB0s2Bvn3
	J4EhioAArSAqlyu/gNAC6/rTUKSZ+d9E8Q23AX1VoeISkMC5R8sV+UB2SKMoBNCGjXkf11RNL+n
	5Vn3c7E3BDiHYhQ5RHZ0K1Ofjbh6WFYBLYsRwNgd71KoNFgcaqbvVV96PcZOimn+2PnMpca8z21
	UvHq1lyXzUkzzSn5rSnqoxXVKN+aQCgk3Nk7B4FJwJb2Hq5VW2r8ze5sPhYNzk91hns7q8zMciu
	gcs68jq5MJtmJondkMb3JMTxBQEwFL9dGbC0CcoB4eHrxyHifd9pA3IkatOMkzFE5E9NvcyLFsP
	sZGqIzrflI3AddMibEzIMXGUocDNcymVKVqkfQiU9+vD2dKp+ucW+WuSLXwU8r4izwOg63oRZXb
	zsijsGsB3JPZly4b+JIad5Gwe5vlelXGOvmY=
X-Received: by 2002:a17:90a:e7c5:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3ae89559886mr6852208a91.6.1793694827794;
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Tue,  3 Nov 2026 16:33:33 +0800
Message-ID: <20261103083335.2944847-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003348_842608_AF70305F 
X-CRM114-Status: GOOD (  10.16  )
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

"pins-usb-hub-3v3-en" listed in "usb1-default-pins" is actually the
enable pin for the USB hub's supply regulator.

Split it out as a separate pinmux node attached to the regulator
instead.

Fixes: 7982bf7ec2e3 ("arm64: dts: mediatek: add device-tree for Genio 700 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 821dbf9d3fc5..5f41d78df685 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -216,6 +216,8 @@ touch0_fixed_3v3: regulator-5 {
 
 	usb_hub_fixed_3v3: regulator-6 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_3v3_pins>;
 		regulator-name = "vhub_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -1256,16 +1258,18 @@ pins-vbus {
 
 	};
 
+	usb_hub_3v3_pins: usb-hub-3v3-pins {
+		pins-usb-hub-3v3-en {
+			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
+			output-high;
+		};
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pins-valid {
 			pinmux = <PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P>;
 			input-enable;
 		};
-
-		pins-usb-hub-3v3-en {
-			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
-			output-high;
-		};
 	};
 
 	usb2_default_pins: usb2-default-pins {
-- 
2.56.0.385.gac671c819a-goog


