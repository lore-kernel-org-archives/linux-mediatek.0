Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C82AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFC861107
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFFC861107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv5eyUorxqslnp1DwaXCpEjsGuerg2NvOiKpdE7e//w=; b=drAq51ea1+cTQG
	XfmBVPg+iXtrdvlantyb03rZX5mwLTWWRNF2g86WvDbnjnBN/W2Riog4ICYJ/LDOom+vtjf5aXhlA
	O/jlpHSc0dcz7lmlMBEu8pjFnuMPqAfFwqnSI0LHJIXe7mMgfRWd90D2D5WDIYS19cyGOBmEN4tXl
	5hOn0A5FuvW2TjehVMvhj0cJV0OAlVWelTfyJYnvG+lA6G5MXGRgFeM0RxAJijdVDGgoiHFZsd9Rn
	TqwcZF7gZ7Jfs0YdVNHPZpCDEETWH8//Th37Guwp2yFLyUQ9HgpzGzz59UyDZWu/zG9VEqkoWnGq6
	YqV29TIzJvsxvTg95ZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJmU-000iS8-KW; Tue, 09 Nov 2021 05:34:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlS-000hxg-Fy
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:47 +0000
Received: by mail-pl1-x631.google.com with SMTP id u11so18900200plf.3
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=JYk6RuEtncv9Yj8kUzfQQAsHTXqjpqW4CuGBXznkYbTp8u3JXO0hGBhsNowicIqzha
 ZZ4i7LW0HN1mOsgYe2oTm5bjrj8NHDDqjo/42xZxyBWkrVY+hqXYKxGxrZj904NVQMAR
 HCZCaPTv/spHvGvWK3cwodQHmwMF9h5xvoeyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=hgAGeibZuW/7kpgXYwJ0NzVeoyWJz75EiO8dWVAvSKsUmJPfp1Sz4Urir0pZ8711WI
 02LQoK/L2xdp0NpnJ7lwIa8hAvqx1M3lPXTWMG80WKH2+sV9qgI9hLmCx97q9FOa1Dq6
 +dayC97mjoUbM63oaRYhHxkDbqWZD1GzQGI7sDz8SL1xFkh5dEkyBhKVKXDoduGiUtgY
 8T44rO4pICJv8xm/VXlARoy426uOnSsRoRP/sfxmOJNokXElLmWer2jfhwmU3SS+v0/X
 i1fBT8BBN2laWdtrw6snzypkEweYPusqZITlBFjJfpih02+R7+dSz+oL0qxJ8kFW2O4D
 WBiw==
X-Gm-Message-State: AOAM532s9sPFn/qMmNd5lPXg5wCu6c53JV3lkhQlpr+QNPv3l+o765Zv
 QQJtvV0AP8c3ebDRQO9VYbSGAw==
X-Google-Smtp-Source: ABdhPJyYiw2ESBezPSH2ABAAwdfC34sMPgqeOgJGIZvnyav6y0KjpeuGgvhlTdr2trwcbIe2bNQfyA==
X-Received: by 2002:a17:902:758b:b0:13e:8b1:e49f with SMTP id
 j11-20020a170902758b00b0013e08b1e49fmr4970995pll.6.1636436026004; 
 Mon, 08 Nov 2021 21:33:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:45 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] dt-bindings: arm64: dts: mediatek: Add more SKUs for
 mt8183 fennel board
Date: Tue,  9 Nov 2021 13:33:33 +0800
Message-Id: <20211109053334.1840273-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213346_568847_81FF3F3C 
X-CRM114-Status: GOOD (  10.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add sku2 and sku7 which uses different audio codec than other fennel boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7cf0c76cd31006..99e7f8e294cd03 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -147,7 +147,9 @@ properties:
           - enum:
               - google,fennel-sku0
               - google,fennel-sku1
+              - google,fennel-sku2
               - google,fennel-sku6
+              - google,fennel-sku7
           - const: google,fennel
           - const: mediatek,mt8183
       - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
