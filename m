Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOTw2SZsHwugM+Ez0nEALoToqSbMZWPKVYP438H1mxU=; b=jT7L1sdZwP76/tvYH0sK8YxlGJ
	hwqXEJh6eQhl51HfMZnkBedqGot14FfutHbZdTksO/M1lpqRbM2aq3QxhWu8qyG/sK12sLMVizsVu
	ZtqyYKkUrsucPAi+nCdJEBo8HVpBkAgT1m8e6sQrORsZvoCZSSRpBzEJH4NxJWkjfannl+3JjsZNd
	rWj+HQYOwzZoJM+l1ljH1SrNeEfAMSraYTQ1gHkCvwSmYl8sC5P5MCI9AR2iAbDhjQXzC2DzKkcjD
	nS5rpiP2Gu7yr/8Jve2A9UpmEi8qEmqbFDX2Z77YoqTwozpkSwZ+PfedycXPk3PpI5j0UVGowKNjG
	l+SSENww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0V-0074wH-31; Wed, 20 Jul 2022 14:48:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0F-0074hF-Ds
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id a5so26432354wrx.12
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=EOTw2SZsHwugM+Ez0nEALoToqSbMZWPKVYP438H1mxU=;
        b=oMm7LoJwBASOpcAnoe5ZW0VcoBtpNp4qdQXkxDMqfsYACtq2XOkYP+zDZPKLL4wMBw
         YgIqj4c9bDXecsVxFerVyCof9sXAssTSpDgeyJzMUqvcp5rJryAbqDSHlATe3jt96iHG
         WDtXCJY7Y6NcZXZsGo3/Pww8583CYWbnViwflztE1ocPMbOBgWan5EX/aj1cCeoZuy9i
         9faahOs5YUZNPf85kg/MwQEMmex/wyjlyUCRmxo4MPNf1qV7Ep+U/pgIAQiOYRiTGjQC
         ZBxpaNtME1cHVV7UMwlhbx1u60srMx9Fp1zRqRjrcLpKx1kk1sNzoYkkn7iaHCbpVNRl
         3ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=EOTw2SZsHwugM+Ez0nEALoToqSbMZWPKVYP438H1mxU=;
        b=hvNXKcLNV4dLy+XW+WPAFNsKj5FVmkLvtXRCphQwkLn+2oVQFOtyuH52n+2kzoDFEe
         mBGZEOb4lwq/KQN2Azm7zSdifG512qYsyilMSGwMgt62BtnmdLKupVxQItrWtypGIRXd
         EoMi+XhrNhLyAgyourhpo78yQiVUBE33pPGz2sTB1DESv2LQOATBWMrdy9xgs/a+f0El
         vs5mZ7aLVHxBlN/Kx8HLZzQzywAEAutpp/FjpEDuPNw/jpujVCVa7w9uxMx50pNabQZa
         k4tX8K+HuZWuGn+Uv4y63gtVM6A168yOkHlxR4x7Sv8u1sJz76oNdH/c20u9lwVrXexE
         +Vwg==
X-Gm-Message-State: AJIora/BoePNFynEvBQVJDz2l581x1HyqN3yPqliLVU6wiYoW/w8v0jc
	eMBz9BUkgUQVMl8oBoTd1/C60w==
X-Google-Smtp-Source: AGRyM1vk48vhBISpLi0CcOr9kKDWKs0EqlrNQDdVJdrT6hsTP+HmSTbFh6RCGQZsl1ZBg+vkqVqr/A==
X-Received: by 2002:a05:6000:1789:b0:21d:7279:f455 with SMTP id e9-20020a056000178900b0021d7279f455mr30432550wrg.542.1658328521299;
        Wed, 20 Jul 2022 07:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:41 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:39 +0200
Subject: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add mediatek,double-keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074843_627247_54A14D02 
X-CRM114-Status: UNSURE (   6.87  )
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

MediaTek keypad has 2 modes of detecting key events:
- single key: each (row, column) can detect one key
- double key: each (row, column) is a group of 2 keys

Currently, only single key detection is supported (by default)
Add an optional property, mediatek,double-keys to support double
key detection.

Double key support exists to minimize cost, since it reduces the number
of pins required for physical keys.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index ca8ae40a73f7..03c9555849e5 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -49,6 +49,12 @@ properties:
     maximum: 256
     default: 16
 
+  mediatek,double-keys:
+    description: |
+      use double key matrix instead of single key
+      when set, each (row,column) is a group that can detect 2 keys
+    type: boolean
+
 required:
   - compatible
   - reg

-- 
b4 0.10.0-dev-54fef

