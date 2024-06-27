Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15993C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 20:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orywsiSsHFizGWPRMJO9II17AovA2NvzyC8C3hh8ugk=; b=W/D39n9tYvsfc0PNluU/wvhKuN
	lybfxkOIu3yP9wbRUS7DpyzkbN/3SQUxKbdPpam9FxAfG88ucafsEAENpdLTp72fW5/oM3ndjZdle
	24jh40F9mkYTCJ6Of/8fVXgUKJszh63o+5L9m92UiZRZhVWQ6VtZNy+jytml4CCzqoDPznVqORVIj
	n+GzikGJQcmM3rcFegXgGhmewSNuWwtA/utwIL/chCJqXNfDEg/m+AUy/2dra2PY6ki3D+/PQnfGu
	VaSMfjKRaHpjD3DRlgk+QM2kH2yJIQLYpsKoWTdzo6WbxFfbPwAB1gNRi+SGNdG+Wle9Q2b87g1g+
	fS40mcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMw7T-0000000Bh85-2bNy;
	Thu, 27 Jun 2024 20:53:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMw7F-0000000Bh4L-1dE7;
	Thu, 27 Jun 2024 20:53:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4256742f67fso7549695e9.3;
        Thu, 27 Jun 2024 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719521592; x=1720126392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orywsiSsHFizGWPRMJO9II17AovA2NvzyC8C3hh8ugk=;
        b=TNyxAECLdvCRW9o5If2OfLbjGQ4ZmyayX3Lo8+6oMgW+7eU/BYvZCS027AgRg1IfPf
         Ik5yNiI6+w0ZLfs+NPdt6Ma3vQZo3q4TDmSGIAL1/iJu3EFhbAFrBwyimN4zD6D1CKrj
         3Arl/UobNpqwy3GORmnerICfv+kxqmqUif9+xey8tWNs6f+tLafSsiulCF6VamBgDP9p
         qST4ZTUnYx2844njiJrtz+nBfdmxWQmI2/6wkrHS1+NIjg1tkmUbGxK3VV8pppIL/4s3
         JnNsAtRDtk9Zs2/4+Xk+JUxdzEKhpg64FqkiIYl3DYjVhWtEllNO5yopS+L0vNxYm062
         Tc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719521592; x=1720126392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orywsiSsHFizGWPRMJO9II17AovA2NvzyC8C3hh8ugk=;
        b=rnNChubCqxtbd4HexGeJYSjYzaw4xyc/dVr8iiddZm6ZS3EmGqfuBGynbDy1NDO852
         tsqjhD4VTgm/i0tgIsbNXMpeZekByVS+CqWIY6x4o+yuP4tXiFp7FJ9Eij6nhJRlLLxl
         YRw12qf2ekL2ToInjGathQ9RsSn+DNBVFuhruG3tQ1nQ0Uk45nS73VJVxWr3l4RtlOz8
         9D6TYFKKRMlyMPaOM4j02KfVDeA6rdTeSS7/gdOh1MxSlTXPQWwWW5s6OBsPJfLFfR3c
         kUqdoQ+qEiXfnnqI+7xePxwvehzpRPB1RZBjHWcAqihjche25xqx3DZzxbGJUu7ueJdq
         JPqg==
X-Forwarded-Encrypted: i=1; AJvYcCUjw/y2YPsFcu2rHQBoAvkF3ln1ndkSeeeBlgUGtB77ANrfL2c78LqLZhYam0Sq4S3lJovh+3btp16Qw6zHy14yFm7bGJxZEIUxSMrn11Sy1C5DjPJKcHjRxMu+zqfPDQu4chE2obzDGjwtASWIN6N2pZgcRZs795g=
X-Gm-Message-State: AOJu0YzpkIErGkuMIbvOw/3mbfY5qts8qZbLwyoaM7+u7P4rhlIY9Jkw
	qtmgacwKYoWEVeqLxwgc4xFOrxoKnZNqDGxW+M4rlGktawapcIcS
X-Google-Smtp-Source: AGHT+IFFefpf9EmSQzF2ndA0UUf4D0il0rbi4xGB2yByQtpidlfBs2BCPDHayZyQ7ccf43Ee8xQRGQ==
X-Received: by 2002:a05:600c:42d1:b0:424:ad6d:c2ea with SMTP id 5b1f17b1804b1-424ad6dc5dfmr35864035e9.41.1719521591852;
        Thu, 27 Jun 2024 13:53:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4256b068e93sm7216935e9.24.2024.06.27.13.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 13:53:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] dt-bindings: clock: mediatek: add syscon compatible for mt7622 pciesys
Date: Thu, 27 Jun 2024 22:52:57 +0200
Message-ID: <20240627205309.28742-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240627205309.28742-1-ansuelsmth@gmail.com>
References: <20240627205309.28742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_135313_448825_28CE1A26 
X-CRM114-Status: GOOD (  10.61  )
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

Add required syscon compatible for mt7622 pciesys. This is required for
SATA interface as the regs are shared.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/mediatek,mt7622-pciesys.yaml           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
index c77111d10f90..17f0d960c314 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
@@ -14,9 +14,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7622-pciesys
-      - mediatek,mt7629-pciesys
+    oneOf:
+      - items:
+          - const: mediatek,mt7622-pciesys
+          - const: syscon
+      - const: mediatek,mt7629-pciesys
 
   reg:
     maxItems: 1
-- 
2.45.1


