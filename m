Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20287D70E1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIal9P/vly9trTFOOFdtiwygL3gRq3FSgu7GS6el7Zc=; b=Q/IZfb6LZhvLYyjJrKY1OhoR5u
	ivw6DDev49HOAy6XhY0gMV3NYwy1KKeBqyHOic5eoAFl0aXcHTCqb+R/hlIOwA77HXuYEKX5O1jXb
	nvD17E41YOdZBgjetRaU2t7QT/TQyJc+QSmpyxRcfQHXdLl1kuLdaO1ERBcqYbNmzdW0lnQS5SycT
	fRjJ9nclwmw67S4a65M8jZwEIchbDBkRmdb38G5Eglgpufz66tn5WBGJ3iNSheVVzBiydO1DpTmTA
	82KBHWBxENfQigqu00vHEbAdlGI2c9PHFlcTKICPf9rZ2wi7J9mhBbiMDVwh2RSeVbkhhb0q16rt8
	BN7egDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu1N-0000000Gxoa-12Yn;
	Fri, 29 Nov 2024 05:58:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu0O-0000000Gxa3-284x
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Nov 2024 05:57:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa5500f7a75so215534166b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Nov 2024 21:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732859847; x=1733464647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIal9P/vly9trTFOOFdtiwygL3gRq3FSgu7GS6el7Zc=;
        b=U2ZervGpva4cKlcpz8woT3C83M85BYAHmS+N0lBDuN4Ih4pnzcf47Uha0wlCCHeTon
         S7aYZnnHT+j4CusQio9/GZfGHXN+DvjV97F00yYJsfZB/TqKr2psoKclvipzwFWppE0h
         YLEMlKZJnNw/rL4xxl3+T97jBfTKdnkphJkU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732859847; x=1733464647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIal9P/vly9trTFOOFdtiwygL3gRq3FSgu7GS6el7Zc=;
        b=mriwZkA+eU4pUa/tGAt0X7UVzFO+yCJBYnWpo4kSPOOWMJDQFsnlfyWhN7BDTDdpiO
         75oYurvQPPRRcNoJqH0qSAaWsrUDQRFjLhgT/6DjA20vwKZaVfJd2CdpH6Gd5dD/LsvJ
         yi9UPdnFx2ai0vC8wY+RmzOJmBJXRVoBmpkBEE+Kqhse1Wv1kBr2MuOgPufbI0sUGYoC
         CkTVvscbVoeb4UHRcjN0gNiuVvFSEVo3XaURgJtoRgFXHVStunloHP2XAY5WZRVhyXRW
         er6fk0xzjqDDRRncJWv9k3+ydQQF64n1CbypU4FPn03YxQFUdn9rtXIRXe521T783po5
         LT8g==
X-Forwarded-Encrypted: i=1; AJvYcCWQM7fJRUeobTuXS1C+BWGmUqu5108RKs7qEvoMnR3dV/d7IqQvLLjMwBunQK9Rv6FW+Fciztdks/98wBIS9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfe7hu9rZPp5acscKYi3r1d3FNMf+PV7L8xVHQkg7ncfn7tIcz
	1f9PjgeGt0CpSw4J/OuQJhHJRvG/DjDyjjw0oZRDbgv9NV6Jy3se1ZzYsEsgoA==
X-Gm-Gg: ASbGncv4soZgyd5oIVrpGsztMnKMAKaAAI5uuqis9uMY1NQmGwlW+HJ3qpXwgNqoONF
	zWrciwO90lKq2RfKSBmjgtFusKFDKPJG7SK49L+EvzwElmBXMkEit12iK9mSZq1VYmS3tqSqWvX
	1s3u86GZhH10Ckn5F7M7j0jH0175XmS3oAWmaNwdIQzdffatbRIc3Rw7GtLALcNLX8rrVEQwwaa
	P6VJPbgXNjflM46rckxiEdlV0MPmNVgaWWp6PahwdgKbNKfbNnizIuI4hJUjpTVYVhvhUi0Y+NN
	9a1EmC0e
X-Google-Smtp-Source: AGHT+IFNv0zD6hK5Kn3ME6hU3vghtPqyWLs3uKgSZCZPb6u8aOBrQiKeDRnrEBES/faD2DMaT8va1w==
X-Received: by 2002:a17:907:75d0:b0:aa5:3631:adcb with SMTP id a640c23a62f3a-aa58109066cmr648048866b.53.1732859846732;
        Thu, 28 Nov 2024 21:57:26 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa59997354bsm136283266b.199.2024.11.28.21.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:57:26 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Fri, 29 Nov 2024 05:57:19 +0000
Message-ID: <20241129055720.3328681-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241129055720.3328681-1-wmacek@chromium.org>
References: <20241129055720.3328681-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_215728_543587_AFB98001 
X-CRM114-Status: UNSURE (   8.66  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v4-v3:
 - No changes
Changelog v3-v2:
 - No changes
Changelog v2-v1:
 - Fixed items/const bidings description in mediatek.yaml
 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..6191a5320c14 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,19 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku0
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie
+          - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku1
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.338.g60cca15819-goog


