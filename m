Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31134C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maPZys3Husg1xXw3s250DwrK944nIzcFhej3lZUZ87w=; b=LZ04r4BlDn1x+FtJWuNCAffqdE
	1dgdF6LLJaU/6B7FEjK9AFBVREx2ZsJGIqM3XEQucVOlLU5X5sNJ+h/stSLV1Bg8+a5o+yryxvCE3
	hb+cxKjiNdyO9wLS8F/ll/Ib8xVuSwHxWzVXdTcQ9ZRtMBiXIWExTq4zmmEycPWkntbfVvbQoZJtA
	0W0eku1kTaA4Lcg6kDibxHmwA/bZG692ncCgwhvybhw+ByOXIj5CyfcKlY5LgWd3n1rGkow4KAK4Y
	duWGfBJLFYEO6RxwU/yrWdijulB0P0rexM5EGG3cZBal2NEnJYea+sSAuM90Txqoxzenaa+HvK+yJ
	unDZQBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqj-00DCqG-0E;
	Wed, 25 Oct 2023 21:55:37 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqd-00DCjd-0k
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:33 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5849fc56c62so175620eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270926; x=1698875726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maPZys3Husg1xXw3s250DwrK944nIzcFhej3lZUZ87w=;
        b=Rc6hmf4U/Ntm31DYvjEVSvh6CGMMtvrOJjtM26kGmp6DJT5rjMAmNnzNKiM1/va4As
         0ydJrxPeO819CpANezQiVoHyg36GYr+tjLpGtQQK8Z4oorzt8hticfsHuluAiguBVqMf
         zAxJAYvE7oihlrHBZXWA9XfPWAXJd+de7u/hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270926; x=1698875726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maPZys3Husg1xXw3s250DwrK944nIzcFhej3lZUZ87w=;
        b=tph4h65JaO7e8hJ/oNHy/xcjalwRXXzGMi+9r/GsN6jORqMaVjVXLNpeJ6CpWxzKPb
         IfcaYzHaQekpWzupFuK4a67ooIZz5LrnK+TYpdAA3djhFjYP0Gc1QaYska8dXQVSHkDc
         SHSSAGQeFlo4qX/GMCvG/wZji9vvqPfGI5zBKIc++jmEq1C6VY5GjXOt7qpB2C3Lsw6G
         uUibhncjX3MWhtxR++dana5SB3023Ji8EJX33M4DzYEhfRcHGa4Eo1ygZjyADkdktr3f
         nwUHrCV5jBrr+BeGwfQ2j6IJZuXMax0ZHrOpTlWFc16g35f2lsB28ZWirPPNxkfE1bc0
         C9Fg==
X-Gm-Message-State: AOJu0YysFc/4xAwM8imy0rECjpo5gem0GgrZabmzchgnbHAX5w4fHUxY
	ndLDyRrwSoEfQL9F/HNcmJb13Q==
X-Google-Smtp-Source: AGHT+IEXp2iiwi0OzXg1ybXYcSTK0weNwhbjcuttoe7Qbdl31Zp2IvdlZ6c0LZV7ASE9Q2yxU4WSIg==
X-Received: by 2002:a05:6358:6a95:b0:168:f55d:4ef9 with SMTP id n21-20020a0563586a9500b00168f55d4ef9mr5866825rwh.28.1698270926641;
        Wed, 25 Oct 2023 14:55:26 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
Date: Wed, 25 Oct 2023 14:48:44 -0700
Message-ID: <20231025215517.1388735-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145531_268002_7D9B1127 
X-CRM114-Status: UNSURE (   9.51  )
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

Add katsu sku32 and sku38 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..4fe58cfe6f1b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,13 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu-sku32
+              - google,katsu-sku38
+          - const: google,katsu
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


