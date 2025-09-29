Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1C2CCA468
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=; b=T5phyp1Sn0HX3PB/r9WqscPl0W
	JfEjpBWiwcZeK/ql2mFOqWhr5nQUONBYDTNGaxOsNQmS3KbB5mUrPAtGa9QhQEylBHiftL9k0EQMm
	Ah5WFuKzI/lgXR2gXXxrPmOKoXB9OGDQToO1LDWFQOrbZwYxFw71fdxeWkpJJg5UZu+bmggyCWqj3
	cTlIyTwZS8FzZjy+47H4y1kFFwEj10aQfITYTCdoI0E0EFfu6sRMQmo8EeM0i4yIo4ia8QHGXZWAF
	BBfsLUIcD2Y7cZPb+DW4/DYlWwoI0lycOX+xtrJL+oTLAFC88M6gevZqP0S6HeVS1nBcs2pLqoYvh
	L9cjkEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNr-00000002OdB-01hM;
	Mon, 29 Sep 2025 11:49:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNp-00000002OaF-0klQ
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e3ea0445fso15777045e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146571; x=1759751371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=dTtyBIYp1IXbOsCXxA2ehtyzRdDXmVye1b0SmuC5HVkJYK1lHVjPhzP4OPs1Qo/JS/
         ejfZ0a5dK+qBw2S6WA65XlnTxuwEVA7eaeLw1saUFtadT/W1Joxit8vx+y3CBKu9GufQ
         q82kPkG22GM26OExWzeGm+bxtcbFAtJ7x16DVwecHnXKWGQu4AkR/zBQmn9HmbyHMiys
         fm1jfzn7xolKXPM8n83QgYhuHtuvjBh4PfDrpE3P5Zh50bYE5qoDfVejAN2KVX+Nxrx3
         JyLQ3XiUZ5jkVIOvCuNzYsUjAmITE+OweRsljdzgPiM+lRC9zTnDgwjfMAHssOWqoEc7
         vJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146571; x=1759751371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=qtbCi/nwLnku1hFcHADOQ6N6pk9kDwefjEEydtGjL3gOmylgT0P6xnLbUFcz0hsPl3
         tI2ZewD/H3ubybflT0bBIU3qXi6pOKbS8pOZTwadcm9D8SUs9vQMaQmLNLkjFgY7ZpI7
         9Ijfp2+jOlrPaMRnRYNvB2Ric1uX88sOq9gw8gegQdqJrw9p3elG3U3y6kKjXLD3YbP/
         IC3cv7oPL24YSYxbsqneCRBxuRL0jX6O6RRuDXj79MwXQ3Yuo9Bvrkcwz2kFxgg2DbFg
         Dj8xblJ7tJ0c//GIECgDmJP6OQUD8yvOgpYVBR3gXALqCO4vZekHKHmoN/Q09V4FIDKr
         K9/g==
X-Forwarded-Encrypted: i=1; AJvYcCWtCgYUlC5U5tUXM/nndLK5kfpIXer+gL3SMM4EB08VTin1laL0AePD2Ljk34c+9WlRmXl4eX+6h22qkivf8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpOiWGL7h0GC+tnCp2do5KgXfxLJbSE2eVwWdyKo0XZGgnWtiP
	lpl4nQCFpxw/hb6jBJ7AioEbQOHnLf4dq7/VNj+8NEr8Kg69Bi9PWqB2
X-Gm-Gg: ASbGncv3hpFQIZiHBzwDHCPvnexGrerEdoM7bpfPuu9Ip9QaIOI9ehJq2mTlcjVhWix
	plG6Tz3eJvIeMZ4X2Vg/8a2uMKLNgVgihsYup6R1/lf+wr8RaZl4VlDYs3CRqKRYtxytH0yiMWp
	Zxoz4QN2mZZu107Vkm3hwtpPcTYWeeq2em3BI9JcoiRKpNFxD8Bs/HQYpyD62Hnfm92NZWCB06T
	jc9NZQe58gY4HOSCnE4Q8wl5iraoBmfaQ+rSR1A8k9XfJksbWFy44fAQNG5CwFE5Hkf2QsLIqGx
	NgXr63JHj577OfvoniktN33gdYR/nYp9MvktTr+EMKnBAiPjyveHePbfTikxQQtWAZGT0Lzs1WN
	CxcMNhB5/WgQOLFnSLe5pmtS2+s5IkWOJhBEV9oo+bIgjelqiIAomJmOkMLjN1j+t2zcVthQ=
X-Google-Smtp-Source: AGHT+IHF2CwXyWBOC4BcrLBbsAVVrnt/gxj/QYgegqRmUtsThNiGS8+anT8fVSz00MWmGGHmAtEBwA==
X-Received: by 2002:a05:600c:4689:b0:46e:32f5:2d4b with SMTP id 5b1f17b1804b1-46e32f52ec4mr147677375e9.37.1759146571403;
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Mon, 29 Sep 2025 13:49:14 +0200
Message-ID: <20250929114917.5501-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044933_233144_312B6224 
X-CRM114-Status: UNSURE (   9.73  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
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


