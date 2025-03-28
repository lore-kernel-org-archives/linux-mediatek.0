Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19957C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=; b=n1elOgLZuUMUk4X04zXVas+rze
	dw8LSiO1BuYEqPbukOWWs5eUlKsNXLCGceho0wRQlcEBoeZWAZUa2PJZgtQuQV4NbMMHq3wBVGGsp
	hjL4bEddzbBcWhXrR6ew+c9XuUzYgGUYG6K1xLV3ZzQnI0CA8NOF1MCeedKcWUy3WKrVujccCNYow
	l4D6esj2YF9y1tO+JQrbhTby+fsUZwOFhqtv09uJh+KTcDuCCycIT7qyldLOmaIvPOX2oMMMY49E6
	XmoOw03kbc5jT25yAz/f1j+uJL/R//I6GRW6x5rTTgTPEVkiRnAUwKyTWXQOWAlEMwh5ciIILimpU
	OYyLK+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8aB-0000000DI8R-2BJu;
	Fri, 28 Mar 2025 12:13:07 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8a9-0000000DI7p-1tel
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 12:13:06 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ac27d8ac365so164706266b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Mar 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743163983; x=1743768783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=S0V0F0VgIM82A7PZqsgQ92xFdSxumMkFddEuZz/0bqs5xBLd+AlYYKvZAH/zuGScHX
         6GeJll/7ePH1HdNV1c7Iz55iOWk9pTWIu/smIBQTZXBXxSqLKrqUO+3XY5BUmn9Q5G6J
         v6FExmSd3VoRz+TfgSxZESvJ4CYYqhLTeVQXkxAiWlluX8zO30Dnl4X7j6bUqYQjzPsl
         aveE5NnxBo/G544fpIYQy8gkU4eo6JSbhn0+0wDwOV/tdkQgkq1F8FVFpn+9kNJLGoFW
         SXLGKwY8h+noSo40UNgOUJUjlbPYQWTB4UzKgq60nHE3QnSbeGzxundoRAAuhR3bLrMX
         KkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743163983; x=1743768783;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=doSPybKzQ1vcEbkxbPcdjWc3JzbgBz3ulFefRfNlkRkvXzHLul3xNywP+jc5OQBD37
         X533gT1YGiAjxISIinPqE7Zh3yZvUv2J0OMsywIwvzVP4Z0IE6JkzDxN4MVSVOZParU3
         5Xp+sayKZoJSZLrBEwwQqe4x0L4gaGasMw48pvh2UitLMocSU5ZKtpipxoBf1KtrRbVz
         zVbIlXFnWCcXFfZbJi24d1PgSsHFno0jVzQtPVBPRB5XaxqOvXpjDINlKgZe2379eNJ2
         t1MKJGr5pj7Y0raPL2gKFv5rJAX4w90AT2Xhr6O3/jYGGGpVdyB5kAL6bQKyD4fSmxDj
         eSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAxEhceSW6RU82h+Tcay8hP21hs6guKuSnBsl++6P45HqqgTrSZJBkGi/VTYvIGy7ekAWmK0W8Tfx9IxImug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGrkbdY8jXKX2hb7QeHTc0ndpJax71ARVzksInkUU74A78Ftzc
	pk2/GQIW6+zU5/EAP74Q/ZPi/QgMRyMHMOzt0GUJjlyDEZ9ohhjAaUaDrmtJOH8edpesBBKijNW
	eaNTKPtaYew==
X-Google-Smtp-Source: AGHT+IH+URE2JNYwtr+vzakMr5FIwnaziOhvei4JU7ZPSwNs2+pFJiuJvdGrEEam/bZoSIkKiBoQnrek1y96ng==
X-Received: from edrc15.prod.google.com ([2002:aa7:d60f:0:b0:5e6:510c:9f00])
 (user=lmajczak job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d4:b0:5ec:8ef1:35c4 with SMTP id 4fb4d7f45d1cf-5ed8e4957d7mr7600952a12.13.1743163983409;
 Fri, 28 Mar 2025 05:13:03 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:13:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328121300.2612942-1-lmajczak@google.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: starmie: Fix external display
From: "=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_051305_487776_5CE0E965 
X-CRM114-Status: UNSURE (   8.55  )
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

The dpi-default-pins overwrittes the same called node, defined in
mt8186-corsola.dtsi with the wrong set of pins, so remove
it from mt8186-corsola-starmie.dtsi as the first one is correct and
sufficient.
In addition, remove dpi-func-pins node from mt8186-corsola-starmie.dtsi,
as it is not used anywhere and also defines the same set of pins as
dpi-default-pins node already present in mt8186-corsola.dtsi.

Verifeid above with Corsola/Starmie device, by connecting external screen
with usb-c -> hdmi adapter.

Signed-off-by: =C5=81ukasz Majczak <lmajczak@google.com>
---
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
index 5ea8bdc00e81..a8e79c2791ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
@@ -375,51 +375,6 @@ &pio {
 			  "TP",
 			  "TP";
=20
-	dpi_default_pins: dpi-default-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_GPIO103>,
-				 <PINMUX_GPIO104__FUNC_GPIO104>,
-				 <PINMUX_GPIO105__FUNC_GPIO105>,
-				 <PINMUX_GPIO106__FUNC_GPIO106>,
-				 <PINMUX_GPIO107__FUNC_GPIO107>,
-				 <PINMUX_GPIO108__FUNC_GPIO108>,
-				 <PINMUX_GPIO109__FUNC_GPIO109>,
-				 <PINMUX_GPIO110__FUNC_GPIO110>,
-				 <PINMUX_GPIO111__FUNC_GPIO111>,
-				 <PINMUX_GPIO112__FUNC_GPIO112>,
-				 <PINMUX_GPIO113__FUNC_GPIO113>,
-				 <PINMUX_GPIO114__FUNC_GPIO114>,
-				 <PINMUX_GPIO101__FUNC_GPIO101>,
-				 <PINMUX_GPIO100__FUNC_GPIO100>,
-				 <PINMUX_GPIO102__FUNC_GPIO102>,
-				 <PINMUX_GPIO99__FUNC_GPIO99>;
-			drive-strength =3D <10>;
-			output-low;
-		};
-	};
-
-	dpi_func_pins: dpi-func-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_DPI_DATA0>,
-				 <PINMUX_GPIO104__FUNC_DPI_DATA1>,
-				 <PINMUX_GPIO105__FUNC_DPI_DATA2>,
-				 <PINMUX_GPIO106__FUNC_DPI_DATA3>,
-				 <PINMUX_GPIO107__FUNC_DPI_DATA4>,
-				 <PINMUX_GPIO108__FUNC_DPI_DATA5>,
-				 <PINMUX_GPIO109__FUNC_DPI_DATA6>,
-				 <PINMUX_GPIO110__FUNC_DPI_DATA7>,
-				 <PINMUX_GPIO111__FUNC_DPI_DATA8>,
-				 <PINMUX_GPIO112__FUNC_DPI_DATA9>,
-				 <PINMUX_GPIO113__FUNC_DPI_DATA10>,
-				 <PINMUX_GPIO114__FUNC_DPI_DATA11>,
-				 <PINMUX_GPIO101__FUNC_DPI_HSYNC>,
-				 <PINMUX_GPIO100__FUNC_DPI_VSYNC>,
-				 <PINMUX_GPIO102__FUNC_DPI_DE>,
-				 <PINMUX_GPIO99__FUNC_DPI_PCLK>;
-			drive-strength =3D <10>;
-		};
-	};
-
 	en_pp6000_mipi_disp_150ma_fixed_pins: en_pp6000-mipi-disp-150ma-fixed-pin=
s {
 		pins-en {
 			pinmux =3D <PINMUX_GPIO154__FUNC_GPIO154>;
--=20
2.49.0.472.ge94155a9ec-goog


