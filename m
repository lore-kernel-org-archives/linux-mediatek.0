Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84032C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E22A611C4
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E22A611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXEsh3YflDGY0HSw0+iu4+V21KdFlSLzDFL2NwLyOGQ=; b=1+4QdjG5TY28JO
	VREFrsjxPs8OxuK7ojlpp6ke5c3yjDGYYzlnCk+Dy8ZwGmpXppRFak+C0I+EK83fQRr0m7m2iuTpe
	OlWvQ0EoqniNOnYw96BfxUbPO7hjNgsoZdLSzfGoaIHUywRX7n3zat0nUDE9hVTJ1dqWDZ28nCwSp
	S4nVIRQCObTknKNAY8R8S+80g20wwFtlWHt9Z59iuOdtDjcT6P3ByDTVATF3mVPwHheNiIh2eDQsi
	8cRP96Y9LAry0VPn5WYLpElfavcKNhyrxPxizptOoBnli/aZPL+pSmhJVHeIgripVxNjvc0WLclZv
	Oy+l3AQquD8w/Q4t6uLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz5o-00FaC4-7z; Mon, 08 Nov 2021 07:29:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3x-00FZ8i-Bz
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id iq11so7458326pjb.3
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibYrUCEgRz+O3z6IkyViyid6MIl4jLdozYXY2+QDyOA=;
 b=fy07Qb7pT9ElWRyx03B312jMf6QHNCa4Vijfldspvv5k+zwF/dKBSLRiqNlZsYIUJL
 nytoQ4+fQ2BF1OEx7jSjroL1eScHyRBRgGwcfauVt23wg1+PCsAPEeIKmUWDN1yF/b7U
 ycOlSQNXV3XOtm87QOk7hN3y2RMkb1yKwHJN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibYrUCEgRz+O3z6IkyViyid6MIl4jLdozYXY2+QDyOA=;
 b=77ECPFQNy8ebauzta03byBOMrrLRQxLPcwpTFQsl0+sUcUKTdQGqye3r3Nn6ZZ1PN5
 Lpsri+oCbiIzI5dhbdAS5+2eN5duNmhrFg2y0x8+CIgEiNkp319peOg80RYrv6e6v/oT
 8i0ovREifRh0N8yJ2J9m+dvOA95zOcuHVcDLX9KhjKUFk4n6iiQN5Oyd86NLUNMaB2Kl
 G4OEjRZVEBIrV0UKmG+FFojdVsI8ZYKXv+EWkcXy5fRdZo2gdUf/ffrvqhmQhhnrQbqY
 Z9rDytajPxdcQcORVrLrl6WieF8NqH+zMjivLbg2xY2d8RX4GSDwg33JXNSrO1AJRp5w
 TsVw==
X-Gm-Message-State: AOAM531WaGn/QSXhRhQCGVoTbEog6e5LDUcAH8pD4v3zjzEpXoCrW6+C
 mBlR2q7OrdA64SKEgIHobcJRNQ==
X-Google-Smtp-Source: ABdhPJyqETo/x1CeHyP4wBfcZNndWs4Br0LOvBzLjoY6GJIiry6n2e/xFv3Txt1JYc89hseVrLIqcw==
X-Received: by 2002:a17:902:ce8c:b0:141:d411:7e25 with SMTP id
 f12-20020a170902ce8c00b00141d4117e25mr54720970plg.85.1636356448062; 
 Sun, 07 Nov 2021 23:27:28 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:27 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for mt8183
 kakadu board
Date: Mon,  8 Nov 2021 15:27:11 +0800
Message-Id: <20211108072711.1628566-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232729_475721_9B5F542C 
X-CRM114-Status: UNSURE (   9.76  )
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

Add sku22 which uses different audio codec than previous kakadu board.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 99e7f8e294cd03..da5f9ecc1a9b37 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -161,8 +161,11 @@ properties:
           - const: mediatek,mt8183
       - description: Google Kakadu (ASUS Chromebook Detachable CM3)
         items:
-          - const: google,kakadu-rev3
-          - const: google,kakadu-rev2
+          - enum:
+              - google,kakadu-rev2
+              - google,kakadu-rev2-sku22
+              - google,kakadu-rev3
+              - google,kakadu-rev3-sku22
           - const: google,kakadu
           - const: mediatek,mt8183
       - description: Google Kappa (HP Chromebook 11a)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
