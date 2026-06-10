Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5649FCD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=; b=WxjsvgxaucpAAzVZIZXDuzVvUB
	ZWA0HkdoiwoNl202OkqTKOCnzElZeXhxT+Wm8Zb7mXZETfAzY0vslr4tGLbQwxqh+/fYft8OiQ1R4
	JXvQEJNWX/Rg+PqsgWoe3Dp8CKBGeOZr+m5PyBG01rcxo7hhgeKyf2nQOJnm+RwEpp1cNmQFrlHns
	ITQKnvPHpan6U9AbjRdk73MF/poXRaIb88i2+m39vSCnvEj/oEvIIvhk8CweqV2sGjy1sIjSrgc9j
	x83TBzGSMGvTCcuCx+C6qYVmtSeTa5QRA4GQeGU1u7lX9K4LDA853CxqYSCIv+QANDtwOBZRkAgjJ
	fb2sIniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVa-000000075xl-0XCI;
	Wed, 10 Jun 2026 08:41:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVX-000000075t5-0wTq
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62700515ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080914; x=1781685714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=G9l/vN7DXahICbOQOoavFEWSH1un8MdnzCG3H5k/GuNSjwNwzzIEer//SfCcgXGJ1Z
         UmJqPxN8fmsLpfb1UVvg7YguS8lwPWjemAk+hlF/utsNzMSYGumwRmH52jsCZH2CnuWr
         VdkCHwsWif8gLVn/k5eGG4WNGXOO9rI4H8PZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080914; x=1781685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=MGnPuMA8vW+XmnlFNIyU6phxKjg0zxXcrRPfWxbVL10NEcxR7lvOdTYuJEl3VFrb04
         a0NWmEnoGbvXAer5KoCySeX+68xfItcjacbM3u9k8rbxtzMwiqC7BtNjDna7YcQ5D06O
         gRmFNg0/4FMudFsGaASpSTbmF3LzHf1o8k0DeP3E08Nmh9vhqDq0j3WlOThxIXwCQWnc
         3GE/UQKRXTHTENBneuJ9frdWyERsbWYF226dnOcDm6Mp1iNyFjmtFXaDy7OISZxZ+s7U
         i4VyLv1kyjvvVPe8VYblH0UgCiucNTb99z2Vw/DQ46vVyzLU7+bpziLN35yDTa4mCP5s
         xxVg==
X-Forwarded-Encrypted: i=1; AFNElJ8BllbgFDSCVIGjwb7ncbp4tM7zXO+vMoKO6tRNVY6jjIx6VaeFw5PXU9IwKJArXo6qyLTggdFoIyU8IZ9t9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZDoW2ATaPzGxzxq1J29iZnRXwB8FlURkjP5BaHMSttJa1RJ+d
	aFEOZ0oAdUSA8ReQIjSdDsyNksKqIgydtBwFBvh3j1vQqqbbeWKoN4PW2te01Y1FIg==
X-Gm-Gg: Acq92OHWFxfYOjHXZYn9IL8jm3CRu267bmN+/xz70IJbJv1IPC4ZAQBCMDw/yF3DHHp
	y25N2zUZvtg54fQM9K9j+PfTgLZy2rzkCct5PupNo0QTCiZVwqswHs9/EI5x1GwwM1rSIHi4fPA
	dGq9d46F0Uyd9x7daUXFiB7ZsbYRcFd9oafan6b0RTBxDTyu2IWGBZd+O9aYjUNENClmvS4SEwP
	g2xWG8dfo2m1IFOnGUOLargvnczLFtWBFOlOBa70JaUTzF5sJ/d2PKljQy8P4pVtV14Dy22i7Te
	LPTenqDTbLACfHBoh2T8ka0iV/nQxKzbcp8kSN2CzTSeOJtaGHocXV6cBz4Ok/RRaqaQaCY1Ifc
	wQM5DLrSD0d2oW/fcx5fKpXrCWRUqaokJIOrBJHn2ssmpPitXOLLPZW1zKmFdvoVKF2Dq09emtI
	RrKD4PLNmAkvofstdjJX3J2X84tvVluJ2Cm/c/dxVeZGwWSb6k3hlHTIemSXQweJpFzZGH/BlOv
	PKDKyv5W1p6YzVW8g==
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr292987545ad.31.1781080914415;
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Wed, 10 Jun 2026 16:40:42 +0800
Message-ID: <20260610084053.2059858-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014155_264398_068AF028 
X-CRM114-Status: UNSURE (   9.35  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.1099.g489fc7bff1-goog


