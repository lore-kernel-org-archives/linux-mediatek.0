Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25103C7115A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=; b=hdxH+k1CDUD3I3VXrzEaM5fAOO
	xmgtChpkl0+xRz1XDPDt9Aw84/wJmoEFUsrR1q7qFO56jqpUEiv3cMhVgCbejCmJzi5SXYy9fY5FN
	oQuMFfdeiUl7W7Qja8pm6CM0KUYDNe2TGKsvYONmMKGooaVY2POur4KN0hE+ZQVDCsIEE5HO2Oxyi
	Wn1NPq+QjF93LsFjipsEBes29Jw7JrHCHflOF616qupvnz3Gzkwq2T2F/GFaI1gsHfc1Nk/yXkg1D
	QdwD+aLx61FDmbFggiW/ZXMECCix0PJ6gRkX9XFZA7TSENkZZJvlAEBKqzLz/IdfZ34KRlT72CStF
	/hYbBS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRhL-00000006bYr-0Md2;
	Tue, 17 Jun 2025 08:29:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYW-00000006a1L-05JE
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=; b=TQzY8u/tV02r/WcWcRPl5qabrP
	fU5UTdqnS6TVvGJK5/0y6ZD1KyzLn1Ka+a9AoIiqwAjw90ZF6CJGCHC82V9MO1kzOs2uFXuAaXA8r
	p/Qm65TkXvtb0Gi72v/U92yWmMIwNlQqpAwSPkAXtxwK29LWbn5WyYyrEqRyyrOObAT2/1I4UhCOK
	cDZ4htCAmfKNRUwnoRIiooYGalme4v1axpZHvss0/Hg01TUmk49yg6Z72MMe+8lSpF4AfvnmBf/EK
	yeg/o0HHvZ1CEGPwLcgTEnVihYkXzTQM54XRRgv6RSH5EpzTErJWkUHKlVPhGQD3gyBCZ3BE+jX7H
	iRIQlPNg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYN-00000003k6I-2A03
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23526264386so53056585ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148416; x=1750753216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=a9gPco95Fd3aWnW2NT4ImfOf1NhL2xB5xBlXVPKMcxjUCn86MnO0HuN4q8BuzEJ52r
         tph/PZ6AJzN8fQjMty/YFGP3XUYRWv5U3EI5X9bQtPS743ZBgjF4rRZTWkP8Pn9wjbpV
         MHJxvwsA3s++qnC+r2Q6i0zoKAF9ykFyP+9wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148416; x=1750753216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=qf+KGl0yipONOiI5jbuky9FNIMEKKofxU9GPbLnmHF+NA8CumXyl17q7yi17E41OM9
         CBQMc1urpwWu2AAarxswsW8JDCTHwtlz1LsZErXoeW5aaqN6kUtI/Plk5sd+1GEOyo7x
         YJSqDpt7mYnT9r+L1oICgjtoORyVnYPV+oaWzmpYye/+0o/MhOF4hzlrz4/ajsMl4bAf
         ZjO7eimD+8ybQ23qlrg9gv/Ei2ET5ervG7rJoETkPU3nxFmA1kjXrZuo7CoMqwOZGPYn
         vQVsW6PZF2Y5zEWCsW/pYkbCARPOSBCkyr1l1h4T1Tp8Lr8waaEd8i9N8t+0WrDibwlT
         2xWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSztGXELZG0Oe7fj+88FHNUj93jqW8G0YXIEFl2PDHTPmC6xfA3U/j0ykp1WKFWjjX/RfPMGwejLBtf4G5Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVbMa5htJ/bMcFIfjSqoK3bT44LBNQSf1BYiwa1drozWXTd6Pu
	LigkkxuKcIAQyH3UNqblhNFrpXZohTK+AGjcobpWHJnA+QBOz2SnL8Mp24FU3wVjFg==
X-Gm-Gg: ASbGncssg1+Ch1dE+EJLc+fL85DsT+/0tdBareimL/pGbzw5JNJfY/TTxQLiS9Y1gSj
	D++BDUpzjBuKDvgRr7ZlfyI5Gc4/qqTGva7Nkql4S3EogRS8U/HMwXecn+DQAszVqboJiPkBdPd
	QXJtmKN0uOZyKULYjzb8OC5aLBHIjEnkYxHB8zwKoUXcWCz5pfijx8JkMv3xRZFTIoQCpptdlT/
	8AdUB/03XLTfG80l76LW6m07TZue4mYOBcA4iztgl2UQ8UWIGEadcZzNPsdjgwpVoMegzxxBqtx
	iZzF+Reh4WSEGm0isZHhkFsSSTjDgdZdykWFApeHutt2wERrvHysJ1sK/wUmYXi9+xljWZG+XdJ
	ljYP/
X-Google-Smtp-Source: AGHT+IEDu/d0gvLMPkfg382ZhcCdbDKZbFxmgqE3AqPSqBv9agEnIVcL4Kq6GKfMPiLzVnBd6My2XA==
X-Received: by 2002:a17:903:24f:b0:235:ea29:28e9 with SMTP id d9443c01a7336-2366b3c35b0mr200531685ad.38.1750148416513;
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:00 +0800
Message-ID: <20250617082004.1653492-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092023_630820_BA4A68A9 
X-CRM114-Status: UNSURE (   9.82  )
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2032b0b64ba7..a4d9c72d10c4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -302,6 +302,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.50.0.rc2.692.g299adb8693-goog


