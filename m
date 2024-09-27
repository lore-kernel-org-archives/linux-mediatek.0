Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608BBCDE02F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=; b=i9fDOgwxLAV1VGDakG4LXBAmpF
	u9b0uu/RcQnORhdY9sBVm5zRBMfKx46IbRmLIa8uSeu5aqa62UFxi7Z2s/KTNlmQwZ53KbU4i2/VU
	Nyk1cZEOTRc2REXAEy5ktLsAsq/Nl+zUglJk6hrjeYK8P4rI6d1YEhL3ZSH5QZE673wawlhBl3Tih
	PBBoiI/6JyHcdPILPLB7ifgzS5M+yOmEPL9Q1YAS4C5Dpdbg+4/YV7ImAkbB/tL8BRStCRgA/gBFi
	tGu+zlDp0+Ryxoghw8Sq/ZDgbwb1eWcw++/NAYyMVIx+aLZTfvq0ThZj1Dnhtqe6fb8opCG8Wlzuf
	klDmtFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suA6f-0000000B4O0-3dVq;
	Fri, 27 Sep 2024 12:29:57 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suA6c-0000000B4Mo-2eoE
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 12:29:56 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e1fea193a4so37284757b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Sep 2024 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727440193; x=1728044993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=;
        b=E08dd0nDQp14spLUNsRTtbqOfiPsRUG6rnLlo8bHyAwOnu/eyDh8nSBQA7TPw21pIE
         2Lzp10Q1tiJW6zdFJJzODLiR22llfd6gGxnophmQxCR7JsW9wuD+6BRuxdv50bIk6vev
         CCRR97y8wcEvGuw3vuOYMaU5X2h2UZCyu+nAIbkloNhvvyE+qH9k2MXTEj7KzfRRFl9d
         LsSKwXfCz1Sk78YzDewC7n/bm2w9NKTI9OcCMLcTfcGx496QacNYCQo2ekh1piHRAc3I
         U5oAmNyKnjunDxQtRQZTCD8AsrDdalDNBGFd7zbuUopz92ou9iqt1BQ17KvzOQufKiQ6
         ueLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727440193; x=1728044993;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELDmQtxXpVLogwubqzTMS3LPGqaX3x3eR2JGyzb/QuM=;
        b=cP6YF93a5amvGO5Ib6EuWjtfreevo8eXGJwQtbh0Wz0giyHiFy7of62as6/jlE57l1
         3LJPbuJKlBZHhuTi78sjWiXDxURF4Ohbk/+/vryKt/YMCUgfVfZbjBtaOKp6wR0k2NFN
         r+mgS+99uu8Wgp0BoslrFRzYTRVqEzu00WEi4+8+VDUO429C+1BIVRIr6mjXjPKZFwzu
         C47EJ6Gbw0Li/lZf01CpuIUqDcq4cbwlEehN6B02LAGYS1uVPdJKAm3KCJA3Fev8VjzU
         RAiPCc4j9l5l+HdIIrKMNdK7+Ic1hljb73g6ZFKUL9eaFIlKAuNaVMkZf0d8LgDKC322
         omcw==
X-Forwarded-Encrypted: i=1; AJvYcCXgOxLjCyDl43o1rr4DOneFZ33Y+ikz8tDHHKc4w9pkGjQpVdl8L4FvAlYc6dcks+zCobbdofRiJcwt3ke6Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYcJVf9DcwHiXoWLie9yLAtuvpfsGMxT9gRGCaDaudTPg4KHs+
	KjOVcfZOa6e9VE6pfsuVHpnhuyD4p4L98SsAeSaFT20mlaDHDsI4DpiM88sENwyzNrruMC3S6tF
	naHntsw==
X-Google-Smtp-Source: AGHT+IHZik69z17s2hBKu9wHoeUjvGVk4W9fpiUC+n6n/gHu9NjuNOw0HQ5rbO8Oy/pIhvjVChUHz6q1p2mz
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a5b:14c:0:b0:e25:2491:d005 with SMTP id
 3f1490d57ef6-e2604b84f89mr2516276.8.1727440192899; Fri, 27 Sep 2024 05:29:52
 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:29:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240927122940.4190949-1-jakiela@google.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186
 Chinchou/Chinchou360 Chromebooks
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, rafal@milecki.pl, hsinyi@chromium.org, 
	nfraprado@collabora.com, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_052954_678328_8B6F9154 
X-CRM114-Status: UNSURE (   7.46  )
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

Changes since v1:
- PATCH 1/2: Delete sku2147483647
- Link to v1: https://lore.kernel.org/all/20240925080353.2362879-1-jakiela@=
google.com/

---
 .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Document=
ation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..47efd96e5659 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,28 @@ properties:
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
2.46.1.824.gd892dcdcdd-goog


