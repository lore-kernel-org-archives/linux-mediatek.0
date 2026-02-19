Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40651C531E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=; b=OZznEZdV4G7Qzrh7V1gf7FwHr4
	BPQJi/Lv+m2T6WADM/yycCmCSwHRrhd5Z4/xUgsrpQWgdnhM94UmQAW2e5OcXtGuhTyzfPpMjgjHG
	rDCD4IYjmoeuoXucpBKYvxK8/zuAP4BHnmQtzVZoGxucDbzlZK9pShMXizs+IAAlyXL39ArWEyNma
	VhpKp37NI6AzKSZGnGt/K9cTr2y4j0uA5sAJLDlUbZzJ5epauk439kHyJaWAeu4jbzjcK98a2cJ2K
	faLywYvrDRJSROOPkcrFeocdU0hl/+m45RcYoWvc67SQVe5u42GLSenmqaZh/0FLQaUcCNE7umqrg
	Nb06cYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwD-0000000CES0-0SJw;
	Thu, 19 Feb 2026 22:56:01 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw9-0000000CEJL-1evV
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:59 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7d4cb7e10efso1304388a34.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541756; x=1772146556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=;
        b=P91RRIC2E5tcfanMjrMrK44RqdNqk+CSW5XNuz98iR0z+hRw4/6MvOvjktGQWxawbQ
         Wg7PxvMmrKj1arvG2P1APJxr/jxttQhU/uAjvzywSE1iw6mDwUW0MpHfCdJqnsdxKi6B
         bGbX5hwwWm6gqX62+GqbJQsbhta0SYHFnAXIUmP6SF/R1li15b9bt6wiNyYElmn0+QiO
         ikWBQvLWS08tDen8UwlNUWqthXDX565r2uA3Xa4Utwo0XimHt+DXV5G+Um1PFxUa9lkX
         Bj+xku5elqB7lFabfW33m8czBjw/tzbCOmwTNy+IC2CTg3utiLawJ1IczN37rWMAuCPU
         9NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541756; x=1772146556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=;
        b=qxwzSTEmMwYl7AGJ8JojOulUI+81rBeeSiXX+RSuXDCwyM5S91Mp64avjnlMzKUwU8
         UPtUVMchTpjMY+9dd/Gz0BYXC2NBULFPN8eGgcFB2q7UKBYQ/FmAkB5MTDycE9FznaRB
         exVy2h0mJElQ/m3KdsIfaRqB0kdTVqq8ksMy+twoPNeM9409rkdNdt90g2D1kc0RFW7G
         jAy9Q2Z8OS61/sb4XwWVH1WKsJC0u5/1HMBT2HHS6BFDoE4XaxGbwzJDN7NlzdKkUEK8
         0jbdY6epdAxoHgzNCBaFgCpzobeX8jzDTx44LvvXeWz1UqgwLD9TbKmF1HHhj6XTJEc3
         J3yg==
X-Forwarded-Encrypted: i=1; AJvYcCX1V2viz7qp/yaPdoqmn0Ie5a/i/EoszWWmca0xjzrAGtF7vzxygQQ+Ecw7V8EuQ36GNW6mVp5X1gBRV0n/cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgcC0y8JTl//XAT2H4+YtnA3yE4RQf8Hw5IbsMRM3LmtxA8IB
	WP1RXihRLLbOKEhTv647MX5Y2IhMUi+zNCF9i1ne1Nqgcs27Oeuy0WykXDkSC3TH7pk=
X-Gm-Gg: AZuq6aLH1S9zqVLR+r0iL9wLCut9/L7qC4hxqLzypCTW0SSLLc/2cKlWPzrmdUMvx9U
	ypUGos2sRLus/oUILfowk02OLiruwDDxrGoh/W9qbokf0RVEUVE3CP0omx8elr4KkgjX15xIwVh
	pdr3HQ0gwE/U4Kdr+IGhTGaq7qvKTUhJvjE7d1i7KokrUCmBuTc+ElelPpvGrD+jNnjh4aCv4uq
	/zP+ZNat7ZHu3WBUPtmpO3CoO+1H6VHPmLZFI959TeeuAzY6UDMtgP9yHa2UklOP/heamZuaHj+
	qW/ofazLpNB5lZRZ7GK2AUU2DXiyKYETTYJiaYsDzlO3q9F/65+ZngEHm4fULE9Sm+6RP+NvhQG
	Otw0YCnigXRrkgC5EtVSOZDoBgtIKgdTYwlCFmOveJfH3yN5ToNgjNy+wXVXvCqblAw8gbvxZ4k
	S6I8tvVyFsWXBK4Bj/mLdeKgOpAw==
X-Received: by 2002:a05:6830:2b23:b0:7c9:5bef:e9b with SMTP id 46e09a7af769-7d4d0a9a731mr11337634a34.3.1771541756215;
        Thu, 19 Feb 2026 14:55:56 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:55 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Feb 2026 16:55:30 -0600
Subject: [PATCH 2/2] dt-bindings: regulator: mt6359: make regulator names
 unique
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-2-ee0fcebfe1d9@baylibre.com>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=q5ubFzH4qgc7OuFNqgcrKZJjea7RWBN3Hi9vN43DLO4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TzMYDxF2HX4rTA3UnTgVFDxUpAyCkM1Kg6Q
 /Pk2GoyLeWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU8wAKCRDCzCAB/wGP
 wBX4B/494HnG2O3/PxDWMUTl5U+mRUHVBFcrRCjPMQGllZGxZhl0cAExWCe/Riqh1c8ca7b6ksR
 O13CBTRTitM2swXkuwkkECCdVDc/WK2FwJMX9HYlAXourphfs+DFDrQAPcAa2EippXn/tQRsnhI
 MrL41gtfiROq8S5cQYJP5wu5ansEBfY5z/1iabqbsDaDNHfn3jOyUqunbQ0HXY6xxdTPzYCKRDx
 O3Ovcp4iVhPbzgPCtidoQ6joIT2IRTIs3A5GCtnG5j6s6Ul2zCJBGvTEFBVyV59LJWoJq2rk74y
 MGyj5pAs73pMtMSh+HHVuMJoVlPv22ngO/F3KJU6T3Te7LZO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145557_452035_183F2DF0 
X-CRM114-Status: GOOD (  11.65  )
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

Update the example devicetree with unique regulator names for all
regulators. This reflects the same change made to the actual .dtsi file.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index d6b3b5a5c0b3..fe4ac9350ba0 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -287,7 +287,7 @@ examples:
           regulator-max-microvolt = <1700000>;
         };
         mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
-          regulator-name = "vrfck";
+          regulator-name = "vrfck_1";
           regulator-min-microvolt = <1240000>;
           regulator-max-microvolt = <1600000>;
         };
@@ -309,7 +309,7 @@ examples:
           regulator-max-microvolt = <3300000>;
         };
         mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
-          regulator-name = "vemc";
+          regulator-name = "vemc_1";
           regulator-min-microvolt = <2500000>;
           regulator-max-microvolt = <3300000>;
         };

-- 
2.43.0


