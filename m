Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F84C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4RNTfCTM4/3mtcYBI0hA/zacZ5JNdS7KBfrJuUzQsE=; b=gHwmjNapV4bBkc
	0f15ZkCxI81uG8ateWil+SsfBWyGrHVi6wkEYIbEgki49TlXNZXxtCbiheJkCj/b0heVpJOqSGSbi
	YZKCdWsw6INTD31tXJ93X1PNS9BihHfEdm0t8SqYDColRIAFFP2wMGfh+tpWTKb7JFh7rs3iuGAPR
	Dd8jmwlY37OgzWiRdApozfM/YdGTKnxVh0k7VSLr4ZSIDYfXi1Fb9/yBpfRa+SZCKJc4+8V56UY+G
	wSQ21oWOg9a2gVtVhMPkILzYUD3wKb5F2HoxPeGehRRAvP2/TW49F3DG8WDtOk2mmsiPXWlpyCRkL
	/4lul9fC63BWtSpDthhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoF7-00AcPF-RZ; Mon, 13 Dec 2021 16:32:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoCI-00Ab2X-ST
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:29:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so12856967pjj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2502SCATk5qTXISqWbrDC4RK34Z7WGkAvudBl98LieM=;
 b=C25z5N9GMvgqS1P9g/yYRotI/7cUxOkcQfEyoQO6JDfuMopGjAVcFWkusTgcpWBJKo
 QR1iOvUgW9+QG42U5gpRa6iOcx2p1SyYZu5zdk6OwZR5vGCKKfcRYKO2K2B1HESbP/hb
 bCQ0mikaoqd4m0eXg5MfaS2VUv+pg02Vom64I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2502SCATk5qTXISqWbrDC4RK34Z7WGkAvudBl98LieM=;
 b=Mc4HZb5s495LUtAwSBXocMxtk0rf0y+gKHt6CNVuw9PYjDhwEYno+BDLGyAKWsxQg0
 coBW6vnBMB6CZGTlBnCOoEy7U87lWti//tihqwoJYPTYYgO7uTXXvOe+BM5WsxgkEv7/
 oCJVEX/efcyGzBELvGx4bihKhS30KjI1KmpCD0iTacxlstH2301VulKkndzkJ8PcALFh
 1fkOTFBbmMD8PCvOTuxWanWVswwlIgrvgCgLjvYIVCzHZQnipzyX90VYVmSjqBy5TaFe
 wtLYwlP7T1G1m87o1D6dpGnQTkW7YoDF4C8FcpYbMxu3qfk5IBHQQbiwCkKCMvndoSUB
 Fe0g==
X-Gm-Message-State: AOAM5316h00GItL8XnNh+0swAQfPz1v3VDnk3ldNml3FfZycIAwQgd5g
 vzUZdAzc/yD9lr0T46N/srjVlw==
X-Google-Smtp-Source: ABdhPJxayZzdaqNk+MKYyCSH0Rri2yOQQoYyI+ykOSsqT4/93hGbAb/vRbiq1RxX7CNWXM3gD2lLIg==
X-Received: by 2002:a17:90b:4f84:: with SMTP id
 qe4mr45816129pjb.102.1639412945316; 
 Mon, 13 Dec 2021 08:29:05 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id mh1sm7803802pjb.6.2021.12.13.08.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:29:05 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Date: Tue, 14 Dec 2021 00:28:56 +0800
Message-Id: <20211213162856.235130-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213162856.235130-1-hsinyi@chromium.org>
References: <20211213162856.235130-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_082906_976699_E818BEBE 
X-CRM114-Status: UNSURE (   8.12  )
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

Makomo is known as Lenovo 100e Gen 2 Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: Fix enum typo
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 75bb06d1802a08..828f5f3fde4e20 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -191,6 +191,18 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Gen 2)
+        items:
+          - const: google,makomo-rev4-sku0
+          - const: google,makomo-rev5-sku0
+          - const: google,makomo
+          - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Gen 2)
+        items:
+          - const: google,makomo-rev4-sku1
+          - const: google,makomo-rev5-sku1
+          - const: google,makomo
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
