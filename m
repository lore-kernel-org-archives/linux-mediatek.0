Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F307D116FA
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=; b=xYqwZiQyqeXasjjKahcfQBKOzB
	fOLkvHVwY7kwkFTO+DHd3ECOHHeVUvMp86q60kFQZ4keu5mOr6D+AVVLvy7n9YN0/LjQyOMyNL7QC
	HdRrWIoLffMAEiGBQW3Ob7wEJulp5S4ZQ8alqvQjP0OKUl1T/nG4HCVB3n9XBe0EB1QR3qzIDE6Zp
	UI73/GdlvowBpHuxK1pRtO0gRj2flySqD4QwuoOxRptt+WN9HbRaeJ+1Svl90D/vS/ckWHB3AtvR5
	sadcKjsSC/l7SrKL56v0GllZmR63DeAdIy9yvU0ylnQk5+aE+meOReUJV5FSikz6pSoUBnuOlZ8fM
	KMdj+lDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzU0-000000038GD-3Z6c;
	Mon, 01 Dec 2025 08:42:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000384g-2R2l
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so38474075e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578505; x=1765183305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=;
        b=PSUb0Uo5j867bvla69GuQR/rLjfC+YhUSVMibWTAVyJWCGPPI3Ov/uHV+PXxiHW82H
         7XCQt0z5zlyGMY2jFxAAqFN71CWoEcFbfrGjGdmxZbnnxgOyDXNlnAfnVe3kLOX5LFlL
         NfzVXKSQMKQ0rdhIxQ8H70p8M5ynQZ3JH6oXsGpLeL3E4AJ63BXBTcf/xQYrT0+xvufA
         Tc0QS4qvnwFCGsS3CpnVAPFAAAnk6QDiOU+9+x1jrmwk9kmnimUEK0cNTTiD7v8HpbRM
         acI7xPAUQ/h4Nl6jyPmoTUBB82HpVkaL0aznLBTn93yuPDxtZ2cX/hyMI4KDczkVXR47
         Fm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578505; x=1765183305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9Kxz2boStuvWtrnpIwzNC+tX+6IpQ3zEJOWuPBhZo8=;
        b=OSc5+lYWBnjwnpVqavkSBrX3okuj6xHTMR6pKECdTdoLGd6z6UxOdcqSmdIcpQxBhR
         +U93rj6CBYvs+ie8vtl7Rv5uloxtcWPDx3D19BXwnJcrVMlsv+HwfRIm3Ma9n7P8JpGl
         E1OQbiUvgew4NYYbDOsIJ8GE56Y6nPUfSqJUWM060wXG+CQZOeIBODSBpZsn0cAtCYPy
         c6sWF1DQRYJYw1NbO7D9D8IjonmGg/NOZJYkB0FGrJSbm/j8TJXSdDQ1xMC4+1vySlzu
         jyDKvpWRzvUeyrAwngJ+XNzLKGrjeYOP3AZrKhRwqs3PK+1UrJYgz0/XZQ8BcuT3WMZt
         XQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0ktjeSQ3UJUeIgroNztHXmMS+3n+1Rm785pHBclpVsm1zHTdS7bb5xRW9aoxEbPLiLOOVWXIpGgnNK5Jn5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw91iJjgSK+z8vndtr9cdneSe2kiG7zBNhHkErTDKpvA+wd1apx
	rRDJOVfxu5plOL4ZguNjxV4/K33f5+K52skNwhV4N4+TAa+795NWRzz3
X-Gm-Gg: ASbGnctoRY59bYE8ur08o5hX9dQ76Dw8AsWzC3Yu1dlouGeRjIiZnITGuQd9/dHP9A5
	KcUjcxoLhBMcpW1J1FcTSUp44pPOUy61laiXEXd1OFMbv8gw0GbkKW4rVuWxmBM2dF0hrz7bL2X
	OA6JUj4EZ60bOni7XYa9wvQax3n3lX3tEpMmFHzGErR0L0BYHE7LFO7niRxc0r82yj1Gac+8pZK
	Ls8HgxnIeH23oiTsF4HcBQ4E95F12pN+9QeCga67mKdIWKpTWN3pOzK7uuotB6hDBAYFVDfRu3K
	EkK0nCJw1leFx3ez2zQGO0Z8PD8upVhgsXoO+f8nSiywHYE2VdbTFcGO4jEc1X3iSSk+Urjmb8N
	toTddpE2UCo3pku8cSLoz30H8hRnyKByORrrkZe1/sBOHouLkl9MmROpZaSaWEExXZyun7YCihn
	KzXqJzTDXRbAmSnDpx0wk=
X-Google-Smtp-Source: AGHT+IEnTnqv/BVPJGKstQYgwzeSPIi3tETUHoDIIqI5/ruaMqH+Im+W1UD6HeMiZEeYg0CJUfiIJA==
X-Received: by 2002:a5d:5f83:0:b0:42b:411b:e476 with SMTP id ffacd0b85a97d-42cc1ac9c8cmr40375471f8f.9.1764578505080;
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:44 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
Date: Mon,  1 Dec 2025 09:41:36 +0100
Message-ID: <20251201084140.376058-2-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_781096_462BC38F 
X-CRM114-Status: UNSURE (   8.52  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":
-- 
2.43.0


