Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E701CD4855
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=; b=Ln0rzY6LWc3EcQlqSytXkeXiXB
	XeGlIYXsL47OXc0AKG6r9ge3Dc4PY01/MpVAnWVm8zWy4WlnFsMXxR987IpsVBw7F45fyWWtqmXl4
	GcO3cGGYqlYBn1kM/fGOGdYDQtEmZ/nEXLY4rMXTRd8E11HcRKq8uGp3NhycIlQYrJcaH9mtCssSz
	GhW7QOkwKHhHjH9e06kV0Yn/+N37Ntq8tZVw6rrUuV0eaU1GZbRSD/6W+o5O++OqfSEVCNgpFJ2KN
	S6I5ndfDD4MbK21Ncvc2KtaX2ZmDujZOBEp9SEH4tQoe7RHRDehmR2jCePkx3BKCcWHi88/WcjURA
	ubrEfg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisj-0000000G9CP-0y8W;
	Tue, 12 May 2026 08:54:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMish-0000000G9AC-2X8N
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 08:54:24 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70c112cb61so4027832a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576063; x=1779180863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=cgTEQxbYzO/WQoFIQUGViaafZdtjDsiapOxlebrwFzhZloKbkzXs2I5ndqNYQ+iSIo
         5iZR+2VlwyC7MFrIpxpa3t6oGTxlRy9VhSuZos0OHP9w/7sdeUNyk4T1CKhhdIcCitC0
         75anFbbwZlJFZhweqcsSmChtmcActLiL/sdis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576063; x=1779180863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=L/65e9sZrWSfzUkmrxmyEIcROnBU+TbIxO62GaE0cVNe79IbDpH3UDql6qxHkb3eQs
         nlLj26pT3kFGcLppKdIaNy9gXxjF8D0Kpqb/y+f3PiIP+4Q7jvCwU8CyRA6YrwlB/xsJ
         nPHON6MnpeiDcw16YJDuJs9wk7ZUnk0tdYElQNwDB4DA5NTS3mHPsmy/Uo7Pzb86CHbD
         1PZ+PMiUOECKY/szYGieyN9K1u3aG5uQ85BPzkuSS5Ze/4YiBAwA1Y2cqAlq1k4Sbx1Y
         ICIJVMRMUEubIvx2EPsc/zqRi8PIfeR79j7n8T3Qjc+seR+LcoC3H8oJ9MsOyDKdCyBi
         lgJg==
X-Forwarded-Encrypted: i=1; AFNElJ/RmgEB3WTxYrsgYKsBYCcm54arMtq7p6TKxz4lbZpM+X19ko29LEFy+95K6j45fxnxnXMj3xZH6Eoro16Zmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPBDAR7M/rn+Gg60aRB6mkiiDBdXtxxNJyyeKxrXjWZesli4HS
	f9wOKeHJFBv/dDRl0EA6dZiM1YF9AvrYFPfFwiKIzp27XVkQ1gBNNPiQJhU5UPhiNA==
X-Gm-Gg: Acq92OF5EjXy86k1vzckJrzXr35E1cmwcQv0rHq1SJM+srk6SpmREDFRBDRSA7mWaav
	IbsoB9CZKg+kGCj3i7azUg7MJ53ambvzB5Ph4q8fcTBHzMrRjR36v4QP/F83Ql+mgKebQVOSUJC
	1h3DTayOzlebb6q1OKZxl9g1tsWQeGxK8ThXXZFjVFQfl8oQbmNqVgvc6+iXUAJOcxzQPL+0EXO
	FijaBkugvZmU6I6kWSLpR7L8CEQNSwR0qQwZPHmceyQEVJ/fr1z90aWipvZEeNP/pfRHfjQUHAP
	7XVcO/EcQ+xO5Nln3kRG3gl+DqNVQImvafqnckIySsU+CfmB2BghM/XLFnzqskq3dk9r0oXkYGf
	V65LBh1rfbk5bEwphjURKFe1dlOs9I33JDT/uXVc+UzNLDDTktnGvmvvF1v9naH0iZS2bVmZkIf
	vHjnrjzoZGG6EvkULDgT2y4y7eAKDE9wEDgdHB3gboYCWHjLNcHIGY8cqcfmOuWHtJ2QzVadJ/w
	k1sNcF6IT8Rveg4JiI=
X-Received: by 2002:a05:6a20:7f9a:b0:3a2:dd8a:5084 with SMTP id adf61e73a8af0-3aa5ab5c3e6mr30559580637.37.1778576062752;
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
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
Subject: [PATCH v3 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Tue, 12 May 2026 16:53:50 +0800
Message-ID: <20260512085358.1693208-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015423_651191_9FA938A0 
X-CRM114-Status: UNSURE (   8.87  )
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.563.g4f69b47b94-goog


