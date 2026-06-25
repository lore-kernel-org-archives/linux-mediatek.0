Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB161CDE008
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=; b=38J4T2Ek4HSsgY3R0OcyWSbwVL
	IxV4xshJ6moXNUQO7CUYyQGHwEZ/tXZYDBGEGWB0N2iUvNWgs9uAlcM7szoKfIHzCjk+3Ghhox7KO
	1p1CENCJ2PelORjQClsFdGita8KgOr5wYid/kwS1l1Lu96NKLowKBIFqCEialdqlEo2HKz4h7dON5
	8JDAeiBi+6V/BOdq8tCvoXmG80bGXIrNX9sfkMY1M7gjX+HgSrg4c3CFzFLl8yq8FQQIDfGKENCQh
	p5yamEye03YnWyHZRDHwjGrpAKAY2X9jCpiyTJyslK2qv+Xea6xhJT/2YiKz+ihSEEnGQ0vBrx90J
	xqGbOkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcu-000000091sn-441o;
	Thu, 25 Jun 2026 10:48:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcr-000000091pg-2kWn
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b3637b90so13843865e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384484; x=1782989284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=aichpx/hjlBYnpeM/EqYSLYEJoCbmBKWexSrF3L+zl3XS4Gw3NbtauJGu47L4rwZR7
         8C1Tw6pozFb89t6kIL2LZ6o6kiDMkFfMmO6vfKmrEAzftH56Ugvzxq/ikFYtTn44B40g
         nKqWmOMjSHXqJyQmZeu/5D9OUNI5uoEZUCgXs0NVJWWJXwTSI95nsHxP9l9K+UlYvPy0
         5b9+BukEbWOyLxdXwHuy2t2uvyHQzSR7FRiGLHS4DR6V9KNV8JZSFMxoQIslF7UYmJ1e
         KlpSB1YjZjDvwO2ffm6+6Zlp7sMg37csR4eeG6IEULdXe4VapudKeVX8smlCDATdhdBB
         sknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384484; x=1782989284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=GDp9hyGvVVAQ7m0U9ro97ICgMex/r/UFIU7WoG02sn08zFfic8OUsazUXa//oc6pK0
         pZPg5unIbbIEOficaAO2FJcfDxUKmNuZyXkl2eD/BSNEQzRD5uo+DVi6NfB3JR2ybm6D
         x1ggvESDNGy8PTRkpV5wdKjM19kLGKubODMk/vZCsTCTui9lAF7CUqLKlEdfq/yw1Jts
         rHqlXBhwirnBiZF0rgL8fO4+ohnmkDjdRnvJtj6Pg6TW3GD6dGpuxr9azMkqOL5RrnTU
         Bgu9NTxH0OTYyuAFcZlxMdFScKM14xLlcMT3By1F5kKPf6iScnoW3XfeewQdOuBcR8ja
         T8gA==
X-Gm-Message-State: AOJu0Yy2l9MF/8ZVXj4ol8XwdYStHmxUs4ZRVNA6Paq1ZHWso58surZf
	qgP0O5knbgU0HfHF7cRNpobyEio4mqJRrj72fKMImYMAuuDmtba+4yLoIIUByaZW
X-Gm-Gg: AfdE7ckpiRaNxY+fdjOu3falwA4znhvwAbcRjuX0loPnh48bWIFVyHk/i6Zo809S6M0
	rXrZ1CZXUl6Cq0wiOx3z0K1CLRxY/2jtZ38+DsMmxbgV+YCvFdVUwYqgQMVIB8ZvT2NyOQKIqJf
	b6iG8JxFto3B8Mr0QLy8LQxOafJAFyGclo73hlgyDAZsex+kgDHj2JLd2LYpAU+MbINAk7xHO2B
	Ip9xJ6v+bAvInX0G/1esOZGDe2gnFDghFUs4Bthj1zVBarGJeMONHEhd5wWXhay9Hf+gLNIkJ+L
	0AET5U2pwj6U3P6CRcPwo/S2JVjbOidwah6rT52qwC1cwh+WRta4O4O1A9nbeb5rF+jn3vlJnMv
	dkGK74IPjJAaNCf+QoYpl81kWnBJ0JkBmwkNssw591I3kTR4efZ0pcqw4bwCCQ/tmLTFuw+fAe3
	Lx5NDdBA==
X-Received: by 2002:a05:600c:4f43:b0:492:660c:5fca with SMTP id 5b1f17b1804b1-4926688582fmr26319285e9.23.1782384483738;
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to mt6795
Date: Thu, 25 Jun 2026 12:46:30 +0200
Message-ID: <20260625104742.113803-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034805_717750_232D5F60 
X-CRM114-Status: GOOD (  12.16  )
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

Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
addresses, one for GPIO and the other for EINT, as it is common in the
"Paris" pinctrl platform that is described in the MediaTek mt6795 docs.

Move the binding compatible for these two SoCs from mt66xx to the mt6796
one as a prerequisite for migrating the pinctrl driver to the
pinctrl-paris platform.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
 .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 1468c6f87cfa..0cff2a352b1f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -22,9 +22,7 @@ properties:
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
       - mediatek,mt8135-pinctrl
-      - mediatek,mt8167-pinctrl
       - mediatek,mt8173-pinctrl
-      - mediatek,mt8516-pinctrl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9a937f414cc9..c703de72e1d5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt6795-pinctrl
+    enum:
+      - mediatek,mt6795-pinctrl
+      - mediatek,mt8167-pinctrl
+      - mediatek,mt8516-pinctrl
 
   gpio-controller: true
 
-- 
2.43.0


