Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7791093182
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=; b=C5I/I4m6t/4PGZwl1+ILr1Fcw2
	SHYi99FgFJziUoBafY8UOeTQgKAQUANKy7WdXFj/21GA0golEEftnbYWh4T4CMnbRfrwOTJTyOgLq
	KrhnZpVNCpQVnfm4dNT70m4dSpV/eqidDcx4VhOYac0UEluFdabs09gT6MjLzLtmoFDf3541LjgPJ
	0xXYpcH0PUZza+EqzoCj2EB20vGCP46pA8AE5k2w9gxlgDWube8f47rggZUAjFz9GtKztce6Dw7dL
	iNzTSDhSXL7AA0D1+3tY2KrLXz5wtVbKqQPNPsARu5twVIM1zk81kEW8+xgbOnUNfbmf2SI4Y8uSl
	2zZoQxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCX-0000000CF25-1LaC;
	Fri, 20 Mar 2026 07:23:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCR-0000000CExn-2nqM
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad617d5b80so10789395ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991395; x=1774596195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=;
        b=iKY+bPCmcU/gpUbziMwvAj0eA1x0t14xyFok32K7P9sYxmNyWkBbIBMbaWdEqNL+EU
         JxZ3enobiSCapNSktUrd61MZjTMfMYB6ZSKwW9HG3kqJSqapq+AbQ6zErmNLkIuuHKY7
         1HVjP7XBzuFkZn3scVQOck+4E/nLaCdQJHqvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991395; x=1774596195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=;
        b=QcYsmtsme/wQ9A4mjAb54qEkdOie18sCIEIeFKbch/5o3HuQoxEKiwysyok8VUDEsu
         oY8PWydKpUMJJqiUahXx4lhVrtwa7yj643jWQrk1HDfULwVWlDYiAdel4CTLwxpUga+O
         xkqvr1Ny5c1lxov/GIrWXN/7Sa6eSxNhU2b2YtQ0AvBczydSWuO2M/1jbWdqKeO6/BN1
         02yQRLDxsRhDUgTYm6+u4HYzxXyDRVZs3Dfog0sjL9Nwdn4NjQ8ctiGRtzmAlTIlfd7L
         G6F3CfmXN8hbb+vu46VGePTpiP0jniFx8zxOvvCIgviYpUEy66Qf6JNBPhuocN+D/Gcy
         QVlw==
X-Forwarded-Encrypted: i=1; AJvYcCWjJ4ghBNRzMMoFlkjfDHof+S7TCdlRm7SSK6gvlMrPFqq1N1pAsy+Z62sciioTTlbD7anKf71bReluRHY9TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEFXJ03D5ExXah+fBehENDj44bVAEVsiVOV1MukJbJ6QqPUSd0
	0Px4GqslXE4R9N8jdh0VQQuyOzUYDRtSvCpHsc7lZ7/Bgu4B2eql/kYByunWRWkcDw==
X-Gm-Gg: ATEYQzzwk7Gub6GRuXAjbYeuMxw61s+GUp1WdfW8JnT77Ay13onzGqmv1/dbI+95nqH
	egQnyAZFBmlJRr052zpF2RJnSmciXl7a83DOJbLWwtJx9Qx2/+ZlLp4JdsFqIBh9oNp7oSs10P8
	a0MZSK0EaMwqgPuipqptbKbuSKGYFHm8t6rIeKkcxuF4XZ8SQ7ggxL2YAlE81vuabtA5dhdTayq
	S6uwt+zG8jDtsLyraP39odZl0Ftm7AKkLbOPAQIldJ3kp0BKXwEPLl5KL47LgqfegXCEuegodFY
	sjqULEu67P1fS70LIrT1ZgOAjJBy06dY7Ki47mPYX79FIQpRh5cBcpr1CoRMnILV/gMA4YM1km8
	CRnW6svmhu26A2Kq+MWoxf+VgdiOuKGQAhK7yg8ucc70c5in3aA0CRK5elpcl3c96ohNF3UbLAa
	1+9ltc5gv+Ia+kHoHu8fn4+0ZkqT/6H+CrB7YswuTrH6OhAxekqklkIRPURCe6GN1LHD3wIukpH
	TM0rYUF
X-Received: by 2002:a17:902:f690:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2b082764904mr20104645ad.19.1773991394782;
        Fri, 20 Mar 2026 00:23:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Fri, 20 Mar 2026 15:23:00 +0800
Message-ID: <20260320072302.2402489-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
References: <20260320072302.2402489-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002315_723547_51474792 
X-CRM114-Status: UNSURE (   9.57  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..ba99a0d02bc7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -29,6 +29,16 @@ properties:
     type: object
     description: List of regulators and its properties
 
+    properties:
+      pvdd1-supply:
+        description: Supply for vbuck1
+      pvdd2-supply:
+        description: Supply for vbuck2
+      pvdd3-supply:
+        description: Supply for vbuck3
+      pvdd4-supply:
+        description: Supply for vbuck4
+
     patternProperties:
       "^vbuck[1-4]$":
         type: object
@@ -51,6 +61,9 @@ examples:
       reg = <0x6 0>;
 
       regulators {
+        pvdd1-supply = <&pp4200_z2>;
+        pvdd3-supply = <&pp4200_z2>;
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.959.g497ff81fa9-goog


