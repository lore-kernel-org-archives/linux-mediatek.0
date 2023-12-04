Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDDAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aA6QuGxbpfyLA8GoL1DX22vu6yZybaikV0/22DbGWE=; b=xIMpPbMGKQMaw0y76bw3ueVxGL
	RvmlX5dPQeeoIBTHy2SFjfsmW0A5bcd0mXYrs6DDNUV9YJQ/zGDnlyw2rr9vRU1DKsRTCWA89KSg4
	K9Z6hKGovsx27/SQm1YBHfitbIRhvht1KWy5vR9tsamEzfiDr2bzRQT7jYgWg8hJMJyzqhIFuXh5f
	6fFAs+dAD2BK6Ouylv+nnyER4VS5cevK9Afl5tYuVpDsiAeo2Taz9NBuKYuIhYYnwRSU9GRXTOwpA
	YFkQGLPx5MO29ZU4Ub/ef2hhZPisI48KRMfjGp68zBL4DBMOr6oc9qpMU3MgCR7Bi8pp9n61lF1O+
	BOH90+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XO-003IX1-0D;
	Mon, 04 Dec 2023 08:42:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X9-003IKM-27
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cb749044a2so4524181b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679351; x=1702284151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aA6QuGxbpfyLA8GoL1DX22vu6yZybaikV0/22DbGWE=;
        b=W6cNUYQ65cXjHwN+Ffp2Ds19qw9nh79fPdNK/C+sdCYVz9jVVBWpCzcq5aYxlZCwY4
         IOkfiyjym9ehatl+LSKjeNedB1oTJJuHOi0bq2mW32g95N1+QMg8IoVCumoNbFXRM4AW
         nRpVhzt2CYpWu/ZAsucB5ygG8klnb8SWp4css=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679351; x=1702284151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aA6QuGxbpfyLA8GoL1DX22vu6yZybaikV0/22DbGWE=;
        b=jHbX38Czg//4Et59z1ypKBq1XYKmhppDBNIELuCvYjZwmuX+Lk3dtjZOuqjQy25I//
         0N9zAtI+7RSkOzZfh1TBJ9u+Nl+pcRIjW7JcpuYHjnOS0ulp82TDCDPEaFvUQtRsDHZk
         DLMRgokC7HCPZdJdacsgygLLhNcegKd1Cd0L72yndbISSeDq+KAMwMIn1AuOn6w305QL
         xUePhhufPPVG+PSr1fFOscllw6s8drYSO01mU23gU281jYjObGiFnWplPQncbEZeg1jL
         9EFjuLWNrdOVbz5JT60Yt3F5kuA8yAfz1Kpk/KvYqoMt9KsS317LvToGvbeF4sK9H8rF
         kB+Q==
X-Gm-Message-State: AOJu0YzII+JxX0HGZfqP4cBkLxi25L6hjdy8OAR38KacuHwJjhKGXqsB
	2hwWSZ+j3+ghTf47Ip4RscGnDA==
X-Google-Smtp-Source: AGHT+IHHys4G1j0LzvAtyDH5r6jNjBqc4C4gAmcOTNfRgLJLRIorxSqsekbLtM7ag3o9PDZsFhb5eA==
X-Received: by 2002:a05:6a20:4298:b0:188:444e:2b6c with SMTP id o24-20020a056a20429800b00188444e2b6cmr4840529pzj.49.1701679350992;
        Mon, 04 Dec 2023 00:42:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
Date: Mon,  4 Dec 2023 16:40:07 +0800
Message-ID: <20231204084012.2281292-6-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004231_741183_209CFB2B 
X-CRM114-Status: GOOD (  11.05  )
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

Add entries for the MT8186 based Chromebooks, also collectively known
as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
the "Steelix" design. Being a laptop instead of a convertible device,
there is no touchscreen or stylus, which is similar to Rusty. However
Magneton does not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.

 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 85d394e390f0..155ba22e2ad3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,24 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393219
+          - const: google,steelix-sku393216
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393220
+          - const: google,steelix-sku393217
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393221
+          - const: google,steelix-sku393218
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.43.0.rc2.451.g8631bc7472-goog


