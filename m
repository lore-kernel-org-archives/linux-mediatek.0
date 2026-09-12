Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD50AC88E64
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8//usBnau6Q5Lsbg3Mie+mt/Y8AKS+7lUlJS5zLltE=; b=yGowFmYENdpp7j6RimWUh8dk+v
	IVjYLy9ib+WjMi7iwg1kV6JytTr2eaQdMpHMvy9Msw1ay3tcbyf9D+DWtjO+2y5YfkIjiMg6dtYOS
	yBAq/wW+5E27QGRndzJB6h0TtzrDeSn1kQFemzAUcH1c6ZqV1TWc2EgISF+uxapkb0ByMBahJKaON
	sCd00xENqYY7cvs6j3rZI4RMAc16Vpkni9jTi99e4iNdWUV3YmjSJoj3ig66k/yge4XB1kUVyCPU2
	IQdRCRzZEsE99XucGNQIUz/Eg5yKe2BcwmwlCDoXFR6WYGSPaDDoXIkt/Rauxguth/eRSk9h0T7Cz
	dw7tAnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SN6-000000013dX-1uEv;
	Sat, 12 Sep 2026 18:22:40 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SN1-000000013b1-3Fsd
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 18:22:37 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-46ae9734a12so472983fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237355; x=1789842155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8//usBnau6Q5Lsbg3Mie+mt/Y8AKS+7lUlJS5zLltE=;
        b=ZXY4H1ieBWHfVsewwW7LM5DuEyXFChhy6KOde1QWPi1VX5QyKbi4QQVkazCbdCeqpY
         T0S9cI9TEk/j3/rQP/ydnSsBhNhex0nkR0BFq8znyQraE+Lze0QPu5bSeKqmDJY21/gg
         yx4SwT4xTasTYXKWFzjX+14VYBU+//9fabB7tn/gMjWtYZ9nD2oksBpY7ie1Se1PA1O3
         NL0cckd62pdvvt0fW9Q/cB2jdvdmF9j9W9S/PcU2cW4uJldMb432Db2UkSPKdkg2WLmW
         K1va155M1MLz8xXr+AvQb4D+xywByY2hi8uKQZRE7QuLykisPJAl5KQRALrmRJOc9lsX
         BcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237355; x=1789842155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8//usBnau6Q5Lsbg3Mie+mt/Y8AKS+7lUlJS5zLltE=;
        b=EzPWb3hfMyIreoXUoJaOLuzPHrAQl74s9pHkvSIc3Tc+IakxKGpRAQHxvq4mZdchUI
         vozqCaunUDOpcFD8JVE/c1DIwrzTC4lpQ24FVsdIKaq4jQzsIR/HbT4pbtNL+WTZjRnX
         MRsRZ5ffYtdTLE0lZ5t2p79bFWeoiemihUHh7Casye+hc2hanwVRNXEn3CZZLOeFJbzK
         vBue1JhHLN5JFTedjrilNXlzQJtzozJ8fQcMf7orHC2SmhPaJmNyPQggaxB+CWfzq026
         +8JHnBBn7ksXULhMxLERqW86tvM1qbisGAxjMXj9T6/B2IUd36lC6kGYWztmcLammqlE
         uyyw==
X-Forwarded-Encrypted: i=1; AKwUvBwVAcUHd228m3fPneFVDqEtfVwO4BTpfurkuKwhetiX/lNNflqAlBCrUR82ZbpfWWRPpaommrzPOG1NlaqU9Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nvK/vPGxa/WR6zuqPGKE/TWz1XQlWGqGNNzT9cN96JhjaAGO1f
	8jtRKRkiYa5S/lH4lkIhebttAWawU34ngUEzejqur+M9EV2wMYZZzweD
X-Gm-Gg: AYBFou2nL1EcmOWervSCjBayg/3qR0HGpduAaX4pzSjniHmr7dE0Gk1KzfCyKaq3pcL
	ow1gDvyHeQJiY7LfhZu7l1//yjnD3doeuMia2gfDIzyVYaE9S7fyi9cnaMIf5Oir0KGRyluApPo
	TJH1rfx6f//MTPFv8pvOs1yWnVWTaDvwQV2bxd4Se2y5S6sOjW8fDPwgdxZvudzqEtzaIcQ/pVF
	FGR2J9OswN51dFVWtWh6YSuQEe4OOohvfoVnjZd9nwv0wkGCK4zO0RIuXBuZuRfJOQ4NfcXuNPy
	+VuPhj8H4msH/P7B87zSTmtb4Bd3x3QdTd8whPhnXhUMjGWnw2enl5FA20paG6/uJo973WFFOox
	K5DiijFGPlYfy87Y7zU430x1Wg5x5VsEPvhSRtxocgvRUhy4q+U9eboNh787DR0Rok+6yt4zO5R
	XwI+HnG4S2oymb3z38APQrFxVIsb7mByYG8d/N2PZtV4F0TP9jzP0hR52o8y1AKW0DJIk=
X-Received: by 2002:a05:6870:450e:b0:447:1ceb:7cc6 with SMTP id 586e51a60fabf-47de872a0e5mr7271993fac.15.1789237354689;
        Sat, 12 Sep 2026 11:22:34 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm5413898fac.1.2026.09.12.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:22:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 13:22:22 -0500
Subject: [PATCH 1/2] dt-bindings: display: panel: add the BOE TV101WUM-NM0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-add-boe-tv101wum-nm0-v1-1-3057a08e8b80@gmail.com>
References: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
In-Reply-To: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
To: Nickolay Goppen <setotau@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237347; l=2359;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Dk5sO8sprqfKcj5v0A3UNo8voXa9iGbs8EHVHYJth8A=;
 b=B8ZBDlitIgMNBtTa8hluOWFctV75BBpAS9/F9ERZR0Xsfyvo30XET1S+jTjJXlCf6SYkKRVAc
 uazXohGolAuBhr88BfOgJA8DimO7G/7HMjMOMH/Z5bpdoO34uROKAio
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_112235_847073_20DB4B45 
X-CRM114-Status: GOOD (  14.56  )
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

Describe the BOE module fitted to the Amazon Fire HD 10 (2017), an
MT8173
tablet, as a third NT51021 panel.

The methodology for finding the part number for this glass is notable,
since it was done by process of elimination.

The vendor firmware chooses between a BOE and an Innolux module from two
board ID straps. This means whatever the two are, they are mechanically
and electrically interchangeable in the one chassis. An Innolux module
pulled directly from one of these tablets was pictured with the part
number "P101KDA-AB0" on the back, and that part is 216.576 x 135.36 mm
active, 227.926 x 143 x 4.4 mm outline, 51-pin MIPI with four data
lanes, a four-string WLED backlight and a 3.3 V supply. The BOE module
therefore has to match those specifications.

Searching through BOE's panel specifications, only two panels match
these constraints: TV101WUM-NM0 and TV101WUM-NM1. In particular the
number of pins and the dimensions were the greatest discriminators.

Measured on the available board (BOE), the tablet's LCM flex is
silkscreened 1 at one end and 51 at the other, and the area was measured
as 216 x 135 mm, and its backlight regulator is configured for four LED
strings, which matches the TV101WUM-NM0.

Finally, a replacement part listing for the Amazon Fire HD 10 (2017)
device also names the BOE TV101WUM-NM0. The NM1 was released later than
the NM0, but is the same mechanical design and would take the same
programming.

Even though the part number was not physically read from the test unit,
this module is absolutely not the boe,tv101wum-nx0, on the pin count
alone.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
index 550aefaead46..6045385ce1a7 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     items:
       - enum:
+          - boe,tv101wum-nm0
           - boe,tv101wum-nx0
           - boe,tv080wum-nx2
       - const: novatek,nt51021

-- 
2.55.0


