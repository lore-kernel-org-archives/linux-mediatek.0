Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B11C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=; b=JVPf6ChdHuaymHT16TDuRlVCqM
	IOKc7e3urmeD0ZvOPPUxegsYRZLltjoUcKxNGTc82NTb3tgUnX+z9E3ZdRu4nvPPTbmtT1/TzcZKh
	gYi404qLB4jiCsF1/IICN/pR/UDBd8mB81USB+CHAS+ZCXdI8u8HIWOuxS5Dj8m69pzA2+Aq6KEbw
	dEm/bR+PZ1UEpEkUStRT0Inm+rVcfSjKbrs13pafWR6PzKNTrE3hQjV7Bi6pApDh7F63RaUdrOPdg
	LlDTFMJ+iql02AZn+79rDK1qcSggv8TaDUhGAjFwEKAkesvHgecdKGcXKC4mu1qihn8afHogWnuuH
	nMn5N/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJoM-00000008C5Z-0Kxz;
	Wed, 12 Mar 2025 10:59:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZ9-000000088gh-0ay0
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22359001f1aso153868035ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776238; x=1742381038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=d0NfefxDy5x4FIGOzFp0S2vQWleNSAEFgGTa4hG2+9SMxhS8USNySCekEMm8fSWK5B
         CXlV0elRCpu2t60Fm1Sp68erZT2bTLTq6cNhV77LS9fl2AUkPB+bR1SGlOMPwUdDMHkP
         UyrdJxXM0OcabV4oenwC6hD8uWeSqXor/yr8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776238; x=1742381038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=pFf1mm9MSIxl1PExQ+yHBw8fmygz9vdJJeJRgRlHCsZDiyA/QbCBKoS3j42RNbHAcs
         IaETYvoEcqADUy7ixv028ny8MYWERZ/Mhwf57ApipleBXZcY70NX47vNIMHQHSwfGfWA
         WBgKyn4m8Fmeha3j3/aWTV0amYXXrkoryX7jZMQuMe6kHINUiwO9hg/O0RfjoIq+RmQV
         Nenu4jMQ9hzfrUP3Ee9xVADAUMEUrJd5x25fkNK4WhpKnPzD4KAG6BVZWCDrxqwxTI9R
         CkwRrNi1k9LRLmanTz1UsE9EGLNscDouiYXkgbkPafgbZF5ZDFyXnmfn0zpth+MyR3mW
         PGMw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Dccu7EPCz3s2fbRTCw80vvejGLCMeohAZbZIm9h7JcD+t5o046vCspBBGVdkyhIIOhczdo9ijxrC13QfeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTipq6HRdWrcROsMh9izF9b/SgFi/FQ+4Emp+ABRq7OD4NfqWJ
	oZffDCWXSTpc9uDwQW/lISUrT4reC/oY3NbymLgd7diIh0teNvsLD/8O4XJcHQ==
X-Gm-Gg: ASbGncsYd2kmIkcz9I8p9nHVZR/jsZD3+MEH+yW/8kHI5cR7ioTDrzPbKQ8XnVS2Ihn
	3svRZ5um2fW2g6oKZYzXgYQfLUdxRwDlj+feGT1Jo7w01f/0C2xaoqgT9dvpEmkgTs/thDwqU1L
	YMCHF434ICx7b56qx2pmUykE2fgSYAYhuxysoxpqsJ77o0I4Z3olbzfGbuBEQMEvSpPhx2xpqwy
	EUknnAApBHMsSdGMIyy+Ac2cIj1rPkVQDIyDIVchPFZ73mpks1/nxFt9IAiienrrxeiOpeuSehn
	CF3e2R3VUcsbngD+vFWZLJUFq1I5ScucZZh3jrxDDn4jsuu+CUhHbM30U8BMqzw=
X-Google-Smtp-Source: AGHT+IEi3t/oRgH4tgJIjV7dZt0tXAW1XWislifFGuRCmj9fEunpdxZYOlzBA/knNfUOTDyGKEKM4w==
X-Received: by 2002:a17:903:2445:b0:21f:52e:939e with SMTP id d9443c01a7336-2242899465emr387459965ad.28.1741776238354;
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Wed, 12 Mar 2025 18:43:36 +0800
Message-ID: <20250312104344.3084425-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034359_187911_1AD54D39 
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


