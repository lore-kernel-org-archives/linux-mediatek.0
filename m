Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59165CE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLdzbrr7qqklLHRlLDBt3HAIeNP30xh3waq/7+yRzz8=; b=AnUuAsjvbCAECO
	XlnK5rp9j/N7rmbKki/uzTwFUi9p/4q0FrJwuKGI/15NvT/UmrspBAiMXPPNy1K4SVd++UT3oGLUI
	yHw5ltzY1CXrhPTDpgejxSTelJ5aY7As3HkSAW8/vTwV5Kd62O8ohZW7/4zrhBcXZigFa9w5xjr3K
	QScxM8nN5/jSnLCK7tSau4V7tnSEyC8AFNTgmv2SanZUe2y/YANrNP/MH7tRfGho3d6M51jeuEjXP
	z9CnuviowMcB1/AmNwlpOxp4hvj22wTQtT+J/KZQrPgR56evlGiHmTnqbiKtcCTzBnDEfKGCryRID
	bW6xOTMFfQtBywgttvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbFp-00000002Yau-0DDI;
	Tue, 01 Oct 2024 11:41:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6F-00000002WLN-33TI
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:29 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3186415a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782287; x=1728387087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLdzbrr7qqklLHRlLDBt3HAIeNP30xh3waq/7+yRzz8=;
        b=KHi8YPS8atkzZgX0PkelN9BiRWxVk6L42X4OZRVcpkftmIE+zL5POEmlemXMSbCh4n
         yGUKW7zx7Lm6Yfb13gH2VSXuVcp47F7O2VeYmag31vlasRGBfXdJiqn6goMfiKEPGdIX
         rChx6CzsxYJNem5rlqeixkxIiySzMD0EHL8wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782287; x=1728387087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLdzbrr7qqklLHRlLDBt3HAIeNP30xh3waq/7+yRzz8=;
        b=BFJHJU3cSvFJswwkYKmk3EM9bBCCqXe+Pu4EFQitni7dBvmP1HrCgvrZ+WY3yernT9
         0l58SRipNFul27iOH45qWc7QwtFTXx0lRVzKH6y9uYibbqXQvE/lEzWcMiNxegj+KOJB
         gAYUdjkWdkr5kZLpO0z4n3LoNLwxDp9cyv9w5akup+/ZAU71XUgVkJBb9SrrWaYYIKqo
         xKtACyNo5jLGnn2DTmOcEY62i83pBhh1eHSFJWAoH6M13cdNTRoWAgkbZZXLG2iv8PQt
         lwtRX/eTUGd5Yxj3r9a3vEE5Z3qUUHGwCjwHetf3Ts3ryXNFYtqW/So8cHB2zgpT3sst
         i1jA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5ZWHXrA87iI/a1lEpXkcsy2NC+lfvwnH17XsL/WY4BkOVz+FalPek+NehunvYbuNp4n428gtoYXmXbMitQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf1lAdfvKhzQr12G2fXvNYq+3v2s+xIbnZf+ERIaIEQ5niCRuG
	SbU56yivS8lmhSK6DfSSUWyZ20cjyUGxNg2xoKLQ0zs3dCyr47bwPy9NfKGQRvuXmdad99mLCBU
	=
X-Google-Smtp-Source: AGHT+IEgct/3Kv8qNzy6ataUfgMbDap5NRUyRDA2O/6Uj+INj/mxGJhKqWWS0ioNmqqYyO5Ym6qkyQ==
X-Received: by 2002:a05:6a21:e8b:b0:1d2:e94d:6e6d with SMTP id adf61e73a8af0-1d4fa806eb0mr21813265637.45.1727782286787;
        Tue, 01 Oct 2024 04:31:26 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:26 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
Date: Tue,  1 Oct 2024 19:27:21 +0800
Message-ID: <20241001113052.3124869-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043127_925910_DB7D072C 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: Bin Liu <bin.liu@mediatek.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
can be assigned with a local arbiter (LARB) which has a maximum of 32
ports for MediaTek's IOMMU infrastructure. That means there can be at
most 32 items in the iommus property in theory.

Instead of relaxing the max item count every time a newly introduced
device tree hits the limit, bump the number to 32 as an one-time effort.

On the other hand, all existing and foreseeable JPEG decoder nodes at
this point have at least 2 IOMMUs, so set minItems to 2 accordingly.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
It's not in the upstream tree yet, but the upcoming MT8188 DT will have
6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.

Changes in v2:
New patch.

 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml       | 3 ++-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml       | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index cfabf360f278..a4aacd3eb189 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -44,7 +44,8 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 2
+    minItems: 2
+    maxItems: 32
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 83c020a673d6..5b15f8977f67 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -39,7 +39,7 @@ properties:
 
   iommus:
     minItems: 2
-    maxItems: 4
+    maxItems: 32
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-- 
2.46.1.824.gd892dcdcdd-goog


