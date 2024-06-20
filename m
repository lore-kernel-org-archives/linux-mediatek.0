Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCA4C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1iA/zvEiFStBDAQUtTcnVMjUIjY5Wwj1aHdUMEw364=; b=eTE8T8O8JKbkMaw82HbhwJ16zH
	7fV6K9UU5KeU384cEyar6EwFkXimP+nJcu6IIRXEm56DmNIhqVgJyL8scwi8A2m8MrU8RHo2j2vpq
	yXQ9/f9Upc5/t0gYNGQoNw9f2T/93ysm/daBOPNH7DgLWq2cghCSPced+6ZwXEFNpBgMA0teIJaUz
	X2nceE9ZC7O3jQ1GhOqkhBXHPl3lwvRCBx6rPFSillA79XTq4fhEyaEg1Awdd/emNjJ8sCKrRMaGa
	7HTUa7JZRo5wGALtxAJ06dadPJxJyeztIASDvblqnE4z/eBAQOjtsH5WBAgeb3lpX6liOmvKMVJ1Z
	vNnCz2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOm-00000004Rwb-0h06;
	Thu, 20 Jun 2024 09:48:08 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOc-00000004RrD-47cP
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:48:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-705fff50de2so498736b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718876878; x=1719481678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1iA/zvEiFStBDAQUtTcnVMjUIjY5Wwj1aHdUMEw364=;
        b=llxILf69gGtH5U/00njXYD9m+4q6tGxq3CtRoJKNW5+EYwd4Z5E2Bmon/oqEbSSvH0
         ZIdRx996mdcJiW/p4LwXJ/VjctStfZTTTSjoerCuXOZ5mgSDBzLKYQBvhB+lSRniM0e+
         jKjpx6shLPftVAdqqrRtGJs2Zrm6u1BU7BbKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876878; x=1719481678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1iA/zvEiFStBDAQUtTcnVMjUIjY5Wwj1aHdUMEw364=;
        b=Bftm60MS0JfszJFXsrYolOwy1jDZ53WJNv7KRTo7d4GYFX/AuGIjK7C3Z5iVhY0dvi
         9J5qbOD0DBSnZd4qkButXSf1aGSt7LyRTUfS0Bv0iKvbijl4Xkq9iqonfJeLf8QKu3EL
         BjW0LcimcsSw+Zp3TCOHR34BxMXAh+ulx0XzWW4oa81hnjlZd6FygeJUlfDATTpaVQwX
         qZyskzaz74ehaiV36znYr0p/MABnvDEMfXcW2+v6dtxAPyK6do0P2mSQSveK38yNQ1uV
         lHOI1TWk5YH0zt4YJJByeM85QeOz4kTWgWgCUvjcO8wIRVY96kshmeWdVEda0tg2LtYT
         bsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3iUNzUZ3KmEKbUn15tpB5PIddCkw78FqTBMuMgpl5vVj0DSSl8ZuW7LxFNBw6alsKhDvXhYOt0Imepc1asS7AoShLHMMthiUJOImCRXfVyMJo
X-Gm-Message-State: AOJu0YzTE8VcKegUZVcbCagCs9AmiGKYXiyIC6OwEwue86/dkzGe9WPc
	epoMi4XPpmzPoA3JeJIiwppsqmhjoLDx4jjchUu3skdulSdVj4xXtjNgvF3sqQ==
X-Google-Smtp-Source: AGHT+IEbLm6UkzausNcxJ9iowsJM7AcH7c4cGUtul3KvHm8nPFGfqXBgRBs6sehTiRsxZ7Zo1TrDRQ==
X-Received: by 2002:aa7:9ddc:0:b0:704:229e:54bd with SMTP id d2e1a72fcca58-70628fa93eamr6460287b3a.8.1718876878161;
        Thu, 20 Jun 2024 02:47:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70dbae52920sm4164469a12.42.2024.06.20.02.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:47:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: mediatek: Add MT8186 Voltorb Chromebooks
Date: Thu, 20 Jun 2024 17:47:37 +0800
Message-ID: <20240620094746.2404753-3-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240620094746.2404753-1-wenst@chromium.org>
References: <20240620094746.2404753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024759_119723_C78518C3 
X-CRM114-Status: UNSURE (   9.63  )
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

Add an entry for the MT8186 based Voltorb Chromebooks, also known as the
Acer Chromebook 311 (C723/C723T). The device is a clamshell style laptop
with an optional touchscreen.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index b1b09db0bd65..e7746afeb0b3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -301,6 +301,13 @@ properties:
           - const: google,tentacruel-sku327683
           - const: google,tentacruel
           - const: mediatek,mt8186
+      - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
+        items:
+          - enum:
+              - google,voltorb-sku589824
+              - google,voltorb-sku589825
+          - const: google,voltorb
+          - const: mediatek,mt8186
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.45.2.741.gdbec12cfda-goog


