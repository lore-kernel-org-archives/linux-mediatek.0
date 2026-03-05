Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1264BF47CB7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=; b=H1ufRu7u/alY0o2Ksg5FvQy8gW
	wzQOLipUVWAQ2gner489zPx+FeEl79npE+KIfRi6LsoCgZ5RZ9V9pDazs35754Ivgu7OLhHCHE5Fw
	3/fm39KnCbHXYFgIhQULrTlHnzNh8CrYmMqn0UCw0iLb23dNNtKGfD70Hu5kj0ZnPILJRoldOBM/1
	gnzYpkVgkdYkOoxPpHR+sKGBRftltLW+UcPYT9kGUd63Sy2cU5IsF0mGVdpEC8COE6M6Mu9f3GnpB
	pEoq89ah3FI1ghPUgb7NZRcFfHRVtBwi2te96TiA4CBZuBCX8jq8zTjOuFEWgK3HT/aUFMi9H1D88
	7Af1GAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDna-00000002Pjv-30Y4;
	Thu, 05 Mar 2026 18:51:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnX-00000002Pha-3LMK
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 18:51:49 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3598a09fcb3so2120702a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772736707; x=1773341507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=;
        b=KmL1xfOB57veY4Tzytp0dP+uDVTrDapaYkLtiV5jptNkPQrtQ37vHSB3mUoqKW815f
         BLVXURLBLyEKtamRbCuc3ym8h00HBjmE9T9sYTNeATdeuunis9WupW0/SWj+cfoagKIN
         J5GvD0TGIy7+WOn4Poom2Wg5vJMY2DAnSWKduz9oLk5Vr67uaXZyuczdpm3m4mlvoy12
         Ac4O8wUWJerowpYBfNnMExHO4GzH5fGlZpyaTIbHHc/fahiKIly90sQyeB1DFyU0ltbM
         YDr3AU6/Seo/ITK+2svAQTqlU9rsFaG0wAEBVwr+P7+T/YAl35sU04mQ7LUknID2Xy7U
         vnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736707; x=1773341507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=;
        b=tpa50o6h3IXzdxFvWiBIiwEmNhfwUPYoYIOXatWzdOrzwEl7JnsuU+QDzsvKDP6p9M
         5FwmFrIVA3cj7E67/Py5AD1AUhQwS2TFJGh4EkdgZSi4w+WUFnJg6Or8mLDLvbs/fZLw
         ZwAng9xlK7nt1sV5n48TW/t/k1NbTfgwn8tV+4g1o9w2z61yAxl/exdnvmawcV3x9zb9
         7BIn3UPp8fwjbh4MCBPvDxFV5UhTQL59OoKUjiiokIqpSOeLfn2GyZD1R9Sy0SOPiTF8
         5CAAdvpf2VtOEh3xEMN+6gocvvXqCh6mgXUeAtaN/9Ojjf92GeU0zzcemeOllUV0uQto
         Fx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjM6o7JQ1mnxds9q1P74k8m9UfbXJqhwSlMHgJdzlbuGgLGEqAm4OjqfcO72HSEcaXH9T0i/59kVxuJ9NAUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf0K/1x7BVu5OhlEifqx88ZPV+fEgT7vreo8Yv4OJW9VUbIoM0
	5iRAu5/JppVuIWrF0BqfcuiAw9yppQnBjOLmPYF4IF/Z7HhthO/soynk
X-Gm-Gg: ATEYQzyAhONIf02Gh+qeJ3udhMuZ1tnWBjU+zr3b65ULWEDFkkEoHD6nIEHtmqlMhUd
	BsRmQYR/Zda4Nam+Lu/1ykIrndhSWl6yNy399hUE2IcdukGMwTswCl6hZGDoj+Gqb97SIO81MTJ
	hTaq2k8pfi7PJeMPC+d1PfnZgJBtyp5INrxAeB/xrHzCihd4DTp6EGz0rvFhKQCrVYy9vLmkcSD
	YpLxZ4wb1TRteFfE/daEbjtBTzgTUMqq4MlelPNcaw0qVtx8snAaZKW98GvTIu17eW+yKXMmdAn
	JBm/4xNSM2RmrC8refWahfuVp8aMb9a6BWHZ5dpY7epbO7tRfL98+dKOTHo2cgv0I0AZd0rQB/l
	3PS+Rc9BggT89fUx47uriwJEcDmwwJQZzjKecKZ0V0fOC7ra/VnpJUD5cM/H3AsBcTqNHGSW8Mk
	ncOE46vSRHNJUx0FQ4RfczL+jWjePP9WtXr0Lt+uV8dLi5qhC6jbDL52qQ8Gw7qOuU7xWPtzyjU
	qN3moA=
X-Received: by 2002:a17:90b:3945:b0:359:94d8:34e7 with SMTP id 98e67ed59e1d1-359a6a7ea1amr5228450a91.32.1772736706964;
        Thu, 05 Mar 2026 10:51:46 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2769158a91.17.2026.03.05.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:51:46 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri,  6 Mar 2026 03:51:15 +0900
Message-ID: <20260305185116.781184-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305185116.781184-1-akkun11.open@gmail.com>
References: <20260305185116.781184-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_105147_828566_CB7902E0 
X-CRM114-Status: UNSURE (   8.59  )
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

Add an entry for Lenovo YOGA Tablet 10 (Wi-Fi) tablet board,
named b8000-f.

It belongs to Lenovo's "blade" product family, a codename found in the
stock Android "ro.product.board" property (e.g., "blade10_row_wifi" for
B8000-F and "blade8_row_3gdata" for B6000-H).

The "blade" family includes several variants with different screen sizes
and connectivity:

YOGA Tablet 8 (8-inch display)
B6000-F  : Wi-Fi
B6000-H  : Wi-Fi + 3G (Data only)
B6000-HV : Wi-Fi + 3G (Voice)

YOGA Tablet 10 (10-inch display)
B8000-F  : Wi-Fi
B8000-H  : Wi-Fi + 3G (Data only)

These devices feature 1GB of RAM and powered by MediaTek MT8125 or MT8389
SoC. Since these SoCs are tablet-oriented variants of MT6589,
they are grouped under the "mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..ab3c5b1152f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b8000-f
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.52.0


