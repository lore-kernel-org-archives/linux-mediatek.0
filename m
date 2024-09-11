Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E97CEE4992
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOnoYB01CVn34qVTO0Wi7WMlpts2N+jH706yGUshpao=; b=RZH33ov5I1qVmL
	fSwslBRiGWWPPgqsF50SL4l14k6Sdm0RRpsLcK/tzL0usMrb65lNn/3pCBWgWQXBdKG2EM8BV5ep5
	2Mj89s+i9kujTv9p76na4yr11g2jph+ghc5AlThr3Z9XowDV6M11CkJtPWehfZm9knQMc1n4IkdDh
	5ljoeLIZNShlCzOtPAepkiK1VALTgtBopg3jFmuebu+l3323cPX3gB6UyFwoJXt6klduZEvxMWjIk
	4gXOKk9DaEXe4wtDoN0WFoVvhVjKe5WR8n2GNV2uPFeb/v8BdywjDFq1CCoPslKUCdEmDKroh+EXo
	BpI41RNVCx0qTQKSHyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL6G-00000009D3Y-3q5t;
	Wed, 11 Sep 2024 11:01:29 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxF-00000009AsF-1ec5
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:11 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-718d6ad6050so4179424b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051929; x=1726656729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOnoYB01CVn34qVTO0Wi7WMlpts2N+jH706yGUshpao=;
        b=L4EU0OVXcOTccrtUqA/mLL5EkmNVN3xjDr4QAUemRfzAcEIjSFFBh/W4J0mXuTC/YA
         I148IBdR+5rqrrKJGvHRy7X0N71dY3PTbMQ9UCUqRDg0Br76Bi3QWqmLT+4e983EgvBB
         ft7kYfIDYACla7b/bW1PSuj5AHVCZ2yNQpNhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051929; x=1726656729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOnoYB01CVn34qVTO0Wi7WMlpts2N+jH706yGUshpao=;
        b=sj31iHOg6LiwKoWPqlYZiFWYJ6mAm7de2WTjkWAZ7QUXmwk0p3JSkA1i50O3d6yf6S
         /qTFnM8Kt5cTV1XOUvY+rSurOUBv1zAaYL14I+MGnRDZMNuJoEDkXJfFrZ4JpCfFeO7x
         aLOmSWcNwULow5vpjOuz1XWHhWri+Wa9rm+Ry8sGtfJo3dHygsCBdGWs6ppnQNu7eUcO
         nei5TWvPUTF2dhe6eQZhT3J418FzJ234bhul58CbGghsjLUNLjjfluCHFO3wvPQX9goJ
         dtOiMgCmiTp0mzQHfvcjZZZM3Up/EEtyD1r9mqPu3Ww8q4nAj2WuCgL6VwNqnaAu/ece
         jSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNfquNInmhdZN7skiKBCfRfRbfccqCHoup+4zLkNJqcWvOhBkstLoExgz3CyZ2cgM366LhMq3FYXZEHmOoRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzt9KYGZdOpXZZEuYtn/KK4H3GmluM6QEK4TsPT10LiHcOKpmT
	114PKr4FIE6VRJEHVXQmORiRebt5JNpTdLe5JY/zbFZ4hzwXBsqxvPx3MVmfxQ==
X-Google-Smtp-Source: AGHT+IEg8W15drzsQZ3XAibIoe6Uk9uFQemRLNOwGm8NTstfjakhVV4QW2T4x1pKLwY5Nwdep+zD6g==
X-Received: by 2002:a05:6a21:168c:b0:1cf:2901:2506 with SMTP id adf61e73a8af0-1cf5e0f65cemr6315893637.14.1726051928367;
        Wed, 11 Sep 2024 03:52:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:07 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/8] dt-bindings: mailbox: mtk,adsp-mbox: Add compatible for MT8188
Date: Wed, 11 Sep 2024 18:51:07 +0800
Message-ID: <20240911105131.4094027-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035209_524862_C902FF9F 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for ADSP mailbox on MT8188 SoC, which is
compatible with the one used on MT8186.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 .../devicetree/bindings/mailbox/mtk,adsp-mbox.yaml   | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
index 72c1d9e82c89..8a1369df4ecb 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -17,9 +17,15 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-adsp-mbox
-      - mediatek,mt8186-adsp-mbox
+    oneOf:
+      - enum:
+          - mediatek,mt8186-adsp-mbox
+          - mediatek,mt8195-adsp-mbox
+      - items:
+          - enum:
+              - mediatek,mt8188-adsp-mbox
+          - const: mediatek,mt8186-adsp-mbox
+
 
   "#mbox-cells":
     const: 0
-- 
2.46.0.598.g6f2099f65c-goog


