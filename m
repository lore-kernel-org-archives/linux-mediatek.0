Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E25CE9D4D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/t/NcB51sqAFQDiderPUcJQ9/jY7pit5p9mBhEVktE=; b=Q++ZsWSXW0s7+QP9AxCu64IgLb
	1qCrTDJtHZ0t+YkIeNw0V5yxZC1WsjU+Lh9BOrKsOvqCCtmRUxgZIYVbjPvaTD83GYidHLyEcvzBD
	k/hcQ7uBtNZEmPu5XZha8iRpemtTv6lFQg9hzbwmKeuJCyG9CSdMn2wiHoCWMjs1WR2AkNBaXFzBH
	AdRQfJ+aP6kW6WBKHxfo1pMq6ytmqZn+Fan94R1pUTDVW2bnJ3gPrQBKyxkp1fxMAs07kQBYPAxa2
	J28dKLGbIRdW1T4l3kNPIbSmex+57nrY/WSpXino5PU+IdyaABiiiiU2EjdAwMnNWAcKAUzDDadCn
	gvod22yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8sL-0000000DOUz-01Dj;
	Tue, 06 Jan 2026 15:21:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8s9-0000000DOPe-2N4v
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 15:21:29 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4537407477aso707886b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jan 2026 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767712882; x=1768317682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/t/NcB51sqAFQDiderPUcJQ9/jY7pit5p9mBhEVktE=;
        b=IBwcgJnL6zzTRbArAWB5u4AqbbWqKiiO2J29oN/y0j8YzNlx6Sb6i4f5wrgU5oXwww
         woGhSv7AOg/iPIsrBK2b7u7ZdRqkCHXuagd2xHYT1ZQMu1ORNwZxsX1tg4hNxC+rx8ts
         cZC5qrWeBNrT8jDztec8muGVuogy04FC5aJRp/hYeR+RSxtDM4B9olVUZ/7Wo4CfMKhu
         kbu7HjMUCe4fPA/6HV6C+NGN7ikb2rAPjsXD8f1GBq+FFbdKWTAn/g+fpCFPqzcT/FyE
         w7MqV09keuHjDE8AchunpnvYf14LJe++2It0pioVZLJsz5ZuIEqlAvHPe0CSX+h74wX8
         NAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712882; x=1768317682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/t/NcB51sqAFQDiderPUcJQ9/jY7pit5p9mBhEVktE=;
        b=NuQURKdO5cqlXT7GnD3InHu7e0EjMzfE79EFXJBTAoKOzmIx8jevDNd09hDVD2rlH3
         IG3Awm2pYlWWLKj4z/tcTHjmF0C1km5ijW3mDCQofhh15ovEDm1TDJuObsc7MLoZno+K
         QLoj0hao2zJKbhu7Selmw8lYo00gBRhY/tYb/YCU5Ccr0rBK6557zUXRBHxpvqv5+eVQ
         tvYOKOYs/RF0r/ekFZuOeE7eW8yqycu10QPYrHJHnRDCVgjtq+Xuh1+CyK30VXOv3ON0
         I/RZMDN2C4Wu8XxBYYC/qhLIu1yASyB3AWA1EjuzEKvKMzuvtW39IEVuvFnoBgStfoO8
         ql6g==
X-Forwarded-Encrypted: i=1; AJvYcCUA2FNytYC+Gq+nzUNhhQgVaaQCZIGzTJSYtx2fcim/HjyA0UjkidamnJmNpfx61idOcbNgafgJXPk7wLw75w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwrwZ5l5JdBICl0rT/F1KoQqNpXJvgEU3rgWaf2v35lYhsEBSu
	4QRe2SLOYgzlooenWqMOjgj6yLmXPDvjWDQqdeHmIgJen1tjzIoINnI4//Sb7AcftHo=
X-Gm-Gg: AY/fxX5OPkLNMNZkxZ7yOkNQBt1LYwRQcukZqr6XM7+Fiab8BPcmNaBM9N622Qnr8hV
	QweWRKo4Hfgjw3Mt5cDZxGqKTj65UcZ5KJxYNFpNlD/quEBF6un7WpTFcS4PJ3vxR/hh778vQeP
	S2ufVAUGBHAt8tpgyr651f1BbhREVxc7k2r5kQcSphF0ScSu8PW0GkzmAZuTOfTbF+XIJdi+f7z
	b+WfJ4KeLXYWPRpvqY7wo9Je5I3j2dD1oj0wv9zaxB0o4qmHz+uDIh2XpV/U+6LhafxZu85MdFB
	gGiFGPUhjh752kW88ldWXyC3E2gfANH7wDQkIuJCnPcHNIQPRL0iNz0TkkuGT9rYQo+o7HkK/vj
	dQpY9xntu6w9/iI8D5FjuLndNbk/JVTLe9YjV203Kvs/Jc5NG8ZGYoQiR5c6aR9EWVp0Q7d2mKd
	xxcK+biISlM6h17p6MXt5/FADSig==
X-Google-Smtp-Source: AGHT+IHMOQWDQWuXZsJRwpIf24l4IJ0UIs4un6Y4JFrYSz9acYwa5C8MYevbexce/tpNOsHYOYBv6g==
X-Received: by 2002:a05:6808:2516:b0:450:7f09:69a9 with SMTP id 5614622812f47-45a5b12f56fmr2140044b6e.49.1767712882089;
        Tue, 06 Jan 2026 07:21:22 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7f98:2205:4ba4:3e65])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd81sm1041992b6e.2.2026.01.06.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:21:21 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Jan 2026 09:20:55 -0600
Subject: [PATCH 1/2] arm: dts: mediatek: mt7623: fix pinctrl node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-mtk-fix-mt7623-pinctl-name-v1-1-33817c7f78ee@baylibre.com>
References: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
In-Reply-To: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Zz/bp8VDcWlKoSk5ViAzIDt0BEsqIbEbJ9edYSIJ1vM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpXShiySFBrfJH8ciCefdKbrKNaXKz+oYa+/Xc/
 5cTjcSGGYuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaV0oYgAKCRDCzCAB/wGP
 wA8hB/0Rk3h/CrVUNlq1EIdiwxY3C0+oKsxr397VbJBjFtcANQJ7Zclc9UqIc1yqOGZkZKDVTT7
 Jw5F1hyzZFRM3cLwCBGf7Bx7wQjvv58z+jtKowVGbowHCo6rp8ESWoeql2a5DWxItDsHskt0VqD
 RckE04g99ezVvjN9EMrlZLrCZoBLXb2oXxMtx43M590KTOARQWqWSRV8B9UqNvKR9FHy389c2bX
 GizH7nz3zAk1LXJdeUnnUwkBg/y2dZWewPd2I/6V8QOZWa5FGkJvmcfX2YfivLKIog5JMHXBi9O
 an4k1ycuIFUoDfk5TdJNra/2xkcEVyt66einevkVMY7kjHb3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072125_887529_2912CF5B 
X-CRM114-Status: GOOD (  11.73  )
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

Correct the pinctrl node name to use the same address as the reg
property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 4b1685b93989..9c54711fab18 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -249,7 +249,7 @@ pericfg: syscon@10003000 {
 		#reset-cells = <1>;
 	};
 
-	pio: pinctrl@10005000 {
+	pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt7623-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;

-- 
2.43.0


