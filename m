Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nm1LhjzrURsMu2LXUVfXLIKRM3CKJIz0VEibP1GTKn0=; b=Wybo3fP+BMW1it
	lszSYoa3Pst3lpRaK2sjDpaAIT3fbdwYeQompKrV6FarTYZiz+ZDlDwRCTvf4AEKvHV0df2fcukW4
	1y3ucI8durSihoRdQ3dG0ViBsqoKdlByEU1ZioOhX7UNoEq38z4b5yLQsyUykwW7VRbXXtrCc7RLf
	qfZPTq9Ch3LuGglcix+DSf4uBa0Fqa9rj64BWu+C4NhTuJkmtuc5lh5vmYA/mFexsnj6t68tBJ9ev
	8X1reTtV5UwRCWak8hGynrImti7+VsPHSQsXT7h8ac0A1545vfGgqXAh88HyS557OrBR0qE0MDEo0
	Sug3P2TqEfEe+aqK+7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWov-00DxIB-Pn; Mon, 14 Feb 2022 08:34:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWaR-00Dr9Y-J7
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:19:57 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1D745407E9
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826794;
 bh=r/A1exu5teyjmoBiQRL2ADp+LBFLDHTow6yiZCZgmss=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Al9b/Wn99YgpwfS893Yi3OAZ6+/tGR3RsNPMLHOZge29hmyFm0Y/9SllL3ZhP5ycx
 52n5VRNDgiKpoZTsu9jVgyCKMNqJpqawREyMRvqipSRvROevn8bv5eeQySbzahh7HM
 sk3RIQEtQiOyWYjsSrnLeBQqz8MUmjfY9nt4keWe17oiffU5+GANoyDQB7107GqB2C
 +JnXqWehb4Akp3Lk1B3UHNyiT6tlFkze4AeS/qL6If9A8035T5gmxa9DcqgiJYA7MB
 l7gqtvBYn/nDRv5IwX/NJipgIrDcpOebyaYjo8UI9x2bsBoXv8HSneP+zz9kQbSrsf
 SRmUJpo+pl4Ug==
Received: by mail-ed1-f71.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so9775839edb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/A1exu5teyjmoBiQRL2ADp+LBFLDHTow6yiZCZgmss=;
 b=vf4d2but+ZgIuy9e5DlBayACM4SEDFYMAR5imCUdRetAm3R3Hl+WABT9QkpFYDsmOU
 wjlEO6u3vst70iGyS90N9AZBmkKmG3LuBC6n4RBm4o2vcNDIxikfVp6Ip5plO5vGrS+Q
 zWsOsxrWFdUhJFWzwMXrndC8Zk/OCdbxuY5OVl6xSj9n/0BgyHDGwiDOvriiz18AHXPK
 XtNe5l2l63txfeQKIbiTQtPzRQGXSJz0SiXegKKETu9drrQK0IIGXbiVrY9ZxKgp+VFF
 /fjBPs3ieYqrb3LltPDboLsKgs+G4/7GgyjivpBIiHhpJbtFqoeCupm+r8jbxxOpSbpE
 h5NQ==
X-Gm-Message-State: AOAM530SEfpR9lYzTcyno3HBQZLibGHrUIqStC/cyo6IICw2iCv6glqn
 9iBbgvFLHJ7+8aWh3TD2CRrDM0y1Kj1Pva9gm/VL5PDNG4J53h3bt2HYIPTDWNC9qlQIxxatt50
 p2uFK1NEVsbN94W58Vs2wF7fZrkZBuJtpPtQ53oUJALsvRIx0Tg==
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr14039640ede.103.1644826793447; 
 Mon, 14 Feb 2022 00:19:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdbYmf42KnCNX/mcVtFFEqTiPZLsd8EmrJGHsXn4X5T6VWqFxb6wiz0GiywYV8Bjax6MTWGA==
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr14039619ede.103.1644826793319; 
 Mon, 14 Feb 2022 00:19:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:19:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: pwm: google,
 cros-ec: include generic pwm schema
Date: Mon, 14 Feb 2022 09:19:13 +0100
Message-Id: <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001955_798887_416D180C 
X-CRM114-Status: GOOD (  13.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
the old name in bindings as deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index d1f53bd449f7..0255b7028496 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -89,6 +89,10 @@ properties:
 
   ec-pwm:
     $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
+    deprecated: true
+
+  pwm:
+    $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
 
   keyboard-controller:
     $ref: "/schemas/input/google,cros-ec-keyb.yaml#"
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 4cfbffd8414a..7ab6912a845f 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -16,6 +16,9 @@ description: |
   An EC PWM node should be only found as a sub-node of the EC node (see
   Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     const: google,cros-ec-pwm
@@ -39,7 +42,7 @@ examples:
             compatible = "google,cros-ec-spi";
             reg = <0>;
 
-            cros_ec_pwm: ec-pwm {
+            cros_ec_pwm: pwm {
                 compatible = "google,cros-ec-pwm";
                 #pwm-cells = <1>;
             };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
