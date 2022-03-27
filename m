Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 20:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/VG3i1eE/WDWnKbx/zUWhBIbyoB35dVvOOPCbFwaXY=; b=vxK6QV9uTL0gid
	DoBOcqYN3BnW9G3NLv1Xo/3PG5eq4xu9zgTP4uegB66SpPUQr4n4Qak7rOOQr1cFoJWFn1ugSrTIl
	xwiUvXoy2/Lf1sE9yw0JAzJ8I46rq4Tu2hSQ+lOp8+hWgHpkCJz75U1IZlGEIyENkq/Q86WNZeXec
	7sJ/yqEeLDy7bSSDPRMfzN/s9T+EsiUrc6Jd25hoW08UT58OUX+8az/jlq1KwXBXlF1xZFYhZu7vT
	ksFfZuITw5vFJFJOF/x+BfaQyXlBa4tnxYoy+zRv44RqliAP6Tew8DSMWSZctgF8nM/FI6wqT71vM
	G2Ca6KA6J/W983Ga3c+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYZ7J-006A6b-4b; Sun, 27 Mar 2022 20:04:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYZ7E-006A4m-VX
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 20:03:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id w4so17522163wrg.12
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1d28fyRINWBEv9rFNENNgciYP3HOQGFrcYEryHqhBZQ=;
 b=ETiMFcHrqDcGBEgPEp4gfZ1ft8E9q6y6ATkGzSVs9s/aB1O+Kvl9zW7Wp2Z1HI3v3R
 5RjXenHnXi7ULhG35yU/RVt2Zy4ux6NoihY0JjBJnAM+UBINSKubsl1Jr26/v+I7GOjK
 cTCbd9sBP2U/mvbB+rcJUXPDXItFBclpPdkVuEhFbHxB4rVNX8+vSCkGFhmUjHf1g21N
 a7aoNTd3PA/TWCRNGxqoKU7hlKgp+gvW/fQ7pXdMLwt0cxc5l/OLqWb4kkX+KW1f+N8t
 EAxZGziLUfq3WyE13+L45h5OamBGDBcttq6VjvRPxR4h7EbMMuN/9XzlBTrD0egq2HpI
 aZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1d28fyRINWBEv9rFNENNgciYP3HOQGFrcYEryHqhBZQ=;
 b=usJNUdtmu4Igi30OIuMaceFeYVQZJWxQE/6uNLp12n5t3oZWyvKDaBZHS61Iz0b9PK
 r6zqjzxPGr8hhcb4hutdefL4eH9zs8VpOtazV6tJjHBsrbarng50Nsr5Kdn3N/Dui5cx
 ezS+zdRJhSGG5+U3BXxZpfHn7ARR3qHDm7OCfQmq/nacog5XkwcASpA0haEgc5M3SjUt
 a5fmvNxZ9MMoKg/CBMNgcqJVRVEyPiEbmhZ3yXuKf/WUm5jGgG7kcQZAkIDvevgJ64xk
 vndkIoDvi83Cywm2bXbMXmS//Ud6+oCpVMYuxHGHcia8lYHcHSp/6ew9ds8Gl8mxw3sm
 3RdA==
X-Gm-Message-State: AOAM532q6e0hXJkTNu7ppZ5ygEQWET7zRzORi3YPqilWgSkDf2MEbKXU
 tSHTtsd73f+7wpy9XsTWOtTywg==
X-Google-Smtp-Source: ABdhPJzePJDajCPuH03dlfT6LG4aetEiDC1h/QSd89XIhYxAFlPsxZjCF0AKG5u4+34RD+EcMX0Avg==
X-Received: by 2002:adf:a482:0:b0:1e3:3e5f:496c with SMTP id
 g2-20020adfa482000000b001e33e5f496cmr18356033wrb.606.1648411435594; 
 Sun, 27 Mar 2022 13:03:55 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b0038d06cc21b2sm1354555wmg.35.2022.03.27.13.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:03:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: arm64: dts: mediatek: Add mt8195-demo
 board
Date: Sun, 27 Mar 2022 22:03:09 +0200
Message-Id: <20220327200312.3090515-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327200312.3090515-1-fparent@baylibre.com>
References: <20220327200312.3090515-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_130357_040738_DBE7D7FB 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for the MediaTek mt8195-demo board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2:
 * move compatible next to the MT8195-EVB compatible

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ab0593c77321..024a45300da5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -133,6 +133,7 @@ properties:
           - const: mediatek,mt8183
       - items:
           - enum:
+              - mediatek,mt8195-demo
               - mediatek,mt8195-evb
           - const: mediatek,mt8195
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
