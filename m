Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295F6C369A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RpI+72pqCUKa6Ph4QBKiGKr7w0qM8RBrdylhoit18tM=; b=JNueCiAVOKBdxYwf0Ay94+fqv+
	ykTTuHtCDIIMa4B54F3Lvvc9A9lb6iiJnzPzBiarw8bC2bpVPZCpBTVPlPDaJki4cSLhPJK6YV/+R
	LrEPZH0y9tmQOBilVvS7YP85EDSwHw41/1hKO52jJCun+1oBrE4Xep3gGBa/qDt0XNEqBxQsS6Z5E
	y+47dgOJ6Yjq7hbCxC/KU56jHx71kMz+K5hx1VojY6mRrnQOlKrdphvGj3rQjMSHryYYgDIzzxwg3
	ToROeWlNsRNTmDD5Z95B9j5vR44SVpSs68ALQBkVeU+nSYbQusCVBy1FS7PMv3jPE0OFJ+iAxOnBR
	FxgAZqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stN3S-00000004SP1-1CWw;
	Wed, 25 Sep 2024 08:07:22 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stN0Q-00000004RcB-3zzf
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 08:04:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1cfb9d655eso9440502276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727251452; x=1727856252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpI+72pqCUKa6Ph4QBKiGKr7w0qM8RBrdylhoit18tM=;
        b=En6xyLj9nI+b1prYYVL/068HKqht9IaPZb6+Tkq4cBIJF5iAciG049wq8kX+xAkBXG
         NwWWtS7c4EAbyK8uGFoUbmDyzlsjzvKtqrIM10G1twtFUqWrV3ggK2DKmztmrrFMiTp0
         Wv5v1i3QfbyBQ5CD7eoaYTjrb+IS/ghZvrn+qyYN3BPSIn7VLA5SWMSgbNz8v1NNiRVG
         4zoVLOKatUgORu25hgHJ3vAoZFt/bpL0KKt/nrWsw0iTrsPBPfz8P7btwIdPxE6ZdBe7
         dh809gboQ0Vs2twE4VOmMfI4gVJYMjze4R/FfjjR/Abua3/Z/fD34yUsiS4GTvOWitfu
         B+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251452; x=1727856252;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpI+72pqCUKa6Ph4QBKiGKr7w0qM8RBrdylhoit18tM=;
        b=xQ4vSiNrxZ6jBlw2opFAuArI3UMW+z1Sbmue2iW2YCkk0o5n1pmMQMYlM6yqStGepf
         SjOiQmdnG1L8GjEKhE4wPWy4mwkonZEhXic1AgySK9HccrwM1C+Owl8MQlzK9bsvTfsf
         GwJ7vV+Aq4p5DQi7G4LtsrZyPKC931DH6yOk90Ch4mRpT0PqZNvxnSsoEnJsgubG0kGz
         E/xeTW0U4p2sBQEjxbnuMebUnZHQp3pz5OehCFcD9ZBSf4VCgfEYKElCp4PTC9yld5c3
         iiHTyzTxtXiI5EK0u2Gy6q0sfibl4SmqFNQHar9uw2ru88rbMOH1K33az91M984r4B6y
         S4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXUWLP4JxblkYzPVm2EpepgzXQALYIMQzIIGKYBVSjkoEWF5998LVQZgWt/P9mgNDTkSruz5SppfqhkKHEleA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB2fNip0110tCLfWnIKKfFn8vSqrwOT0eXkAvRw+7thZgTiuP2
	w0UwWwPJDgck+hnXSsCN32HkWt4FQrBsNbyOPSf9eDxN1n9QyJ7ddEFwIjQ1NWiv+oXbpQ3BIHf
	yshA5LA==
X-Google-Smtp-Source: AGHT+IFw0bYPHUqMq0e7EqXrAe/PmOO/o9gXTmryzs8osv8xXCpAe3duc1gxJ6QGosYWIIQYVmnDKsUKdHGX
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a05:6902:1782:b0:e0b:958a:3344 with SMTP
 id 3f1490d57ef6-e24da39b0c3mr15148276.10.1727251452579; Wed, 25 Sep 2024
 01:04:12 -0700 (PDT)
Date: Wed, 25 Sep 2024 08:03:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925080353.2362879-1-jakiela@google.com>
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add MT8186
 Chinchou/Chinchou360 Chromebooks
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, rafal@milecki.pl, hsinyi@chromium.org, 
	nfraprado@collabora.com, macpaul.lin@mediatek.com, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_010415_183278_542121ED 
X-CRM114-Status: UNSURE (   7.67  )
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

Add entries for MT8186 based Chinchou/Chinchou360 Chromebooks.
These two are clamshell or convertible with touchscreen, stylus
and extra buttons.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Document=
ation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..110149f5d748 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,29 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou360 (Asus Chromebook CZ11 Flip CZ1104F=
)
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: google,chinchou-sku2147483647
+          - const: mediatek,mt8186
+      - description: Google Chinchou (Asus Chromebook CZ12 Flip CZ1204C)
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: google,chinchou
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14=
M868))
         items:
           - const: google,steelix-sku393219
--=20
2.46.0.792.g87dc391469-goog


