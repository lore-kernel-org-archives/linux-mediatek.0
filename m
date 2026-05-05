Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A05CD343A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=; b=U3fLtJ2ILJV+v/LzreU5btmFkr
	RfhekcPrRClGT7Y7z3UTV+aerqlZor//rCX2GeB0A/Kuez+8v6T09nE1BWQFasizXkTno2lGwFg6j
	Q4nurA0w2MA5cxLfetVHAycJ5ULr6rseAi65MBUKsoSjuo4jA8eEgq53ycftAfCXh7TY5GM1o1Ein
	Q7zHoKG+OzKmb3rM3KhzfQj6h6b4TZGyBXSLyhih0B5VIh1kreroIgvq0pESnTfB7tWxJAC5VjYkT
	Gedt/zvK5qMYSo+/h8uQ1XTq8S1CJtzA300xP7fJWZabih7g2B2SW/d4BDgpXkh9jflVw+en3bzZF
	5/cDNPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCns-0000000FrOw-0KmV;
	Tue, 05 May 2026 10:15:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnq-0000000FrLS-2HIW
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=; b=BQQlUMJnmVX+dk9B69P9U4uwwD
	4USWYzLSKtqBQGmnuOnooPz/994xrJQ+bVgYr1zIzJCvOW3/BNVNdXUu5WIQIVedEsb1/3vA1qdd9
	5NaTfR1v+nZHgRrBbfclaeOH8KZL5xII6yzR5gqG5H5s1HHHRDokulPj2Idl78a0V1K/LA0Kdio8e
	G4ilxVyPDbvwIvPF5X8d5j+Bf9pvH6zWwRyJ2wtc7VTLmnlREGjgxtOYDpYcVRvftm4StMbruMMA0
	O/HRwPGFhmvH1DSkESx+HzPXH3RVo0ZCnL8KXaEPBE7oll68UpY2fynt4b3YXzCzbInDUXGExWmFl
	6jxY8ULw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000D9eG-2pHS
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-83659d38e38so938762b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976094; x=1778580894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=nsbcAYs246Owlx54mc39chAwvSmgI5rWTA4bDhF37AcSYRN73ORjzikJ8yvZQHzZe4
         6YjkKUOmQtEyw/xh/eUmZYx9qjeY/K4NeqmLCSWMW+YV3v6sNNwu4uvK5CZFwGMLo5D5
         vTP7LkSXsqcBbvDrzpbvsUl9Wky/zKQGp9/iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976094; x=1778580894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=SBvek1urvxae5ojkF5w4c5hovUduqJSc1h8nnmNs+cDD4waD5ByrP4NGGe1DBOO5Mv
         H85VJ3YBRCkbDENxAX0s2O6/+50J53W6Qs97BkA/+znHxAz5AG5MaalSGnYWEqcVzq2C
         sdoDxLXZ9tXUfukSIqviZ78ZNdE8iDzqO6kPn194i2M7cx3OaAvBRc3UOLhzI9IBJZfq
         7a5TXP4u61WkVXrm5UFp7eM7/bwr60YZP77DBZHGv5IA/iieAKDiuqLNnlDbOiPUgamB
         E0mtWWV333UMnDiivIMQ7IYfF5mZGI2UXjfYa1Wmqzl4i0qm9fXhfcESHh5xf01x4rkb
         +54Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ec6qfKqlp0Zqpww1P+/1fKTR8ZQbAR0NW+w0jetwYzconQ+u5ooEa4Z952jQ/iGQCb10HL9x4v/0dzSdzdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZVqjt6e2+jypid6dRIJxYgik9dR+ToQNUMOOQbPzFkhkqOovl
	9y+xwDU/jowbwHAU2o6ftlpCrSHWybcJ50pecU69Fdj1HKy18RooW8KGLuf4rQXYZQFKeTrN8/R
	2hh4=
X-Gm-Gg: AeBDievWWUVelIEAeRQwWjG+wt2cbTgnFJQe8A3zZvxjrtvlegGCbc7dUpBsQCskUOX
	r48rXYhgEo8ZmZiuVtix6qiAP9oqPiUEUB++eBKQklW7QcZ3AuZL4R5/IRXOX0lgli57dwq2yYo
	cN3pihB70ds/732LpMmiNksC4PfXjSCuR4vw2EcxlL1NiEd1is865+2caJ47Py0JCOpvM71v9+q
	rMdsUKUj9NG47vXaYO614nG7Ma/nvChya3kybFxUc03bmuuCv3yulKWS504V+LZ/Z8yFQoViWF4
	U4X8BY1lQnk29BtMAqBT4Mi6t/aKCXu1cMD8CV8uIKMdsJnxyQ6+J8Ty/hQqIgchOrGSf2hNDqJ
	qFVM8zALLe9KH4FEldXB20OgZP1OFLV33gKybWisOdvpj75uNRjCUFXyEs8bUNpC8uPR06FWXw1
	nacRXMx+rwe4lJ4ED6b90GgpvtJ9qHZTtV8t6NHqXG93nAqIow+yaUbojZLUSxBjQLF65UWj2Ru
	LBYN2Gwp/QKuSOztPVJF6+P6qCY5A==
X-Received: by 2002:a05:6a00:3e0d:b0:838:c01a:7a54 with SMTP id d2e1a72fcca58-83921dfaa03mr2439889b3a.2.1777976093740;
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
Date: Tue,  5 May 2026 18:14:02 +0800
Message-ID: <20260505101408.1796563-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111455_819958_799E183C 
X-CRM114-Status: GOOD (  11.07  )
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

The VBUS regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bda1b0f9f72a..dc1ba143ccf2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -212,10 +212,9 @@ tboard_thermistor2: thermal-sensor-t2 {
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.54.0.545.g6539524ca2-goog


