Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F9ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PJpXROupFzpexVoTGiiVagAL/RrrwaZ7jH85Py7k9E=; b=2zuTcX7C/Am4kF
	KVp0vUuHPeJpmD0YO58hFkQUaReMMmZ3w8OUw4QGN812moI/+fmOMjYSuRCPH7if5RLWf/81KkW+R
	oNRPAML/r2T210N2nwWj/GS9CwI+b9waG806Ri22R+QE5tusREzFTISBDQ7ZusKL/OCfUE7QyEi90
	mtFfTBjzVoCcn07Ik1uIZr2Snopm+48Fibbpxm5InBFpakKGywpX39vgqEaGXzv/kgB5vbTxi0+lX
	AINpIEaUDijXqAkkCJ/LCFex3JMsmAiKYU+oTfDV5klVHKQQqio17BeskMHQlgW1afziZoy4RZ0uv
	BtHH6CaoeG7k40X8C1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncjG-00000001hZV-0e76;
	Mon, 09 Sep 2024 11:38:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPU-00000001dN2-2CsD
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-206e614953aso31933065ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880699; x=1726485499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PJpXROupFzpexVoTGiiVagAL/RrrwaZ7jH85Py7k9E=;
        b=ZC74DPb1XaEFqT3bBZayX/QHaxGx/yzcMG+9a24wT0M86wDPPgoggsLsjlO0Ofxr/c
         OuPM+AESqbARe6iBSTkZDBW4CWEJ2GNdRTy0RrOCbICU5LQtK4LyvQYpUVRvH7jy6mCn
         OwkfETbkuJ5gyDP0jEEToutODT+M4+JrMrnjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880699; x=1726485499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PJpXROupFzpexVoTGiiVagAL/RrrwaZ7jH85Py7k9E=;
        b=WDdIi/fxZt45MHPa92jN7dNsRHSPrsyy5TT7/9FNOIpo2ECDtU2gVHtPJKbxwjP2E1
         fvSHXjZkIjoWa09JF9wnod50GTFZWz009BOlzLY5VXm3QVSMANmjQzmarnz/QYLPLOvj
         xQlVUNMze0y9HAHupDXvzTC2rO5qZLmWBtz04JDZ2V5HKXdsmfjCvdPIW35Yud7vzrLR
         sESPwL9Tvk4Vv5Vn2W/lWNHYsM+UTieaEKigCFJofG3NB6B4KN+7lY39EUL5bRSGfZ+8
         bPO0ytsS1JeUGaWuziGrwo098ScD0nk/Jd56lWvMIxm2Uogn75jbi99CCPNW2l6tWaVU
         Z0mw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4bSFVSsWNZEi4CnkMmFME5uyuU6L82UBl5/hMsexHNkt8YqVMrw0I3YxsDhyPjtqc7uKY3h2dK3d5CdU2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK0SY39PajJlYMl1AC1fx0wjdjghce22DqHKfoRTLguNrAE+Vx
	3r4bgzvQ/pALMzpL4oKmklMkGqyCYY3mYH4qLSNz94YWMkIXLh0IQAQURbW72A==
X-Google-Smtp-Source: AGHT+IFb5WZHwqHsufJH6qAL0gHUxmqndWyboWWJlOq6FZ3jgewZxyJSYDmEy6wDlOwb6HBwJFmDYA==
X-Received: by 2002:a17:902:c949:b0:206:ae0b:bfb6 with SMTP id d9443c01a7336-2070c1967d2mr79655945ad.40.1725880699360;
        Mon, 09 Sep 2024 04:18:19 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:18 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 12/13] dt-bindings: mailbox: mtk,adsp-mbox: Add compatible for MT8188
Date: Mon,  9 Sep 2024 19:14:25 +0800
Message-ID: <20240909111535.528624-13-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041820_585522_E49E5E39 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for ADSP mailbox on MT8188 SoC, which is
compatible with the one used on MT8186.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

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
2.46.0.469.g59c65b2a67-goog


