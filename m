Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804360850BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zoCTRCbf;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VAGUGW6Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=; b=zoCTRCbfanmYc8
	8h7Vmyymyr98pOUGUOkcyPqqg4zrMgnVDbdxU4N4b8F7xEUeQWHNIElQRrwYRbxMhek4TOjwdWRJN
	w3FYByJXtddTfmkmrnkBvU+4KVWJw1GpdZLBpiWx+BpbqWQBvOuJ6oJuNBVLjTfFmBsvERjIcsoPH
	zxHp/+h9LslrYcA8AZ4ehvXXMllfo5PA+5AP7R/vgtaMgKuNyt/dm8MZjiLmEOg9X+yI5V8b7geSP
	DDt/Puke8Mu6VTbFPgTm9A8+WQsqSn2/Y4EDI3Rayeoa1lmYcyi7bFt4bYziAIVEvAeSLFmZmyua0
	anPc966GohZ9GlTFOQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xk-00000001Z0u-0cYr;
	Tue, 03 Nov 2026 08:33:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xi-00000001Yzf-1xTi
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so229720a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694826; x=1794299626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=VAGUGW6ZxHBt5891nQxD9nLsYDs0rj8d0PpFw0QIx5fXG+20WaBh//ROp3HhnVk92L
         HChDWKilYYRYOjrYwJVjkHHl+hg5D7Hiyk47F3Lfwt6o/4dxKNVkKxnJtS0cvPWq28a7
         MZGHY/24PAA8tiYOoW+oXIl4CDTYrk3zaIJiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694826; x=1794299626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=xRbPPUPhxaG+V/Ok8FP+ECnjm7HyoNOFvlaJK8tnNv78YNeJ5Y9u8XRhVtXhVjwJni
         aTSwWTy9tLBNNMQyPf0TYJI1edKUSexpa6Ts2fKM03El9m7RnK2pbhMLcDgOBzWdZM+I
         FGsqKuDoktLz9YTNzIMFot6230yk96R1jjIJjZRCUrt+zxvTFyKPXdwefusG0Arfz86c
         NP7G+kikVq1Y15v7PC5xLsvQ+fxCDNMFVD49GFL3UkZkqbJLWW4SblpRb+NhdElJMNru
         bAHX6dTMyXjD8RyCW795+7v5tSxvXfKRSum2whgqNobMGfB/2Bn6GtIjjCsQtedd7JFP
         neFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUF3KNt82L4hFJYaQIhEbC8qGgW0wGmZJkOtSmn+yWMy34uMy+WUR9U50NpFvwuX5XraSJBdh7mhfEJz+VBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9G4NuMx4fdd96Lm1AMAdSVUweu8juU22FZdo3CN4recUCfv/Db
	vcs1eS1m5UL5DmKFnu9qAv+ahor7qYgxqh+RpqF1s8B5SqGxT7zhSxHLp4w6EmVPrw==
X-Gm-Gg: AYBFou1owMDFyv2TTiLHu4WJ0ua8Z607MWuX72/35gHwlMD0YPU90CwlXboZKDaaz7h
	Uv9b9L7tTlgENk4pQnYZvPL/UJpV98P6MmFyYehtY0E4MkOdzMfyyslsiAOKVhy0pe1RSvp41iM
	T1Fc/9YH3jQ1OPHtC3AdQ1DJC8nUJopK5FH0HTcKPT8v+2ChwR7wZkOvKU5XoN72BdW2ltiOQnK
	aa1DoczlYc2KOixO3/Oom0DEj3Kv8rzj9ZmVYp8247d4dpuP8+fLbK3qD5ZGYy3NCWuovRl8GZd
	7ttXgldetRfXNb1WVdjoG6Oukz9s7obUA5z/hWu1U0EXcqlE92ynH9lZv+UCb6GBtjmsOq2+W6n
	igwvz2ds+8Vb/o8/gHIvuV7r/y6QleJxsNWOi0etwrZIIoUHmhAzdFpX42ci6x2R/KyTm6TuXAb
	zjDU/VKsJzSv2tcCCK0VrRL4/wXKqGeYbE7LVebnD7+U6hUYM3y7h7nUyHiqTBHsVKm6n0odDOM
	EYe2RQbPTU08jgxtYIvYk970jT7tzHOcRBTOvczqq0YxBrbJlVjX6y+PtidG3DsKxb3AC3+hHmZ
	n8/Htv+DW5XwWBk477NGWeQf/ribKmx7FKRChyxSA6++ZKUNHiXCTPDPuopLMW6SRhqfcNnf9ct
	zIdoBq9Haddr4
X-Received: by 2002:a17:90b:528d:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ae896d8027mr6639826a91.13.1793694825657;
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
Date: Tue,  3 Nov 2026 16:33:32 +0800
Message-ID: <20261103083335.2944847-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003346_507236_D767CBFD 
X-CRM114-Status: GOOD (  16.07  )
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

The USB controller complex ssusb1 and xhci1 operate in host mode only,
as it is immediately connected to a USB hub. The user manual has a block
diagram showing this, and a USB usage table showing port 1 as "host
only".

Change the controller's operating mode to "host", and drop the USB role
switch property. Fix the USB type C port data line connections to go
through the USB hub, as shown in the block diagram. Change the data-role
on the type C port to "host".

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.

Unfortunately I don't have a board or the schematics to check which of
the USB hub downstream ports the type C port is connected to.

Also, the order of the USB hubs might be reversed. In my previous
experience, port 1 on the XHCI is SuperSpeed, and port 2 is HighSpeed.
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 43 ++++++++++++-------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..821dbf9d3fc5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -512,7 +512,7 @@ rt1715@4e {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			data-role = "dual";
+			data-role = "host";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
 			try-power-role  = "sink";
@@ -539,14 +539,14 @@ ports {
 				port@0 {
 					reg = <0>;
 					typec_con_hs: endpoint {
-						remote-endpoint = <&mtu3_hs1_role_sw>;
+						remote-endpoint = <&usb_2_0_p2>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					typec_con_ss: endpoint {
-						remote-endpoint = <&xhci_ss_ep>;
+						remote-endpoint = <&usb_3_0_p2>;
 					};
 				};
 
@@ -1528,19 +1528,12 @@ &xhci0 {
 };
 
 &ssusb1 {
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "host";
 	wakeup-source;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	pinctrl-0 = <&usb1_default_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	port {
-		mtu3_hs1_role_sw: endpoint {
-			remote-endpoint = <&typec_con_hs>;
-		};
-	};
 };
 
 &xhci1 {
@@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_2_0_p2: endpoint {
+					remote-endpoint = <&typec_con_hs>;
+				};
+			};
+		};
 	};
 
 	hub_3_0: hub@2 {
@@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
-	};
 
-	port {
-		xhci_ss_ep: endpoint {
-			remote-endpoint = <&typec_con_ss>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_3_0_p2: endpoint {
+					remote-endpoint = <&typec_con_ss>;
+				};
+			};
 		};
 	};
 };
-- 
2.56.0.385.gac671c819a-goog


