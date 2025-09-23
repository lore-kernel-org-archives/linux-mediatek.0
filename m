Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69311CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=; b=xdGpX3Ekk3ZeCxyDHSQjyzGpSu
	Tzdo9HNGwzSZJVaK3ijwejw7IN3/pih1PXSgFEnTEbGD5BqTnHy2trWi0sHH3yDGmkJWnQ+5dQ1xw
	k3Ul9PogPlKnWNWTTXO9IPMyW2dZORGwrhM4W1wKlM79PDVTcR1DDizQEU0UpmC8d8CrkhCtdd84y
	W9gHJSjcyDViekzZoZ1Eu0LgnGZMJjeLDBTN4Bo4Ff9x+e4C4XRCc0FpIxDdQ5OOPwuOf1XJ/vJvm
	6zFVSrd2xpWkVNP78ynl+nWwIV3nFu/m5Yphg1xeUz9ZNfLoGAOk8eSJp3Fo+fEB7Ndd6z5eJMTiv
	gF+X0Hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v189C-0000000EZyb-3rtG;
	Tue, 23 Sep 2025 18:53:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1899-0000000EZwv-1xQ6
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 18:53:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso8310515e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653629; x=1759258429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=;
        b=CU6FI1stYFqX80BdwofGPmJOuQPBWYEK3qVsQgwRuU0IkH6XPonb9AEKzrx+2JIXcW
         IMH8nDY1cM+1T4iVf8UllzzGE3eyEeTwgK6CBgjcPSRy9CdS49oIKBtf2Sl7b+1J/2oR
         T1z2dw5xeQ9eYNLMV5PR598uXHaS7rbFQAfJuFkhQBohQ8Lg83il4ccE2Q8zTOfF604o
         hMZdTYG6yBoMIUbJw2O56Cj12fPwIXvk9SjijgrvRrfeg8FdQ9E605bMDQNDt2ylLUpt
         my/zdD2g15Q0CDh4/kf6iKHQPhtsi3F72k+QCF+3AlIVg8KxdKMLZUL4hhrEngq/tlYz
         lazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653629; x=1759258429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWcLtw2qXrDtFeNiHTtrGneV08EOKIFUjDj5SrfHC4s=;
        b=FLpYJ+PjR5CkkIEWzuEoAquLpWHE98P/jO+QW5l/aZ5tLgXGTrB9zgkdXsznM44Miz
         dtBVU/axJnlsGX4ivaePvc0H/8Q2dDD1fmRCZguZ+JDbZoU/BeIaJJKwny0qv4ENlhnQ
         yoECSIPM8GfV2+05CF+KEV2thA0XBTlvi8+oupU7gyqD5+0er8SIDyMSW/3r5MSdIeVc
         mfTCPchPWcDmrpf9+mlcuUcbPbJHMYcfV+qOisl5hS88hV0LKXS7V40HkPytwKp8xGVu
         eIpCCkjP2mQo71lZpvsUVfP6/0xbDKPg9LG4QY/7gF4hA9dmn/y4mWtFxywEbZyKnFjG
         U9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU4aYS6epZfs9PbDILKpzOCOYP1oIMnhxusdaDSj7ozv28DtOM+ECgR6feP3VHZQXhLWI6JnSQUztqO5yZ0vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDKw5befVavEPCxvzbZMB9Jj/J6ftwxsjxczFblpJOX1B5BlJS
	hNLK1b+X/Be+uFkRC150MwGD7+ANIV0DKm+mnN96BW7mCqiOlnnRtQDH
X-Gm-Gg: ASbGncufZb63QcwJGhzvUch39H6be6sxI6KLKdApq6h8yb4UwvGl0mo4x155sz8nMsv
	+lfePDVRVkgIAvtPa8VtG56nRpcnzuEwsvH1uD+JQ1CQ8DP02A8CJfB15S3ed+FOYTAxV22/4Ze
	dubtd7dZIaAW6aHlRfjMRWCljOY8cfmY++YZBAEqA1lBmXwrlfVFkLtesv4wqTtQZAHsPnZhoFO
	sMLi0bS3BRSTYpVg/LSChYpNxtoX7MWcAmw+z7nPcUGh9hePWAYjgf7HD5AvMXsK4huPpV+fHjj
	oESPtk5n975UaGEdSDUdXZsdw5W0/BaOzblh6jMAKEdVpLWZ3wcJwGSF4apw8//uyrSU1WRI1uv
	P1oQZaKgZVrQeWztAXgxxq/hm6g0krhUiuOneg9maZhA1x4Vw/0g8U3KcobNxVjXByN8i81Ugpq
	28pK4NKA==
X-Google-Smtp-Source: AGHT+IGKjgQQvlEa+A94efi/b5b4nbfk7G0qwnMnOukLmIKhoBHDXNsNeAGIWOJr8BOP+8/JH7HY5A==
X-Received: by 2002:a05:600c:4fcb:b0:458:bf0a:6061 with SMTP id 5b1f17b1804b1-46e1dab51fdmr45625665e9.24.1758653629107;
        Tue, 23 Sep 2025 11:53:49 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm295014655e9.23.2025.09.23.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:53:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Tue, 23 Sep 2025 20:53:34 +0200
Message-ID: <20250923185340.21526-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_115351_509021_CBF3C28C 
X-CRM114-Status: UNSURE (   9.12  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Follow alphabetical order

 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


