Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619A4CE8D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwMdY8rdxam8QM2rdLhELR6drCqsB9RkOgkWUwEo4Nc=; b=ycJzLWFewkM+LOdNHb4kDvlaAC
	G02KDTZFTdJyVtFmC4YLxKnxrgI7LGBMIV498UeeKwS/3JJMMaJT8KA+ncU3A4YMIKaBJr4g3itax
	ZUztYZlrSMrGhvrcMQbVVbUtRnVkqL7sWVB9gl4vKqeod/Pbs0KOlHsTWua8znyvByzsO/7s52Z2s
	CAR6aVcZtRuFBk8Zn3HYrJASXbDxivRntlUzJ0AkCRZJ5lnCtpJikq2fBv5ZULrMXXWUagBop+FsF
	78bsOLMTkTgv72lxiFyu8UTiq8LKPUdiBp46fKUNtTPXkCA15BBflavu2WAKuMOVqVJKJz+yViZrj
	Y/2nhA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFFj-0000000A9GM-49j9;
	Thu, 19 Sep 2024 11:23:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFEc-0000000A91K-3HNS
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 11:22:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-205659dc63aso6504115ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726744926; x=1727349726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwMdY8rdxam8QM2rdLhELR6drCqsB9RkOgkWUwEo4Nc=;
        b=BFmNBLqY2yqLorqnIX8oBgfPmAeGFbpEtavEvsjaeMNeZ55dcoiNCA/DyhMigmzIaM
         7muTxK+dkz6NZBUk1ff6H0zfk1nZtA6uePzrGdwfkFF9j9Z/7xV7vdR2bTVmnxY/4p3h
         m3+CsvOjS/1XGGHslWgjfmi5C545wqLWbVaPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726744926; x=1727349726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwMdY8rdxam8QM2rdLhELR6drCqsB9RkOgkWUwEo4Nc=;
        b=WiSwQgkev9BBh0oj8SWYGBy8wzmfxSSEcyjHyV3R27DZGYsQd1WBviV33bDswPVdtn
         N5GnH6ixI71ofV1DkG0PKe8oeEXPFJS1mHyY7eS97yVVuCtsxD1r+hb1pEqMwr6IUpe5
         0q9j9RBi5i+YdZsaQzeXGETbzFbhDLJ9ufdtOwanGnqM8SmCx0+uQ+rvGPR9Cub3iGPA
         XJmCdV5LjNMXvdJno/JFSG9w/5CKtXwfM+IS4CuSmcf0/X3Ho0RFenTJRgMKyJ5HD4Ia
         AZXekcxfEmBzAmpSYKl5z5JT9M3Io9U0LdQXxNSIHPbi5HlF/k6NoowmEUif0JnwQw2b
         gvYA==
X-Gm-Message-State: AOJu0Yy5eEX7n6XVpXmu19M7drmHCGZmhCje4mkzQCEfDFIsP9nyxjeY
	N8hFBGnUdmG3kq2/OBCbUN9vhdgJnSVCt0W9DrpHFTQw2yZpr0RsGG7o9tixjHrw6Ih04TihksY
	=
X-Google-Smtp-Source: AGHT+IF7NZIzRSvq4SPW/ooEciWdwOfEcj6TQwh8am9csyrkRhBcF6KyEh38R7s9Np38/enguUBOVw==
X-Received: by 2002:a17:902:b416:b0:207:3a45:2be1 with SMTP id d9443c01a7336-2076e4854d2mr294228205ad.51.1726744926008;
        Thu, 19 Sep 2024 04:22:06 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-207946dff96sm78417475ad.128.2024.09.19.04.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 04:22:05 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	krzk+dt@kernel.org,
	ck.hu@mediatek.com,
	robh@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add power domain for MT8183
Date: Thu, 19 Sep 2024 11:21:51 +0000
Message-ID: <20240919112152.2829765-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240919112152.2829765-1-rohiagar@chromium.org>
References: <20240919112152.2829765-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_042206_856941_45ACD1EA 
X-CRM114-Status: UNSURE (   9.81  )
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

Add power domain binding to the mediatek DPI controller
for MT8183 that already had the property in DT.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..1e748ee23fc7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -88,6 +88,7 @@ allOf:
               enum:
                 - mediatek,mt6795-dpi
                 - mediatek,mt8173-dpi
+                - mediatek,mt8183-dpi
                 - mediatek,mt8186-dpi
     then:
       properties:
-- 


