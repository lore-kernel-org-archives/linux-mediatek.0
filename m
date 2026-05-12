Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778D3CD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=; b=DqzflEbYYNBMzHACk+4Fic5Llp
	UsaO9KUgW8kvRa5E2JwfyXP9jXYwJqNGKP9I2TFxqq4uj5WxswldmAuFEMY2DQ7d5gMgZOZ9Uh6pA
	Z+H0AmgFTHNYmVssMjfRHyS0Q0ghbcmTOmDefM7L7wb1wdZCrVRS/4Zc2myF059PVZnUKg5RruwAQ
	J94kS+Vssj64ZwN4oFIAtKvugPdf74p6RLkjtOvdjObU5fnb3kJbLm+MN8KmSA7m3rZND545NWTHQ
	eCH6Y1GTj/eGLUkQ9qCwKJCI9wWN6VWLfp1nS/JH0MA6TfGVSpwHteImV1VKHorScxZ/28JD2e/Sk
	b2Ar/ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMism-0000000G9G3-1fmt;
	Tue, 12 May 2026 08:54:28 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisk-0000000G9DK-10mG
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 08:54:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c80167f56cdso2078404a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576066; x=1779180866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=D9PNGWXv8FGl0U7lrmDEAy4JDbQzcU4jEQAEV4wFfsndSMOVrNAg8aPTpb++dbcXNw
         inIebDtyo2VT2UMXQlClEhTUTspDDq0b4/ARm4uqPbA8B08MEKCWZ2YNglj+d9kw9ZBH
         a7KTNdP/QSc8tj544NG0tpC5KW70+ENIgeCYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576066; x=1779180866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=G0X1vYzwXXonrbPsRG+Z5uVsHxzzdgGOmXCPOROuUn3B2OnwzmPBnwNChjrn5Htnj7
         Bh/u0VmDl/xOteF6y/O7hTAE51BxpcD+tD5xHsN/LmJ/whcBlK2ch3aKONsEGtAGwCib
         c3crOMzPPv+4PM1mu1FVMtMFpHKoSZ/cwuawegpQeyQXRcm52/KztqCVhDmotnvn1KZY
         CwIF/AsR4CCpK5qfl5MEtoCvDWc2dcXj9UKvjfnbQq8yYd+/vIaxSC1xabXQtzJqa4jD
         fwxynWv/IoVaFQ/DYuqi38rm5tLjKG2j7VLnMzyrkS6aY+oNpFc0jSoUdDgg5gc4Fy8k
         7m/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dBHXMit2f/+/LNFHDyrfQ4irUFoHLFQUdp1m8YgC0RP8gdjq9Ra2NJLzvw+6jtSQi/GfvbpDryomxW0AnNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK73YN1rFbyuhfr93eiQvq4UBa5LSbKPSKVkzf+B2zD4ro/Zsf
	CloVF2tt2UTqqkwejbaF5o2OboIIbVAbEG+a5i1wGdI5cGIQ+HGm++/TuoVkFcHGOQ==
X-Gm-Gg: Acq92OFQWIASwgjFBINQXx5EFRouMtEBWiNcrgcMeZ5CaA0qlrv7snsMDDF7nFZF6s/
	l/AEStF2NYwitIKrQn5YF2p1TENJGayrPrLMQyxa65Qg4fr7FCVtlHTOfFBGXwbTGlCm8831ojY
	1pYqCIWp6epCXQLbzUCiIcuectazxACpkUNEv4daooUuZ3fbAP0bromoDJATnIMpGPl6covYw6i
	c6CodRtq9dR92WkQxXINiBQBl/GnhWAv2pn0FkD5nn1hOlN/4NsOdTIzQJy6YHonFzfHqldCMoy
	9BK11Qm/iSiYvTJ3Qjq0QRUAcyUCzZFOfRjAiuKX1kdc1ltpTxJp+53FSuYA7dmUFMR5XE2QkRp
	xTIexWkfv2R2Ei4qYFk/GyNUbAxAXSxc7LZHrUKpSd1dAUD8X4JIzieTDQy4TRMSytdtd+VWw0F
	I2tzlrvDDhNQEtqUntkYBoZS4jOLrR5X54i4DdO1QT2rOBGc04OwG9DhI1XxwVrhjlgfAO8DUiA
	Ktlr9ZRGoPHoDQodcE=
X-Received: by 2002:a05:6a21:9983:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3aa5ab71a24mr29852885637.26.1778576065529;
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Tue, 12 May 2026 16:53:51 +0800
Message-ID: <20260512085358.1693208-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015426_289376_6A788E88 
X-CRM114-Status: GOOD (  11.40  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.563.g4f69b47b94-goog


